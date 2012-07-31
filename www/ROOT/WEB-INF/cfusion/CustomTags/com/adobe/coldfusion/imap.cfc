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
 * Imap Service : Queries an IMAP server to retrieve and manage mails within multiple folders
 * @name imap
 * @displayname ColdFusion IMAP Service 
 * @output false
 * @accessors true
 */
component extends="base"
{
	property string attachmentpath;
	property string connection;
	property string folder;
	property boolean generateuniquefilenames;
	property numeric maxrows;
	property string messagenumber;
	property string name;
	property string newFolder;
	property string password;
	property numeric port;
	property boolean recurse;
	property boolean secure;
	property string server;
	property numeric startrow;
	property boolean stopOnError;
	property numeric timeout;
	property string uID;
	property string username;
	
	//service tag to invoke
    variables.tagName = "CFIMAP";
	
    //list of valid cfimap tag attributes
    variables.tagAttributes = getSupportedTagAttributes(getTagName());
	
	//imap connection properties
	variables.connectionProperties = ["server","username","password","secure","port"];
	
	/**
	 * Initialization routine. Returns an instance of this component
	 * @output false
	 */
	public imap function init()
    {
		if(!structisempty(arguments))
		{
	        structappend(variables,arguments,"yes");
		}
        return this;
    }
	
	
	/** 
	 * Removes connection-specific properties like server, username, password, secure and port 
	 * @output false
	 */
	private struct function removeConnectionProperties(tagAttributes)
	{
		var attributes = duplicate(tagAttributes);
		for(connectionProperty in variables.connectionProperties)
		{
			if(structkeyexists(attributes,connectionProperty)) structdelete(attributes,connectionProperty);
		}
		return attributes;
	} 
	
	
	/* ************************ BEGIN :: IMAP SERVICES *************************************** */
	

	/**
	 * Initiates an open session or connection with the IMAP server.
	 * @output false
	 */	
	public void function open()
	{
		//connection is optional, so we pass one if it is not specified 
		if(structkeyexists(arguments,"connection") and trim(arguments["connection"]) neq "")
			this.setConnection(trim(arguments["connection"]));
		else 
		{
			if(!structkeyexists(variables,"connection") or  (structkeyexists(variables,"connection") and  variables["connection"] eq "")) 
				this.setConnection(replace(createUUID(), "-", "_", "all"));
		}
		invoketag(arguments,"open");
	}


	/**
	 * Terminates an open session or connection with the IMAP server.
	 * @output false
	 */	
	public void function close()
	{
		invoketag(arguments,"close");	
	}	
	
	
	/**
	 * Returns message header information, message text, and any attachments (if attachmentPath property is set) 
	 * @return query
	 * @output false
	 */	
	public query function getAll()
	{
		return invoketag(arguments,"getAll");	
	}	


	/**
	 * Returns the message header information for all retrieved mail. Other values for this attribute are: 
	 * @return query
	 * @output false
	 */	
	public query function getHeaderOnly()
	{
		return invoketag(arguments,"getHeaderOnly");	
	}		
	
	
	/**
	 * Displays a list of all existing folders in the mailbox or under the folder name defined by the Folder attribute.
	 * @return query
	 * @output false
	 */	
	public query function listAllFolders()
	{
		return invoketag(arguments,"listAllFolders");	
	}	


	/**
	 * Creates a folder in the Mailbox.
	 * @output false
	 */	
	public void function createFolder()
	{
		invoketag(arguments,"createFolder");	
	}
	
	
	/**
	 * Renames an existing user-defined folder.
	 * @output false
	 */	
	public void function renameFolder()
	{
		invoketag(arguments,"renameFolder");	
	}	


	/**
	 * Deletes a folder in the Mailbox.
	 * @output false
	 */	
	public void function deleteFolder()
	{
		invoketag(arguments,"deleteFolder");	
	}


	/**
	 * Deletes messages from a folder.
	 * @output false
	 */
	public void function delete()
	{
		invoketag(arguments,"delete");	
	}


	/**
	 * Marks all messages from a folder as read.
	 * @output false
	 */	
	public void function markRead()
	{
		invoketag(arguments,"markRead");	
	}	


	/**
	 * Moves mail from one folder to another.
	 * @output false
	 */	
	public void function moveMail()
	{
		invoketag(arguments,"moveMail");	
	}	


	/************************** END :: IMAP SERVICES *************************************** */	


	/**
     * Invoke the cfimap tag  to provide the IMAP service in cfscript
     * @output false 
     */
    public any function invoketag(struct attribs,string action)
	{
		//store tag attributes to be passed to the service tag in a local variable
		var tagAttributes = duplicate(getTagAttributes());

        //cfimap service tag action 
		tagAttributes["action"] = arguments.action;

        //for actions other than open or close, passing 'connection' property and connection-specific properties 
		//like server,username together result in an error, so we remove the connection-specfic properties
		if(!listfindnocase("open",arguments.action)){
			tagAttributes = removeConnectionProperties(tagAttributes);
		}
		
		//attributes passed to service tag action like send() override existing attributes and are discarded after the action
		if(!structisempty(arguments.attribs)){
    		 structappend(tagAttributes,arguments.attribs,"yes");
        }
    
		//if no name is passed for action="getAll | getHeaderOnly | listAllFolders", we pass one 
		if(listfindnocase("getAll,getHeaderOnly,listAllFolders",arguments.action))
		{
			if(!structKeyExists(tagAttributes, "name")){
				tagAttributes["name"] = replace(createUUID(), "-", "_", "all");
			}
		}

		//trim attribute values
		tagAttributes = trimAttributes(tagAttributes);

		//invoke the ldap tag to perform the http service
		return super.invokeTag(getTagName(),tagAttributes).getResult();
    } 
}