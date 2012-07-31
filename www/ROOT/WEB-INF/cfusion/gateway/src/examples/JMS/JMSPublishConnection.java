/*
 * ADOBE SYSTEMS INCORPORATED
 *  Copyright 2004 Adobe Systems Incorporated
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
 * provides methods to publish messages to topics on a JMS server.
 * This uses the same configuration machinery as the 
 * JMSConsumer class but sets most of its parameters based on the Map
 * of data passed into it.
 *
 * CFML Usage:
 *	<cfset event = structNew()/>
 *	<cfset event.status = "SEND"/>	<!--- send a message --->
 *	<cfset event.topic = "topic"/>	<!--- name of the topic to publish the message to --->
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

package examples.JMS;

import javax.jms.BytesMessage;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.jms.Topic;
import javax.jms.TopicConnection;
import javax.jms.TopicConnectionFactory;
import javax.jms.TopicPublisher;
import javax.jms.TopicSession;
import javax.jms.JMSException;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.Enumeration;
import java.util.Map;
import java.util.Properties;

public class JMSPublishConnection
{

    // send the message specified in the data Map:
    void sendMessage(Map data) throws Exception
    {
    	if (this.publisher == null)
    	{
    		start();
    	}
        try
        {
            String topicName = (String) data.get("topic");
            String text = (String) data.get("message");
            String correlationID = (String) data.get("id");
            String asBytes = (String) data.get("asBytes");
            if (this.configuration.isDebugOn())
            {
                this.gateway.getLogger().info("JMSPublisher.sendMessage topic=" + topicName +
                                              "; id=" + correlationID + "; asBytes=" + asBytes + "; message=" + text);
            }
            Message message = null;
            if (asBytes == null || asBytes.equals("no") || asBytes.equals("false"))
            {
                TextMessage textMessage = this.session.createTextMessage();
                textMessage.clearBody();
                textMessage.setText(text);
                message = textMessage;
            }
            else
            {
                BytesMessage bytesMessage = this.session.createBytesMessage();
                bytesMessage.clearBody();
                bytesMessage.writeUTF(text);
                message = bytesMessage;
            }
            message.setJMSCorrelationID(correlationID);
            this.publisher.publish(message);
        }
        catch (Exception jmse)
        {
            this.gateway.getLogger().error("JMSPublisher.sendMessage failed: " + jmse.toString());
            stop();
        }
    }

    JMSPublishConnection(JMSConfiguration configuration, JMSGateway gateway, String topicName) throws Exception
    {
        this.configuration = configuration;
        this.gateway = gateway;
        this.topicName = topicName;
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
        	String propName = (String)props.nextElement();
        	env.setProperty(propName,extra.getProperty(propName));
        }
        this.jndi = new InitialContext(env);

        TopicConnectionFactory conFactory =
                (TopicConnectionFactory) jndi.lookup(this.configuration.getTopicConnectionFactory());
        // allow for username / password here:
        String username = this.configuration.getUsername();
        String password = this.configuration.getPassword();
        this.connection = (username == null || password == null) 
								? conFactory.createTopicConnection()
								: conFactory.createTopicConnection(username,password);
        try
        {
            this.connection.setClientID(this.configuration.getPublisherName(this.topicName));
        }
        catch (JMSException e)
        {
            // ignore
        }
        this.connection.start();
        this.session = this.connection.createTopicSession(false, Session.AUTO_ACKNOWLEDGE);
        Topic thisTopic = (Topic) jndi.lookup(this.topicName);
        this.publisher = this.session.createPublisher(thisTopic);
    }

    // tidy up the connection stuff
    void stop() throws Exception
    {
        if (this.publisher != null)
        {
            this.publisher.close();
            this.publisher = null;
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
    private TopicConnection connection = null;
    private TopicSession session = null;
    private TopicPublisher publisher = null;

    private JMSConfiguration configuration;
    private JMSGateway gateway;
    private String topicName;
}
