/***********************************************************************************************************
*
* ADOBE CONFIDENTIAL
* ___________________
*
*  Copyright 2008 Adobe Systems Incorporated
*  All Rights Reserved.
*
*  NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
*  terms of the Adobe license agreement accompanying it.  If you have received this file from a 
*  source other than Adobe, then your use, modification, or distribution of it requires the prior 
*  written permission of Adobe.
*************************************************************************************************************/

/**
 * PDF service to manipulates PDF documents like merging PDF docs, generating thumbnails etc in cfscript
 * @name pdf 
 * @displayname ColdFusion PDF service
 * @output false
 * @accessors true
 */
component extends="base"
{

    property boolean addQuads;
	property string algo;
	property string align;            
	property boolean ascending;
	property numeric bottomMargin;
	property string charset;            
    property boolean compressTiffs;
	property string copyFrom;
	property string ddxfile;            
	property string destination;            
	property string directory;  
    property boolean encodeAll;                  
	property string encrypt;
	property boolean flatten;
	property boolean foreground;
	property string format;            
	property numeric height;        
	property boolean hiRes;        
	property boolean honourSpaces;        
	property numeric hScale;        
	property string image;              
	property string imagePrefix;       
	property any info;       
	property any inputFiles; 
	property boolean isBase64;           
	property numeric jpgDpi;
	property boolean keepBookmark;          
	property numeric leftMargin;
	property numeric maxBreadth;
	property numeric maxLength;
	property numeric maxScale;
	property any name;            
	property string newOwnerPassword;
	property string newUserPassword;
    property boolean noAttachments;
    property boolean noBookmarks; 
    property boolean noComments; 
    property boolean noFonts;
    property boolean noJavascripts;
    property boolean noLinks; 
    property boolean noMetadata;
    property boolean noThumbnails; 
	property string numberFormat;
	property numeric opacity;            
	property string order;               
	property any outputFiles;
	property boolean overridePage;
	property boolean overwrite; 
	property boolean package;
	property string pages;
	property string password;  
	property string permissions;            
	property string position;           
	property string resolution;            
	property numeric rightMargin;
	property numeric rotation;              
	property string saveOption;            
	property numeric scale;                 
	property boolean showOnPrint;            
	property any source;         
	property boolean stopOnError;            
	property string text;        
	property numeric topMargin;
	property string transparent;
	property string type;
	property boolean useStructure;
    property string version;        
	property numeric vscale;
	property numeric width;        

    //used to store cfpdfparams
    variables.parameters = [];
    
	//service tag to invoke
    variables.tagName = "CFPDF";

    //list of valid cfpdf tag attributes
    variables.tagAttributes = getSupportedTagAttributes(getTagName());
    
    /**
	 * Initialization routine. Returns an instance of this component
     * @output false 
	 */
    public pdf function init()
    {
		if(!structisempty(arguments))
        {
        	 structappend(variables,arguments,"yes");
    	}
        return this;
    }


    /********************************  BEGIN :: LIST OF PDF SERVICES ******************************************/
    
    /**
     * Adds watermarks to PDF documents or pages.
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
    public any function addWatermark()
    {
    	return invoketag(arguments,"addWatermark");
    }


    /**
     * Remove watermarks from PDF documents or pages
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
	public any function removewatermark() 
    {
    	return invoketag(arguments,"removewatermark");
    }    


    /**
     * Delete pages from a PDF document.
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
    public any function deletePages()
    {
    	return invoketag(arguments,"deletePages");
    }    


    /**
     * Note: This function is called getPdfInfo() and not getInfo() because we have a property called info
     * Retrieves information associated with a PDF document, such as the author etc.
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
    public any function getPDFInfo()
    {
    	return invoketag(arguments,"getInfo");
    }


    /**
     * Note: This function is setPdfInfo() and not setInfo() because we have a property called info
     * Sets information for a PDF document, such as the author etc.
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
	public any function setPDFInfo()
    {
    	 return invoketag(arguments,"setInfo");
    }    


    /**
     * Merge several PDF documents into one PDF document
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
	public any function merge() 
    {
    	 return invoketag(arguments,"merge");
    }    


    /**
     * Use DDX instructions to manipulate PDF documents
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
	public any function processddx()
    {
    	return invoketag(arguments,"processddx");
    }    


    /**
     * Set passwords and encrypts PDF documnets
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
	public any function protect() 
    {
    	 return invoketag(arguments,"protect");
    }    


    /**
     * Reads a PDF File and also a cfdocument or cfpdf variable
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
	public any function read()
    {
    	return invoketag(arguments,"read");
    }    
    

    /**
     * Write a PDF document to an output file
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
	public any function write()
    {
    	 return invoketag(arguments,"write");
    }    


    /**
     * Generate thumbnail images from PDF documents or pages.
     * @output false
     */
	public void function thumbnail()
    {
    	 invoketag(arguments,"thumbnail");
    }    


    /**
     * Transformation of the images in a PDF (such as horizontal and vertical scaling and rotation)
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
	public any function transform()
    {
    	 return invoketag(arguments,"transform");
    }    


    /**
     * Downsamples images in PDF and also removes extra objects like links, bookmarks, thumbnails etc.
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
	public any function optimize()
    {
    	 return invoketag(arguments,"optimize");
    }    


    /**
     * Extracts image(s) from a PDF and puts it in the destination directory (only jpeg,png,tiff are supported)
     * @output false
     */
	public void function extractimage()
    {
    	 invoketag(arguments,"extractimage");
    }    


    /**
     * Extracts text from a PDF 
     * @output false
     */
	public string function extracttext()
    {
    	 return invoketag(arguments,"extracttext");
    }    


    /**
     * Adds a header to a PDF. Can be both - text and image
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
	public any function addheader()
    {
    	 return invoketag(arguments,"addheader");
    }    


    /**
     * Adds a footer to a PDF. Can be both - text and image
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
	public any function addfooter()
    {
    	 return invoketag(arguments,"addfooter");
    }    


    /**
     * Removes header and footer
	 * @return Pdf (If name attribute is specified) or an empty string
     * @output false
     */
	public any function removeheaderfooter()
    {
    	 return invoketag(arguments,"removeheaderfooter");
    }    


    /********************************  END :: LIST OF PDF SERVICES ******************************************/

    /**
     * Provides PDF services on a PDF object
     * Invoked the cfpdf service tag (and its child tag cfpdfparam) to provide the PDF services in cfscript 
	 *    
	 * Usage::
	 *    
     * pdfObj = new pdf();	//create a new pdf object
     * r = pdfObj.read(source="path_to_pdf",name="test"); //pdf service to read a pdf file from disk
	 * @return pdf (if name attribute is specified) or an empty string
   	 *
     * @output false
     */
    public any function invoketag(struct attribs,string action)
    {
        //store tag attributes to be passed to the service tag in a local variable
		var tagAttributes = duplicate(getTagAttributes());
        
		//attributes passed to service tag action like read() override existing attributes and are discarded after the action
		if(!structisempty(arguments.attribs))
        {
    		 structappend(tagAttributes,arguments.attribs,"yes");
        }
    
		//PDF action to perform
		tagAttributes["action"] = arguments.action;   
		
		//trim attribute values
		tagAttributes = trimAttributes(tagAttributes);

		//invoke the cfpdf/cfpdfparam tags to perform the PDF service
		return super.invokeTag(getTagName(),tagAttributes,{params=variables.parameters}).getResult();
    }
}