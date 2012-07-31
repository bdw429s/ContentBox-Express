/***********************************************************************************************************
*
* ADOBE CONFIDENTIAL
* ___________________
*
*  Copyright 2008 Adobe Systems Incorporated
*  All Rights Reserved.
*
*  NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
*  terms of the Adobe license agreement accompanying it.  If you have received this file from a 
*  source other than Adobe, then your use, modification, or distribution of it requires the prior 
*  written permission of Adobe.
*************************************************************************************************************/

/**
 * Mail service to send mail in cfscript
 * @name mail  
 * @displayname ColdFusion Mail service 
 * @output false 
 * @accessors true
 */
component extends="base"
{
    property string from; 
    property string to; 
    property string subject; 
    property string bcc; 
    property string cc; 
    property string charset; 
    property boolean debug; 
    property string failto; 
    property string group; 
    property boolean groupcasesensitive; 
    property string mailerid; 
    property numeric maxrows; 
    property string mimeattach; 
    property string password; 
    property numeric port; 
    property numeric priority; 
    property query query; 
    property string replyto; 
    property string server; 
    property boolean spoolenable; 
    property numeric startrow; 
    property numeric timeout; 
    property string type; 
    property string username; 
    property boolean useSSL;
    property boolean useTLS; 
    property string wraptext; 
    property boolean remove;
    property string body; //required for specifying mail content. Not a valid cfmail attribute

    //used to store cfmailparams
    variables.parameters = [];
    
    //used to store cfmailparts
    variables.parts = [];
    
	//service tag to invoke
    variables.tagName = "CFMAIL";

    //list of valid cfmail tag attributes. We add the body attribute which we use to capture mail content
    variables.tagattributes = listappend(getSupportedTagAttributes(getTagName()),"body");


    /**
	 * Initialization routine. Returns an instance of this component
	 * @output false
	 */
    public mail function init()
    {
		if(!structisempty(arguments))
        {
        	 structappend(variables,arguments,"yes");
    	}
        return this;
    }


    /**
	 * Add cfmailpart child tags
	 * @output false      
	 */
    public void function addPart()
    {
		if(!structisempty(arguments))
        {
        	arrayappend(variables.parts, arguments);
    	}
    }


    /**
	 * Clear cfmailpart child tags
	 * @output false      
	 */
    public void function clearParts()
    {
		 variables.parts = [];
    }


    /**
     * Clear service tag attributes and also any child tags, if applicable
     * In case of service tag attributes, they are removed from the CFC variables scope 
     * In case of service tag child tags (like mailpart/mailparam), the arrays used to store the child tags are reset
     * @output false
	 */
    public void function clear()
    {
		 //clear tag attributes and cfmailparam tags
         super.clear();

		 //clear cfmailpart tags
         clearParts();
    }


    /**
	 * Invoke the cfmail service tag to send mail in cfscript
     * Usage :: new mail().send(from="x@adobe.com", to="y@adobe.com",subject="test",body="test");
	 * @output true      
	 */
    public void function send()
    {
        //store tag attributes to be passed to the service tag in a local variable
        var tagAttributes = duplicate(getTagAttributes());

        //attributes passed to service tag action like send() override existing attributes and are discarded after the action
		if (!structisempty(arguments))
        {
    		 structappend(tagAttributes,arguments,"yes");
        }

		//trim attribute values
		tagAttributes = trimAttributes(tagAttributes);

		//mail service uses cfmail/cfmailparam/cfmailpart service tags to perform its action. The mail/mailpart content is specified via the body attribute 
		super.invokeTag(getTagName(),tagAttributes,{params=variables.parameters,parts=variables.parts});
    }
}