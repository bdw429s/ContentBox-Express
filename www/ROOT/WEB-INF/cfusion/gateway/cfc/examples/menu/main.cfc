<cfcomponent>

	<cffunction name="onIncomingMessage">
		<cfargument name="CFevent" type="struct" required="YES">

		<cfset var message_to = "">
		<cfset var message_from = "">
		<cfset arguments.networkInfo = Trim(arguments.CFEvent.gatewayType)>
		<cfset arguments.message =  Trim(arguments.CFEvent.data.MESSAGE)>

		<cfscript>
			if (ListContains("XMPP,SAMETIME,YIM,AIM,MSN,ICQ,JSC", arguments.networkInfo) GT 0) {
				message_to = Trim(arguments.CFEvent.data.RECIPIENT);
				message_from = Trim(arguments.CFEvent.data.SENDER);
			} else if (arguments.networkInfo EQ "Socket") {
				message_to = Trim(arguments.CFEvent.gatewayID);
				message_from = Trim(arguments.CFEvent.originatorID);
			} else {
				message_to = Trim(arguments.CFEvent.data.destAddress);
				message_from = Trim(arguments.CFEvent.data.sourceAddress);
			}
			if (
				NOT isDefined("session.menu") OR 
				trim(arguments.message) eq "rebuild" OR 
				trim(arguments.message) eq "debug" OR 
				trim(arguments.message) eq "##"
				)
			{
				// Initialize the menu framework	
				if (ListContains("XMPP,SAMETIME,YIM,AIM,MSN,ICQ,JSC", arguments.networkInfo) GT 0) {
					session.menu = createObject("component","CFIDE.componentutils.gatewaymenu.menu").init(type="IM", gatewayID=arguments.CFEvent.gatewayID);
				} else if (arguments.networkInfo EQ "Socket") {
					session.menu = createObject("component","CFIDE.componentutils.gatewaymenu.menu").init(type="socket", gatewayID=arguments.CFEvent.gatewayID);
				} else {
					session.menu = createObject("component","CFIDE.componentutils.gatewaymenu.menu").init(type="SMS", gatewayID=arguments.CFEvent.gatewayID);
				}

				if (ListContains("SMS", arguments.networkInfo) GT 0) { // lf
					session.menu.setReturnChar(chr(10));
				}
				else if (ListContains("AIM", arguments.networkInfo) GT 0) { // <br>
					session.menu.setReturnChar("<br>");
				}
				else { // crlf for XMPP,SAMETIME,YIM,Socket and etc..
					session.menu.setReturnChar(chr(13)&chr(10));
				}

				// Determine if debug should be enabled
				if (findNoCase("debug", arguments.message) NEQ 0)
					session.menu.enableDebug(true);
				else
					session.menu.enableDebug(false);

				// HACK
				session.menu.enableDebug(true);
				
				
				session.menu.setMaxMessages(2);
				
				// Create the root level menu node and set it as the root with the menu framework
				session.root = createObject("component", "CFIDE.componentutils.gatewaymenu.menunode").init(name="Application Root");
				session.menu.setRoot(session.root);
				
				// Create a TOP level menu node called "Helpers"
				session.m1 = session.root.addChild(name="Lang Tools", key="L");
					// Setup sub-menuNodes and tie them to specific CFCs and methods
					session.m1a = session.m1.addChild(name="Definition", key="D", cfc="gateway.examples.menu.apps.definition", method="onIncomingMessage");
					session.m1b = session.m1.addChild(name="Spellcheck", key="S", cfc="gateway.examples.menu.apps.spellcheck", method="onIncomingMessage");
					session.m1c = session.m1.addChild(name="Thesaurus", key="T", cfc="gateway.examples.menu.apps.thesaurus", method="onIncomingMessage");
				
				// Create a TOP level menu node called "Weather/Stocks/Directions"
				session.m2 = session.root.addChild(name="Stocks/Weather", key="S");
					// Setup sub-menuNodes and tie them to specific CFCs and methods
					session.m2b = session.m2.addChild(name="Stock Quote", key="Q", cfc="gateway.examples.menu.apps.stockquote", method="getQuote");
					session.m2c = session.m2.addChild(name="Weather", key="W", cfc="gateway.examples.menu.apps.weather", method="onIncomingMessage");
					//session.m2d = session.m2.addChild(name="Directions", key="D", cfc="manual.eventgateway.menuapps.directions", method="onIncomingMessage");
					
				// Create a TOP level menu node called "Utilities"
				session.m3 = session.root.addChild(name="CF Server Utils", key="C");
						// Setup sub-menuNodes and tie them to specific CFCs and methods
						session.m3a1 = session.m3.addChild(name="Memory Usage", key="M", cfc="gateway.examples.menu.apps.servermemory", method="enter");
						session.m3a2 = session.m3.addChild(name="JVM Version", key="V", cfc="gateway.examples.menu.apps.serverjvminfo", method="enter");
			}
			
			// Pass control onto the menu framework to process the incoming message and forward it onto the appropriate application if necessary
			session.menu.process(message=arguments.message, message_from=message_from, message_to=message_to, networkInfo=arguments.networkInfo);
		</cfscript>
	</cffunction>

	<cffunction name="onBuddyStatus">
		<cfargument name="CFevent" type="struct" required="YES"/>
	</cffunction>

	<cffunction name="onAddBuddyRequest">
		<cfargument name="CFevent" type="struct" required="YES"/>
	</cffunction>

	<cffunction name="onAddBuddyResponse">
		<cfargument name="CFevent" type="struct" required="YES"/>
	</cffunction>

	<cffunction name="onIMServerMessage">
		<cfargument name="CFevent" type="struct" required="YES"/>
	</cffunction>

</cfcomponent>