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
 * JMSConfiguration
 * a bean that wraps the property-style configuration file:
 * destinationName - full message hub topic / queue name
 * providerURL - full message hub provider URL
 * initialContextFactory - how to get an initial context
 * connectionFactory - how to get a connection
 *
 * @author Sean Corfield
 *
 */

package examples.ActiveMQ;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;
import java.util.StringTokenizer;

public class JMSConfiguration
{
    JMSConfiguration(String configFile) throws java.io.IOException
    {
        properties = new Properties();
        InputStream configFileStream = new FileInputStream(configFile);
        properties.load(configFileStream);
    }

    // "required" properties - no error checking on these (they will return null if the property is missing):
    String getProviderURL()
    {
        return properties.getProperty("providerURL");
    }

    String getInitialContextFactory()
    {
        return properties.getProperty("initialContextFactory");
    }

    String getConnectionFactory()
    {
        return properties.getProperty("connectionFactory");
    }

    // optional / translated properties:
    String getDestinationName()
    {
        return properties.getProperty("destinationName");
    }

    // connection names can be a short name or a fully-qualified cn
    // this method strips cn=connectionname,cn=... down to just connectionname
    static String getShortDestinationName(String fullDestinationName)
    {
        String shortDestinationName = fullDestinationName;
        if (fullDestinationName.startsWith("cn="))
        {
            int comma = fullDestinationName.indexOf(',');
            if (comma > 0)
            {
                shortDestinationName = fullDestinationName.substring(3, comma);
            }
            else
            {
                shortDestinationName = fullDestinationName.substring(3);
            }
        }
        return shortDestinationName.toLowerCase();
    }

    String getSubscriberName()
    {
        String subscriberName = properties.getProperty("subscriberName");
        if (subscriberName == null)
        {
            return "sub_" + getShortDestinationName(getDestinationName());
        }
        else
        {
            return subscriberName;
        }
    }

    String getUsername()
    {
        return properties.getProperty("username");
    }

    String getPassword()
    {
        return properties.getProperty("password");
    }

    String getPublisherName(String destinationName)
    {
        String publisherName = properties.getProperty("publisherName");
        if (publisherName == null)
        {
            return "pub_" + getShortDestinationName(destinationName);
        }
        else
        {
            return publisherName;
        }
    }

    Properties getContextProperties()
    {
        Properties props = new Properties();
        String contextProperties = properties.getProperty("contextProperties");
        if (contextProperties != null)
        {
            // comma-separated list of other properties to add:
            StringTokenizer parser = new StringTokenizer(contextProperties, ",");
            while (parser.hasMoreTokens())
            {
                String propName = parser.nextToken();
                String propVal = properties.getProperty(propName);
                if (propVal != null)
                {
                    props.setProperty(propName, propVal);
                }
            }
        }
        return props;
    }

    String getSelector()
    {
        return properties.getProperty("selector");
    }

    boolean isTopic()
    {
        String topic = properties.getProperty("topic");
        if (topic == null)
        {
            return true;
        }
        else
        {
            return topic.equals("yes") || topic.equals("true");
        }
    }

    boolean isDurable()
    {
        String durable = properties.getProperty("durable");
        if (durable == null)
        {
            return false;
        }
        else
        {
            return durable.equals("yes") || durable.equals("true");
        }
    }

    boolean isNoLocal()
    {
        String noLocal = properties.getProperty("noLocal");
        if (noLocal == null)
        {
            return false;
        }
        else
        {
            return noLocal.equals("yes") || noLocal.equals("true");
        }
    }

    boolean isTransacted()
    {
        String transacted = properties.getProperty("transacted");
        if (transacted == null)
        {
            return false;
        }
        else
        {
            return transacted.equals("yes") || transacted.equals("true");
        }
    }

    public int getPoolSize()
    {
        String poolSize = properties.getProperty("poolSize");
        if (poolSize == null)
        {
            return 10;
        }
        else
        {
            return Integer.parseInt(poolSize);
        }
    }

    public int getTransactionTimeout()
    {
        String transactionTimeout = properties.getProperty("transactionTimeout");
        if (transactionTimeout == null)
        {
            return 60;
        }
        else
        {
            return Integer.parseInt(transactionTimeout);
        }
    }

    public String getActionOnTimeout()
    {
        String actionOnTimeout = properties.getProperty("actionOnTimeout");
        if (actionOnTimeout == null)
        {
            return "rollback";
        }
        else
        {
            return actionOnTimeout;
        }
    }

    boolean isCachable()
    {
        String cachable = properties.getProperty("cachable");
        if (cachable == null)
        {
            return false;
        }
        else
        {
            return cachable.equals("yes") || cachable.equals("true");
        }
    }

    boolean isDebugOn()
    {
        String debug = properties.getProperty("debug");
        if (debug == null)
        {
            return false;
        }
        else
        {
            return debug.equals("yes") || debug.equals("true");
        }
    }

    boolean isOutboundOnly()
    {
        String outbound = properties.getProperty("outboundOnly");
        if (outbound == null)
        {
            return false;
        }
        else
        {
            return outbound.equals("yes") || outbound.equals("true");
        }
    }

    Properties properties;

    // main() for testing purposes only
    public static void main(String[] args)
    {
        if (args.length >= 1)
        {
            System.out.println("Loading " + args[0]);
            try
            {
                JMSConfiguration config = new JMSConfiguration(args[0]);
                System.out.println("destinationName " + config.getDestinationName());
                System.out.println("providerURL " + config.getProviderURL());
                System.out.println("initialContextFactory " + config.getInitialContextFactory());
                System.out.println("connectionFactory " + config.getConnectionFactory());
                if (config.isDurable())
                {
                    System.out.println("durable subscriberName " + config.getSubscriberName());
                }
                if (config.isDebugOn())
                {
                    System.out.println("debug level logging enabled");
                }
            }
            catch (Exception e)
            {
                System.out.println("JMSConfiguration failed");
                e.printStackTrace();
            }
        }
        else
        {
            System.out.println("Usage: JMSConfiguration {filename}");
        }
    }

}
