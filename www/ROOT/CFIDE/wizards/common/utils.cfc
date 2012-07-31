<!---
* Copyright (c) 2005 Macromedia.  All Rights Reserved.
* DO NOT REDISTRIBUTE THIS SOFTWARE IN ANY WAY WITHOUT THE EXPRESSED
* WRITTEN PERMISSION OF MACROMEDIA.
--->
<cfcomponent>
	<cffunction name="wizardHash" access="remote" >
		<cfargument name="inPassword" required="yes" type="string">
		<cfset x = randString()>
		<cfset y = randString()>
		
			<cfoutput>#hash(x&arguments.inPassword&y, "SHA-1")#,#x#,#y#</cfoutput>
			
			<cfset foo = x&arguments.inPassword&y>
		</cffunction>
	
	<cffunction name="randString" access="private" returntype="string">
		<cfset var foo="">
		<cfloop from="1" to="#randrange(8,12)#" index="i">
			<cfset foo=foo & chr(randrange(32,128))>
		</cfloop>
		<cfreturn hash(foo)>
	</cffunction>
	
			
  <cffunction name="verifyldapserver" access="remote">
		<cfargument name="vserver" required="yes">
		<cfargument name="vport" required="yes">
		<cfargument name="vstart" required="yes">
		<cfargument name="vusername" required="yes">
		<cfargument name="vpassword" required="yes">
		<cfset var retargs = StructNew()>
			<cftry>
				<cfldap action="QUERY"
					  name="userSearch"
					  attributes="dn"
					  start="#vstart#"
					  server="#vserver#"
					  port="#vport#"
					  username="#vusername#"
					  password="#vpassword#"> 
				<cfif  userSearch.recordCount>
					<cfset retargs.Validated = "true">
					<cfset retargs.name="#userSearch.dn#">
				</cfif>
					<cfcatch>
						<cfset retargs.Validated="false">
					</cfcatch>
	  		</cftry>		
	  <cfreturn retargs>
  </cffunction>
  
</cfcomponent>