/**
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

package examples.watcher;

import coldfusion.eventgateway.CFEvent;
import coldfusion.eventgateway.Logger;
import coldfusion.server.ServiceRuntimeException;
import examples.EmptyGateway;

import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import java.util.Properties;
import java.util.StringTokenizer;

/**
 * DirectoryWatcherGateway
 * <p/>
 * Send events when a file is created, deleted, or modified in a directory.
 * This gateway extends the EmptyGateway, which shows how you can implement
 * a simple gateway without having to do all the boilerplate functions.
 * <P>
 * Configuration file options:
 * <ul>
 * <li>directory - where to watch
 * <li>recurse - should we recurse in to subdirectories?
 * <li>extensions - a list of extensions to match
 * <li>interval - how often should we check the directory
 * <li>changeFunction - which CFC function send file change events
 * <li>addFunction - which CFC function to send file add events
 * <li>deleteFunction - which CFC function to send file delete events
 * </ul>
 *
 * @author Tom Jordahl
 */
public class DirectoryWatcherGateway extends EmptyGateway implements FilenameFilter
{
    // Default interval - 1 minute
    private static final long SIXTY_SECONDS = 60 * 1000;

    // Handle to the logger
    private Logger logger = null;

    //
    // These are set in the configuration file
    //

    // Directory to monitor
    protected String directory = null;
    // Extensions to monitor
    protected String[] extensions = null;
    // should we recurse into subdirectories?
    protected boolean recursive = false;
    // interval to check directory
    protected long interval = SIXTY_SECONDS;
    // CFC Function for file Change events
    protected String changeFunction = "onChange";
    // CFC Function for file Add events
    protected String addFunction = "onAdd";
    // CFC Function for file Delete events
    protected String deleteFunction = "onDelete";


    /**
     * Requred Gateway constructor.
     * <P>
     * Throw a coldfusion.server.ServiceRuntimeException
     * if something goes wrong in initialization.
     */
    public DirectoryWatcherGateway(String gatewayID, String config)
    {
        // Initialize the EmptyGateway constructor
        super(gatewayID, config);

        // We create our own log file, which will be named "watcher.log"
        logger = gatewayService.getLogger("watcher");

        // Load our configuration file
        loadconfig();
    }

    /**
     * Load the properties file to get our settings
     */
    protected void loadconfig() throws ServiceRuntimeException
    {
        // load config
        logger.info("DirectoryWatcher (" + gatewayID + ") Initializing DirectoryWatcher gateway with configuration file " + config);
        Properties properties = new Properties();

        try
        {
            FileInputStream propsFile = new FileInputStream(config);
            properties.load(propsFile);
            propsFile.close();
        }
        catch (IOException e)
        {
            String error = "DirectoryWatcher (" + gatewayID + ") Unable to load configuration file";
            throw new ServiceRuntimeException(error, e);
        }

        // The directory to monitor
        directory = properties.getProperty("directory");
        if (directory == null || directory.length() == 0)
        {
            String error = "DirectoryWatcher (" + gatewayID + ") Missing 'directory' property in configuration file " + config;
            throw new ServiceRuntimeException(error);
        }

        // recusive?
        recursive = false;
        String value = properties.getProperty("recurse", "no");
        if (value.equalsIgnoreCase("true") || value.equalsIgnoreCase("yes") || value.equals("1"))
        {
            recursive = true;
        }

        // The list of extensions to match
        String exts = properties.getProperty("extensions");
        if (exts == null)
        {
            // Default is all extensions
            extensions = new String[]{"*"};
        }
        else
        {
            ArrayList e = new ArrayList();
            StringTokenizer tok = new StringTokenizer(exts, ",");
            while (tok.hasMoreTokens())
            {
                e.add(tok.nextToken());
            }
            extensions = new String[e.size()];
            extensions = (String[]) e.toArray(extensions);
        }

        // The interval to check, in miliseconds
        String intvl = properties.getProperty("interval", "60000");
        try
        {
            interval = Long.parseLong(intvl);
        }
        catch (NumberFormatException e)
        {
            interval = SIXTY_SECONDS;
        }

        // Event functions
        changeFunction = properties.getProperty("changeFunction", "onChange");
        addFunction = properties.getProperty("addFunction", "onAdd");
        deleteFunction = properties.getProperty("deleteFunction", "onDelete");
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
        // Return a String, possibly a messageID number or error string
        return "ERROR: outgoingMessage not supported";
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

        // The EmptyGateway doesn't reload the configuration
        loadconfig();

        start();
    }


    /**
     * Listener thread which send events in to the EventService
     */
    protected void listener()
    {
        Hashtable last = new Hashtable();
        boolean first = true;   // first time through?
        while (!shutdown)
        {
            File dir = new File(directory);

            if (!dir.exists())
            {
                logger.error("DirectoryWatcher (" + gatewayID + ") Directory does not exists: " + directory);
                status = FAILED;
                break;
            }
            if (!dir.isDirectory())
            {
                logger.error("DirectoryWatcher (" + gatewayID + ") Path is not a directory: " + directory);
                status = FAILED;
                break;
            }

            // Check for changed files
            ArrayList files = new ArrayList();
            getFiles(dir, files);

            // compare with the last time we ran
            Enumeration keys = last.keys();
            while (keys.hasMoreElements())
            {
                String fname = (String) keys.nextElement();
                if (!files.contains(fname))
                {
                    last.remove(fname);
                    if (!first)
                    {
                        sendEvent(EVENT_DELETED, fname, 0);
                    }
                }
            }
            for (int i = 0; i < files.size(); i++)
            {
                String fname = (String) files.get(i);

                if (last.get(fname) == null)
                {
                    long lastmod = new File(fname).lastModified();
                    last.put(fname, new Long(lastmod));
                    if (!first)
                    {
                        sendEvent(EVENT_ADDED, fname, lastmod);
                    }
                }
                else
                {
                    long lastmod = ((Long) last.get(fname)).longValue();
                    long modtime = new File(fname).lastModified();
                    if (modtime != lastmod)
                    {
                        last.put(fname, new Long(modtime));
                        if (!first)
                        {
                            sendEvent(EVENT_CHANGED, fname, lastmod);
                        }
                    }
                }
            }

            first = false;
            try
            {
                Thread.sleep(interval);
            }
            catch (InterruptedException e)
            {
                // probably shutdown
            }
        }
    }

    private static final int EVENT_ADDED = 1;
    private static final int EVENT_DELETED = 2;
    private static final int EVENT_CHANGED = 3;

    /**
     * Send an event to the configured CFC
     *
     * @param type     the type of event: Added, Deleted, Changed
     * @param filename the filename
     * @param lastmod  the last modication time of this file (for changed)
     */
    private void sendEvent(int type, String filename, long lastmod)
    {
        String typeString;
        String cfcFunction;

        if (type == EVENT_ADDED)
        {
            typeString = "ADD";
            cfcFunction = addFunction;
        }
        else if (type == EVENT_DELETED)
        {
            typeString = "DELETE";
            cfcFunction = deleteFunction;
        }
        else
        {
            typeString = "CHANGE";
            cfcFunction = changeFunction;
        }

        // If no function is defined for this event, do nothing.
        if (cfcFunction == null || cfcFunction.trim().length() == 0)
        {
            return;
        }

        // create an event
        // Use our gatewayID (as told to us earlier) to identify where the message comes from.
        CFEvent event = new CFEvent(gatewayID);

        // Set the function to call in the CFC.
        event.setCfcMethod(cfcFunction);

        // Create a Map of key-value pairs, generally containing the event data.
        // You will need to document what data members the CFML user can expect.
        // NOTE: Since CFML is case insensitive, this is converted in to a case
        // insensitive Map so keys are case insensitive.
        Hashtable mydata = new Hashtable();
        mydata.put("TYPE", typeString);
        mydata.put("FILENAME", filename);
        if (lastmod != 0)
        {
            mydata.put("LASTMODIFIED", new Date(lastmod));
        }

        // Set the data in the event
        event.setData(mydata);

        // Set a gateway type, this is a string that identifies the class of
        // gateway (e.g. "SMS", "AIM") and is the same for all instances.
        event.setGatewayType("FileWatcher");

        // Set an ID that is used to identify the sender
        event.setOriginatorID("");

        // Send to each listener
        // We reuse the Event - will this get us in to trouble?
        for (int i = 0; i < listeners.length; i++)
        {
            // Set CFC path
            event.setCfcPath(listeners[i]);

            // send it to the event service
            gatewayService.addEvent(event);
        }
    }

    /**
     * Implement FilenameFilter method
     * <p/>
     * Tests if a specified file should be included in a file list.
     *
     * @param dir  the directory in which the file was found.
     * @param name the name of the file.
     * @return <code>true</code> if and only if the name should be
     *         included in the file list; <code>false</code> otherwise.
     */
    public boolean accept(File dir, String name)
    {
        // a subdir is allowed if recursing
        if (recursive && new File(dir.toString() + File.separator + name).isDirectory())
        {
            return true;
        }

        for (int i = 0; i < extensions.length; i++)
        {
            String extension = extensions[i];
            // all extensions
            if ("*".equals(extension))
            {
                return true;
            }

            // compare extension
            if (name.length() > extension.length() && extension.compareToIgnoreCase(name.substring(name.length() - extension.length())) == 0)
            {
                return true;
            }
        }

        return false;
    }

    /**
     * Get a list of files from this directory matching the criteria
     * (extension, recursion, etc)
     *
     * @param d  The directory
     * @param lf list of File objects in the directory matching the criteria
     */
    private void getFiles(File d, List lf)
    {
        // Get the list of files
        File[] files = d.listFiles(this);

        if (files != null)
        {
            for (int i = 0; i < files.length; i++)
            {
                File tmp = files[i];
                if (tmp.isDirectory())
                {
                    if (recursive)
                    {
                        getFiles(tmp, lf);
                    }
                }
                else
                {
                    lf.add(tmp.toString());
                }
            }
        }
    }
}


