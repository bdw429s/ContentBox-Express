<!--- Component that receives sync notification from FMS gateway
		and saves updated sales data to the database 
--->
		
<cfcomponent>
	<!--- This method is called by FMS gateway whenever shared object that it 
		is listening to is modified
	--->		
	<cffunction name="onSync">
		<cfargument name="cfevent" type="struct" required="Yes">
		
		<cfobject type="JAVA" class="java.lang.System" action="CREATE" name="System">			
		
		<cfscript>
			//If changed property in the shared object on FMS 
			//is not 'changedData' then ignore it. We are 
			//interested in changed sales data only.
			if (cfevent.Data.name NEQ "changedData") {
				return;
			}
			eventSalesData = cfevent.Data["value"];
			
			salesData = StructNew();
			salesData.productId = 1; //hardcoded for this demo
			salesData.year = eventSalesData["SALES_YEAR"];
			salesData.month = eventSalesData["SALES_MONTH"];
			salesData.amount = eventSalesData["SALES_AMOUNT"];
			
			//update sales data
			salesComp = CreateObject("component","FMSGatewayDemo.sales");
			salesComp.updateSales(salesData.productId,salesData.year,salesData.month,salesData.amount);

			//change sales data info (shared object containing list of sales data) on FMS
			//we will use FMS gateway helper to do this
			fmsGatewayHelper = getGatewayHelper("FMS Sales App");
			sharedObj = fmsGatewayHelper.getSharedObjectProperty("salesData");
			
			for (i = 1; i LE ArrayLen(sharedObj); i = i + 1) {
				//this shared object has data for all years and month
				//we need to change sales data for only one year and month
				if (sharedObj[i]["SALES_YEAR"] eq salesData.year and 
					sharedObj[i]["SALES_MONTH"] eq salesData.month) {
					
					sharedObj[i]["SALES_AMOUNT"] = salesData.amount;
					fmsGatewayHelper.setSharedObjectProperty("salesData",sharedObj);
					
					break;
				} //of if
			} //of for
			
		</cfscript>
		
	</cffunction>
	
</cfcomponent>