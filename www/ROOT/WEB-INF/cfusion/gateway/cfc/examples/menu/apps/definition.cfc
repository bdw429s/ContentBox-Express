<cfcomponent>
	<cfparam name="session.lastword" default="">
	<cfparam name="session.start" default="1">
	<cfparam name="session.max" default="3">
	
	<cffunction name="enter">
		<cfargument name="message" required="yes" default="">
		<cfargument name="message_from" required="no" default="">
		<cfargument name="message_to" required="no" default="">
		<cfargument name="networkInfo" required="no" default="">
		<cfreturn "">
	</cffunction>
	
	<cffunction name="onIncomingMessage">
		<cfargument name="message" required="yes" default="">
		<cfargument name="message_from" required="no" default="">
		<cfargument name="message_to" required="no" default="">
		<cfargument name="networkInfo" required="no" default="">
		<cfset var str = "">

		<cfset str = getDefinition(arguments.message)>
		<cfreturn str>
	</cffunction>
	
	<!---*************************************************************************************************--->
	<!--- :: 
		Call dictionary.com and 
		return the definitions for the provided word.
	 :: --->
	<cffunction name="getDefinition">
		<cfargument name="word" required="Yes">
		<cfset var start = 0>
		<cfset var end = 0>
		
		<cfhttp url="http://dictionary.reference.com/search?q=#arguments.word#" method="GET"></cfhttp>
		<cfif cfhttp.statuscode contains "200">
			<cfscript>
				start = reFindNoCase("results for:", cfhttp.Filecontent, 1);
				start = reFindNoCase("<table", cfhttp.Filecontent, start);
				start = reFindNoCase("1.", cfhttp.Filecontent, start);
				end = reFindNoCase("(<hr|</table)", cfhttp.Filecontent, start);
				str = mid(cfhttp.Filecontent, start+2, end - start);
			</cfscript>

			<cfscript>
				str = reReplace(str, "&##183;", "-", "all");
				str = reReplace(str, "&nbsp;", " ", "all");
				str = reReplace(str, "&##147;", '"', "all");
				str = reReplace(str, "&##148;", '"', "all");
				count = 1;
				if( findNoCase("<li>", str) )
				{
					while( FindNoCase("<li>", str, 1) )
					{
						str = replaceNoCase(str, "<li>", "||" &count &". ", "one");
						count = count + 1;
					}
				}else if( findNoCase("<dd>", str) ){
					str = replaceNoCase(str, "<dd>", "||" &count &". ", "one");
					count = count + 1;
				}
				str = reReplace(str, "<[^>]*>", "", "all");
				str = reReplace(str, "\|\|", "<br>", "all");
			</cfscript>

			
			<cfset str2 = reReplace(str, "([0-9]\.)", "|\1", "all")>
			<cfset str3 = listToArray(str2, "|")>

		<cfelse>
			<cfset str = "Sorry, service is not available.">
		</cfif>

		<cfreturn str>

	</cffunction>

</cfcomponent>
