<cfcomponent displayname="log" hint="Process events from the cfml gateway and write to log">

	<cffunction name="onIncomingMessage" output="no">
	<cfargument name="CFEvent" type="struct" required="yes">
	
		<!--- Get the message --->
		<cfset data=cfevent.DATA>
		<cfset message="#data.message#">
		
		<cflog text="#message#" file="cfmlgateway.log" type="Information">
	
	</cffunction>

</cfcomponent>