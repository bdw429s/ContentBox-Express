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
		
		<cfset str = getThesaurus(arguments.message)>
		
		<cfreturn str />
		
	</cffunction>
	
	
	<!---::
		Call thesaurus.reference.com
		to get the synonyms for the word argument. 
	::--->
	<cffunction name="getThesaurus">
		<cfargument name="word" required="Yes">
		<cfset var start = 0>
		<cfset var end = 0>
		
		<cfhttp url="http://thesaurus.reference.com/search?q=#arguments.word#" method="GET"></cfhttp>
		<cfif cfhttp.statuscode contains "200">
			<cfscript>
				start = reFindNoCase("<!-- Content -->", cfhttp.Filecontent, 1);
				start = FindNoCase("Synonyms:", cfhttp.Filecontent, start);
				start = FindNoCase("<td>", cfhttp.Filecontent, start);
				end = FindNoCase("</td>", cfhttp.Filecontent, start);
				str = mid(cfhttp.Filecontent, start, end - start);
				str = reReplace(str, "<[^>]*>", "", "all");
			</cfscript>
		<cfelse>
			<cfset str="Sorry, service is not available.">
		</cfif>

		<!--- :: string returned also goes to client. :: --->
		<cfreturn left(str, 400)>
	</cffunction>
	
	
</cfcomponent>
