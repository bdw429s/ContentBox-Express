<cfcomponent>
	<cffunction name="enter">
		<cfargument name="message" required="yes" default="">			
		<cfargument name="message_from" required="no" default="">
		<cfargument name="message_to" required="no" default="">
		<cfargument name="networkInfo" required="no" default="">
		
		<cfset session.directions.step = "FROM">	
		<cfreturn "Enter FROM address,city,state:">
	</cffunction>
		
	<cffunction name="OnIncomingMessage">
		<cfargument name="message" required="yes" default="">			
		<cfargument name="message_from" required="no" default="">
		<cfargument name="message_to" required="no" default="">
		<cfargument name="networkInfo" required="no" default="">
		
		<CFIF session.directions.step EQ "FROM">
			<CFIF ListLen(arguments.message) NEQ 3>
				<CFRETURN "Please enter FROM formatted as address,city,state:">
			</CFIF>
			<CFSET session.directions.fromaddress = ListGetAt(Trim(arguments.message), 1)> 
			<CFSET session.directions.fromcity = ListGetAt(Trim(arguments.message), 2)> 
			<CFSET session.directions.fromstate = ListGetAt(Trim(arguments.message), 3)> 
			<cfset session.directions.step = "TO">	
			<cfreturn "Enter TO address(,cty,st):">
		<CFELSEIF session.directions.step EQ "TO">
			<CFIF (ListLen(arguments.message) LT 1) OR (ListLen(arguments.message) GT 3)>
				<CFRETURN "Please enter TO formatted as address,city,state:">
			</CFIF>

			<CFSET session.directions.toaddress = ListGetAt(Trim(arguments.message), 1)> 
			<CFIF (ListLen(arguments.message) EQ 1)>
				<CFSET session.directions.tocity = session.directions.fromcity> 
				<CFSET session.directions.tostate = session.directions.fromstate> 
			<CFELSE>
				<CFSET session.directions.tocity = ListGetAt(Trim(arguments.message), 2)> 
				<CFSET session.directions.tostate = ListGetAt(Trim(arguments.message), 3)> 
			</CFIF>

			<cfset session.directions.step = "ROUTE">
			<cftry>
				<cfinvoke webservice="http://ww6.borland.com/webservices/MapQuest/MapQuest.exe/wsdl/IMapQuest" method="GetDirections" returnVariable="route">
					<cfinvokeargument name="FromAddress" value="#session.directions.fromaddress#">
					<cfinvokeargument name="FromCity" value="#session.directions.fromcity#">
					<cfinvokeargument name="FromState" value="#session.directions.fromstate#">
					<cfinvokeargument name="FromCountry" value="US">
					<cfinvokeargument name="ToAddress" value="#session.directions.toaddress#">
					<cfinvokeargument name="ToCity" value="#session.directions.tocity#">
					<cfinvokeargument name="ToState" value="#session.directions.tostate#">
					<cfinvokeargument name="ToCountry" value="US">
				</cfinvoke>
				<CFSET route = ReplaceNoCase(route,  "<br>",  "", "ALL")> 
				<CFSET route = ReplaceNoCase(route,  "\n",  "", "ALL")> 
				<CFSET route = ReplaceNoCase(route,  "\r",  "", "ALL")> 
				<CFSET route = ReplaceNoCase(route,  "\f",  "", "ALL")> 
				<CFSET route = ReplaceNoCase(route,  " the ",  " ", "ALL")> 
				<CFSET route = ReplaceNoCase(route,  #Chr(10)#,  "", "ALL")> 
				<CFSET route = ReplaceNoCase(route,  #Chr(13)#,  "", "ALL")> 
				<CFSET route = ReplaceNoCase(route,  " miles",  " miles ", "ALL")> 
				<CFSET route = ReplaceNoCase(route,  " miles ",  "mi ", "ALL")> 
				<CFLOOP from="1" to="30" index="x">
					<CFSET route = ReplaceNoCase(route,  #x# & ". ",  " ", "ALL")> 
				</CFLOOP> 
				<CFSET trimstart = FindNoCase("Distance: ", route)>
				<CFSET route = Mid(route,  trimstart,  9999)>
			<cfcatch type="any">
				<cfset ret = cfcatch.message>
			</cfcatch>
			</cftry>
			<CFRETURN route>
		</CFIF>
	</cffunction>
</cfcomponent>	