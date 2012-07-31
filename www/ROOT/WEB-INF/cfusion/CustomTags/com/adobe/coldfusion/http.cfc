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
 * Http Service to generates an HTTP request and handle the response from the server
 * @name http
 * @displayname ColdFusion HTTP Service 
 * @output false
 * @accessors true
 */
component extends="base"
{
    property string url; 
    property string charset;
    property string clientcert; 
    property string clientcertpassword; 
    property string columns; 
    property string delimiter; 
    property string file; 
    property boolean firstrowasheaders; 
    property string getasbinary; 
    property string method; 
    property boolean multipart; 
    property String multiparttype; 
    property string name; 
    property string password; 
    property string path; 
    property numeric port; 
    property string proxyserver; 
    property numeric proxyport; 
    property string proxyuser; 
    property string proxypassword; 
    property boolean redirect; 
    property boolean resolveurl;  
    property string result;  
    property string textqualifier;  
    property boolean throwonerror; 
    property numeric timeout; 
    property string useragent; 
    property string username; 

	//array to store child cfhttpparam tags
	variables.parameters = [];
	
	//service tag to invoke
    variables.tagName = "CFHTTP";

    //list of valid cfhttp tag attributes
    variables.tagAttributes = getSupportedTagAttributes(getTagName());


    /**
	 * Initialization routine. Returns an instance of this component
	 * @output false
	 */
    public http function init()
    {
		if(!structisempty(arguments))
        {
        	structappend(variables,arguments,"yes");
    	}
        return this;
    }


	/**
     * Invoke the cfhttp tag (and its child tag cfhttpparam) to provide the http service in cfscript
     * @output true 
     */
    public result function send()
	{
        //store tag attributes to be passed to the service tag in a local variable
		var tagAttributes = duplicate(getTagAttributes());

		//attributes passed to service tag action like send() override existing attributes and are discarded after the action
		if(!structisempty(arguments))
        {
    		 structappend(tagAttributes,arguments,"yes");
        }
    
        //if a result attribute is specified, we ignore it so that we can always return the result struct 
		if(structkeyexists(tagAttributes,"result"))
        {
             structdelete(tagAttributes, "result");
        }

		//trim attribute values
		tagAttributes = trimAttributes(tagAttributes);

		//invoke the cfhttp/cfhttpparam tags to perform the http service
		return super.invokeTag(getTagName(),tagAttributes,{params=variables.parameters});
    }
}