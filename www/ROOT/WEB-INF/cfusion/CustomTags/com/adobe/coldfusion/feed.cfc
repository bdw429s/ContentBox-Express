/***********************************************************************************************************
*
* Made by Raymond Camden, Jedi Master
*
*  Copyright 2009 
*  All Rights Reserved.
*
*************************************************************************************************************/

/**
 * Feed Service to perform RSS operations in cfscript
 * @name feed
 * @displayname ColdFusion Feed Service 
 * @output false
 * @accessors true
 */
component extends="base" {

	property struct columnMap;
	property string enclosureDir;
	property boolean escapeChar;
	property boolean ignoreEnclosureError;
	property any name;
	property string outputFile;
	property boolean overwrite;
	property boolean overwriteEnclosure;
	property name="properties" type="any" getter="false" setter="false";
	property string proxyPassword;
	property string proxyPort;
	property string proxyServer;
	property string proxyUser;
	property any query;
	property string source;
	property numeric timeout;
	property string useragent;
	property string xmlvar;
	
	//service tag to invoke
	variables.tagName = "CFFEED";
	
    //cffeed tag attributes
    variables.tagAttributes = getSupportedTagAttributes(getTagName());

	
	/**
	 * Default constructor invoked when feed objects are created. 
	 * @return feed object
	 * @output false
	 */
    public feed function init() 
	{
		if(!structisempty(arguments)) structappend(variables,arguments);
        return this;
    }

	
	/**
	 * Retrieves feed metadata. Replacement for implict getter getPropeties. 
	 * To avoid clash with getProperties method in base.cfc, implcit getter for property "properties" has been turned off.
	 * @return struct if property "properties" is set or an empty string
	 * @output false
	 */
	public any function getFeedProperties() 
	{
		return structkeyexists(variables,"properties") ? variables.properties : "";
	}


	/**
	 * Set feed metadata. Replacement for implict setter setPropeties. 
	 * To avoid clash with setProperties method in base.cfc, implcit setter for property "properties" has been turned off.
	 * @output false
	 */
	public void function setFeedProperties(any properties) 
	{
		//properties["properties"] might be used in cases like f1.setFeedProperties(feed.getAttributes("properties"))
		variables.properties = isstruct(properties) and structkeyexists(properties,"properties") ? properties["properties"] : properties;
	}


	/**
	 * Create an RSS 2.0 or Atom 1.0 feed XML document and saves it in a variable, writes it to a file, or both.
	 * @return result object
	 * @output false
	 */
	public string function create() 
	{
		return invoketag(arguments,"create").xmlvar;
    }   
	

	/**
	 * Parse an RSS or Atom feed from a URL or an XML file and save it in a structure or query. 
	 * You can also get feed metadata in a separate structure.
	 * @return result object
	 * @output false
	 */
	public struct function read() 
	{
		return invoketag(arguments,"read");
	}
	

    /** 
     * Invoke the cffeed service tag to perfrom feed operations 
     * Usage :: new feed().read(source=mysource);
     * @output false
     */
    public struct function invoketag(struct attribs,string action)
    {
	 	//store tag attributes to be passed to the service tag in a local variable
		var tagAttributes = duplicate(getTagAttributes());

		//attributes passed to service tag action like send() override existing attributes and are discarded after the action
		if(!structisempty(arguments.attribs)) structappend(tagAttributes,arguments.attribs,"yes");
 
        //cffeed service tag action 
		tagAttributes["action"] = arguments.action;

		//we set this auto as it is used for the result		
		//note (for read), we ALWAYS nuke this - cuz if you run it twice, it will have xml in it, and we want a valid cfml var
		tagAttributes["xmlvar"] = replace(createUUID(), "-", "_", "all");
				
		if(action eq "read")
		{
	 		//If they didn't pass query, we default it. This allows us to return a result that defaults
			//to a query object
			if(!structKeyExists(tagAttributes, "query")) {
				tagAttributes["query"] = replace(createUUID(), "-", "_", "all");
			}
	
			//if they didn't pass in props, it doesn't matter, we always send it for read
			if(!structKeyExists(tagAttributes, "properties")) {
				tagAttributes["properties"] = replace(createUUID(), "-", "_", "all");
			}
	
			//if they didn't pass in name, it doesn't matter, we always send it for read
			if(!structKeyExists(tagAttributes, "name")) {
				tagAttributes["name"] = replace(createUUID(), "-", "_", "all");
			}
		}

		//trim attribute values
		tagAttributes = trimAttributes(tagAttributes);

 		//invoke the cffeed tag to perform the feed service
		return super.invokeTag(getTagName(),tagAttributes).getResult();
	}
}