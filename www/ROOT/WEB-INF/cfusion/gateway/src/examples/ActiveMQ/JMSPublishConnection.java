/*
 * ADOBE SYSTEMS INCORPORATED
 *  Copyright 2004-2007 Adobe Systems Incorporated
 *  All Rights Reserved.
 * 
 * NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
 * terms of the Adobe license agreement accompanying it.  If you have received this file from a 
 * source other than Adobe, then your use, modification, or distribution of it requires the prior 
 * written permission of Adobe.
 *
 */

/**
 * JMSPublishConnection
 * provides methods to publish messages to topics or queues on a JMS server.
 * This uses the same configuration machinery as the 
 * JMSConsumer class but sets most of its parameters based on the Map
 * of data passed into it.
 *
 * CFML Usage:
 *	<cfset event = structNew()/>
 *	<cfset event.status = "SEND"/>	<!--- send a message --->
 *
 *  Either:
 *	<cfset event.topic = "topic"/>	<!--- name of the topic to publish the message to --->
 *  Or:
 *	<cfset event.queue = "queue"/>	<!--- name of the queue to publish the message to --->
 *
 *	<cfset event.id = createUUID()/>	<!--- unique message ID (optional, default null) --->
 *	<cfset event.message = "This is a text message"/>
 *	<cfset event.asBytes = "yes"/>	<!--- send as BytesMessage with UTF-8 or as TextMessage?
 *											(optional, default TextMessage) --->
 *	<cfset result = sendGatewayMessage("Test JMS Gateway",event)/>
 *	#result#
 *
 * @author Sean Corfield
 *
 */

package examples.ActiveMQ;

import javax.jms.BytesMessage;
import javax.jms.Connection;
import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.MessageProducer;
import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueSender;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.jms.Topic;
import javax.jms.TopicConnection;
import javax.jms.TopicConnectionFactory;
import javax.jms.TopicPublisher;
import javax.jms.TopicSession;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

public class JMSPublishConnection
{

    // send the message specified in the data Map:
    void sendMessage(Map data) throws Exception
    {
        if (this.producer == null)
        {
            start();
        }
        try
        {
            String destinationName = (String) data.get("topic");
            boolean isTopic = true;
            Object textOrMap = data.get("message");
            String correlationID = (String) data.get("id");
            String messageID = (String) data.get("msgid");
            String asBytes = (String) data.get("asBytes");
            Map properties = (Map) data.get("properties");
            Map propertyTypes = (Map) data.get("propertyTypes");
            boolean msgIsText = textOrMap instanceof String;

            if (destinationName == null)
            {
                destinationName = (String) data.get("queue");
                isTopic = false;
            }
            if (this.configuration.isDebugOn())
            {
                this.gateway.getLogger().info("JMSPublisher.sendMessage " +
                        (isTopic ? "topic" : "queue") +
                        "=" + destinationName +
                        "; " +
                        (correlationID == null ? "" : "id=" + correlationID + "; ") +
                        (messageID == null ? "" : "msgid=" + messageID + "; ") +
                        (asBytes == null ? "" : "asBytes=" + asBytes + "; ") +
                        (properties == null ? "" : "properties={}; ") +
                        (msgIsText ? "message=" + textOrMap : "message={}"));
            }
            Message message = null;
            if (msgIsText)
            {
                if (asBytes == null || asBytes.equals("no") || asBytes.equals("false"))
                {
                    TextMessage textMessage = this.session.createTextMessage();
                    textMessage.clearBody();
                    textMessage.setText((String) textOrMap);
                    message = textMessage;
                }
                else
                {
                    BytesMessage bytesMessage = this.session.createBytesMessage();
                    bytesMessage.clearBody();
                    bytesMessage.writeUTF((String) textOrMap);
                    message = bytesMessage;
                }
            }
            else if (textOrMap instanceof Map)
            {
                MapMessage mapMessage = this.session.createMapMessage();
                Map map = (Map) textOrMap;
                Collection c = map.entrySet();
                Iterator i = c.iterator();

                mapMessage.clearBody();
                while (i.hasNext())
                {
                    Map.Entry p = (Map.Entry) i.next();
                    String k = (String) p.getKey();

                    // because ColdFusion types are dynamic, we will force them to strings:
                    mapMessage.setObject(k, p.getValue().toString());
                }
                message = mapMessage;
            }
            else
            {
                this.gateway.getLogger().error("Message has type " + textOrMap.getClass().getName() + " and cannot be processed");
                return;
            }

            if (correlationID != null) message.setJMSCorrelationID(correlationID);

            if (messageID != null) message.setJMSMessageID(messageID);

            if (properties != null)
            {
                Collection c = properties.entrySet();
                Iterator i = c.iterator();
                while (i.hasNext())
                {
                    Map.Entry p = (Map.Entry) i.next();
                    String k = (String) p.getKey();
                    String v = p.getValue().toString();

                    if (propertyTypes == null)
                    {
                        // assume properties are strings in the absence of type information
                        message.setStringProperty(k, v);
                    }
                    else
                    {
                        // remember that all CF values come in as strings by default
                        // supported types:
                        // boolean, byte, double, float, int, long, short, string (default)
                        String t = (String) propertyTypes.get(k);
                        if ("boolean".equals(t))
                        {
                            message.setBooleanProperty(k, Boolean.valueOf(v).booleanValue());
                        }
                        else if ("byte".equals(t))
                        {
                            message.setByteProperty(k, Byte.parseByte(v));
                        }
                        else if ("double".equals(t))
                        {
                            message.setDoubleProperty(k, Double.parseDouble(v));
                        }
                        else if ("float".equals(t))
                        {
                            message.setFloatProperty(k, Float.parseFloat(v));
                        }
                        else if ("int".equals(t))
                        {
                            message.setIntProperty(k, Integer.parseInt(v));
                        }
                        else if ("long".equals(t))
                        {
                            message.setLongProperty(k, Long.parseLong(v));
                        }
                        else if ("short".equals(t))
                        {
                            message.setShortProperty(k, Short.parseShort(v));
                        }
                        else
                        {
                            // either string or unknown - silently treat it as a string
                            message.setStringProperty(k, (String) p.getValue());
                        }
                    }
                }
            }

            if (this.isTopic)
            {
                ((TopicPublisher) this.producer).publish(message);
            }
            else
            {
                ((QueueSender) this.producer).send(message);
            }
        }
        catch (Exception jmse)
        {
            this.gateway.getLogger().error("JMSPublisher.sendMessage failed: " + jmse.toString());
            stop();
        }
    }

    JMSPublishConnection(JMSConfiguration configuration, JMSGateway gateway, String destinationName, boolean isTopic) throws Exception
    {
        this.configuration = configuration;
        this.gateway = gateway;
        this.destinationName = destinationName;
        this.isTopic = isTopic;
    }

    // setup the connection to the hub:
    void start() throws Exception
    {
        Properties env = new Properties();
        env.setProperty(Context.PROVIDER_URL, this.configuration.getProviderURL());
        env.setProperty(Context.INITIAL_CONTEXT_FACTORY, this.configuration.getInitialContextFactory());
        // add any extra context parameters here:
        Properties extra = this.configuration.getContextProperties();
        Enumeration props = extra.propertyNames();
        while (props.hasMoreElements())
        {
            String propName = (String) props.nextElement();
            env.setProperty(propName, extra.getProperty(propName));
        }
        this.jndi = new InitialContext(env);

        // allow for username / password here:
        String username = this.configuration.getUsername();
        String password = this.configuration.getPassword();
        if (this.isTopic)
        {
            TopicConnectionFactory conFactory =
                    (TopicConnectionFactory) jndi.lookup(this.configuration.getConnectionFactory());

            this.connection = (username == null || password == null)
                    ? conFactory.createTopicConnection()
                    : conFactory.createTopicConnection(username, password);
            if (this.configuration.isDurable())
            {
                try
                {
                    this.connection.setClientID(this.configuration.getPublisherName(this.destinationName));
                }
                catch (JMSException e)
                {
                    // ignore
                }
            }
            this.connection.start();
            this.session = ((TopicConnection) this.connection).createTopicSession(false, Session.AUTO_ACKNOWLEDGE);
            Topic destination = (Topic) jndi.lookup(this.destinationName);
            this.producer = ((TopicSession) this.session).createPublisher(destination);
        }
        else
        {
            QueueConnectionFactory conFactory =
                    (QueueConnectionFactory) jndi.lookup(this.configuration.getConnectionFactory());

            this.connection = (username == null || password == null)
                    ? conFactory.createQueueConnection()
                    : conFactory.createQueueConnection(username, password);
            this.connection.start();
            this.session = ((QueueConnection) this.connection).createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
            Queue destination = (Queue) jndi.lookup(this.destinationName);
            this.producer = ((QueueSession) this.session).createSender(destination);
        }
    }

    // tidy up the connection stuff
    void stop() throws Exception
    {
        if (this.producer != null)
        {
            this.producer.close();
            this.producer = null;
        }
        if (this.session != null)
        {
            this.session.close();
            this.session = null;
        }
        if (this.connection != null)
        {
            this.connection.close();
            this.connection = null;
        }
        if (this.jndi != null)
        {
            this.jndi.close();
            this.jndi = null;
        }
    }

    // Declare variables for the objects used by JMS, as follows:
    private Context jndi = null;
    private Connection connection = null;
    private Session session = null;
    private MessageProducer producer = null;
    private boolean isTopic;

    private JMSConfiguration configuration;
    private JMSGateway gateway;
    private String destinationName;
}
