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
		
		<cfset str = getSpellCheck(arguments.message)>
		<cfreturn str />
		
	</cffunction>
	
	<!--- :: 
		Call google and do a spell check on the word.
	 :: --->
	<cffunction name="getSpellCheck">
		<cfargument name="word" required="Yes">
		<cfscript>
			var google = "";
			try{
				google = createObject("webservice", "http://api.google.com/GoogleSearch.wsdl");
				newWord = google.doSpellingSuggestion("pOMbtPO/GHerunqaZnkarRtBCZKD6UGq", "#arguments.word#");
				/* for debug
				if(isDefined("newWord")){
					obj = createObject("java", "java.lang.System").out.println("from google: " &newWord);
				} else {
					obj = createObject("java", "java.lang.System").out.println("from google: null");
				}
				*/

			}catch("ANY" ex){
				// obj = createObject("java", "java.lang.System").out.println("error message: " &ex.message);
				newWord = ex.message;
			}
		</cfscript>
		
		<cfif isDefined("newWord")>
			<cfreturn newWord>
		<cfelse>
			<cfreturn word>
		</cfif>
	</cffunction>
</cfcomponent>	