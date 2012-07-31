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
 * JMSConfiguration
 * a bean that wraps the property-style configuration file:
 * topicName - full message hub topic name
 * providerURL - full message hub provider URL
 * initialContextFactory - how to get an initial context
 * topicConnectionFactory - how to get a connection
 *
 * @author Sean Corfield
 *
 */

package examples.JMS;

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

    String getTopicConnectionFactory()
    {
        return properties.getProperty("topicConnectionFactory");
    }

    // optional / translated properties:
    String getTopicName()
    {
        return properties.getProperty("topicName");
    }

    // topic names can be a short name or a fully-qualified cn
    // this method strips cn=topicname,cn=... down to just topicname
    static String getShortTopicName(String fullTopicName)
    {
    	String shortTopicName = fullTopicName;
    	if (fullTopicName.startsWith("cn="))
    	{
    		int comma = fullTopicName.indexOf(',');
    		if (comma > 0)
    		{
    			shortTopicName = fullTopicName.substring(3,comma);
    		}
    		else
    		{
    			shortTopicName = fullTopicName.substring(3);
    		}
    	}
    	return shortTopicName.toLowerCase();
    }

    String getSubscriberName()
    {
        String subscriberName = properties.getProperty("subscriberName");
        if (subscriberName == null)
        {
            return new String("sub_" + getShortTopicName(getTopicName()));
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

    String getPublisherName(String topicName)
    {
        String publisherName = properties.getProperty("publisherName");
        if (publisherName == null)
        {
            return new String("pub_" + getShortTopicName(topicName));
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
    		StringTokenizer parser = new StringTokenizer(contextProperties,",");
    		while (parser.hasMoreTokens())
    		{
    			String propName = parser.nextToken();
    			String propVal = properties.getProperty(propName);
    			if (propVal != null)
    			{
    				props.setProperty(propName,propVal);
    			}
    		}
    	}
		return props;
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
                System.out.println("topicName " + config.getTopicName());
                System.out.println("providerURL " + config.getProviderURL());
                System.out.println("initialContextFactory " + config.getInitialContextFactory());
                System.out.println("topicConnectionFactory " + config.getTopicConnectionFactory());
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
