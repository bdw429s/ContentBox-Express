Change 89652

Don't use the same File Reader object thinger from multiple threads.  Instead create a copy, so that each thread has its own copy.  This way we don't close files from one thread while trying to read the same file from another thread.

UPDATED JAVA CLASS: com/lowagie/text/pdf/TrueTypeFontUnicode.java

<               TrueTypeFontSubSet sb = new TrueTypeFontSubSet(fileName, rf, longTag, directoryOffset, false);
---
>               TrueTypeFontSubSet sb = new TrueTypeFontSubSet(fileName, new RandomAccessFileOrArray(rf), longTag, directoryOffset, false);


change 87379

adding JDK 1.4.x 's Bidi checking to see if incoming string requires Bidi operation, and if it needs bidi operation then creating PDF only Bidiline object to reverse the arabic text.  

UPDATED JAVA CLASS: 	com/lowagie/text/pdf/PdfGraphics2D.java

boolean bBidi = false;
+  420              try {
+  421                  // ask jdk for Bidi class, only available jdk 1.4.x above
+  422                  // check to see if our text requires bidi operation.
+  423                  Class bidiClass = Class.forName("java.text.Bidi");
+  424                  Class clParams[] = new Class[3];
+  425                  clParams[0] = char[].class;
+  426                  clParams[1] = int.class;
+  427                  clParams[2] = int.class;
+  428                  Method requiresBidi = bidiClass.getMethod("requiresBidi", clParams);
+  429  
+  430                  Object params[] = new Object[3];
+  431                  params[0] = s.toCharArray();
+  432                  params[1] = new Integer(0);
+  433                  params[2] = new Integer(s.length());
+  434                  Object retObj = requiresBidi.invoke(null, params);
+  435  
+  436                  if(retObj != null && retObj instanceof Boolean) {
+  437                      if(((Boolean)retObj).booleanValue()) {
+  438                          forgroundcb.beginText();
+  439                          forgroundcb.setFontAndSize(baseFont, fontSize);
   440  
-                   forgroundcb.beginText();
-                   forgroundcb.setFontAndSize(baseFont, fontSize);
+  441                          BidiLine bidiLine = new BidiLine();
+  442                          Chunk ck = new Chunk(s, new com.lowagie.text.Font(baseFont, fontSize, font.getStyle(), null));
+  443                          bidiLine.addChunk(new PdfChunk(ck, null));
+  444  
+  445                          PdfLine line = bidiLine.processLine(baseFont.getWidth(s), Element.ALIGN_RIGHT, PdfWriter.RUN_DIRECTION_RTL, PangoArabicShapping.ar_lig);
+  446                          forgroundcb.setTextMatrix((float)mx[0], (float)mx[1], (float)mx[2], (float)mx[3], (float)mx[4], (float)mx[5]);
+  447                          forgroundcb.showTextKerned(line.getChunk(0).toString());
+  448                          forgroundcb.endText();
+  449                          bBidi = true;
+  450                      }
+  451                  }
+  452  
+  453  
+  454              }catch (Exception e){
+  455                  bBidi = false;
+  456              }
+  457  
+  458              if(!bBidi) {
+  459                  forgroundcb.beginText();
+  460                  forgroundcb.setFontAndSize(baseFont, fontSize);
+  461                  forgroundcb.setTextMatrix((float)mx[0], (float)mx[1], (float)mx[2], (float)mx[3], (float)mx[4], (float)mx[5]);
+  462  
+  463                  forgroundcb.showText(s);
+  464                  forgroundcb.endText();
+  465              }
   466  
-                   forgroundcb.setTextMatrix((float)mx[0], (float)mx[1], (float)mx[2], (float)mx[3], (float)mx[4], (float)mx[5]);
-                   forgroundcb.showText(s);
-                   forgroundcb.endText();
   467              setTransform(at);

changlist 87606

Itext uses text strings in the font face to identify the font style. It looks for string like "italic", "bold", "Normal", "Oblique" to flag the font style.  This technique works fine for most fonts out there, but lino font files use
abbrevated "it" to stand for italic fonts. 

UPDATED JAVA CLASS: 	com/lowagie/text/FontFactory.java
   729                    fs = Font.NORMAL;
   730                    if (lcf.toLowerCase().indexOf("bold") != -1) fs |= Font.BOLD;
-                         if (lcf.toLowerCase().indexOf("italic") != -1 || lcf.toLowerCase().indexOf("oblique") != -1) fs |= Font.ITALIC;
+  731                    if (lcf.toLowerCase().indexOf("italic") != -1 || lcf.toLowerCase().indexOf("oblique") != -1 || lcf.toLowerCase().indexOf("it") != -1)
+  732                      fs |= Font.ITALIC;
   733                    if ((s & Font.BOLDITALIC) == fs) {
   734                        fontname = f;
   735                        found = true;


change 58117

some text was wrongfully cut due to mis-calculation on the margin + string location to cut off text writting in the margin area.  However, orginal equation did not properly assign bottom and top margin calculation.  this will fix it.

UPDATED JAVA CLASS: 	com/lowagie/text/pdf/PdfGraphics2D.java

   393              inverse.getMatrix(mx);
   394  
-                   float orig_topline = (float)orig_mx[5] + topmargin;
-                   float orig_bottomline = (float)orig_mx[5] + bottommargin;
-                   float topline = (float)mx[5] + topmargin;
-                   float bottomline = (float)mx[5] + bottommargin;
+  395              // check to see if the string location is mistakenly inside of margin area
+  396              float string_location_plus_bottom_margin = (float)orig_mx[5] + bottommargin;
+  397              float string_location_plus_top_margin = (float)mx[5] + topmargin;
   398  
-                   if(!bHeaderfooter && (orig_topline > height || orig_bottomline > height
-                       || topline > height || bottomline > height))
+  399              if(!bHeaderfooter && (string_location_plus_bottom_margin > height || string_location_plus_top_margin > height))
   400              {
+  401                  // set back the original transformation so
+  402                  // we did not change this due to invalid string location
   403                  setTransform(at);
   404                  return;
   405              }

change 86546 
fix checksum duplication code
UPDATED JAVA CLASS: com/lowagie/text/Image.java, com/lowagie/text/ImgWMF.java, com/lowagie/text/Jpeg.java
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/Image.java#4


  1489          Checksum checksumEngine = new Adler32();
  1490          checksumEngine.update(bytes, 0, bytes.length);
  1491          long checksum = checksumEngine.getValue();
-       
-               // Compute CRC-32 checksum
-               checksumEngine = new CRC32();
-               checksumEngine.update(bytes, 0, bytes.length);
-               checksum = checksumEngine.getValue();
-       
+ 1492         
  1493          // The checksum engine can be reused again for a different byte array by calling reset()
  1494          checksumEngine.reset();
  1495  
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/ImgWMF.java#3


   113          rawData = img;
   114          originalData = img;
   115          processParameters();
+  116          mySerialId = new Long(getByteArrayCheckSum(img));
   117      }
   118      
   119  /**
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/Jpeg.java#3


   155          rawData = img;
   156          originalData = img;
   157          processParameters();
+  158          mySerialId = new Long(getByteArrayCheckSum(img));
   159      }
   160      
   161      /**

   170          this(img);
   171          scaledWidth = width;
   172          scaledHeight = height;
+  173          mySerialId = new Long(getByteArrayCheckSum(img));
   174      }
   175      
   176      // private static methods


change 86509 

Use checksum for image tracking, if it is the same image then it is no longer added to the document. this is drastic enhancement for ememory usage and speed of the PDF formation.  Also added wait image timeout, so we do not do blocking on waitonimage.

UPDATED JAVA CLASS: com/lowagie/text/Image.java, com/lowagie/text/ImgCCITT.java, com/lowagie/text/ImgRaw.java, com/lowagie/text/pdf/PdfGraphics2D.java

Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/Image.java#3


    57  import java.net.MalformedURLException;
    58  import java.util.Properties;
    59  import java.util.Set;
+   60  import java.util.zip.Checksum;
+   61  import java.util.zip.Adler32;
+   62  import java.util.zip.CRC32;
    63  import java.awt.color.ICC_Profile;
    64  import com.lowagie.text.pdf.PdfTemplate;
    65  import com.lowagie.text.pdf.codec.CCITTG4Encoder;

  1477      public void setUrl(URL url) {
  1478          this.url = url;
  1479      }
+ 1480  
+ 1481      /**
+ 1482       * getting ByteArray CheckSum base on Adler-32
+ 1483       * @param bytes
+ 1484       * @return
+ 1485       */
+ 1486      public static long getByteArrayCheckSum(byte[] bytes)
+ 1487      {
+ 1488          // Compute Adler-32 checksum
+ 1489          Checksum checksumEngine = new Adler32();
+ 1490          checksumEngine.update(bytes, 0, bytes.length);
+ 1491          long checksum = checksumEngine.getValue();
+ 1492  
+ 1493          // Compute CRC-32 checksum
+ 1494          checksumEngine = new CRC32();
+ 1495          checksumEngine.update(bytes, 0, bytes.length);
+ 1496          checksum = checksumEngine.getValue();
+ 1497  
+ 1498          // The checksum engine can be reused again for a different byte array by calling reset()
+ 1499          checksumEngine.reset();
+ 1500  
+ 1501          return checksum;
+ 1502  
+ 1503      }
+ 1504  
  1505  }
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/ImgCCITT.java#3


   142          rawData = data;
   143          plainWidth = width();
   144          plainHeight = height();
+  145          mySerialId = new Long(getByteArrayCheckSum(data)); 
   146      }
   147  }
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/ImgRaw.java#3


    93          rawData = data;
    94          plainWidth = width();
    95          plainHeight = height();
+   96          mySerialId = new Long(getByteArrayCheckSum(data));
    97      }
    98  }
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/pdf/PdfGraphics2D.java#9


  1624          double[] mx = new double[6];
  1625          inverse.getMatrix(mx);
  1626  
-               try {
+ 1627          try {            
  1628              com.lowagie.text.Image image = com.lowagie.text.Image.getInstance(img, bgColor);
  1629              if (mask!=null) {
  1630                  com.lowagie.text.Image msk = com.lowagie.text.Image.getInstance(mask, null, true);

  1796              mediaTracker = new MediaTracker(new PdfGraphics2D.fakeComponent());
  1797          mediaTracker.addImage(image, 0);
  1798          try {
-                   mediaTracker.waitForID(0);
+ 1799              mediaTracker.waitForID(0, 60000);   //add 60 s wait timeout
  1800          }
  1801          catch (InterruptedException e) {
  1802              // empty on purpose


change 86449 
adding margin into pdf graphics2d to avoid printing text outside of the page margin.  Also added headerfooter region checking.  we allow header/footer print within the maring area.
UPDATED JAVA CLASS: com/lowagie/text/pdf/PdfContentByte.java, com/lowagie/text/pdf/PdfGraphics2D.java
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/pdf/PdfContentByte.java#3


  2302       * @return a <CODE>Graphics2D</CODE>
  2303       */
  2304      public java.awt.Graphics2D createGraphics(float width, float height) {
-               return createGraphics(width, height, null);
+ 2305          return createGraphics(width, height, 0, 0, null);
  2306      }
  2307      
  2308      /** Gets a <CODE>Graphics2D</CODE> to write on. The graphics

  2312       * @param fontMapper the mapping from awt fonts to <CODE>BaseFont</CODE>
  2313       * @return a <CODE>Graphics2D</CODE>
  2314       */
-           public java.awt.Graphics2D createGraphics(float width, float height, FontMapper fontMapper) {
-               return new PdfGraphics2D(this, width, height, fontMapper);
+ 2315      public java.awt.Graphics2D createGraphics(float width, float height, float topmargin, float bottommargin, FontMapper fontMapper) {
+ 2316          return new PdfGraphics2D(this, width, height, topmargin, bottommargin, fontMapper);
  2317      }
  2318      
  2319      PageResources getPageResources() {
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/pdf/PdfGraphics2D.java#8


   177      private Shape _missingImageOutline = null;
   178      private PdfGraphics2D parent = null;
   179  
+  180      private float topmargin = 0;
+  181      private float bottommargin = 0;
+  182      private boolean bHeaderfooter = false;
+  183  
   184      private PdfGraphics2D() {
   185      }
   186  

   188       * Constructor for PDFGraphics2D.
   189       *
   190       */
-           PdfGraphics2D(PdfContentByte cb, float width, float height, FontMapper fontMapper) {
+  191      PdfGraphics2D(PdfContentByte cb, float width, float height, float topmargin, float bottommargin, FontMapper fontMapper) {
   192          super();
   193          if(debugmode) debug("PdfGraphics2D(PdfContentByte cb, float width, float height, FontMapper fontMapper) " + "width " + width + " height " + height + " FontMapper " + fontMapper);
   194          this.transform = new AffineTransform();

   204          cb.saveState();
   205          this.width = width;
   206          this.height = height;
+  207          this.topmargin = topmargin;
+  208          this.bottommargin = bottommargin;
   209          clip = new Area(new Rectangle2D.Float(0, 0, width, height));
   210          clip(clip);
   211          originalStroke = stroke = oldStroke = strokeOne;

   382              at2.translate(x, y);
   383              at2.concatenate(font.getTransform());
   384              setTransform(at2);
+  385              double[] orig_mx = new double[6];
+  386              at2.getMatrix(orig_mx);
+  387  
   388              AffineTransform inverse = this.normalizeMatrix();
   389              AffineTransform flipper = AffineTransform.getScaleInstance(1,-1);
   390              inverse.concatenate(flipper);
   391              double[] mx = new double[6];
   392              inverse.getMatrix(mx);
   393  
+  394              float orig_topline = (float)orig_mx[5] + topmargin;
+  395              float orig_bottomline = (float)orig_mx[5] + bottommargin;
+  396              float topline = (float)mx[5] + topmargin;
+  397              float bottomline = (float)mx[5] + bottommargin;
+  398  
+  399              if(!bHeaderfooter && (orig_topline > height || orig_bottomline > height
+  400                  || topline > height || bottomline > height))
+  401              {
+  402                  setTransform(at);
+  403                  return;
+  404              }
+  405  
   406              if(debugmode)
   407              {
   408                  String fullfontnames = extractStringfromStringArray(baseFont.getFullFontName());

  1049          g2.cb.saveState();
  1050          g2.width = this.width;
  1051          g2.height = this.height;
+ 1052          g2.topmargin = this.topmargin;
+ 1053          g2.bottommargin = this.bottommargin;
+ 1054          g2.bHeaderfooter = this.bHeaderfooter;
  1055          g2.followPath(new Area(new Rectangle2D.Float(0, 0, width, height)), CLIP);
  1056          if (this.clip != null)
  1057              g2.clip = new Area(this.clip);

  1495          }
  1496      }
  1497  
+ 1498      public void setHeaderFooter(boolean b){
+ 1499           bHeaderfooter = b;
+ 1500      }
+ 1501  
+ 1502      public boolean isHeaderFooter() {
+ 1503          return bHeaderfooter;
+ 1504      }
+ 1505  
  1506      ///////////////////////////////////////////////
  1507      //
  1508      //

Change 86337 by sgong
Add  '/usr/X11R6/lib/X11/fonts/TrueType' to the list of directories that Blackstone scans for fonts. 
UDATED JAVA CLASS: com/lowagie/text/FontFactory.java
 659          count += registerDirectory("/usr/share/fonts/default/TrueType");
   660          count += registerDirectory("/usr/X11R6/lib/X11/fonts/ttf");
   661          count += registerDirectory("/usr/X11R6/lib/X11/fonts/truetype");
+  662          count += registerDirectory("/usr/X11R6/lib/X11/fonts/TrueType");
   663          count += registerDirectory("/usr/X11R6/lib/X11/fonts/TTF");
   664          return count;
   665      }

Change 86023

To solve the problem of background image overlapping text, we will call create PdfGraphics2D's default PdfContentByte to use the pdfwriter.getContentByteUnder to draw images on the bottom of the Graphics2D canvas.  In order for this to work, changed PdfGraphics2D's drawString method need to use the forground PdfContentByte using pdfwriter.getContentByte.  we still see some table background color not displayed, but this is  a big improvement from what we had before.  
UDATED JAVA CLASS:  com/lowagie/text/pdf/PdfGraphics2D.java
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/pdf/PdfGraphics2D.java#7


   362       */
   363      public void drawString(String s, float x, float y) {
   364  
-               setFillPaint();
+  365          PdfContentByte forgroundcb = cb.getPdfWriter().getDirectContent();
+  366  
+  367          setFillPaint(forgroundcb);
+  368  
   369          if (onlyShapes) {
   370              TextLayout tl = new TextLayout(s, this.font, new FontRenderContext(new AffineTransform(), false, true));
   371              tl.draw(this, x, y);

   392                      baseFont.getWidth(s) + " FontType " + baseFont.getFontType() + " Encoding " + baseFont.getEncoding()
   393                      + " embeded " + baseFont.isEmbedded()+ "] " + " inverse-flipped-transform " + inverse);
   394              }
-                   cb.beginText();
-                   cb.setFontAndSize(baseFont, fontSize);
+  395  
+  396  
+  397              forgroundcb.beginText();
+  398              forgroundcb.setFontAndSize(baseFont, fontSize);
   399  
-                   cb.setTextMatrix((float)mx[0], (float)mx[1], (float)mx[2], (float)mx[3], (float)mx[4], (float)mx[5]);
-                   cb.showText(s);
-                   cb.endText();
+  400              forgroundcb.setTextMatrix((float)mx[0], (float)mx[1], (float)mx[2], (float)mx[3], (float)mx[4], (float)mx[5]);
+  401              forgroundcb.showText(s);
+  402              forgroundcb.endText();
   403              setTransform(at);
   404  
   405              if(underline)

   751  
   752      private void setStrokeDiff(Stroke newStroke, Stroke oldStroke) {
   753          if(debugmode) debug("setStrokeDiff(Stroke newStroke, Stroke oldStroke): " + "newStroke " + newStroke + " oldStrok " + oldStroke);
+  754  
   755          if (newStroke == oldStroke)
   756              return;
   757          if (!(newStroke instanceof BasicStroke))

  1625          }
  1626      }
  1627  
+ 1628      private void setFillPaint(PdfContentByte cb) {
+ 1629           if (checkNewPaint(paintFill)) {
+ 1630              paintFill = paint;
+ 1631              setPaint(false, 0, 0, true, cb);
+ 1632          }
+ 1633      }
+ 1634  
  1635      private void setStrokePaint() {
  1636          if (checkNewPaint(paintStroke)) {
  1637              paintStroke = paint;

  1640      }
  1641  
  1642      private void setPaint(boolean invert, double xoffset, double yoffset, boolean fill) {
+ 1643          setPaint(invert, xoffset, yoffset, fill, cb);
+ 1644      }
+ 1645  
+ 1646      private void setPaint(boolean invert, double xoffset, double yoffset, boolean fill, PdfContentByte contentByte) {
+ 1647  
  1648          if (paint instanceof Color) {
  1649              Color color = (Color)paint;
  1650              int alpha = color.getAlpha();

  1657                          gs.setFillOpacity((float)alpha / 255f);
  1658                          fillGState[alpha] = gs;
  1659                      }
-                           cb.setGState(gs);
+ 1660                      contentByte.setGState(gs);
  1661                  }
-                       cb.setColorFill(color);
+ 1662                  contentByte.setColorFill(color);
  1663              }
  1664              else {
  1665                  if (alpha != currentStrokeGState) {

  1670                          gs.setStrokeOpacity((float)alpha / 255f);
  1671                          strokeGState[alpha] = gs;
  1672                      }
-                           cb.setGState(gs);
+ 1673                      contentByte.setGState(gs);
  1674                  }
-                       cb.setColorStroke(color);
+ 1675                  contentByte.setColorStroke(color);
  1676              }
  1677          }
  1678          else if (paint instanceof GradientPaint) {

  1683              transform.transform(p2, p2);
  1684              Color c1 = gp.getColor1();
  1685              Color c2 = gp.getColor2();
-                   PdfShading shading = PdfShading.simpleAxial(cb.getPdfWriter(), (float)p1.getX(), normalizeY((float)p1.getY()), (float)p2.getX(), normalizeY((float)p2.getY()), c1, c2);
+ 1686              PdfShading shading = PdfShading.simpleAxial(contentByte.getPdfWriter(), (float)p1.getX(), normalizeY((float)p1.getY()), (float)p2.getX(), normalizeY((float)p2.getY()), c1, c2);
  1687              PdfShadingPattern pat = new PdfShadingPattern(shading);
  1688              if (fill)
-                       cb.setShadingFill(pat);
+ 1689                  contentByte.setShadingFill(pat);
  1690              else
-                       cb.setShadingStroke(pat);
+ 1691                  contentByte.setShadingStroke(pat);
  1692          }
  1693          else if (paint instanceof TexturePaint) {
  1694              try {

  1696                  BufferedImage img = tp.getImage();
  1697                  Rectangle2D rect = tp.getAnchorRect();
  1698                  com.lowagie.text.Image image = com.lowagie.text.Image.getInstance(img, null);
-                       PdfPatternPainter pattern = cb.createPattern(image.width(), image.height());
+ 1699                  PdfPatternPainter pattern = contentByte.createPattern(image.width(), image.height());
  1700                  AffineTransform inverse = this.normalizeMatrix();
  1701                  inverse.scale(rect.getWidth() / image.width(), -rect.getHeight() / image.height());
  1702                  double[] mx = new double[6];

  1705                  image.setAbsolutePosition(0,0);
  1706                  pattern.addImage(image);
  1707                  if (fill)
-                           cb.setPatternFill(pattern);
+ 1708                      contentByte.setPatternFill(pattern);
  1709                  else
-                           cb.setPatternStroke(pattern);
+ 1710                      contentByte.setPatternStroke(pattern);
  1711              } catch (Exception ex) {
  1712                  if (fill)
-                           cb.setColorFill(Color.gray);
+ 1713                      contentByte.setColorFill(Color.gray);
  1714                  else
-                           cb.setColorStroke(Color.gray);
+ 1715                      contentByte.setColorStroke(Color.gray);
  1716              }
  1717          }
  1718          else {

  1737                      g.drawImage(img,tx,null);
  1738                  }
  1739                  com.lowagie.text.Image image = com.lowagie.text.Image.getInstance(img, null);
-                       PdfPatternPainter pattern = cb.createPattern(width, height);
+ 1740                  PdfPatternPainter pattern = contentByte.createPattern(width, height);
  1741                  image.setAbsolutePosition(0,0);
  1742                  pattern.addImage(image);
  1743                  if (fill)
-                           cb.setPatternFill(pattern);
+ 1744                      contentByte.setPatternFill(pattern);
  1745                  else
-                           cb.setPatternStroke(pattern);
+ 1746                      contentByte.setPatternStroke(pattern);
  1747              } catch (Exception ex) {
  1748                  if (fill)
-                           cb.setColorFill(Color.gray);
+ 1749                      contentByte.setColorFill(Color.gray);
  1750                  else
-                           cb.setColorStroke(Color.gray);
+ 1751                      contentByte.setColorStroke(Color.gray);
  1752              }
  1753          }
  1754      }

Change 85605
Remove the isFontNameLegal() method from documentServiceImpl, and use the version in fontFactory.
UPDATED JAVA CLASS: com/lowagie/text/FontFactory.java
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/FontFactory.java#9

   484          register(path, null);
   485      }
   486  
-       
-           private static boolean isFontNameLegal(String str) {
+  487      public static boolean isFontNameLegal(String str) {
   488        if (str==null) {
   489          return false;
   490        }

   492        boolean rc=true;
   493        for (int i=0; i < str.length(); i++) {
   494          char ch = str.charAt(i);
-               if (Character.isLetterOrDigit(ch) || Character.isSpace(ch)) {
+  495          if (Character.isLetterOrDigit(ch) || Character.isSpace(ch) ||
+  496              Character.getType(ch)==Character.CURRENCY_SYMBOL || Character.getType(ch)==Character.DASH_PUNCTUATION) {
   497          } else {
   498            rc=false;
   499            break;

   502        return rc;
   503      }
   504  
-       
   505  /**
   506   * Register a font file and use an alias for the font contained in it.
   507   *

Change 85603 by song 
We always have some foreign fonts that contains unicode characters that fails in the wddx serialization/deserialization. 
To fix this problem, we now define valid font name/font family name as a string combination of of numbers, letters, currency symbol, dashes, and space characters. If the font name contains other characters, we will refuse to register the file. 
UPDATED JAVA CLASS: com/lowagie/text/FontFactory.java
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/FontFactory.java#8


   484          register(path, null);
   485      }
   486  
+  487  
+  488      private static boolean isFontNameLegal(String str) {
+  489        if (str==null) {
+  490          return false;
+  491        }
+  492  
+  493        boolean rc=true;
+  494        for (int i=0; i < str.length(); i++) {
+  495          char ch = str.charAt(i);
+  496          if (Character.isLetterOrDigit(ch) || Character.isSpace(ch)) {
+  497          } else {
+  498            rc=false;
+  499            break;
+  500          }
+  501        }
+  502        return rc;
+  503      }
+  504  
+  505  
   506  /**
   507   * Register a font file and use an alias for the font contained in it.
   508   *

   521                  String fullName = null;
   522                  String familyName = null;
   523                  String[][] names = (String[][])allNames[2];
+  524  
+  525                  /**
+  526                   * We look for font name in the default code page
+  527                   *
+  528                   */
   529                  for (int i = 0; i < names.length; i++) {
   530                      if ("0".equals(names[i][2])) {
   531                          fullName = names[i][3];
   532                          break;
   533                      }
   534                  }
+  535                  /**
+  536                   * No leagl font name found in the default code page
+  537                   * we look for it in the english code page.
+  538                   */
+  539                  if ((!isFontNameLegal(fullName)))
+  540                    for (int i = 0; i < names.length; i++) {
+  541                      if ("1033".equals(names[i][2])) {
+  542                        fullName = names[i][3];
+  543                        break;
+  544                      }
+  545                  }
+  546  
   547                  // register all the font names with all the locales
   548                  for (int i = 0; i < names.length; i++) {
   549                      trueTypeFonts.setProperty(names[i][3], path);
   550                  }
-                       if (fullName != null) {
+  551                  if (isFontNameLegal(fullName)) {
+  552  
   553                       // Currently only adobe is the only commercial open type font vendor.
   554                       // The adobe otf files sometimes use the same font Family name for multiple font files.
   555                       // That means the fonts won't show up correctly in the font administrator page.

   566                      for (int i = 0; i < names.length; i++) {
   567                          if ("0".equals(names[i][2])) {
   568                              familyName = names[i][3];
-                                   HashSet tmp = (HashSet) fontFamilies.get(familyName);
-                                   if (tmp == null) {
-                                       tmp = new HashSet();
-                                   }
-                                   tmp.add(fullName);
-                                   fontFamilies.put(familyName, tmp);
   569                              break;
   570                          }
   571                      }
-                       }
+  572  
+  573                      if (!isFontNameLegal(familyName)) {
+  574                        for (int i = 0; i < names.length; i++) {
+  575                          if ("1033".equals(names[i][2])) {
+  576                            familyName = names[i][3];
+  577                            break;
+  578                          }
+  579                        }
+  580                      }
+  581                      if (!isFontNameLegal(familyName)) {
+  582                        throw new DocumentException("Font file " + path + " does not have a legal font name");
+  583                      }
+  584                      HashSet tmp = (HashSet) fontFamilies.get(familyName);
+  585                      if (tmp == null) {
+  586                        tmp = new HashSet();
+  587                      }
+  588                      tmp.add(fullName);
+  589                      fontFamilies.put(familyName, tmp);
+  590                    }
   591              }
   592              else if (path.toLowerCase().endsWith(".ttc")) {
   593                  if (alias != null)


Change 85317 

added altText handling for missing images, created freeText PdfAnnotation and square float pointer for missing object.   This does not effect regular images because PDF does not have a way to add altText without effect image look and feel, also does not have 508 screen reader capability without drawing Text on top of the image.

UPDATED JAVA CLASS: com.lowagie.test.pdf.PdfGraphics2D.java
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/pdf/PdfGraphics2D.java#6


   100  import java.util.Set;
   101  import java.util.Iterator;
   102  import java.awt.font.TextAttribute;
+  103  import java.io.IOException;
   104  
+  105  import com.lowagie.text.BadElementException;
+  106  import com.lowagie.text.Annotation;
   107  
+  108  
   109  public class PdfGraphics2D extends Graphics2D implements G2DLink{
   110  
   111      private static final int FILL = 1;

   172      private static boolean itextdebuglink  = (System.getProperty("itextdebuglink") != null
   173              && ((String) System.getProperty("itextdebuglink")).equalsIgnoreCase("true"));
   174  
+  175      // this is use for setting altText - 508 complain.
+  176      private Shape _imageOutline = null;
+  177      private Shape _missingImageOutline = null;
+  178      private PdfGraphics2D parent = null;
+  179  
   180      private PdfGraphics2D() {
   181      }
   182  

   445  
   446          if(itextdebuglink) debug("addAltText(java.awt.Image image, String altText )" +
   447                          " image " + image + " altText " + altText );
-              /* try
-               {
-                   PdfWriter writer = cb.getPdfWriter();
-                   PdfDocument doc = writer.getPdfDocument();
-                   com.lowagie.text.Image img = com.lowagie.text.Image.getInstance(image, image.getGraphics().getColor());
-                   img.setAnnotation(new Annotation(altText,altText, 0, 0, 0, 0));
+  448  
+  449  
+  450          if(_imageOutline!= null) {
+  451              //showAltText(_imageOutline, altText, "SQUARE");
+  452              _imageOutline = null;
+  453          }
+  454          else {
+  455              if(_missingImageOutline != null)
+  456              {
+  457                  try{
+  458                      com.lowagie.text.Image.getInstance(image, null);
+  459                  }catch(IOException e){
+  460  
+  461                      showAltText(_missingImageOutline, altText, "FREETEXT");
+  462                      showAltText(_missingImageOutline, altText, "SQUARE");
+  463                      _missingImageOutline = null;
   464  
-                   doc.add(img);
+  465                  }catch(Exception e){
+  466                      // do nothing
+  467                  }
+  468              }
   469          }
-               catch (Exception e)
-               {
-                   e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
-               }*/
+  470  
   471  
   472      }
   473  

   482      public void addAltText(java.awt.Shape s, String altText) {
   483          if(itextdebuglink) debug("addAltText(java.awt.Shape s, String altText))" +
   484                          " Shape " + s + " altText " + altText );
-            /*   try
-               {
-                   Rectangle2D r = s.getBounds2D();
-                   double w = r.getWidth();
-                   double h = r.getHeight();
-                   double x = r.getX();
-                   double y = r.getY();
-                   Annotation ann = new Annotation(altText,altText, (float)x, (float)y, (float)(x+w), (float)(y+h));
-                   PdfWriter writer = cb.getPdfWriter();
-                   PdfDocument doc = writer.getPdfDocument();
-                   doc.add(ann);
+  485  
+  486          if(s != null) {
+  487              //showAltText(s, altText, "SQUARE");
+  488          }
+  489  
+  490      }
+  491  
+  492      private void showAltText(Shape s, String altText, String type)
+  493      {
+  494          Rectangle2D rect = s.getBounds2D();
+  495  
+  496          double rec_width = rect.getWidth();
+  497          double rec_height = rect.getHeight();
+  498          double x = rect.getX();
+  499          double y = rect.getY();
+  500  
+  501          AffineTransform at = getTransform();
+  502          AffineTransform at2 = getTransform();
+  503          at2.translate(x, y);
+  504          at2.concatenate(font.getTransform());
+  505          setTransform(at2);
+  506          AffineTransform inverse = this.normalizeMatrix();
+  507          AffineTransform flipper = AffineTransform.getScaleInstance(1,-1);
+  508          inverse.concatenate(flipper);
+  509          double[] mx = new double[6];
+  510          inverse.getMatrix(mx);
+  511  
+  512          PdfWriter writer = cb.getPdfWriter();
+  513  
+  514          com.lowagie.text.Rectangle r = new com.lowagie.text.Rectangle((float)mx[4],
+  515                      (float)mx[5] - (float)rec_height,
+  516                      (float)mx[4] + (float)rec_width,
+  517                      (float)mx[5]);
+  518  
+  519          if(type.equals("FREETEXT")) {
+  520              PdfAnnotation annot = new PdfAnnotation(writer, r);
+  521              annot.put(PdfName.SUBTYPE, PdfName.FREETEXT);
+  522              annot.put(PdfName.CONTENTS, new PdfString(altText, PdfObject.TEXT_UNICODE));
+  523              cb.addAnnotation(annot);
+  524          }
+  525          else if (type.equals("LINE")) {
+  526              PdfAnnotation annot = PdfAnnotation.createLine(writer, r,
+  527                      altText,(float)mx[4],
+  528                      (float)mx[5] - (float)rec_height,
+  529                      (float)mx[4] + (float)rec_width,
+  530                      (float)mx[5]);
+  531              cb.addAnnotation(annot);
+  532          }
+  533          else if (type.equals("SQUARE")) {
+  534              PdfAnnotation annot = PdfAnnotation.createSquareCirlcle(writer, r,
+  535                      altText,true);
+  536              cb.addAnnotation(annot);
   537          }
-               catch (DocumentException e)
-               {
-                   e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
-               }*/
+  538          else if(type.equals("TEXT")) {
+  539              cb.beginText();
+  540              cb.setFontAndSize(baseFont, fontSize);
   541  
+  542              cb.setTextMatrix((float)mx[0], (float)mx[1], (float)mx[2], (float)mx[3], (float)mx[4], (float)mx[5]);
+  543              cb.showText(altText);
+  544              cb.endText();
+  545          }
+  546          setTransform(at);
   547      }
   548  
   549      /**

  1004          if(debugmode) debug("create()");
  1005  
  1006          PdfGraphics2D g2 = new PdfGraphics2D();
+ 1007          g2.parent = this;
+ 1008          g2._imageOutline = this._imageOutline;
+ 1009          g2._missingImageOutline = this._missingImageOutline;
  1010          g2.onlyShapes = this.onlyShapes;
  1011          g2.transform = new AffineTransform(this.transform);
  1012          g2.baseFonts = this.baseFonts;

  1157          if(debugmode) debug("clipRect(int x, int y, int width, int height): " + "x " + x + " y "+ y + " width " + width + " height " + height);
  1158  
  1159          Rectangle2D rect = new Rectangle2D.Double(x,y,width,height);
+ 1160          if(parent!=null) parent._missingImageOutline = rect;
  1161          clip(rect);
  1162      }
  1163  

  1254      public void fillRect(int x, int y, int width, int height) {
  1255          if(debugmode) debug("fillRect(int x, int y, int width, int height): "+ "x " + x + " y "+ y + " width " + width + " height " + height);
  1256  
-               fill(new Rectangle(x,y,width,height));
+ 1257          Rectangle rect = new Rectangle(x,y,width,height);
+ 1258          fill(rect);
  1259      }
  1260  
  1261      /**

  1572      private boolean drawImage(Image img, Image mask, AffineTransform xform, Color bgColor, ImageObserver obs) {
  1573          if (xform==null) return true;
  1574  
+ 1575          double x = xform.getScaleX();
+ 1576          double y = xform.getScaleY();
+ 1577  
  1578          xform.translate(0, img.getHeight(obs));
  1579          xform.scale(img.getWidth(obs), img.getHeight(obs));
  1580  

  1594                  msk.setInvertMask(true);
  1595                  image.setImageMask(msk);
  1596              }
+ 1597  
+ 1598              if(parent!=null) parent._imageOutline = new Rectangle((int)x, (int)y, img.getWidth(obs), img.getHeight(obs));
+ 1599  
  1600              cb.addImage(image, (float)mx[0], (float)mx[1], (float)mx[2], (float)mx[3], (float)mx[4], (float)mx[5]);
  1601  
  1602          } catch (Exception ex) {

Change 85084 
If a font file can be read by both the Java native font class and iText font class, then the font file is usable in CF.  Open type font files can be read by Itext, but can't be read by either SUN JDK1.3, or SUN JDK1.4, the only time a open type font can be used is in CFReport/PDF output. With this check-in, we allow otf file to be registered.  The otf fonts will be displayed in the font admin page. It can be added, or dropped. If a OTF font is being used in situations where it is not supported, we throw DocumentFontException and show the actual font file name which caused the problem.

UPDATE JAVA CLASS: com/lowagie/text/FontFactory.java

Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/FontFactory.java#7

   513                      trueTypeFonts.setProperty(names[i][3], path);
   514                  }
   515                  if (fullName != null) {
-                           names = (String[][])allNames[1];
+  516                       // Currently only adobe is the only commercial open type font vendor.
+  517                       // The adobe otf files sometimes use the same font Family name for multiple font files.
+  518                       // That means the fonts won't show up correctly in the font administrator page.
+  519                       // To work around this problem, we look for font names in the windows platform, rather
+  520                       // than the mac platform
+  521                       //
+  522                       // See the open font names spec in
+  523                       // http://partners.adobe.com/asn/tech/type/opentype/recom.jsp
+  524                       if (path.toLowerCase().endsWith(".otf")) {
+  525                         names = (String[][])allNames[2];
+  526                       } else
+  527                         names = (String[][])allNames[1];
+  528  
   529                      for (int i = 0; i < names.length; i++) {
   530                          if ("0".equals(names[i][2])) {
   531                              familyName = names[i][3];


Change 84538 

adding debug print out for pdfGraphics2d

in order to see what funcitons are called and what parameters passing in.

-Ditextdebug=true and -Ditextdebuglink=true need to be set.
UPDATED JAVA CLASS:  com/lowagie/text/pdf/PdfGraphics2D.java

 90  import java.awt.RenderingHints.Key;
    91  import java.awt.geom.NoninvertibleTransformException;
    92  import java.awt.geom.Point2D;
-       import java.awt.geom.GeneralPath;
    93  import java.text.CharacterIterator;
    94  import java.text.AttributedCharacterIterator;
    95  import java.util.Map;

   162  
   163      public static int AFM_DIVISOR = 1000; // used to calculate coordinates
   164  
+  165      private static boolean debugmode = (System.getProperty("itextdebug")!= null
+  166              && ((String)System.getProperty("itextdebug")).equalsIgnoreCase("true"));
+  167  
+  168      private static boolean itextdebuglink  = (System.getProperty("itextdebuglink") != null
+  169              && ((String) System.getProperty("itextdebuglink")).equalsIgnoreCase("true"));
+  170  
   171      private PdfGraphics2D() {
   172      }
   173  
adding print if(debugmode)  to the class



Change 83407

1) Update the PdfWriter to ignore missing internal reference link if not present.

UPDATED JAVA CLASS:  com/lowagie/text/pdf/PdfWriter.java#4 edit
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/pdf/PdfWriter.java#3


  1235              String name = (String)i.next();
  1236              Object obj[] = (Object[])dest.get(name);
  1237              PdfDestination destination = (PdfDestination)obj[2];
-                   if (destination == null)
-                       throw new RuntimeException("The name '" + name + "' has no local destination.");
-                   if (obj[1] == null)
-                       obj[1] = getPdfIndirectReference();
-                   PdfIndirectObject iob = body.add(destination, (PdfIndirectReference)obj[1]);
+ 1238  
+ 1239              // ignore if destination is null
+ 1240              //if (destination == null)
+ 1241              //    throw new RuntimeException("The name '" + name + "' has no local destination.");
+ 1242  
+ 1243              if (destination != null)
+ 1244              {
+ 1245                  if (obj[1] == null)
+ 1246                      obj[1] = getPdfIndirectReference();
+ 1247                  PdfIndirectObject iob = body.add(destination, (PdfIndirectReference)obj[1]);
+ 1248              }
  1249          }
  1250      }
  1251      


Change 83387 
	
	1) extend G2DLink interface to PdfGraphics2D.java to enable PDF links
	   -  added addLink function to enable links.
	   -  addAltText still under development
	
	2) update the iText build.xml to include G2DLink interface.

UPDATED JAVA CLASS: 

... //depot/ColdFusion/cf_main/tools/itext/build.xml#4 edit 
... //depot/ColdFusion/cf_main/tools/itext/lib/G2DLink.jar#1 add 
... //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/pdf/PdfGraphics2D.java#4 edit  (added addLink function to enable links.)
Edit //depot/ColdFusion/cf_main/tools/itext/build.xml#3


    27          <property name="itext.cvsroot" value=":pserver:anonymous@cvs.itext.sourceforge.net:/cvsroot/itext" />
    28          <property name="defaultnumber" value="invalid" />
    29          <available property="j2ee.jar" value="lib/j2ee.jar" file="lib/j2ee.jar"/>
+   30          <available property="g2dlink.jar" value="lib/G2DLink.jar" file="lib/G2DLink.jar"/>
    31          <property name="j2ee.jar" value="COULD_NOT_FIND_J2EE_JAR"/>
    32  
    33          <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

    40              <pathelement location="${itext.bin}/iTextXML.jar" />
    41              <pathelement location="${itext.bin}/iTextHYPH.jar" />
    42              <pathelement location="${itext.examples}" />
+   43              <pathelement location="${g2dlink.jar}" />            
    44          </path>
    45      </target>
    46  

   697      <target name="install.cvs" depends="properties,download.cvs, release, examples" description="--> installs the current version of iText in one command">
   698      </target>
   699  
-       </project>+</project>

Add //depot/ColdFusion/cf_main/tools/itext/lib/G2DLink.jar


Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/pdf/PdfGraphics2D.java#3
  104  
-       public class PdfGraphics2D extends Graphics2D {
-           
+  105  
+  106  public class PdfGraphics2D extends Graphics2D implements G2DLink{
+  107  

+  381  
+  382  
   383      /**
+  384       * Define the 'alt' text associated with an image. This method should be called after
+  385       * each image is drawn on the screen, even if the alt text is empty.
+  386       *
+  387       * @param image Reference to the Image Object previously drawn on the screen
+  388       * @param altText The alt text, or "" if no alt text is defined.
+  389       */
+  390      public void addAltText(java.awt.Image image, String altText ) {
+  391  
+  392         /* try
+  393          {
+  394              PdfWriter writer = cb.getPdfWriter();
+  395              PdfDocument doc = writer.getPdfDocument();
+  396              com.lowagie.text.Image img = com.lowagie.text.Image.getInstance(image, image.getGraphics().getColor());
+  397              img.setAnnotation(new Annotation(altText,altText, 0, 0, 0, 0));
+  398  
+  399              doc.add(img);
+  400          }
+  401          catch (Exception e)
+  402          {
+  403              e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
+  404          }*/
+  405  
+  406      }
+  407  
+  408  
+  409      /**
+  410       * Define the 'alt' text associated with each clickable region. This method should be called after
+  411       * each region is drawn on the screen, even if the alt text is empty.
+  412       *
+  413       * @param s Each clickable region
+  414       * @param altText altText The alt text, or "" if no alt text is defined.
+  415       */
+  416      public void addAltText(java.awt.Shape s, String altText) {
+  417  
+  418       /*   try
+  419          {
+  420              Rectangle2D r = s.getBounds2D();
+  421              double w = r.getWidth();
+  422              double h = r.getHeight();
+  423              double x = r.getX();
+  424              double y = r.getY();
+  425              Annotation ann = new Annotation(altText,altText, (float)x, (float)y, (float)(x+w), (float)(y+h));
+  426              PdfWriter writer = cb.getPdfWriter();
+  427              PdfDocument doc = writer.getPdfDocument();
+  428              doc.add(ann);
+  429          }
+  430          catch (DocumentException e)
+  431          {
+  432              e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
+  433          }*/
+  434  
+  435      }
+  436  
+  437      /**
+  438       * Enable Links and Anchors in the PDF document
+  439       *
+  440       * @param resource - external links (i.e. http://www.yahoo.com), internal reference
+  441       *             anchor (i.e. #topofdocument), internal reference target where anchor point to
+  442       *             (i.e. topofdocument)
+  443       *
+  444       * @param linkType - 0 external_link,
+  445       *                   1 internal_reference_anchor,
+  446       *                   2 internal_reference_name
+  447       * @param trans    - Transform Matrix for the shape
+  448       * @param s        - Opaque Shape defines the region of the image or text where
+  449       *                   it is sensitive to mouse clicking.
+  450       *
+  451       */
+  452      public void addLink(String resource, int linkType, AffineTransform trans, Shape s) {
+  453  
+  454          AffineTransform at = getTransform();
+  455          AffineTransform at2 = getTransform();
+  456  
+  457          at2.concatenate(trans);
+  458          setTransform(at2);
+  459          AffineTransform inverse = this.normalizeMatrix();
+  460          AffineTransform flipper = AffineTransform.getScaleInstance(1,-1);
+  461          inverse.concatenate(flipper);
+  462  
+  463          double rec_width = 0;
+  464          double rec_height = 0;
+  465          s = trans.createTransformedShape(s);
+  466          Rectangle2D r = s.getBounds2D();
+  467          rec_width = r.getWidth();
+  468          rec_height = r.getHeight();
+  469  
+  470          double[] mx = new double[6];
+  471          inverse.getMatrix(mx);
+  472  
+  473          PdfWriter writer = cb.getPdfWriter();
+  474          PdfAction action = null;
+  475  
+  476          if(linkType == internal_reference_anchor) {
+  477              PdfDocument doc = writer.getPdfDocument();
+  478              PdfDestination destination = new PdfDestination(PdfDestination.XYZ, (float)mx[4], (float)mx[5], 0);
+  479              doc.localDestination(resource, destination);
+  480          }
+  481          else {
+  482              if(linkType == external_link ) {
+  483                  action = new PdfAction(resource);
+  484                  PdfAnnotation a = new PdfAnnotation( writer,
+  485                          (float)mx[4],
+  486                          (float)mx[5] - (float)rec_height,
+  487                          (float)mx[4] + (float)rec_width,
+  488                          (float)mx[5],
+  489                          action);
+  490  
+  491                  cb.addAnnotation(a);
+  492              }
+  493              else if (linkType == internal_reference_target ) {
+  494                  PdfDocument doc = writer.getPdfDocument();
+  495                  String target = null;
+  496  
+  497                  int index = -1;
+  498                  if((index = resource.indexOf('#')) >= 0) {
+  499                      target = resource.substring(index+1, resource.length());
+  500                  }
+  501                  else {
+  502                      target = resource;
+  503                  }
+  504  
+  505                  doc.localGoto(target, (float)mx[4],
+  506                              (float)mx[5] - (float)rec_height,
+  507                              (float)mx[4] + (float)rec_width,
+  508                              (float)mx[5]);
+  509              }
+  510          }
+  511  
+  512          setTransform(at);
+  513  
+  514      }
+  515  

Change 78165 

Add a method in iTextFactory to return font path for true type fonts.

UPDATED JAVA CLASS: com/lowagie/text/FontFactory.java
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/FontFactory.java#6


   653        return fontFamilies;
   654      }
   655  
+  656      public static String getFontPath(String family, int style) {
+  657            String fontname = family;
+  658            HashSet tmp = (HashSet) fontFamilies.get(fontname);
+  659            if (tmp != null) {
+  660                // some bugs were fixed here by Daniel Marczisovszky
+  661                String lowercasefontname = fontname.toLowerCase();
+  662                int s = style == Font.UNDEFINED ? Font.NORMAL : style;
+  663                int fs = Font.NORMAL;
+  664                boolean found = false;
+  665                for (Iterator i = tmp.iterator(); i.hasNext(); ) {
+  666                    String f = (String) i.next();
+  667                    String lcf = f.toLowerCase();
+  668                    fs = Font.NORMAL;
+  669                    if (lcf.toLowerCase().indexOf("bold") != -1) fs |= Font.BOLD;
+  670                    if (lcf.toLowerCase().indexOf("italic") != -1 || lcf.toLowerCase().indexOf("oblique") != -1) fs |= Font.ITALIC;
+  671                    if ((s & Font.BOLDITALIC) == fs) {
+  672                        fontname = f;
+  673                        found = true;
+  674                        break;
+  675                    }
+  676                }
+  677                if (style != Font.UNDEFINED && found) {
+  678                    style &= ~fs;
+  679                }
+  680            }
+  681            fontname = trueTypeFonts.getProperty(fontname);
+  682            return fontname;
+  683      }
   684  }


Change 76958 
	itext/src/com/lowagie/text/Font.java -- change getCalculatedBaseFont method to include embeding option, before it is always false for embed.  (to maintain the original method, added a simple redirect method, with embed always false).
	itext/src/com/lowagie/text/pdf/BaseFont.java -- change CreateFont method, comment out force to embed when encoding is IDENTITY-H, update in the TrueTypeFontUnicode to handle not embeded situations
	itext/src/com/lowagie/text/pdf/TrueTypeFontUnicode -- change the constructor checking for embed true, automatic throw exception behavior.   Also change the WriteFont method, to handle the embedded = false situation. 

Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/Font.java#3


   612          return baseFont;
   613      }
   614  
+  615      /**
+  616       * maintain the original method
+  617       * @param specialEncoding
+  618       * @return
+  619       */
+  620      public BaseFont getCalculatedBaseFont(boolean specialEncoding)
+  621      {
+  622          return getCalculatedBaseFont(specialEncoding, false);
+  623      }
   624      /** Gets the <CODE>BaseFont</CODE> this class represents.
   625       * For the built-in fonts a <CODE>BaseFont</CODE> is calculated.
   626       * @param specialEncoding <CODE>true</CODE> to use the special encoding for Symbol and ZapfDingbats,
   627       * <CODE>false</CODE> to always use <CODE>Cp1252</CODE>
   628       * @return the <CODE>BaseFont</CODE> this class represents
   629       */    
-           public BaseFont getCalculatedBaseFont(boolean specialEncoding) {
+  630      public BaseFont getCalculatedBaseFont(boolean specialEncoding, boolean embed) {
   631          if (baseFont != null)
   632              return baseFont;
   633          int style = this.style;

   702                  break;
   703          }
   704          try {
-                   cfont = BaseFont.createFont(fontName, encoding, false);
+  705              cfont = BaseFont.createFont(fontName, encoding, embed);
   706          }
   707          catch (Exception ee) {
   708              throw new ExceptionConverter(ee);
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/pdf/BaseFont.java#3


   360          boolean isCJKFont = isBuiltinFonts14 ? false : CJKFont.isCJKFont(nameBase, encoding);
   361          if (isBuiltinFonts14 || isCJKFont)
   362              embedded = false;
-               else if (encoding.equals(IDENTITY_H) || encoding.equals(IDENTITY_V))
-                   embedded = true;
+  363  
+  364          // Should not force to embed, update in the TrueTypeFontUnicode to handle the
+  365          // not embeded situations
+  366          //else if (encoding.equals(IDENTITY_H) || encoding.equals(IDENTITY_V))
+  367          //    embedded = true;
+  368  
   369          BaseFont fontFound = null;
   370          BaseFont fontBuilt = null;
   371          String key = name + "\n" + encoding + "\n" + embedded;
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/pdf/TrueTypeFontUnicode.java#3


    81      TrueTypeFontUnicode(String ttFile, String enc, boolean emb, byte ttfAfm[]) throws DocumentException, IOException {
    82          String nameBase = getBaseName(ttFile);
    83          String ttcName = getTTCName(nameBase);
+   84  
    85          if (nameBase.length() < ttFile.length()) {
    86              style = ttFile.substring(nameBase.length());
    87          }

    92          if (ttcName.length() < nameBase.length())
    93              ttcIndex = nameBase.substring(ttcName.length() + 1);
    94          fontType = FONT_TYPE_TTUNI;
-               if ((fileName.toLowerCase().endsWith(".ttf") || fileName.toLowerCase().endsWith(".otf") || fileName.toLowerCase().endsWith(".ttc")) && ((enc.equals(IDENTITY_H) || enc.equals(IDENTITY_V)) && emb)) {
+   95          if ((fileName.toLowerCase().endsWith(".ttf") || fileName.toLowerCase().endsWith(".otf") || fileName.toLowerCase().endsWith(".ttc")) && ((enc.equals(IDENTITY_H) || enc.equals(IDENTITY_V)))) {
    96              process(ttfAfm);
-                   if (os_2.fsType == 2)
+   97              if (os_2.fsType == 2  && emb)
    98                  throw new DocumentException(fileName + style + " cannot be embedded due to licensing restrictions.");
    99              // Sivan
   100              if ((cmap31 == null && !fontSpecific) || (cmap10 == null && fontSpecific))

   308          PdfObject pobj = null;
   309          PdfIndirectObject obj = null;
   310          // sivan: cff
-               if (cff) {
-                  RandomAccessFileOrArray rf2 = new RandomAccessFileOrArray(rf);
-                  byte b[] = new byte[cffLength];
-                  try {
-                      rf2.reOpen();
-                      rf2.seek(cffOffset);
-                      rf2.readFully(b);
-                  } finally {
-                      try {
-                          rf2.close();
-                      } catch (Exception e) {
-                          // empty on purpose
-                      }
-                  }
-                  
-                  CFFFont cffFont = new CFFFont(new RandomAccessFileOrArray(b));
-                  // test if we can find the font by name and if it's a type1 CFF
-                  if (cffFont.exists(fontName) && !cffFont.isCID(fontName)) {
-                      byte[] cid = cffFont.getCID( (cffFont.getNames())[0] );
-                      if (cid != null) b=cid;
-                  }
-                  // if the font is already CID, or not found by name, or 
-                  // getCID returned null, we just use the data in the CFF
-                  // table and hope for the best.
-                
-                      
-                  // for debugging, force a reparsing
-                  /*
-                  java.lang.System.err.println("");
-                  java.lang.System.err.println("");
-                  java.lang.System.err.println("");
-                  CFFFont dummy = new CFFFont(java.nio.ByteBuffer.wrap(b));   
-                  java.lang.System.err.println("");
-                  java.lang.System.err.println("");
-                  java.lang.System.err.println("");
-                  */  
-                  pobj = new StreamFont(b, "CIDFontType0C");
-                  obj = writer.addToBody(pobj);
-                  ind_font = obj.getIndirectReference();
-               } else {
-                 TrueTypeFontSubSet sb = new TrueTypeFontSubSet(fileName, rf, longTag, directoryOffset, false);
-                 byte b[] = sb.process();
-                 int lengths[] = new int[]{b.length};
-                 pobj = new StreamFont(b, lengths);
-                 obj = writer.addToBody(pobj);
-                 ind_font = obj.getIndirectReference();
+  311          if ( embedded )
+  312          {
+  313              if (cff) {
+  314                  RandomAccessFileOrArray rf2 = new RandomAccessFileOrArray(rf);
+  315                  byte b[] = new byte[cffLength];
+  316                  try {
+  317                      rf2.reOpen();
+  318                      rf2.seek(cffOffset);
+  319                      rf2.readFully(b);
+  320                  } finally {
+  321                      try {
+  322                          rf2.close();
+  323                      } catch (Exception e) {
+  324                          // empty on purpose
+  325                      }
+  326                  }
+  327  
+  328                  CFFFont cffFont = new CFFFont(new RandomAccessFileOrArray(b));
+  329                  // test if we can find the font by name and if it's a type1 CFF
+  330                  if (cffFont.exists(fontName) && !cffFont.isCID(fontName)) {
+  331                      byte[] cid = cffFont.getCID( (cffFont.getNames())[0] );
+  332                      if (cid != null) b=cid;
+  333                  }
+  334                  // if the font is already CID, or not found by name, or
+  335                  // getCID returned null, we just use the data in the CFF
+  336                  // table and hope for the best.
+  337  
+  338  
+  339                  // for debugging, force a reparsing
+  340                  /*
+  341                  java.lang.System.err.println("");
+  342                  java.lang.System.err.println("");
+  343                  java.lang.System.err.println("");
+  344                  CFFFont dummy = new CFFFont(java.nio.ByteBuffer.wrap(b));
+  345                  java.lang.System.err.println("");
+  346                  java.lang.System.err.println("");
+  347                  java.lang.System.err.println("");
+  348                  */
+  349                  pobj = new StreamFont(b, "CIDFontType0C");
+  350                  obj = writer.addToBody(pobj);
+  351                  ind_font = obj.getIndirectReference();
+  352              } else {
+  353                TrueTypeFontSubSet sb = new TrueTypeFontSubSet(fileName, rf, longTag, directoryOffset, false);
+  354                byte b[] = sb.process();
+  355                int lengths[] = new int[]{b.length};
+  356                pobj = new StreamFont(b, lengths);
+  357                obj = writer.addToBody(pobj);
+  358                ind_font = obj.getIndirectReference();
+  359              }
   360          }
-               String subsetPrefix = createSubsetPrefix();
+  361  
+  362          String subsetPrefix = "";
+  363          if(embedded) subsetPrefix = createSubsetPrefix();
+  364          
   365          //if (cff) subsetPrefix = "";
   366          PdfDictionary dic = getFontDescriptor(ind_font, subsetPrefix);
   367          obj = writer.addToBody(dic);



Change 77009 
	 itext/src/com/lowagie/text/FontFactory.java.Adding TTF directory typical to unix machines (ttf folder in uppercase).

Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/FontFactory.java#5


   599          count += registerDirectory("/usr/share/fonts/default/TrueType");
   600          count += registerDirectory("/usr/X11R6/lib/X11/fonts/ttf");
   601          count += registerDirectory("/usr/X11R6/lib/X11/fonts/truetype");
+  602          count += registerDirectory("/usr/X11R6/lib/X11/fonts/TTF");
   603          return count;
   604      }
   605  



Change 76036 

add "/usr/X11R6/lib/X11/fonts/truetype" to one of these directories FontService will automatically scan for fonts on server start.
	
Edit //depot/ColdFusion/cf_main/tools/itext/src/com/lowagie/text/FontFactory.java#4


   598          count += registerDirectory("/usr/openwin/lib/X11/fonts/TrueType");
   599          count += registerDirectory("/usr/share/fonts/default/TrueType");
   600          count += registerDirectory("/usr/X11R6/lib/X11/fonts/ttf");
+  601          count += registerDirectory("/usr/X11R6/lib/X11/fonts/truetype");
   602          return count;
   603      }
   604  


Change 87750

if the font face name contains "it", then we consider the font face italic. 

     public static Font getFont(String fontname, String encoding, boolean embedded, float size, int style, Color color) {
           if (fontname == null) return new Font(Font.UNDEFINED, size, style, color);
           HashSet tmp = (HashSet) fontFamilies.get(fontname);
           if (tmp != null) {
               // some bugs were fixed here by Daniel Marczisovszky
               String lowercasefontname = fontname.toLowerCase();
               int s = style == Font.UNDEFINED ? Font.NORMAL : style;
               int fs = Font.NORMAL;
               boolean found = false;
               for (Iterator i = tmp.iterator(); i.hasNext(); ) {
                   String f = (String) i.next();
                   String lcf = f.toLowerCase();
                   fs = Font.NORMAL;
                   if (lcf.toLowerCase().indexOf("bold") != -1) fs |= Font.BOLD;
<                  if (lcf.toLowerCase().indexOf("italic") != -1 || lcf.toLowerCase().indexOf("oblique") != -1) fs |= Font.ITALIC;
->                 if (lcf.toLowerCase().indexOf("italic") != -1 || lcf.toLowerCase().indexOf("oblique") != -1 || lcf.toLowerCase().indexOf("it") != -1) fs |= Font.ITALIC;
                   if ((s & Font.BOLDITALIC) == fs) {
                       fontname = f;
                       found = true;
                       break;
                   }
               }
               if (style != Font.UNDEFINED && found) {
                   style &= ~fs;
               }
           }


changelist 88282 
update com.lowagie.text.pdf.PdfGraphics2D.java

change the drawString function's contentByte to use default contentByte object, this has no effect on the background image.

 /**
        * @see Graphics2D#drawString(String, float, float)
        */
       public void drawString(String s, float x, float y) {
   
<          PdfContentByte forgroundcb = cb.getPdfWriter().getDirectContent();
->         PdfContentByte forgroundcb = cb;//cb.getPdfWriter().getDirectContent();
   
           setFillPaint(forgroundcb);
   
           if (onlyShapes) {
               TextLayout tl = new TextLayout(s, this.font, new FontRenderContext(new AffineTransform(), false, true));
               tl.draw(this, x, y);
           }
