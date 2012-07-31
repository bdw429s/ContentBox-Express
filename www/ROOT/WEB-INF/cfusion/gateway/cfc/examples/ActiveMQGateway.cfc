<cfcomponent output="false" hint="Sample CFC for use with the Active MQ JMS gateway.">

	<cffunction name="onIncomingMessage" returntype="struct" access="public" output="false">
		<cfargument name="event" type="struct" required="true" />
		
		<cfset var result = structNew() />
		<cfset var data = arguments.event.data />
		<cfset var id = "unknown" />
		<cfset var msgid = "unknown" />
		<cfset var propString = "" />
		<cfset var propName = "" />
		
		<cfif structKeyExists(data,"id")>
			<cfset id = data.id />
		</cfif>
		<cfif structKeyExists(data,"msgid")>
			<cfset msgid = data.msgid />
		</cfif>
		<cflog log="console" text="Received id: #id#; msgid: #msgid#; type: #data.jmsmsg.getClass().getName()#" />
		<cfif structKeyExists(data,"properties")>
			<cfloop item="propName" collection="#data.properties#">
				<cfset propString = listAppend(propString,propName & "=" & data.properties[propName]) />
			</cfloop>
		</cfif>
		<cfif propString is not "">
			<cflog log="console" text="Properties: #propString#" />
		</cfif>
		<cfif structKeyExists(data,"msg") and isSimpleValue(data.msg)>
			<cflog log="console" text="Message Text '#left(data.msg,32)#...'" />
		<cfelseif structKeyExists(data,"msg") and isStruct(data.msg)>
			<cfset propString = "" />
			<cfloop item="propName" collection="#data.msg#">
				<cfset propString = listAppend(propString,propName & "=" & data.msg[propName]) />
			</cfloop>
			<cflog log="console" text="Message Map: #propString#" />
		</cfif>
		<cfif data.transacted>
			<cfparam name="application.seen8" default="false" />
			<cfif id is "id0">
				<cfif application.seen8>
					<cflog log="console" text="Committing message #id# / #msgid#." />
					<cfset data.jmssession.commit() />
					<cfset application.seen8 = false />
				<cfelse>
					<cflog log="console" text="Rolling back message #id# / #msgid#." />
					<cfset data.jmssession.rollback() />
				</cfif>
			<cfelseif id is "id4">
				<cflog log="console" text="Ignoring message #id# / #msgid#." />
			<cfelse>
				<cflog log="console" text="Committing message #id# / #msgid#." />
				<cfset data.jmssession.commit() />
				<cfif data.id is "id8">
					<cfset application.seen8 = true />
				</cfif>
			</cfif>
		</cfif>
		
		<cfset result.status = "OK" />
		
		<cfreturn result />
		
	</cffunction>

	<cffunction name="sendMessages" returntype="numeric" access="remote" output="false">
		<cfargument name="isTopic" type="boolean" default="true" />
		<cfargument name="isMap" type="boolean" default="false" />
		
		<cfset var i = 0 />
		<cfset var packet = 0 />
		<cfset var count = 0 />
		<!---
#               status - SEND
#               topic/queue - destination name on which to publish the message
#               message - message to publish
#               id - optional correlation ID for the message
#               asBytes - optional indicates whether to publish as TextMessage
#                       or byte-encoded UTF-8 BytesMessage - yes|no|true|false
#                       default is no (i.e., use TextMessage)
		--->
		
		<cfloop index="i" from="1" to="10">
			<cfset packet = structNew() />
			<cfset packet.status = "SEND" />
			<cfif arguments.isTopic>
				<cfset packet.topic = "dynamicTopics/TEST.FOO" />
			<cfelse>
				<cfset packet.queue = "dynamicQueues/TEST.FOO" />
			</cfif>
			<cfif arguments.isMap>
				<cfset packet.message = structNew() />
				<cfset packet.message["Number"] = i />
				<cfset packet.message["Time"] = now() />
				<cfset packet.message["MessageText"] = "Message as struct" />
			<cfelse>
				<cfset packet.message = "Message #i# sent at #now()#." />
			</cfif>
			<cfset packet.id = "ID" & i />
			<cfset packet.msgid = "msg" & i />
			<cfset packet.properties = structNew() />
			<cfset packet.properties["TestIntProperty"] = 42 />
			<cfset packet.properties["TestBooleanProperty"] = true />
			<cfset packet.properties["TestDoubleProperty"] = 4.2 />
			<cfset packet.properties["TestProperty"] = "Forty Two" />
			<cfset packet.propertyTypes = structNew() />
			<cfset packet.propertyTypes["TestIntProperty"] = "int" />
			<cfset packet.propertyTypes["TestBooleanProperty"] = "boolean" />
			<cfset packet.propertyTypes["TestDoubleProperty"] = "double" />
			<cfif sendGatewayMessage("SampleAMQGateway",packet) is "OK">
				<cfset count = count + 1 />
			</cfif>
		</cfloop>

		<cfreturn count />
				
	</cffunction>

</cfcomponent>