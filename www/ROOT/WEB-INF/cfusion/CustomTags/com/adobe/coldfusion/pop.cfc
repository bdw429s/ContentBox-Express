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
 * Pop Service : Allows to retrieve or delete e-mail messages from a POP mail server
 * @name pop
 * @displayname ColdFusion POP Service 
 * @output false
 * @accessors true
 */
component extends="base"
{
	property string attachmentpath;
	property boolean debug;
	property boolean generateuniquefilenames;
	property numeric maxrows;
	property string messagenumber;
	property string name;
	property string password;
	property numeric port;
	property string server;
	property numeric startrow;
	property numeric timeout;
	property string uID;
	property string username;
	
	//service tag to invoke
    variables.tagName = "CFPOP";

    //cfpop tag attributes
    variables.tagAttributes = getSupportedTagAttributes(getTagName());
	

	/**
	 * Initialization routine. Returns an instance of this component
	 * @output false
	 */
	public pop function init()
    {
		if(!structisempty(arguments))
        {
        	structappend(variables,arguments,"yes");
    	}
        return this;
    }
	

	/* ************************ BEGIN :: POP SERVICES *************************************** */

	/**
	 * Retrieve message header information only
	 * @return query 
	 * @output false
	 */
	public query function getHeaderOnly()
	{
		return invoketag(arguments,"getHeaderOnly");	
	}


	/**
	 * Retrieve message header information, message text, and attachments (if attachmentPath is specified)
	 * @return query 
	 * @output false
	 */
	public query function getAll()
	{
		return invoketag(arguments,"getAll");	
	}


	/**
	 * Delete messages on POP server
	 * @output false
	 */
	public void function delete()
	{
		invoketag(arguments,"delete");	
	}

	/* ************************ END :: POP SERVICES *************************************** */


	/**
     * Invoke the cfpop tag to provide the POP service in cfscript
     * @output false 
     */
    public any function invoketag(struct attribs,string action)
	{
        //store tag attributes to be passed to the service tag in a local variable
		var tagAttributes = duplicate(getTagAttributes());

        //cfpop service tag action 
		tagAttributes["action"] = arguments.action;

		//attributes passed to service tag action like send() override existing attributes and are discarded after the action
		if(!structisempty(arguments.attribs))
		{
    		 structappend(tagAttributes,arguments.attribs,"yes");
        }
    
		//if no name is passed for action="getAll | getHeaderOnly", we always pass one 
		if(arguments.action eq "getAll" or arguments.action eq "getHeaderOnly")
		{
			if(!structKeyExists(tagAttributes, "name"))
			{
				tagAttributes["name"] = replace(createUUID(), "-", "_", "all");
			}
		}

		//trim attribute values
		tagAttributes = trimAttributes(tagAttributes);

		//invoke the cfpop tag to perform the pop service
		return super.invokeTag(getTagName(),tagAttributes).getResult();
    } 
}