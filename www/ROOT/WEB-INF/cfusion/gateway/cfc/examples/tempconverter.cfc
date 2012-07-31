<cfcomponent displayname="tempconverter" hint="Process events from the test gateway to convert temperature scale.">

<cffunction name="onIncomingMessage" output="no">
	<cfargument name="CFEvent" type="struct" required="yes">

	<!--- Get the message --->
	<cfset data=cfevent.DATA>
	<cfset message="#data.message#">

	<!--- where did it come from? --->
	<cfset orig="#CFEvent.originatorID#">
	<cfif listlen(message) eq 2>
		<cfif (listgetat(message,1) IS "F") OR
			(listgetat(message,1) IS "Fahrenheit") OR
			(listgetat(message,1) IS "C") OR
			(listgetat(message,1) IS "Celsius")>
			
			<cfset scale=listgetat(message,1)>
				
			<cfif isNumeric(listgetat(message,2))>
				<cfset temperature=listgetat(message,2)>
				
				<cfswitch expression="#scale#">
					<cfcase value="F">
						<cfset retmsg = "tempconverter.cfc: " & temperature & " degrees Fahrenheit equals " & (temperature-32.0) * (5.0/9.0) & " degrees Celsius">
					</cfcase>
					<cfcase value="Fahrenheit">
						<cfset retmsg = "tempconverter.cfc: "  & temperature & " degrees Fahrenheit equals " &  (temperature-32.0) * (5.0/9.0) & " degrees Celsius">
					</cfcase>						
					<cfcase value="C">
						<cfset retmsg = "tempconverter.cfc: "  & temperature & " degrees Celsius equals " &  (temperature * 9.0/5.0) + 32 & " degrees Fahrenheit">
					</cfcase>
					<cfcase value="Celsius">
						<cfset retmsg = "tempconverter.cfc: "  & temperature & " degrees Celsius equals " &  (temperature * 9.0/5.0) + 32 & " degrees Fahrenheit">
					</cfcase>					
				</cfswitch>	
				
			<cfelse>
				<cfset retmsg="tempconverter.cfc: please input in the format ""scale, integer"" where scale is F or C, i.e. ""F, 32""">
			</cfif>		
		<cfelse>	
			<cfset retmsg="tempconverter.cfc: please input in the format ""scale, integer"" where scale is F or C, i.e. ""F, 32""">
		</cfif>		
	<cfelse>
		<cfset retmsg="tempconverter.cfc: please input in the format ""scale, integer"" where scale is F or C, i.e. ""F, 32""">		
	</cfif>

	<cfset retValue = structNew()>
	<cfif listcontains("XMPP,SAMETIME,YIM,AIM,MSN,ICQ,JSC", arguments.CFEVENT.GatewayType) gt 0>
	<!--- gateway types YIM, AIM, MSN, ICQ and JSC are supported by JBuddy-CF --->
		<cfset retValue.BuddyID = orig>
		<cfset retValue.MESSAGE = retmsg>
	<cfelseif arguments.CFEVENT.GatewayType is "Socket">
		<cfset retValue.originatorID = orig>
		<cfset retValue.message = retmsg>
	<cfelseif arguments.cfevent.gatewaytype is "SMS">
		<cfset retValue.command = "submit">
		<cfset retValue.sourceAddress = arguments.CFEVENT.GatewayID>
		<cfset retValue.destAddress = orig>
		<cfset retValue.shortMessage = retmsg>
	</cfif>

	<!--- send the return message back --->
	<cfreturn retValue>
</cffunction>

<cffunction name="onAddBuddyRequest">
</cffunction>
<cffunction name="onAddBuddyResponse">
</cffunction>
<cffunction name="onBuddyStatus">
</cffunction>
<cffunction name="onIMServerMessage">
</cffunction>

</cfcomponent>
