<cfcomponent>
	<cffunction name="enter">
		<cfargument name="message" required="yes" default="">
		<cfargument name="message_from" required="no" default="">
		<cfargument name="message_to" required="no" default="">
		<cfargument name="networkInfo" required="no" default="">
		
		<cfreturn "Enter a Zip Code: ">
	</cffunction>
	
	<cffunction name="OnIncomingMessage">
		<cfargument name="message" required="yes" default="">
		<cfargument name="message_from" required="no" default="">
		<cfargument name="message_to" required="no" default="">
		<cfargument name="networkInfo" required="no" default="">

		<cftry>
			<cfinvoke webservice="http://www.ejse.com/WeatherService/Service.asmx?WSDL" 
				method="GetWeatherInfo2" returnVariable="condition">
				<cfinvokeargument name="userName" value="dsarkar@adobe.com">
				<cfinvokeargument name="password" value="Y98KQ191fHd6">
				<cfinvokeargument name="zipCode" value=#arguments.message#>
			</cfinvoke> 
		
			<cfinvoke webservice="http://www.ejse.com/WeatherService/Service.asmx?WSDL" 
				method="GetNineDayForecastInfo2" returnVariable="forecast">
				<cfinvokeargument name="userName" value="dsarkar@adobe.com">
				<cfinvokeargument name="password" value="Y98KQ191fHd6">
				<cfinvokeargument name="zipCode" value=#arguments.message#>
			</cfinvoke> 

			<cfset day = ArrayNew(1)>
			<cfset day[1] = forecast.getDay1()>
			<cfset day[2] = forecast.getDay2()>
			<cfset day[3] = forecast.getDay3()>
			<cfset day[4] = forecast.getDay4()>
			<cfset forecaststr = "">	
		
			<cfloop index="x" from="1" to="4">
				<cfset daystr = UCase(Trim(day[x].getDay())) & ": " & Trim(day[x].getForecast()) & " " & 
					day[x].getHigh() & "/" & day[x].getLow() & " " & 
					day[x].getPrecipChance() & " precip. ">

				<cfset forecaststr = forecaststr & daystr>
			</cfloop>
		
			<cfset str = "Currently " & 	
				Trim(condition.getTemprature()) & " and " & LCase(Trim(condition.getForecast())) & 
				" in " & Trim(condition.getLocation()) & 
				". Humidity " & LCase(Trim(condition.getHumidity())) & 
				", winds " & LCase(Trim(condition.getWind())) & ". " & forecaststr >
				
			<cfset str = Replace(str, "°","","all")> 
			<cfset str = Replace(str, " %","%","all")> 

		<cfcatch type="any">
			<cfset str=cfcatch.message>
		</cfcatch>
		</cftry>
		
		<cfreturn str>
	</cffunction>
</cfcomponent>	