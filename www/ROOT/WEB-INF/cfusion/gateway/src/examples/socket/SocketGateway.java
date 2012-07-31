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

package examples.socket;

import coldfusion.eventgateway.CFEvent;
import coldfusion.eventgateway.Gateway;
import coldfusion.eventgateway.GatewayHelper;
import coldfusion.eventgateway.GatewayServices;
import coldfusion.eventgateway.Logger;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Map;
import java.util.Properties;

/**
 * Socket gateway.
 * <p/>
 * This gateway listens on a socket and passes the strings read to the target CFC.
 *
 * @author Jim Schley
 */
public class SocketGateway implements Gateway
{
    // The handle to the CF gateway service
    private GatewayServices gatewayService = null;

    // ID provided by EventService
    private String gatewayID = "";

    // CFC Listeners for our events
    private Collection cfcListeners = new ArrayList(10);

    // The default function to pass our events to
    private String cfcEntryPoint = "onIncomingMessage";

    // Our status
    private int status = Gateway.STOPPED;

    private Hashtable socketRegistry = new Hashtable();

    // default port
    private int port = 1225;

    private Properties properties = new Properties();

    private String propsFilePath = "";

    private boolean listening = true;

    private ServerSocket serverSocket = null;

    Logger log;

    /**
     * constructor with config file
     */
    public SocketGateway(String id, String configpath)
    {
        gatewayID = id;
        gatewayService = GatewayServices.getGatewayServices();
        // log things to socket-gateway.log in the CF log directory
        log = gatewayService.getLogger("socket-gateway");

        propsFilePath = configpath;
        try
        {
            FileInputStream propsFile = new FileInputStream(propsFilePath);
            properties.load(propsFile);
            propsFile.close();
            this.loadProperties();
        }
        catch (IOException e)
        {
            // do nothing. use default value for port.
            log.warn("SocketGateway(" + gatewayID + ") Unable to read configuration file '" + propsFilePath + "': " + e.toString() +
                     ".  Using default port " + port + ".", e);
        }
    }

    private void loadProperties()
    {
        String tmp = properties.getProperty("port");
        port = Integer.parseInt(tmp);
    }

    /**
     * Send a message back out of the gateway.
     * <P>
     * The information about the message to send our is found
     * in the Map returned by cfmsg.getData().
     * <P>
     * The values in the Map are <i>Gateway specific</i>.  So the component
     * sending the output message will need to know the values the gateway
     * expects to see here.
     *
     * @param cfmsg the message to send
     */
    public String outgoingMessage(coldfusion.eventgateway.CFEvent cfmsg)
    {
        String retcode = "ok";
        // Get the table of data returned from the event handler
        Map data = cfmsg.getData();
        String message = (String) data.get("MESSAGE");
        // find the right socket to write to from the socketRegistry hashtable
        if (cfmsg.getOriginatorID() != null && message != null)
        {
            SocketServerThread st = ((SocketServerThread) socketRegistry.get(cfmsg.getOriginatorID()));
            if (st != null)
            {
                st.writeOutput(message);
            }
            else
            {
                log.error("Cannot send outgoing message. OriginatorID '" + cfmsg.getOriginatorID() + "' is not a valid socket id.");
                retcode = "failed";
            }
        }
        else if (data.get("OriginatorID") != null && message != null)
        {
            SocketServerThread st = ((SocketServerThread) socketRegistry.get(data.get("OriginatorID")));
            if (st != null)
            {
                st.writeOutput(message);
            }
            else
            {
                log.error("Cannot send outgoing message. OriginatorID '" + data.get("OriginatorID") + "' is not a valid socket id.");
                retcode = "failed";
            }
        }
        else
        {
            log.error("Cannot send outgoing message. OriginatorID/MESSAGE is not available.");
            retcode = "failed";
        }
        return retcode;
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
        ArrayList aListeners = new ArrayList();

        for (int i = 0; i < listeners.length; i++)
        {
            aListeners.add(listeners[i]);
        }

        // Try not to pull the rug out from underneath a running message
        synchronized (cfcListeners)
        {
            cfcListeners = aListeners;
        }
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
    public GatewayHelper getHelper()
    {
        // SocketHelper class implements the GatewayHelper interface
        return new SocketHelper();
    }

    /**
     * Set the id that uniquely defines the gateway.
     * <P>
     * Generally, you just need to return this string in getGatewayID().
     * It is used by the even manager to identify the gateway
     *
     * @param id this gateways id string
     */
    public void setGatewayID(String id)
    {
        gatewayID = id;
    }

    /**
     * Return the id hat uniquely defines the gateway.
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
     * This function <i>should</i> return within a admin configured timeout.
     * If it does not, there is an admin controlled switch which will determine
     * if the thread that calls this function gets killed.
     */
    public void start()
    {
        status = STARTING;
        listening = true;
        // Start up event generator thread
        Runnable r = new Runnable()
        {
            public void run()
            {
                socketServer();
            }
        };
        Thread t = new Thread(r);
        t.start();
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
        listening = false;
        Enumeration e = socketRegistry.elements();
        while (e.hasMoreElements())
        {
            try
            {
                ((SocketServerThread) e.nextElement()).socket.close();
            }
            catch (IOException e1)
            {
                // We don't care if a close failed
                //log.error(e1);
            }
        }
        if (serverSocket != null)
        {
            try
            {
                serverSocket.close();
            }
            catch (IOException e1)
            {
            }
            serverSocket = null;
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
     * Return the status of the gateway (RUNNING, STOPPED, etc).
     *
     * @return int status code
     */
    public int getStatus()
    {
        return status;
    }

    /**
     * returns a unique key value to be used for naming
     * the SocketServerThread and register it in the
     * socketRegistry hashtable
     *
     * @return String unique key
     */
    private String getUniqueKey(Object x)
    {
        Integer z = new Integer(System.identityHashCode(x));
        return z.toString();
    }

    /**
     * "Listener" thread routine which sends events to the EventService
     */
    private void socketServer()
    {
        String key;
        try
        {
            serverSocket = new ServerSocket(port);
        }
        catch (IOException e)
        {
            // Log this error - can't start up!
            log.error("SocketGateway(" + gatewayID + ") Error opening port " + port + ": " + e.toString(), e);
            status = FAILED;
        }

        while (listening)
        {
            try
            {
                SocketServerThread a = new SocketServerThread(serverSocket.accept());
                a.start();
                key = getUniqueKey(a);
                a.setName(key);
                socketRegistry.put(key, a);
            }
            catch (SocketException s)
            {
                log.error("SocketGateway(" + gatewayID + ") Error attempting to listen on socket: " + s.toString(), s);
            }
            catch (IOException e)
            {
                log.error("SocketGateway(" + gatewayID + ") Error attempting to listen on socket: " + e.toString(), e);
            }
        }
        if (serverSocket != null)
        {
            try
            {
                serverSocket.close();
            }
            catch (IOException e)
            {
            }
            serverSocket = null;
        }
    }

    private void processInput(String theInput, String theKey)
    {
        // Convert listeners list to a local array
        // protect ourselves if the list changes while we are running
        String[] listeners;
        int size = cfcListeners.size();
        if (size > 0)
        {
            // capture the listeners list
            synchronized (cfcListeners)
            {
                listeners = new String[size];
                cfcListeners.toArray(listeners);
            }
        }
        else
        {
            // Create a dummy list
            listeners = new String[1];
            listeners[0] = null;
        }
        // broadcast to all the CFC listeners
        // send one message at a time with different CFC address on them
        for (int i = 0; i < listeners.length; i++)
        {
            String path = listeners[i];

            CFEvent event = new CFEvent(gatewayID);

            Hashtable mydata = new Hashtable();
            mydata.put("MESSAGE", theInput);
            event.setData(mydata);
            event.setGatewayType("Socket");
            event.setOriginatorID(theKey);

            event.setCfcMethod(cfcEntryPoint);
            event.setCfcTimeOut(10);
            if (path != null)
            {
                event.setCfcPath(path);
            }

            boolean sent = gatewayService.addEvent(event);
            if (!sent)
            {
                log.error("SocketGateway(" + gatewayID + ") Unable to put message on event queue. Message not sent from "
                          + gatewayID + ", thread " + theKey + ".  Message was " + theInput);
            }
        }
    }

    private class SocketServerThread extends Thread
    {
        private Socket socket = null;
        private PrintWriter out = null;
        private BufferedReader in = null;

        public SocketServerThread(Socket socket)
        {
            super();
            this.socket = socket;
        }

        public void run()
        {
            try
            {
                out = new PrintWriter(socket.getOutputStream(), true);
                in = new BufferedReader(new InputStreamReader(socket.getInputStream()));

                String inputLine;
                out.println("Welcome to the ColdFusion Socket Gateway" + "\r\nConnected to Socket " + this.getName());
                out.print("> ");

                while (((inputLine = in.readLine()) != null) && listening)
                {
                    if (inputLine.equals("exit"))
                    {
                        break;
                    }
                    else
                    {
                        processInput(inputLine, this.getName());
                        // TODO: wait() would be cool
                    }
                }
                out.close();
                out = null;
                in.close();
                in = null;
                socket.close();
                socket = null;
                socketRegistry.remove(this.getName());
            }
            catch (SocketException s)
            {
                log.error("SocketGateway(" + gatewayID + ") Error attempting read from socket: " + s.toString(), s);
            }
            catch (IOException e)
            {
                log.error("SocketGateway(" + gatewayID + ") Error attempting read from socket: " + e.toString(), e);
            }
        }

        public void writeOutput(String theOutput)
        {
            out.println(theOutput);
            out.print("> ");
        }
    }

    public class SocketHelper implements GatewayHelper
    {
        public SocketHelper()
        {

        }

        public coldfusion.runtime.Array getSocketIDs()
        {
            coldfusion.runtime.Array a = new coldfusion.runtime.Array();
            Enumeration e = socketRegistry.elements();
            while (e.hasMoreElements())
            {
                a.add(((SocketServerThread) e.nextElement()).getName());
            }
            return a;
        }

        public boolean killSocket(String socketid)
        {
            try
            {
                ((SocketServerThread) socketRegistry.get(socketid)).socket.close();
                ((SocketServerThread) socketRegistry.get(socketid)).socket = null;
                socketRegistry.remove(socketid);
                return true;
            }
            catch (IOException e)
            {
                return false;
            }

        }
    }
}
