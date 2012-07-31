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
 * DBInfo Service - Retrieves information about a data source, including details about the database, tables, queries, 
 * procedures, foreign keys, indexes, and version information about the database, driver, and JDBC.
 * @name dbinfo
 * @displayname ColdFusion DBInfo Service 
 * @output false
 * @accessors true
 */
component extends="base"
{
	property string datasource;
	property string dbname;
	property string name;
	property string password;
	property string pattern;
	property string table;
	property string username;
	
	//service tag to invoke
    variables.tagName = "CFDBINFO";
	
    //list of valid cfhttp tag attributes
    variables.tagAttributes = getSupportedTagAttributes(getTagName());
	
	/**
	 * Initialization routine. Returns an instance of this component
	 * @output false
	 */
	public dbinfo function init()
    {
		if(!structisempty(arguments))
        {
        	structappend(variables,arguments,"yes");
    	}
        return this;
    }
	

	/* ************************ BEGIN :: DBINFO SERVICES *************************************** */
	
	/**
	 * Retrieve database information such as name and type of database
	 * @return query with columns DATABASE_NAME, TYPE 
	 * @output false
	 */
	public query function dbnames()
	{
		return invoketag(arguments,"dbnames");	
	}


	/**
	 * Retrieve table information such name, type, and remarks of tables
	 * @return query with columns TABLE_NAME, TABLE_TYPE, REMARKS 
	 * @output false
	 */
	public query function tables()
	{
		return invoketag(arguments,"tables");	
	}


	/**
	 * Retrieve column information such name, data type of columns
	 * @return query with columns COLUMN_NAME, TYPE_NAME, IS_NULLABLE, IS_PRIMARYKEY, IS_FOREIGNKEY, REFERENCED_PRIMARYKEY, REFERENCED_PRIMARYKEY_TABLE, COLUMN_SIZE, DECIMAL_DIGITS, COLUMN_DEFAULT_VALUE, CHAR_OCTET_LENGTH, ORDINAL_POSITION, REMARKS
	 * @output false
	 */
	public query function columns()
	{
		return invoketag(arguments,"columns");	
	}


	/**
	 * Retrieve version information such database product name and version
	 * @return query with columns DATABASE_VERSION,DATABASE_PRODUCTNAME,DRIVER_VERSION,DRIVER_NAME,JDBC_MAJOR_VERSION,JDBC_MINOR_VERSION
	 * @output false
	 */
	public query function version()
	{
		return invoketag(arguments,"version");	
	}


	/**
	 * Retrieve procedures information such as name, type, and remarks
	 * @return query with columns PROCEDURE_NAME, REMARKS, PROCEDURE_TYPE
	 * @output false
	 */
	public query function procedures()
	{
		return invoketag(arguments,"procedures");	
	}


	/**
	 * Retrieve foreign key information such as primary key name, foreign key name and table
	 * @return query with columns FKCOLUMN_NAME, FKTABLE_NAME, PKCOLUMN_NAME, DELETE_RULE, UPDATE_RULE
	 * @output false
	 */
	public query function foreignkeys()
	{
		return invoketag(arguments,"foreignkeys");	
	}


	/**
	 * Retrieve index information such as name and column on which the index is applied
	 * @return query with columns INDEX_NAME, COLUMN_NAME, ORDINAL_POSITION, CARDINALITY, TYPE, PAGES, NON_UNIQUE
	 * @output false
	 */
	public query function index()
	{
		return invoketag(arguments,"index");	
	}

	/* ************************ END :: DBINFO SERVICES *************************************** */


	/**
     * Invoke the dbinfo tag to provide the DBINFO service in cfscript
     * @output false 
     */
    public query function invoketag(struct attribs,string type)
	{
        //store tag attributes to be passed to the service tag in a local variable
		var tagAttributes = duplicate(getTagAttributes());

        //type of information to get using dbinfo service 
		tagAttributes["type"] = arguments.type;

		//attributes passed to service tag action like send() override existing attributes and are discarded after the action
		if(!structisempty(arguments.attribs)){
    		 structappend(tagAttributes,arguments.attribs,"yes");
        }
		
		//if they didn't pass in name, it doesn't matter, we always send it 
		if(!structKeyExists(tagAttributes, "name")){
			tagAttributes["name"] = replace(createUUID(), "-", "_", "all");
		}

		//trim attribute values
		tagAttributes = trimAttributes(tagAttributes);

		//invoke the cfdbinfo tag for dbinfo service
		return super.invokeTag(getTagName(),tagAttributes).getResult();
    } 
}