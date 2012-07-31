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
 * JMSGateway
 * extends the GenericGateway to provide interaction with the JMSConsumer class
 *
 * @author Sean Corfield
 *
 */

package examples.JMS;

import coldfusion.eventgateway.CFEvent;
import coldfusion.eventgateway.GenericGateway;

import java.util.HashMap;
import java.util.Map;

public class JMSGateway extends GenericGateway
{
    // start/stop template methods:
    protected void startGateway() throws Exception
    {
        // re-read the configuration:
        this.consumer.reconfigure(this.configFile);
        this.publisher.reconfigure(this.configFile);
        // start listener thread(s)
        this.consumer.start();
        this.publisher.start();
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
            return RUNNING;	// no matter what the status should be, if
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
                log.error("Failed to send message with exception: " + jmse.toString());
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
        this.log = getGatewayServices().getLogger();
        this.configFile = configFile;
        this.consumer = new JMSConsumer(this);
        this.publisher = new JMSPublisher(this);
    }

    // message handling - from threaded consumer:
    public void handleMessage(String msg, String topicName, String msgID)
    {
        Map data = new HashMap();
        CFEvent cfMsg = new CFEvent(getGatewayID());
        data.put("msg", msg);
        data.put("id", msgID);
        cfMsg.setData(data);
        cfMsg.setOriginatorID(topicName);
        cfMsg.setGatewayType("JMS");
        if (sendMessage(cfMsg))
        {
            log.info("Added message '" + msgID + "' to queue.");
        }
        else
        {
            // this isn't really enough - we need to save the failed msg and / or
            // retry sending the message...
            log.error("Failed to add message '" + msgID + "' to queue.");
        }
    }

    // accessor for our logger:
    coldfusion.eventgateway.Logger getLogger()
    {
        return this.log;
    }

    private JMSConsumer consumer;
    private JMSPublisher publisher;
    private String configFile;
    private coldfusion.eventgateway.Logger log;
}