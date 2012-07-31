/*
* ServerDateTime (retrieve the date and time from a network server)
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
* This example uses the java networking classes to retrieve the
* date and time from a network server. It does this by querying
* the "daytime" port (normally port 13). Note that this example will
* only work for servers that provide a daytime service (most do not). 
* The attributes for the tag are as follows:
*
* HOST      Domain name of the server to query.
*
* VARIABLE  CFML variable name to return the value into.
*
* PORT      Port to query for "daytime" (defaults to 13).
*
* For example, to query the National Institute of Standards and
* Technology (NIST) time server for the date and time and then output 
* it you would use the following CFML code:
*
* <CFX_ServerDateTime 
*     HOST="time.nist.gov" 
*     VARIABLE="CurrentDateTime" >
*
* <CFOUTPUT>
* The current date and time is: #CurrentDateTime# <br>
* </CFOUTPUT>	
*
*/

import com.allaire.cfx.* ;

import java.util.Hashtable ;
import java.net.Socket;
import java.io.InputStream ;
import java.io.BufferedReader ;
import java.io.InputStreamReader ;
import java.io.IOException ;

public class ServerDateTime implements CustomTag 
{    
   // Main processing method for custom tag
   public void processRequest( Request request, Response response ) throws Exception
   {
      // validate that required attributes were passed
      if (  !request.attributeExists("HOST") ||
            !request.attributeExists("VARIABLE") )
      {
         throw new Exception( 
            "Missing attribute (HOST and VARIABLE are both " +
            "required attributes for this tag)" ) ;
      }
            
      // get required attribute values
      String strHost = request.getAttribute("HOST") ;      
      String strVariable = request.getAttribute("VARIABLE") ;    

      // get the optional PORT attribute
      int port = request.getIntAttribute("PORT",13) ;       
         
      // try to lookup the date and time from the server
      Socket socket = null ;
      InputStream input = null ;
      try  
      {
         // get input stream
         socket = new Socket( strHost, port );         
         input = socket.getInputStream() ;
       
         // read date/time
         BufferedReader reader = 
            new BufferedReader(new InputStreamReader(input)) ;
         String strDateTime = "" ;
         while ( true )
         {
            strDateTime = reader.readLine() ;   
            if ( strDateTime == null )
               throw new Exception( "Error, no daytime returned from server" ) ;
            else if ( strDateTime.length() > 0 )
               break ;            
         }          
         
         // set the variable as requested
         response.setVariable( strVariable, strDateTime ) ;
      }
      catch( IOException e ) // trap exception and build error message
      {         
         throw new Exception( 
            "IOException occurred while attempting to retrieve 'daytime' " +
            "from port " + String.valueOf(port) + " of server " + strHost +
            " (" + e.getMessage() + ")" ) ;
      }
      finally // cleanup stream and socket
      {
         if ( input != null ) 
            input.close() ;
         if ( socket != null )
            socket.close() ;
      }
   }
   
   
   // Debugger testbed for GetServerDateTime
   public static void main(String[] argv)
   {
      try
      {
         // initialize attributes         
         Hashtable attributes = new Hashtable() ;
         attributes.put( "HOST",  "time.nist.gov" ) ;
         attributes.put( "VARIABLE", "CurrentDateTime" ) ;
                                   
         // create tag, process debug request, and print results           
         ServerDateTime tag = new ServerDateTime() ;
         DebugRequest request = new DebugRequest( attributes ) ;
         DebugResponse response = new DebugResponse() ;
         tag.processRequest( request, response ) ;
         response.printResults() ;        
      }
      catch( Throwable e )
      {
         e.printStackTrace() ;
      }      
   }      
}

