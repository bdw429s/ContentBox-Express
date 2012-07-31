/*
* HelloColdFusion (very simple Java CFX)
*
* ADOBE SYSTEMS INCORPORATED
*  Copyright 2002 Adobe Systems Incorporated
*  All Rights Reserved.
* 
* NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
* terms of the Adobe license agreement accompanying it.  If you have received this file from a 
* source other than Adobe, then your use, modification, or distribution of it requires the prior 
* written permission of Adobe.
*
* Tag that prints a personalized greeting. The attributes of this
* tag are as follows:
*
* NAME   Name to use for printing personalized greeting.
*
* For examle, to print a greeting to "Robert", you would use the 
* following CFML code:
*
* <CFX_HelloColdFusion NAME="Robert">
*
*/

import com.allaire.cfx.* ;

public class HelloColdFusion implements CustomTag
{
   public void processRequest( Request request, Response response ) 		
      throws Exception
   {
      String strName = request.getAttribute( "NAME" ) ;
      response.write( "Hello, " + strName ) ;
   }
}
