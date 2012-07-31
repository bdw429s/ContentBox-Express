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
 * JMSGateway
 * extends the GenericGateway to provide interaction with the JMSConsumer class
 *
 * @author Sean Corfield
 *
 */

package examples.ActiveMQ;

import coldfusion.eventgateway.CFEvent;
import coldfusion.eventgateway.GenericGateway;
import coldfusion.eventgateway.Logger;

import javax.jms.BytesMessage;
import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.TextMessage;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

public class JMSGateway extends GenericGateway
{
    // start/stop template methods:
    protected void startGateway() throws Exception
    {
        try
        {
            // re-read the configuration:
            this.consumer.reconfigure(this.configFile);
            this.publisher.reconfigure(this.configFile);
            // start listener thread(s)
            this.consumer.start();
            this.publisher.start();
        }
        catch (Exception e)
        {
            getLogger().error("Failed to start gateway: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }

    protected void stopGateway() throws Exception
    {
        this.consumer.stop();
        this.publisher.stop();
    }

    // override getStatus to handle special case where
    // consumer goes on/offline asynchronously:
    public int getStatus()
    {
        if (this.consumer.isStarted())
        {
            return RUNNING;    // no matter what the status should be, if
            // the consumer is started, it *is* running!
        }
        // the consumer is not running so we are either starting, stopping, stopped or failed
        int defaultStatus = super.getStatus();
        if (defaultStatus == RUNNING)
        {
            // the consumer is offline so we must have failed since startup
            return FAILED;
        }
        return super.getStatus();
    }

    // handle response from CFC:
    public String outgoingMessage(CFEvent cfmessage)
    {
        Map data = cfmessage.getData();
        String status = (String) data.get("status");
        if (status.equals("SEND"))
        {
            // SEND - handle an outgoing message back to the hub
            try
            {
                this.publisher.sendMessage(data);
                status = "OK";
            }
            catch (Exception jmse)
            {
                getLogger().error("Failed to send message with exception: " + jmse.toString());
                status = "EXCEPTION";
            }
        }
        // else it's either OK or EXCEPTION - just return the status
        return status;
    }

    // constructor (can throw coldfusion.server.ServiceRuntimeException):
    public JMSGateway(String gatewayID, String configFile) throws Exception
    {
        super(gatewayID);
        this.logger = getGatewayServices().getLogger();
        this.configFile = configFile;
        this.consumer = new JMSConsumer(this);
        this.publisher = new JMSPublisher(this);
    }

    // message handling - from threaded consumer:
    public void handleMessage(
            Message message,
            String destinationName,
            boolean isTransacted,
            JMSConsumeSession session)
    {
        CFEvent cfMsg = new CFEvent(getGatewayID());
        Map data = new HashMap();
        String msgID = null;
        String corrID = null;
        Object textOrMap = null;
        Map properties = null;
        Enumeration propEnum = null;
        try
        {
            propEnum = message.getPropertyNames();
        }
        catch (JMSException e1)
        {
            // ignore it, assume there are no properties
        }

        // get the message IDs: 
        try
        {
            msgID = message.getJMSMessageID();
            if (msgID != null) data.put("msgid", msgID);
        }
        catch (JMSException jmse)
        {
            msgID = "unknown";
        }
        try
        {
            corrID = message.getJMSCorrelationID();
            if (corrID != null) data.put("id", corrID);
        }
        catch (JMSException jmse)
        {
            corrID = "unknown";
        }

        // handles both text and UTF-8 bytes formats:
        if (message instanceof BytesMessage)
        {
            BytesMessage bytesMessage = (BytesMessage) message;
            try
            {
                textOrMap = bytesMessage.readUTF();
            }
            catch (JMSException e)
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
                // TODO: should we commit or rollback at this point, after an "internal" error?
            }
        }
        else if (message instanceof TextMessage)
        {
            TextMessage textMessage = (TextMessage) message;
            try
            {
                textOrMap = textMessage.getText();
            }
            catch (JMSException e)
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
                // TODO: should we commit or rollback at this point, after an "internal" error?
            }
        }
        else if (message instanceof MapMessage)
        {
            MapMessage mapMessage = (MapMessage) message;
            Map map = new HashMap();
            try
            {
                Enumeration names = mapMessage.getMapNames();
                while (names.hasMoreElements())
                {
                    String k = (String) names.nextElement();
                    map.put(k, mapMessage.getObject(k));
                }
                textOrMap = map;
            }
            catch (JMSException e)
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
                // TODO: should we commit or rollback at this point, after an "internal" error?
            }
        }
        else
        {
            // we cannot understand that message - log it!
            getLogger().error("Unable to understand message '" + msgID + "/" + corrID + "', class: " + message.getClass().getName());
        }
        if (textOrMap != null) data.put("msg", textOrMap);
        data.put("jmsmsg", message);

        while (propEnum.hasMoreElements())
        {
            String propName = (String) propEnum.nextElement();
            if (properties == null) properties = new HashMap();
            try
            {
                properties.put(propName, message.getObjectProperty(propName));
            }
            catch (JMSException e)
            {
                // ignore the exception - we just won't put it in the data structure
            }
        }
        if (properties != null) data.put("properties", properties);

        // these are new fields passed to ColdFusion:
        data.put("transacted", isTransacted ? "true" : "false");
        data.put("jmssession", session);

        cfMsg.setData(data);
        cfMsg.setOriginatorID(destinationName);
        cfMsg.setGatewayType("ActiveMQ");

        if (sendMessage(cfMsg))
        {
            getLogger().info("Added message '" + msgID + "/" + corrID + "' to event gateway queue.");
        }
        else
        {
            // queue is full, log the error and prepare for redelivery:
            getLogger().error("Failed to add message '" + msgID + "/" + corrID + "' to queue.");
            // if this is a transacted consumer, we can rollback the message:
            if (isTransacted)
            {
                session.rollback();
            }
            // else throw the message away!
        }
    }

    // accessor for our logger:
    Logger getLogger()
    {
        return this.logger;
    }

    private JMSConsumer consumer;
    private JMSPublisher publisher;
    private String configFile;
    private Logger logger;
}