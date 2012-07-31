/*
* HelloWorldGraphic (generates a hello world JPEG graphic)
* NOTE: A JDK 1.2 compiler is required to build this example
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
* This example is based on the 'HelloWorldGraphics' servlet example in Jason
* Hunter's book "Java Servlet Programming" (http://www.servlets.com)
*
* This example uses the Sun JPEG image encoder package to create a 
* hello world message as a graphic and save it into a user specified
* JPEG file. The attributes of this tag are as follows:
*
* FILENAME    Name of file to save JPEG image into.
*
* For example, to implement a template that returns the HelloWorld
* graphic to a browser you would use the following code:
*
* HTML code to request the dispaly of the graphic (calls a CFML
* template that generates and returns the graphic):
*
* <IMG SRC="GetHelloWorldGraphic.cfm">
*
* Implementation of 'GetHelloWorldGraphic.cfm' template:
*
* <CFSET GraphicFile = GetTempFile(GetTempDirectory(),'gf') >
*
* <CFX_HelloWorldGraphic
*     FILENAME="#GraphicFile#">
*
* <CFCONTENT 
*     TYPE="image/jpeg" 
*     FILE=#GraphicFile#
*     DELETEFILE="Yes" >
*
*/

import com.allaire.cfx.* ;

import java.util.Hashtable ;
import java.io.FileOutputStream ;
import java.io.IOException ;
import java.awt.Font ;
import java.awt.Graphics ;
import java.awt.Color ;
import java.awt.image.BufferedImage ;
import com.sun.image.codec.jpeg.JPEGCodec ;
import com.sun.image.codec.jpeg.JPEGImageEncoder ;
import com.sun.image.codec.jpeg.ImageFormatException ;

public class HelloWorldGraphic implements CustomTag 
{    
   // Main processing method for custom tag
   public void processRequest( Request request, Response response ) throws Exception
   {
      // Get the FILENAME attribute (throw if empty or not passed)
      String strFileName = request.getAttribute("FILENAME") ;
      if ( strFileName.length() == 0 )
         throw new Exception( 
            "Required FILENAME attribute either empty or not specified." ) ;
      
      // Create an image to draw graphics on
      BufferedImage image = 
         new BufferedImage(400, 60, BufferedImage.TYPE_INT_RGB ) ;
      Graphics g = image.getGraphics() ;
      
      // Create a white background
      g.setColor(Color.white) ;
      g.fillRect(0, 0, image.getWidth(), image.getHeight() ) ;
      
      // Draw the Hello World string in blue
      g.setFont( new Font( "Serif", Font.ITALIC, 48 ) ) ;
      g.setColor(Color.blue) ;
      g.drawString("Hello World!", 10, 50);
                
      // Attempt to encode the image into a JPEG
      FileOutputStream file = null ;
      try
      {
         file = new FileOutputStream( strFileName ) ;
         JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(file) ;
         encoder.encode( image ) ;      
      }
      catch( IOException e )
      {
         throw new Exception(
            "Error in HelloWorldGraphic: Unexpected IO exception " +
            "writing to file " + strFileName + ", " + e.getMessage() ) ;
      }
      catch( ImageFormatException e ) 
      {
         throw new Exception(
            "Error in HelloWorldGraphic: Unexpected image format " +
            "exception, " + e.getMessage() ) ;         
      }
      finally
      {
         if ( file != null ) file.close() ;   
      }   
   }
  
   
   // Debugger testbed for HelloWorldGraphic
   public static void main(String[] argv)
   {
      try
      { 
         // initialize attributes         
         Hashtable attributes = new Hashtable() ;
         attributes.put( "FILENAME",  "HelloWorld.jpg" ) ;
                                   
         // create tag, process debug request, and print results           
         HelloWorldGraphic tag = new HelloWorldGraphic() ;
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

