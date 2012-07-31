<cfcomponent displayname="echo" hint="Process events from the test gateway and return echo">

<cffunction name="onIncomingMessage" output="no">
  <cfargument name="CFEvent" type="struct" required="yes">

  <!--- Get the message --->
  <cfset data=cfevent.DATA>
  <cfset message="#data.message#">

  <!--- where did it come from? --->
  <cfset orig="#CFEvent.originatorID#">

  <cfset retValue = structNew()>
  <cfif listcontains("XMPP,SAMETIME,YIM,AIM,MSN,ICQ,JSC", arguments.CFEVENT.GatewayType) gt 0>
  <!--- gateway types YIM, AIM, MSN, ICQ and JSC are supported by JBuddy-CF --->
    <cfset retValue.BuddyID = orig>
    <cfset retValue.MESSAGE = "echo: " & message>
  <cfelseif arguments.CFEVENT.GatewayType is "Socket">
    <cfset retValue.originatorID = orig>
    <cfset retValue.message = "echo: " & message>
  <cfelseif arguments.cfevent.gatewaytype is "SMS">
    <cfset retValue.command = "submit">
    <cfset retValue.sourceAddress = arguments.CFEVENT.GatewayID>
    <cfset retValue.destAddress = orig>
    <cfset retValue.shortMessage = "echo: " & message>
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