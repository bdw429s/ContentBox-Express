<cfcomponent>
	<cffunction name="enter">
		<cfargument name="message" required="yes" default="">
		<cfargument name="message_from" required="no" default="">
		<cfargument name="message_to" required="no" default="">
		<cfargument name="networkInfo" required="no" default="">
		<cflog text="menu.apps.serverjvminfo - entering" file="main_cfc" application="yes"/>
		
		<cfscript>
			sys = createObject("java", "java.lang.System");

			VMversion = sys.getProperty("java.vm.version");
			VMvendor = sys.getProperty("java.vm.vendor");
			VMname = sys.getProperty("java.vm.name");

			str = "Server JVM Version Information:<br>" &
				  "JVM implementation version: #VMversion#<br>" &
				  "JVM implementation vendor: #VMvendor#<br>" &
				  "JVM implementation name: #VMname#";
		</cfscript>

		<cfreturn str>
	</cffunction>
</cfcomponent>
