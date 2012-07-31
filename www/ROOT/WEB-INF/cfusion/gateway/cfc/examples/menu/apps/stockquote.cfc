<cfcomponent>
	<cffunction name="enter">
		<cfargument name="message" required="yes" default="">
		<cfargument name="message_from" required="no" default="">
		<cfargument name="message_to" required="no" default="">
		<cfargument name="networkInfo" required="no" default="">
		
		<cfreturn "Enter a Stock Symbol:">
	</cffunction>
	
	<cffunction name="getQuote">
		<cfargument name="message" required="yes" default="">
		<cfargument name="message_from" required="no" default="">
		<cfargument name="message_to" required="no" default="">
		<cfargument name="networkInfo" required="no" default="">
		
		<cfif Len(Trim(arguments.message)) IS 1>
			<cfset str = "Symbol '" & Trim(arguments.message) & "' Not Found. Try Again:"> 
		<cfelse>
			<cftry>
				<cfinvoke webservice="http://www.webservicex.net/stockquote.asmx?wsdl" method="GetQuote" returnVariable="o"> <!--- webservicex.net --->
					<cfinvokeargument name="symbol" value="#Trim(arguments.message)#">
				</cfinvoke>
				<cfscript>
					xmlObj = xmlParse(o);
					price = xmlObj.StockQuotes.Stock.Last.xmlText;
				</cfscript>
		
				<cfif Len(Trim(price)) EQ 0 OR (price EQ 0)>
					<cfset str = "Symbol '" & arguments.message & "' Not Found.">
				<cfelse>
					<cfset str = UCase(Trim(arguments.message)) & " " & dollarFormat(price)>
				</cfif>
			<cfcatch type="any">
				<cfset str = cfcatch.message>
			</cfcatch>
			</cftry>
		</cfif>

		<cfreturn str>
	</cffunction>
</cfcomponent>
