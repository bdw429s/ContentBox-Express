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
 * Ftp Service to perform ftp operations in cfscript
 * @name query
 * @displayname ColdFusion Ftp Service 
 * @output false
 * @accessors true
 */
component extends="base"
{
    property string actionparam; 
    property string buffersize; 
    property string connection; 
    property boolean passive; 
    property string password; 
    property numeric port; 
    property numeric proxyserver; 
    property numeric retrycount; 
    property string server; 
    property boolean stoponerror; 
    property numeric timeout; 
    property string username; 
    property string fingerprint; 
    property string key; 
    property string passphrase; 
    property boolean secure; 
    property string ASCIIExtensionList; 
    property string directory; 
    property string existing; 
    property boolean failifexists; 
    property string item; 
    property string localfile; 
    property string name;
    property string new; 
    property string remotefile; 
    property string result;
    property string transfermode; 
    property any allosize;

	//service tag to invoke
    variables.tagName = "CFFTP";

    //list of valid cfftp tag attributes
    variables.tagAttributes = getSupportedTagAttributes(getTagName());


    /**
	 * Initialization routine. Returns an instance of this component
	 * @output false
	 */
    public ftp function init()
    {
		if(!structisempty(arguments))
        {
        	structappend(variables,arguments,"yes");
    	}
        return this;
    }


	/* ************************ BEGIN :: LIST OF FTP SERVICE ACTIONS *************************************** */
    
    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().succeeded is true, connection to the ftp server was opened successfully
     * @output false
     */
    public result function open()
    {
		return invoketag(arguments,"open");
	}


    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().succeeded is true, connection to the ftp server was closed successfuly
     * @output false
     */
    public result function close()
    {
		return invoketag(arguments,"close");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().succeeded is true, the command verbatim was sent to the ftp server successfully
     * @output false
     */
	public result function quote()
    {
		return invoketag(arguments,"quote");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().succeeded is true, execution of the site-specific command was executed successful
     * @output false
     */
    public result function site()
    {
		return invoketag(arguments,"site");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().succeeded is true, memory allocatation operation (like putting large files on the server) was successful
     * @output false
     */
    public result function allo()
    {
		return invoketag(arguments,"allo");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().succeeded is true, the account information (for systems that require it) was sent successfully
     * @output false
     */
    public result function acct()
    {
		return invoketag(arguments,"acct");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().succeeded is true, the change directory action was successful
     * @output false
     */
    public result function changeDir()
    {
		return invoketag(arguments,"changedir");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * Returns true if the specified directory was created successfully or false, if otherwise
     * @output false
     */
    public result function createDir()
    {
		return invoketag(arguments,"createdir");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with name property set to directory contents and result property set to the cfftp (scope). 
     * Use r.getName() to view the directory contents
     * If r.getResult().succeeded is true, the directory listing operation was successful
     * @output false
     */
    public result function listDir()
    {
		return invoketag(arguments,"listdir");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().succeeded is true, the directory was removed
     * @output false
     */
    public result function removeDir()
    {
		return invoketag(arguments,"removedir");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().succeeded is true, the file was downloaded successfully
     * @output false
     */
    public result function getFile()
    {
		return invoketag(arguments,"getfile");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().succeeded is true, the requested file was uploaded successfully
     * @output false
     */
    public result function putFile()
    {
		return invoketag(arguments,"putfile");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().succeeded is true, the file/directory rename operation was successful
     * @output false
     */
    public result function rename()
    {
        return invoketag(arguments,"rename"); 
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().succeeded is true, the file was removed from the ftp server
     * @output false
     */
    public result function remove()
    {
		return invoketag(arguments,"remove");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * Use r.getResult().returnvalue to access the current directory
     * @output true
     */
    public result function getCurrentDir()
    {
        return invoketag(arguments,"getcurrentdir");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * Use r.getCurrentUrl().getResult().returnvalue to access the current url
     * @output false
     */
    public result function getCurrentUrl()
    {
		return invoketag(arguments,"getcurrenturl");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().returnvalue is true, the requested directory exists on the ftp server
     * @output false
     */
    public result function existsDir()
    {
		return invoketag(arguments,"existsdir");
	}

    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().returnvalue is true, the requested file exists on the ftp server
     * @output false
     */
    public result function existsFile()
    {
		return invoketag(arguments,"existsfile");
	}


    /**
     * Returns an instance of com.adobe.coldfusion.result cfc (say, r) with result property set to the cfftp (scope). 
     * If r.getResult().returnvalue is true, the requested resourece exists on the ftp server
     * @output false
     */
    public result function exists()
 	{   
		return invoketag(arguments,"exists");
	}

	/* ************************ END :: LIST OF FTP SERVICE ACTIONS *************************************** */

    /** 
     * Invoke the cfftp service tag to perfrom the ftp operation 
     * Usage :: new ftp().existsfile("my_file");
     * @output false
     */
    public result function invoketag(struct attribs,string action)
    {
        //store tag attributes to be passed to the service tag in a local variable
		var tagAttributes = duplicate(getTagAttributes());

		//attributes passed to service tag actions override existing attributes and are discarded after the action
		if(!structisempty(arguments.attribs))
    	{
        	structappend(tagAttributes,arguments.attribs,"yes");
        }
    
        //ftp service tag action 
		tagAttributes["action"] = arguments.action;

        //if a result attribute is specified, we ignore it so that we can always return the result struct 
		if(structkeyexists(tagAttributes,"result"))
        {
    		structdelete(tagAttributes,"result");
        }

		//trim attribute values
		tagAttributes = trimAttributes(tagAttributes);

		//Invoke service tag by passing the attributes attributs/child tags
        return super.invokeTag(getTagName(),tagAttributes);
    }
}