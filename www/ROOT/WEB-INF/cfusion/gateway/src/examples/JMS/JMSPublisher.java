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
 * JMSPublisher
 * provides methods to publish messages to topics on a JMS server.
 * This manages a potential connection pool for publishers.
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

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class JMSPublisher
{

    // send the message specified in the data Map:
    void sendMessage(Map data) throws Exception
    {
        String topicName = (String) data.get("topic");
    	JMSPublishConnection publisher = getPublishConnection(topicName);
        publisher.sendMessage(data);
        putPublishConnection(publisher);
    }

    JMSPublisher(JMSGateway gateway) throws Exception
    {
        this.gateway = gateway;
        // when the gateway starts up, it will call our start() method
        // to complete the initialization
    }
    
    void reconfigure(String configFile) throws Exception
	{
        this.configuration = new JMSConfiguration(configFile);
        // one instance per publisher object - each gateway creates exactly
        // one publisher so you should have a single outbound gateway if
        // you want to take advantage of caching:
        this.useCache = this.configuration.isCachable();
        if (this.useCache)
        {
            this.cache = new HashMap();
        }
        else
        {
        	this.cache = null;
        }
	}
    
    void start() throws Exception
	{
    	// nothing to do here - we start publishers on demand
	}
    
    void stop() throws Exception
	{
    	// walk the cache (if any) and stop all the publishers and remove them
    	if (this.useCache)
    	{
    		Iterator publishers = this.cache.values().iterator();
    		while (publishers.hasNext())
    		{
    			// need to ignore exceptions while we're shutting things down:
    			try
				{
        			((JMSPublishConnection)publishers.next()).stop();
				}
    			catch (Exception e)
				{
    				// ignore it
				}
    		}
    		this.cache.clear();
    	}
	}
    
    private JMSPublishConnection getPublishConnection(String topicName) throws Exception
    {
    	JMSPublishConnection publisher = null;
    	String shortName = null;
    	if (this.useCache)
    	{
    		shortName = JMSConfiguration.getShortTopicName(topicName);
    		publisher = (JMSPublishConnection)this.cache.get(shortName);
    	}
    	if (publisher == null)
    	{
        	publisher = new JMSPublishConnection(this.configuration,this.gateway,topicName);
        	if (this.useCache)
        	{
        		this.cache.put(shortName,publisher);
        	}
        	publisher.start();
    	}
    	return publisher;
    }

    // if we're caching, putPublishConnection does nothing - we leave the connection alive
    // else we stop the connection just to tidy up
    private void putPublishConnection(JMSPublishConnection publisher) throws Exception
    {
    	if (!this.useCache)
    	{
        	publisher.stop();
    	}
    }
    
    private JMSConfiguration configuration;
    private JMSGateway gateway;
    private HashMap cache = null;
    private boolean useCache;
}
