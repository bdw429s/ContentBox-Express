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
 * EmptyGateway
 * 
 * Skeleton ColdFusion Event Gateway
 * 
 */

package examples;

import coldfusion.eventgateway.CFEvent;
import coldfusion.eventgateway.Gateway;
import coldfusion.eventgateway.GatewayServices;

import java.util.Map;

/**
 * An Empty gateway class that can be used as a starting point for user gateways.
 */
public class EmptyGateway implements Gateway
{
    // The handle to the CF gateway service
    protected GatewayServices gatewayService = null;

    // ID provided by EventService
    protected String gatewayID = "";

    // Listener CFC paths for our events
    protected String[] listeners = null;

    // Path to my configuration file
    protected String config = null;

    // The thread that is running the listener
    protected Thread listenerThread = null;

    // Should we shutdown?
    protected boolean shutdown = false;

    // The default function to pass our events to
    protected String cfcEntryPoint = "onIncomingMessage";

    // timeout for waiting for listener thread to die - 10 seconds
    protected static final int TEN_SECONDS = 10 * 1000;

    // Out status
    protected int status = STOPPED;


    /**
     * Requred Gateway constructor.
     * <P>
     * Throw a coldfusion.server.ServiceRuntimeException
     * if something goes wrong in initialization.
     */
    public EmptyGateway(String gatewayID, String config)
    {
        this.gatewayID = gatewayID;
        this.config = config;
        this.gatewayService = GatewayServices.getGatewayServices();
    }

    /**
     * Send a message back out of the gateway.
     * <P>
     * The information about the message to send out is found
     * in the Map returned by cfmsg.getData().
     * <P>
     * The values in the Map are <i>Gateway specific</i>.  So the component
     * sending the output message will need to know the values the gateway
     * expects to see here.
     *
     * @param cfmsg the message to send
     * @return A Gateway specific string, such as an outgoing message ID or status.
     */
    public String outgoingMessage(coldfusion.eventgateway.CFEvent cfmsg)
    {
        // Get the table of data returned from the even handler
        Map data = cfmsg.getData();

        // TODO: Your code here

        // You can get named values from this map as set by the CFML CFC code
        // You should not assume String data unless you check.
        Object value = data.get("MESSAGE");

        if (value != null)
        {
            // Play it safe and convert message to a String
            String message = value.toString();

            // TODO: send the message back to wherever
        }

        // Return a String, possibly a messageID number or error string.
        return "OK";
    }

    /**
     * Set the CFClisteners list.
     * <P>
     * Takes a list of fully qualified CF component names (e.g. "my.components.HandleEvent")
     * which should each receive events when the gateway sees one.
     * This will reset the list each time it is called.
     * <P>
     * This is called by the Event Service manager on startup, and may be called
     * if the configuration of the Gateway is changed during operation.
     *
     * @param listeners a list of component names
     */
    public void setCFCListeners(String[] listeners)
    {
        this.listeners = listeners;
    }

    /**
     * Return a CFC helper class (if any) so that a CFC can invoke
     * Gateway specific utility functions that might be useful
     * to the CFML developer.
     * <P>
     * Called by the CFML function getGatewayHelper(gatewayID).
     * <P>
     * Return null if you do not provide a helper class.
     *
     * @return an instance of the gateway specific helper class or null
     */
    public coldfusion.eventgateway.GatewayHelper getHelper()
    {
        // We have no helper class to provide to the CFML programmer
        return null;
    }

    /**
     * Set the id that uniquely defines the gateway.
     * <P>
     * Generally, you just need to return this string in getGatewayID().
     * It is used by the event manager to identify the gateway
     *
     * @param id this gateways id string
     */
    public void setGatewayID(String id)
    {
        gatewayID = id;
    }

    /**
     * Return the id that uniquely defines the gateway.
     *
     * @return the gateway ID set by setGatewayID()
     */
    public String getGatewayID()
    {
        return gatewayID;
    }

    /**
     * Start this Gateway.
     * <P>
     * Perform any gateway specific initialization required.
     * This is where you would start up a listener thread(s) that
     * monitors the event source you are a gateway for.
     * <P>
     * This function <i>should</i> return within an admin configured timeout.
     * If it does not, there is an admin controlled switch which will determine
     * if the thread that calls this function gets killed.
     */
    public void start()
    {
        status = STARTING;
        // Start up listener thread
        Runnable r = new Runnable()
        {
            public void run()
            {
                listener();
            }
        };
        listenerThread = new Thread(r);
        shutdown = false;
        listenerThread.start();

        status = RUNNING;
    }

    /**
     * Stop this Gateway.
     * <P>
     * Perform any gateway specific shutdown tasks, such as shutting down
     * listener threads, releasing resources, etc.
     */
    public void stop()
    {
        status = STOPPING;

        // tell generator to stop
        shutdown = true;
        try
        {
            listenerThread.interrupt();
            listenerThread.join(TEN_SECONDS);
        }
        catch (InterruptedException e)
        {
            // ignore
        }
        status = STOPPED;
    }

    /**
     * Restart this Gateway
     * <P>
     * Generally this can be implemented as a call to stop() and then start(),
     * but you may be able to optimize this based on what kind
     * of service your gateway talks to.
     */
    public void restart()
    {
        stop();
        start();
    }

    /**
     * Return the status of the gateway
     *
     * @return one of STARTING, RUNNING, STOPPING, STOPPED, FAILED.
     */
    public int getStatus()
    {
        return status;
    }

    /**
     * Listener thread which send events in to the EventService
     */
    protected void listener()
    {
        while (!shutdown)
        {
            // Listen for something
            // TODO: YOUR CODE HERE

            // create an event
            // Use our gatewayID (as told to us earlier) to identify where the message comes from.
            CFEvent event = new coldfusion.eventgateway.CFEvent(gatewayID);

            // Set the function to call in the CFC.
            // If not set, the ColdFusion default is "onIncomingMessage".
            // This is something gateway providers need to document for the CFML developers
            // You can direct different types of messages to different functions.
            // This could be done in the gateway specific config file, if you have one.
            // Or just document a single function gets all events.
            event.setCfcMethod(cfcEntryPoint);

            // Set the absolute path to the CFC you want this message to go to.
            // Generally you wont do this, unless your gateway wants to send the same
            // event to many different CFCs.  The event system will handle the default
            // case.
            //event.setCfcPath(listeners[0]);

            // Set the timeout in seconds for executing the CFC function
            // This will override the request timeout set for executing CFM pages
            event.setCfcTimeOut(10);

            // Create a Map of key-value pairs, generally containing the event data.
            // You will need to document what data members the CFML user can expect.
            // NOTE: Since CFML is case insensitive, this is converted in to a case
            // insensitive Map so keys are case insensitive.
            java.util.Hashtable mydata = new java.util.Hashtable();
            mydata.put("MESSAGE", "Here is a message");
            mydata.put("INFO", "Here is more info about the message");
            event.setData(mydata);

            // Set a gateway type, this is a string that identifies the class of
            // gateway (e.g. "SMS", "CMFL") and is the same for all instances.
            event.setGatewayType("EmptyGateway");

            // Set an ID that is used to identify the sender (e.g. the user
            // the message is from).  This helps route the response (if any)
            event.setOriginatorID("This message is from the Empty Gateway!");

            // send it to the event service
            gatewayService.addEvent(event);

            // wait forever, REMOVE THIS
            try
            {
                wait();
            }
            catch (InterruptedException e)
            {
                // ignore
            }
        }
    }

}


