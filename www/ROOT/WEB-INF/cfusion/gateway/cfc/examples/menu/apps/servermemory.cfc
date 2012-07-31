<cfcomponent>
	<cffunction name="enter">
		
		<cfscript>
			obj = createObject("java", "java.lang.Runtime");
			runtime = obj.getRuntime();
			
			// an approximation to the total amount of memory currently available for future allocated objects, measured in bytes.
			freeMemory = runtime.freeMemory() / 1048576;
			
			// the total amount of memory currently available for current and future objects, measured in bytes.
			totalMemory = runtime.totalMemory() / 1048576;
			
			// the maximum amount of memory that the virtual machine will attempt to use, measured in bytes
			maxMemory = runtime.maxMemory() / 1048576;
			
			str = "Server JVM Memory Information:<br>" &
				  "freeMemory: #NumberFormat(freeMemory, "_____.00")#MB<br>" &
				  "totalMemory: #NumberFormat(totalMemory, "_____.00")#MB<br>" &
				  "maxMemory: #NumberFormat(maxMemory, "_____.00")#MB";
		</cfscript>
			
		<cfreturn str>
	</cffunction>
</cfcomponent>
