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
 * component returned by the storedproc service
 * @name storedprocresult  
 * @displayname ColdFusion Storedproc service return object
 * @output false
 * @accessors true
 */
component
{
    property name="prefix" type="struct" hint="represents the result struct returned by the procedure"; 
	property name="procResultSets" type="struct"  hint="represents the resultsets returned by the procedure";
	property name="procOutVariables" type="struct" hint="represents any InOut or Out variables set by the procedure";
}
