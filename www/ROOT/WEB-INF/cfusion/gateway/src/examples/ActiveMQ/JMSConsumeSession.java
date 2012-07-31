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
 * JMSConsumerSession
 * implements the JMS session management for a consumer. This
 * allows the event gateway to manage transacted consumption.
 * The gateway creates a pool of these session objects.
 *
 * @author Sean Corfield
 *
 */

package examples.ActiveMQ;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.jms.Topic;
import javax.jms.TopicConnection;
import javax.jms.TopicSession;

public class JMSConsumeSession implements MessageListener, Runnable
{

    public JMSConsumeSession(JMSConsumer jmsConsumer) throws Exception
    {
        this.jmsConsumer = jmsConsumer;

        // see if there was a selector specified:
        String selector = this.jmsConsumer.getConfiguration().getSelector();
        boolean noLocal = this.jmsConsumer.getConfiguration().isNoLocal();

        if (this.jmsConsumer.getConfiguration().isTopic())
        {
            this.jmsSession = ((TopicConnection) this.jmsConsumer.getConnection())
                    .createTopicSession(this.jmsConsumer.getConfiguration().isTransacted(), Session.AUTO_ACKNOWLEDGE);

            Topic thisDestination = (Topic) jmsConsumer.getJndi()
                    .lookup(this.jmsConsumer.getConfiguration().getDestinationName());

            if (this.jmsConsumer.getConfiguration().isDurable())
            {
                if (selector == null)
                {
                    this.msgConsumer = ((TopicSession) this.jmsSession)
                            .createDurableSubscriber(thisDestination,
                                                     this.jmsConsumer.getConfiguration().getSubscriberName());
                }
                else
                {
                    this.msgConsumer = ((TopicSession) this.jmsSession)
                            .createDurableSubscriber(thisDestination,
                                                     this.jmsConsumer.getConfiguration().getSubscriberName(),
                                                     selector, noLocal);
                }
            }
            else
            {
                if (selector == null)
                {
                    this.msgConsumer = ((TopicSession) this.jmsSession).createSubscriber(thisDestination);
                }
                else
                {
                    this.msgConsumer = ((TopicSession) this.jmsSession)
                            .createSubscriber(thisDestination, selector, noLocal);
                }
            }
        }
        else
        {
            this.jmsSession = ((QueueConnection) this.jmsConsumer.getConnection())
                    .createQueueSession(this.jmsConsumer.getConfiguration().isTransacted(), Session.AUTO_ACKNOWLEDGE);

            Queue thisDestination = (Queue) jmsConsumer.getJndi()
                    .lookup(this.jmsConsumer.getConfiguration().getDestinationName());

            if (this.jmsConsumer.getConfiguration().isDurable())
            {
                // TODO: illegal configuration!
            }
            else
            {
                if (selector == null)
                {
                    this.msgConsumer = ((QueueSession) this.jmsSession).createReceiver(thisDestination);
                }
                else
                {
                    this.msgConsumer = ((QueueSession) this.jmsSession).createReceiver(thisDestination, selector);
                }
            }
        }
        new Thread(this).start();
    }

    public void run()
    {
        if (this.jmsConsumer.getConfiguration().isTransacted())
        {
            Message message;
            int waitTime = 0;
            // get time limit in milliseconds:
            int timeLimit = this.jmsConsumer.getConfiguration().getTransactionTimeout() * 1000;

            while (this.active)
            {
                if (this.waiting)
                {
                    // if the CF code never calls commit() or rollback(), we lose
                    // this thread from the pool - this is sort of detectable if we
                    // find ourselves repeatedly looping in this waiting state
                    try
                    {
                        Thread.sleep(sleepTime);
                        waitTime += sleepTime;
                        if (waitTime >= timeLimit)
                        {
                            this.jmsConsumer.getGateway().getLogger().error("ColdFusion code did not commit() or rollback() within " + waitTime + " milliseconds.");
                            if ("rollback".equals(this.jmsConsumer.getConfiguration().getActionOnTimeout()))
                            {
                                this.jmsConsumer.getGateway().getLogger().error("Performing automatic rollback() after transaction timeout.");
                                this.rollback();
                            }
                            else
                            {
                                this.jmsConsumer.getGateway().getLogger().error("Performing automatic commit() after transaction timeout.");
                                this.commit();
                            }
                        }
                    }
                    catch (InterruptedException e)
                    {
                        // ignore interrupted sleep
                    }
                }
                else
                {
                    waitTime = 0;
                    try
                    {
                        message = this.msgConsumer.receive(waitTime);
                        if (message != null)
                        {
                            this.waiting = true;
                            onMessage(message);
                        }
                    }
                    catch (JMSException e)
                    {
                        // ignore timeout exception
                    }
                }
            }
        }
        else
        {
            try
            {
                this.msgConsumer.setMessageListener(this);
            }
            catch (JMSException e)
            {
                // TODO: ignore this failure
            }
        }
    }

    // Code an onMessage method that retrieves messages from the connection:
    public void onMessage(Message message)
    {
        // hand off to the event gateway
        this.jmsConsumer.getGateway().handleMessage(message,
                                                    this.jmsConsumer.getConfiguration().getDestinationName(),
                                                    this.jmsConsumer.getConfiguration().isTransacted(),
                                                    this);
    }

    public void close()
    {
        this.active = false;
        try
        {
            Thread.sleep(waitTime + sleepTime + 1);
        }
        catch (InterruptedException e1)
        {
            // ignore
        }
        try
        {
            this.msgConsumer.close();
        }
        catch (Exception e)
        {
        }
        this.msgConsumer = null;
        try
        {
            this.jmsSession.close();
        }
        catch (Exception e)
        {
        }
        this.jmsSession = null;
    }

    public void commit()
    {
        try
        {
            this.jmsSession.commit();
        }
        catch (JMSException e)
        {
        }
        this.waiting = false;
    }

    public void rollback()
    {
        try
        {
            this.jmsSession.rollback();
        }
        catch (JMSException e)
        {
        }
        this.waiting = false;
    }

    // Declare variables for the objects used by JMS, as follows:
    private boolean active = true;
    private boolean waiting = false;
    private final int sleepTime = 10;
    private final int waitTime = sleepTime * 10;
    private Session jmsSession = null;
    private MessageConsumer msgConsumer = null;
    private JMSConsumer jmsConsumer = null;
}
