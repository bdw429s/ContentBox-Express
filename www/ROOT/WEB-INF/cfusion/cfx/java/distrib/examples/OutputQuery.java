/*
* OutputQuery (output a ColdFusion query in an HTML table)
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
* Tag that outputs a ColdFusion query in an HTML table. The attributes
* of this tag are as follows:
* 
* QUERY     ColdFusion to query to output
* HEADER    Toggle printing of column headers (Yes/No) -- Defaults to No
* BORDER    Border width in pixels (same as <TABLE> BORDER attribute)
*
* For example, to output a query with column headers and a 3 pixel borde, 
* you would use the following CFML code:
*
* <CFQUERY DATASOURCE="CFExamples" NAME="Employees">
*     SELECT FIRSTNAME, LASTNAME, TITLE 
*        FROM EmpEmployees
* </CFQUERY>
*
* <CFX_OutputQuery
*     QUERY="Employees"
*     HEADER="yes" 
*     BORDER="3" >
*
*/

import com.allaire.cfx.* ;

import java.util.Hashtable ;

public class OutputQuery implements CustomTag
{        
   // Main processing method for custom tag   
   public void processRequest( Request request, Response response ) 		
      throws Exception
   {       
      // Create string buffer to use for output
      StringBuffer buffOutput = new StringBuffer() ;          

      // Get query 
      Query query = request.getQuery() ;
      if ( query == null )
         throw new Exception ( 
            "Required QUERY attribute not specified" ) ;
      
      // Determine number of columns in the query
      String[] columns = query.getColumns() ;
      
      // Generate table formatting options
      String strCols = " cols=" + String.valueOf( columns.length ) ;
      String strBorder = "" ;
      if ( request.attributeExists("BORDER") )
         strBorder = " border=" + request.getAttribute("BORDER") ;
            
      // Begin table
      buffOutput.append( "<table " + strCols + strBorder + ">" ) ;
      
      // output headers if requested      
      if ( request.getAttribute("HEADER").equalsIgnoreCase("YES") )
         appendRow( buffOutput, columns ) ;                
      
      // Iterate over the query
      int nRows = query.getRowCount() ;
      String[] row = new String[columns.length] ;
      for ( int iRow=1; iRow<=nRows; iRow++ )
      {
         // build up row data
         for ( int iCol=1; iCol<=columns.length; iCol++ )
            row[iCol-1] = query.getData( iRow, iCol ) ;
         
         // output the row
         appendRow( buffOutput, row ) ;		
		}

      // End table
      buffOutput.append( "</table>" ) ;      
      
      // Write output back to the calling page
      response.write( buffOutput.toString() ) ;
   }
 
 
   // helper function to append an HTML table row to a buffer
   private void appendRow( StringBuffer buffOutput, String[] row )
   {
      buffOutput.append( "<tr>" ) ;
      for ( int i=0; i<row.length; i++ )
         appendData( buffOutput, row[i] ) ;     
      buffOutput.append( "</tr>" ) ;    
   }
   
   
   // helper function to append an HTML table data element to a buffer
   private void appendData( StringBuffer buffOutput, String strData )
   {
      buffOutput.append( "<td>" ) ;
      buffOutput.append( strData ) ;
      buffOutput.append( "</td>" ) ;      
   }  
   
   
   // Debugger testbed for OutputQuery
   public static void main(String[] argv)
   {
      try
      {
         // initialize attributes         
         Hashtable attributes = new Hashtable() ;
         attributes.put( "HEADER",  "Yes" ) ;
         attributes.put( "BORDER", "3" ) ;
         
         // initialize query       
         
         String[] columns = 
            { "FIRSTNAME", "LASTNAME", "TITLE" } ;
         
         String[][] data =  {   
            { "Stephen", "Cheng", "Vice President" },
            { "Joe", "Berrey", "Intern" },
            { "Adam", "Lipinski", "Director" },
            { "Lynne", "Teague", "Developer" } }  ;         
         
         DebugQuery query = 
            new DebugQuery( "Employees", columns, data ) ;         
                              
         // create tag, process debug request, and print results           
         OutputQuery tag = new OutputQuery() ;
         DebugRequest request = new DebugRequest( attributes, query ) ;
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
