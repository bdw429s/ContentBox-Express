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
 * LDAP Service : Provides an interface to a Lightweight Directory Access Protocol (LDAP) directory server, such as the Netscape Directory Server 
 * @name ldap
 * @displayname ColdFusion LDAP Service 
 * @output false
 * @accessors true
 */
component extends="base"
{
	property type="string" name="attributes" getter="false" setter="false" ;
    property string delimiter; 
    property string dn; 
    property string filter;
    //property string filterFile; deprecated
    property numeric maxRows; 
    property string modifyType; 
    property string name;
    property string password;
    property numeric port;
    property boolean rebind;
    property numeric referral;
    property string returnAsBinary; 
    property string scope;
    property string secure; 
    property string separator;
    property string server;
    property string sort;
    property string sortControl;
    property string start;
    property numeric startRow; 
    property numeric timeout;
    property string username;

	//service tag to invoke
    variables.tagName = "CFLDAP";
	
    //valid ldap tag attributes
    variables.tagAttributes = getSupportedTagAttributes(getTagName());
	


	/**
	 * Initialization routine. Returns an instance of this component
	 * @output false
	 */
    public ldap function init()
    {
		if(!structisempty(arguments))
		{
        	structappend(variables,arguments,"yes");
    	}
		
		/* 
		Special case for cfdump: 
		If attributes is not set in the contructor, we set it to an empty string.
		If this is not done, value for attributes in dump will be a struct containing all properties set in cfc variables scope.
		*/
		/*
		if(!structkeyexists(variables,"attributes")){
			this.setAttributes("");
		}
		*/
		
        return this;
    }
	


	/**
	 * Used to set "attributes" property. 
	 * Note that implicit setter setAttributes() is not used since a method with the same name is defined in base.cfc 
	 * @output false
	 */
	public void function setLdapAttributes(String attributes)
	{
		variables.attributes = attributes;
	}



	/**
	 * Returns the "attributes" property, if defined, or an empty string    
	 * Note that implicit getter getAttributes() is not used since a method with the same name is defined in base.cfc 
	 * @output false
	 */
	public function getLdapAttributes()
	{
		return structkeyexists(variables,"attributes") ? variables.attributes : "";
	}



	/**
	 * Removes tag attributes from variables scope. Accepts a list of tag attributes 
	 * If no attributes are specified, all attributes are removed from CFC variables scope
	 * @output false
	 */
	public void function clearAttributes(string tagAttributesToClear="")
	{
		//delegate call to clearAttributes in base.cfc
		super.clearAttributes(tagAttributesToClear);
		
		//required since we explicitly set attributes to "" (see init method)
		if(!structkeyexists(variables,"attributes"))
			this.setAttributes("");
	}

	

	/**
	 * Removes tag attributes
	 * @output false
	 */
	public void function clear()
	{
		//delegate call to clearAttributes
		 clearAttributes();
	}	
	
	/* ************************ BEGIN :: LDAP SERVICES *************************************** */
	
	/**
	 * Returns LDAP entry information 
	 * @output false
	 */
	public query function query() 
	{
		return invoketag(arguments,"query");
	}
	

	/**
	 * Adds LDAP entries to LDAP server 
	 * @output false
	 */
	public void function add() 
	{
		invoketag(arguments,"add");
	}


	/**
	 * Modifies LDAP entries (except distinguished name 'dn' attribute) on LDAP server
	 * @output false
	 */
	public void function modify() 
	{
		invoketag(arguments,"modify");
	}


	/**
	 * Modifies distinguished name attribute for LDAP entries on LDAP server
	 * @output false
	 */
	public void function modifyDN() 
	{
		invoketag(arguments,"modifyDN");
	}


	/**
	 * Deletes LDAP entries on an LDAP server.
	 * @output false
	 */
	public void function delete() 
	{
		invoketag(arguments,"delete");
	}
	
	/* ************************ END :: LDAP SERVICES *************************************** */



	/**
     * Invoke the cfldap tag to provide LDAP service in cfscript
     * @output false 
     */
    public any function invoketag(struct attribs,string action)
	{
        //store tag attributes to be passed to the service tag in a local variable
		var tagAttributes = duplicate(getTagAttributes());
		
		//cfldap service tag action 
		tagAttributes["action"] = arguments.action;

		//attributes passed to service tag action like send() override existing attributes and are discarded after the action
		if(!structisempty(arguments.attribs))
        {
    		 structappend(tagAttributes,arguments.attribs,"yes");
        }
    
        if(arguments.action eq "query")
		{
			//if they didn't pass in name, it doesn't matter, we always send it for query action
			if(!structKeyExists(tagAttributes, "name")) {
				tagAttributes["name"] = "cf_ldap_#randrange(1,100000)#";
			}
		}

		//trim attribute values
		tagAttributes = trimAttributes(tagAttributes);

		//invoke the ldap tag to perform the http service
		return super.invokeTag(getTagName(),tagAttributes).getResult();
    }

}