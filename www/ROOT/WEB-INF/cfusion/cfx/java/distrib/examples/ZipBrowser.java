/*
* ZipBrowser (retrieve the contents of a zip archive)
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
* This example uses the java.util.zip package to implement a simple 
* zip file browsing tag (ZipBrowser). The attributes of this tag
* are as follows:
*
* ARCHIVE   Name of the zip archive to browse.

* NAME      Name of the query to return to the calling page  
*           (contains 3 columns: Name, Size, and Compressed).
*
* For example, to query an archive at the path "c:\archive.zip" for 
* its contents and to output the results you would use the following 
* CFML code:
*
* <CFX_ZipBrowser 
*     ARCHIVE="c:\archive.zip"
*     NAME="ArchiveContents" >
*
* <CFOUTPUT QUERY="ArchiveContents">
* #Name#,  #Size#, #Compressed# <BR>
* </CFOUTPUT>	
*
*/

import com.allaire.cfx.* ;

import java.util.Hashtable ;
import java.io.FileInputStream ;
import java.util.zip.* ;

public class ZipBrowser implements CustomTag 
{   
   // Main processing method for custom tag
   public void processRequest( Request request, Response response ) throws Exception
   {
      // validate that required attributes were passed
      if (  !request.attributeExists( "ARCHIVE" ) ||
            !request.attributeExists( "NAME" ) )
      {
         throw new Exception( 
            "Missing attribute (ARCHIVE and NAME are both " +
            "required attributes for this tag)" ) ;
      }
            
      // get attribute values
      String strArchive = request.getAttribute( "ARCHIVE" ) ;      
      String strName = request.getAttribute( "NAME" ) ;    
                   
      // create a query to use for returning the list of files
      String[] columns = { "Name", "Size", "Compressed" } ;
      int iName = 1, iSize = 2, iCompressed = 3 ;
      Query files = response.addQuery( strName, columns ) ;
           
      // open the archive 
      ZipInputStream zin = 
         new ZipInputStream( new FileInputStream(strArchive) ) ;
               
      // iterate over the archive and build the query
      ZipEntry entry ;
      while (( entry = zin.getNextEntry()) != null )
      {
         // add a row to the results
         int iRow = files.addRow() ;
                  
         // Populate the row with data
         files.setData( iRow, iName, entry.getName() ) ;
         files.setData( iRow, iSize, String.valueOf(entry.getSize()) ) ;
         files.setData( iRow, iCompressed, 
            String.valueOf(entry.getCompressedSize()) ) ;
                  
         // finish up with entry
         zin.closeEntry() ;
      }
            
      // close the archive
      zin.close() ;
   }	
   
   
   // Debugger testbed for ZipBrowser 
   public static void main(String[] argv)
   {
      try
      {
         // initialize attributes         
         Hashtable attributes = new Hashtable() ;
         attributes.put( "ARCHIVE", "c:\\archive.zip" ) ; 
         attributes.put( "NAME", "ArchiveContents" ) ;
                              
         // create tag, process debug request, and print results           
         ZipBrowser tag = new ZipBrowser() ;
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

