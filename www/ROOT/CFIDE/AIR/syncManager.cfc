<cfcomponent>
	<cffunction name="sync" access="remote" returntype="any">
		<cfargument name="cfcName" type="string" required="true">
		<cfargument name="operations" type="array" required="true">
		<cfargument name="clientobjects" type="array" required="true">
		<cfargument name="originalobjects" type="array" required="true">

		<cfset retArray = ArrayNew(1)>
		<!--- Arguments for the sync method--->
		<cfset cfcArgs = ArrayNew(1)>
		<cfset cfcArgs[1] = operations>
		<cfset argCount = 2>
		<cfset cfcArgs[argCount] = clientobjects>
		<cfset argCount = argCount + 1>
		<cfset cfcArgs[argCount] = originalobjects>
		
		<cfset airutil = CreateObject("java","coldfusion.AIR.AIRUtil")>
		<cfset airutil.init()>
		<cfset retval = airutil.invokeCFCMethod(cfcName,"sync",cfcArgs)>
		
		<cfif isDefined("retval")>
			<cfset retArray = retval>
		</cfif>
		<cfreturn retArray>
	</cffunction>
</cfcomponent>