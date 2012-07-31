<cfcomponent>
	<cffunction name="enter">
		<cfargument name="message" required="yes" default="">
		<cfargument name="message_from" required="no" default="">
		<cfargument name="message_to" required="no" default="">
		<cfargument name="networkInfo" required="no" default="">
		
		<cfreturn "Enter Phone No:">
	</cffunction>

	<cffunction name="OnIncomingMessage">
		<cfargument name="message" required="yes" default="">
		<cfargument name="message_from" required="no" default="">
		<cfargument name="message_to" required="no" default="">
		<cfargument name="networkInfo" required="no" default="">
		<cfscript>	
			println("++++++++++++++++++++++++++++++++++++++");
			println("SENDING SMS");
			mesg = structNew();
			mesg.command = "submit";
			mesg.sourceAddress = "19256836652";
			mesg.destAddress = Trim(arguments.message);  // send to whomever you wanted us to
			mesg.shortMessage = trim(arguments.message_from) & " is inviting you to try a simple SMS app.  Reply with 'Y' to try it.";
			sendGatewayMessage("19256836652", mesg);

			println("*** FORWARDED APP TO PHONE");
			println("message: " & mesg.shortMessage);
			println("to: " & Trim(arguments.message));
			println("from: 19256836652");
		</cfscript>
		<cfreturn "App forwarded to: " & Trim(arguments.message)>
	</cffunction>	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		println(String): debug method used to pipe information into a log file
			input: String (str) -> string to be sent to the log file
			output: void
	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction access="private" name="println" output="true" returntype="void" hint="debug method used to pipe information into a log file">
		<cfargument name="str" type="string" required="yes" hint="string to be sent to the log file" />
		<cflog text="#arguments.str#" type="Information" file="cfc_menu" application="yes" />
	</cffunction>
</cfcomponent>
