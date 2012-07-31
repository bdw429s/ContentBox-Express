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
 * JMSConsumer
 * implements a generic JMS subscriber that is attached to
 * a ColdFusion event gateway. The gateway is provided at construction time
 * and all messages received are passed to the gateway to be handled.
 *
 * @author Sean Corfield
 *
 */

package examples.ActiveMQ;

import javax.jms.Connection;
import javax.jms.ExceptionListener;
import javax.jms.JMSException;
import javax.jms.QueueConnectionFactory;
import javax.jms.TopicConnectionFactory;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.Enumeration;
import java.util.Properties;

//Create a class declaration that implements the MessageListener interface:

public class JMSConsumer implements ExceptionListener
{

    // start the connection to the hub
    void start() throws Exception
    {
        if (this.isOutboundOnly)
        {
            this.isRunning = true;
            return;
        }
        if (this.isDebugOn)
        {
            this.getGateway().getLogger().info("JMSConsumer.start() called");
        }
        if (this.isDebugOn)
        {
            this.getGateway().getLogger().info("JMSConsumer.start() initializing");
        }

        Properties env = new Properties();
        env.setProperty(Context.PROVIDER_URL, this.getConfiguration().getProviderURL());
        env.setProperty(Context.INITIAL_CONTEXT_FACTORY, this.getConfiguration().getInitialContextFactory());
        // add any extra context parameters here:
        Properties extra = this.getConfiguration().getContextProperties();
        Enumeration props = extra.propertyNames();
        while (props.hasMoreElements())
        {
            String propName = (String) props.nextElement();
            env.setProperty(propName, extra.getProperty(propName));
        }
        this.setJndi(new InitialContext(env));

        // allow for username / password here:
        String username = this.getConfiguration().getUsername();
        String password = this.getConfiguration().getPassword();

        if (this.getConfiguration().isTopic())
        {
            TopicConnectionFactory conFactory =
                    (TopicConnectionFactory) this.getJndi().lookup(this.getConfiguration().getConnectionFactory());

            this.setConnection((username == null || password == null)
                    ? conFactory.createTopicConnection()
                    : conFactory.createTopicConnection(username, password));
            if (this.getConfiguration().isDurable())
            {
                try
                {
                    this.getConnection().setClientID(this.getConfiguration().getSubscriberName());
                }
                catch (JMSException e)
                {
                    // ignore
                }
            }
        }
        else
        {
            QueueConnectionFactory conFactory =
                    (QueueConnectionFactory) this.getJndi().lookup(this.getConfiguration().getConnectionFactory());

            this.setConnection((username == null || password == null)
                    ? conFactory.createQueueConnection()
                    : conFactory.createQueueConnection(username, password));
        }
        this.getConnection().setExceptionListener(this);

        // Start the JMS connection; allows messages to be delivered.
        if (this.isDebugOn)
        {
            this.getGateway().getLogger().info("JMSConsumer.start() starting connection");
        }
        this.getConnection().start();
        if (this.getConfiguration().isTransacted())
        {
            // need a pool of consumers
            this.jmsSession = new JMSConsumeSession[this.getConfiguration().getPoolSize()];
            for (int i = 0; i < this.getConfiguration().getPoolSize(); ++i)
            {
                this.jmsSession[i] = new JMSConsumeSession(this);
            }
        }
        else
        {
            // just a single consumer
            this.jmsSession = new JMSConsumeSession[1];
            this.jmsSession[0] = new JMSConsumeSession(this);
        }
        this.isRunning = true;
        if (this.isDebugOn)
        {
            this.getGateway().getLogger().info("JMSConsumer.start() done");
        }
    }

    // stop the connection to the hub
    void stop() throws Exception
    {
        if (this.isOutboundOnly)
        {
            this.isRunning = false;
            return;
        }
        if (this.isDebugOn)
        {
            this.getGateway().getLogger().info("JMSConsumer.stop() called");
        }
        this.getConnection().stop();
        this.setConnection(null);
        for (int i = 0; i < this.jmsSession.length; ++i)
        {
            this.jmsSession[i].close();
        }
        this.jmsSession = null;
        this.isRunning = false;
        if (this.isDebugOn)
        {
            this.getGateway().getLogger().info("JMSConsumer.stop() done");
        }
    }

    // expose internal status:
    boolean isStarted()
    {
        return this.isRunning;
    }

    // we try to stop and restart the connection (most likely it's a timeout problem):
    public void onException(JMSException jmse)
    {
        if (this.isDebugOn)
        {
            this.getGateway().getLogger().info("JMSConsumer.onException() called: " + jmse.toString());
        }
        boolean isRestarted = false;
        int nAttempts = 0;
        int maxAttempts = 30;
        long pauseTime = 1000;
        while (!isRestarted)
        {
            ++nAttempts;
            if (this.isDebugOn)
            {
                this.getGateway().getLogger().info("JMSConsumer.onException() attempt #" + nAttempts);
            }
            try
            {
                this.stop();
            }
            catch (Exception eStop)
            {
                if (this.isDebugOn)
                {
                    this.getGateway().getLogger().info("JMSConsumer.onException() stop() failed: " + eStop.toString());
                }
            }
            // pause between stop / start to allow server time to clean up the connection:
            try
            {
                java.lang.Thread.sleep(pauseTime);
            }
            catch (Exception eSleep)
            {
                // unexpected but harmless... just means we sleep less!
            }
            try
            {
                this.start();
                isRestarted = true;
            }
            catch (Exception eStart)
            {
                if (this.isDebugOn)
                {
                    this.getGateway().getLogger().info("JMSConsumer.onException() start() failed: " + eStart.toString());
                }
                // we failed to restart the connection, try again:
                if (this.isDebugOn)
                {
                    this.getGateway().getLogger().info("JMSConsumer.onException() - try restart");
                }
                try
                {
                    this.start();
                    isRestarted = true;
                }
                catch (Exception eRestart)
                {
                    this.getGateway().getLogger().error("JMSConsumer.onException() start() failed (second attempt): "
                            + eRestart.toString());
                }
            }
            if (!isRestarted && nAttempts == maxAttempts)
            {
                // we haven't been able to recover after several attempts
                // we need to shutdown :(
                this.getGateway().getLogger().error("JMSConsumer.onException() maximum retries exceeded - giving up!");
                break;
            }
        }
        if (this.isDebugOn)
        {
            this.getGateway().getLogger().info("JMSConsumer.onException() done");
        }
    }

    JMSConsumer(JMSGateway gateway) throws Exception
    {
        this.setGateway(gateway);
        // the gateway will call start and complete our initialization
    }

    // this forces the configuration file to be re-read
    void reconfigure(String configFile) throws Exception
    {
        this.setConfiguration(new JMSConfiguration(configFile));
        this.isDebugOn = this.getConfiguration().isDebugOn();
        this.isOutboundOnly = this.getConfiguration().isOutboundOnly();
    }

    public void setConfiguration(JMSConfiguration configuration)
    {
        this.configuration = configuration;
    }

    public JMSConfiguration getConfiguration()
    {
        return configuration;
    }

    public void setConnection(Connection connection)
    {
        this.connection = connection;
    }

    public Connection getConnection()
    {
        return connection;
    }

    public void setJndi(Context jndi)
    {
        this.jndi = jndi;
    }

    public Context getJndi()
    {
        return jndi;
    }

    public void setGateway(JMSGateway gateway)
    {
        this.gateway = gateway;
    }

    public JMSGateway getGateway()
    {
        return gateway;
    }

    // Declare variables for the objects used by JMS, as follows:
    private Connection connection = null;
    private Context jndi = null;

    private boolean isDebugOn = false;
    private boolean isOutboundOnly = false;
    private boolean isRunning = false;
    private JMSConfiguration configuration;
    private JMSGateway gateway;
    private JMSConsumeSession[] jmsSession;
}
