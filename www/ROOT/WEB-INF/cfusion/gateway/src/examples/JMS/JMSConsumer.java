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
 * JMSConsumer
 * implements a generic JMS topic subscriber that is attached to
 * a ColdFusion event gateway. The gateway is provided at construction time
 * and all messages received are passed to the gateway to be handled.
 *
 * @author Sean Corfield
 *
 */

package examples.JMS;

import javax.jms.BytesMessage;
import javax.jms.ExceptionListener;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.jms.Topic;
import javax.jms.TopicConnection;
import javax.jms.TopicConnectionFactory;
import javax.jms.TopicSession;
import javax.jms.TopicSubscriber;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.Enumeration;
import java.util.Properties;

// Create a class declaration that implements the MessageListener interface:

public class JMSConsumer implements MessageListener, ExceptionListener
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
            this.gateway.getLogger().info("JMSConsumer.start() called");
        }
        if (this.isDebugOn)
        {
            this.gateway.getLogger().info("JMSConsumer.start() initializing");
        }
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
        Context jndi = new InitialContext(env);

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
            this.connection.setClientID(this.configuration.getSubscriberName());
        }
        catch (JMSException e)
        {
            // ignore
        }
        this.subSession = this.connection.createTopicSession(false, Session.AUTO_ACKNOWLEDGE);

        Topic thisTopic = (Topic) jndi.lookup(this.configuration.getTopicName());

        if (this.configuration.isDurable())
        {
            this.subscriber = this.subSession.createDurableSubscriber(thisTopic,
                                                                      this.configuration.getSubscriberName());
        }
        else
        {
            this.subscriber = this.subSession.createSubscriber(thisTopic);
        }
        this.subscriber.setMessageListener(this);
        this.connection.setExceptionListener(this);

        // Start the JMS connection; allows messages to be delivered.
        if (this.isDebugOn)
        {
            this.gateway.getLogger().info("JMSConsumer.start() starting connection");
        }
        this.connection.start();
        this.isRunning = true;
        if (this.isDebugOn)
        {
            this.gateway.getLogger().info("JMSConsumer.start() done");
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
            this.gateway.getLogger().info("JMSConsumer.stop() called");
        }
        this.connection.stop();
        this.connection = null;
        try
        {
            this.subscriber.close();
        }
        catch (Exception e)
        {
        }
        this.subscriber = null;
        try
        {
            this.subSession.close();
        }
        catch (Exception e)
        {
        }
        this.subSession = null;
        this.isRunning = false;
        if (this.isDebugOn)
        {
            this.gateway.getLogger().info("JMSConsumer.stop() done");
        }
    }

    // expose internal status:
    boolean isStarted()
    {
        return this.isRunning;
    }

    // Code an onMessage method that retrieves messages from the topic:
    public void onMessage(Message message)
    {
        try
        {
            String text = null;
            // handles both text and UTF-8 bytes formats:
            if (message instanceof BytesMessage)
            {
                BytesMessage bytesMessage = (BytesMessage) message;
                text = bytesMessage.readUTF();
            }
            else
            {
                TextMessage textMessage = (TextMessage) message;
                text = textMessage.getText();
            }
            // hand off to the event gateway
            this.gateway.handleMessage(text, this.configuration.getTopicName(),
                                       message.getJMSCorrelationID());
        }
        catch (Exception jmse)
        {
            this.gateway.getLogger().error("JMSConsumer.onMessage() failed to handle message! " + jmse.toString());
        }
    }

    // we try to stop and restart the connection (most likely it's a timeout problem):
    public void onException(JMSException jmse)
    {
        if (this.isDebugOn)
        {
            this.gateway.getLogger().info("JMSConsumer.onException() called: " + jmse.toString());
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
                this.gateway.getLogger().info("JMSConsumer.onException() attempt #" + nAttempts);
            }
            try
            {
                this.stop();
            }
            catch (Exception eStop)
            {
                if (this.isDebugOn)
                {
                    this.gateway.getLogger().info("JMSConsumer.onException() stop() failed: " + eStop.toString());
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
                    this.gateway.getLogger().info("JMSConsumer.onException() start() failed: " + eStart.toString());
                }
                // we failed to restart the connection, try again:
                if (this.isDebugOn)
                {
                    this.gateway.getLogger().info("JMSConsumer.onException() - try restart");
                }
                try
                {
                    this.start();
                    isRestarted = true;
                }
                catch (Exception eRestart)
                {
                    this.gateway.getLogger().error("JMSConsumer.onException() start() failed (second attempt): "
                                                   + eRestart.toString());
                }
            }
            if (!isRestarted && nAttempts == maxAttempts)
            {
                // we haven't been able to recover after several attempts
                // we need to shutdown :(
                this.gateway.getLogger().error("JMSConsumer.onException() maximum retries exceeded - giving up!");
                break;
            }
        }
        if (this.isDebugOn)
        {
            this.gateway.getLogger().info("JMSConsumer.onException() done");
        }
    }

    JMSConsumer(JMSGateway gateway) throws Exception
    {
        this.gateway = gateway;
        // the gateway will call start and complete our initialization
    }

    // this forces the configuration file to be re-read
    void reconfigure(String configFile) throws Exception
    {
        this.configuration = new JMSConfiguration(configFile);
        this.isDebugOn = this.configuration.isDebugOn();
        this.isOutboundOnly = this.configuration.isOutboundOnly();
    }

    // Declare variables for the objects used by JMS, as follows:
    private TopicConnection connection = null;
    private TopicSubscriber subscriber = null;
    private TopicSession subSession = null;

    private boolean isDebugOn = false;
    private boolean isOutboundOnly = false;
    private boolean isRunning = false;
    private JMSConfiguration configuration;
    private JMSGateway gateway;
}
