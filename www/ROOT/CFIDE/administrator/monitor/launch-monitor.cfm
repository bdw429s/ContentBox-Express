����  -� 
SourceFile PE:\cf9_updates_rc\cfusion\wwwroot\CFIDE\administrator\monitor\launch-monitor.cfm cflaunch2dmonitor2ecfm551796945  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   BERRORSEXIST Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   ISSERVERMONITORINGAVAILABLE   	   LOCALE   	    ALTERNATECONTENT_CF " " 	  $ PROTOCOL & & 	  ( REQUEST * * 	  , FEATURE_NOT_AVAILABLE_MSG . . 	  0 AERRORMESSAGES 2 2 	  4 com.macromedia.SourceModTime  %���� pageContext #Lcoldfusion/runtime/NeoPageContext; 9 :	  ; getOut ()Ljavax/servlet/jsp/JspWriter; = > javax/servlet/jsp/PageContext @
 A ? parent Ljavax/servlet/jsp/tagext/Tag; C D	  E com.adobe.coldfusion.* G bindImportPath (Ljava/lang/String;)V I J
  K 
 M _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V O P
  Q $class$coldfusion$tagext$io$SilentTag Ljava/lang/Class; coldfusion.tagext.io.SilentTag U forName %(Ljava/lang/String;)Ljava/lang/Class; W X java/lang/Class Z
 [ Y S T	  ] _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; _ `
  a coldfusion/tagext/io/SilentTag c _setCurrentLineNo (I)V e f
  g 	hasEndTag (Z)V i j coldfusion/tagext/GenericTag l
 m k 
doStartTag ()I o p
 d q 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; s t
  u CGI w java/lang/String y SERVER_PORT_SECURE { _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; } ~
   	IsBoolean (Ljava/lang/Object;)Z � �
  � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean � �
 � � https:// � set (Ljava/lang/Object;)V � � coldfusion/runtime/Variable �
 � � http:// � doAfterBody � p
 m � _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � doEndTag � p #javax/servlet/jsp/tagext/TagSupport �
 � � doCatch (Ljava/lang/Throwable;)V � �
 m � 	doFinally � 
 m � 


 � REQUEST.LOCALE � en � checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V � �
  � isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z � �
  � _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � Trim &(Ljava/lang/String;)Ljava/lang/String; � �
  � LCase � �
  � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
  � 
LOCALEFILE � java/lang/StringBuffer � resources/monitor_ �  J
 � � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 � � .xml � toString ()Ljava/lang/String; � � java/lang/Object �
 � � false � 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V � �
  � ArrayNew (I)Ljava/util/List; � �
  � _Array .(Ljava/lang/Object;)Lcoldfusion/runtime/Array; � �
 � � setArray (Lcoldfusion/runtime/Array;)V � �
 � � 

 � _get � �
  � IsServerMonitoringAvailable � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
  � 
	 � 'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTag � � T	  !coldfusion/tagext/lang/IncludeTag 	cfinclude template ../header.cfm	 _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  setTemplate J
 _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z
  ../include/margintop.cfm ../include/errors.cfm 
	
	 $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag T	  coldfusion/tagext/io/OutputTag!
" q 
	<h2 class="pageHeader">$ write& J java/io/Writer(
)' (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag,+ T	 . "coldfusion/tagext/lang/ImportedTag0 l10n2 
../cftags/4 admin6 setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V89
1: &coldfusion/runtime/AttributeCollection< id> pageHeader_clientvars1@ ([Ljava/lang/Object;)V B
=C setAttributecollection (Ljava/util/Map;)VEF  coldfusion/tagext/lang/ModuleTagH
IG
I q %Server Monitoring &gt; Server MonitorL
I �
I �
I � </h2>
	<br>
	Q
" � coldfusion/tagext/QueryLoopT
U �
U �
" � ../include/marginbottom.cfmY ../footer.cfm[ %class$coldfusion$tagext$lang$AbortTag coldfusion.tagext.lang.AbortTag^] T	 ` coldfusion/tagext/lang/AbortTagb o

<html lang="en">
	<!--
		Â© 2006 Adobe Macromedia Software LLC. All rights reserved.
	-->
	<head>
		d  <LINK REL="SHORTCUT ICON" href="f SERVER_NAMEh :j SERVER_PORTl GetContextRootn �
 o "/CFIDE/administrator/favicon.ico">q
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Server Monitor</title>
		<script src="AC_OETags.js" language="javascript"></script>
		<style>
			body { margin: 0px; overflow:hidden }
		</style>
		<script language="JavaScript" type="text/javascript">
			<!--
			// -----------------------------------------------------------------------------
			// Globals
			// Major version of Flash required
			var requiredMajorVersion = 9;
			// Minor version of Flash required
			var requiredMinorVersion = 0;
			// Minor version of Flash required
			var requiredRevision = 16;
			// -----------------------------------------------------------------------------
			// -->
                    
		</script>
	</head>
	<body scroll="no">
                s alternatecontent_cfu varw �
                  This content requires the Adobe Flash Player. <a href=http://www.adobe.com/go/getflash/>Get Flash
                y 1

                <script>
 
                { $class$coldfusion$tagext$lang$WddxTag coldfusion.tagext.lang.WddxTag~} T	 � coldfusion/tagext/lang/WddxTag� cfwddx� action� cfml2js� 	setAction� J
�� input� \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;�
 � setInput� �
�� toplevelvariable� alternatecontent_js� setToplevelvariable� J
���
                </script>        

		<script language="JavaScript" type="text/javascript">
			<!--
			// Version check for the Flash Player that has the ability to start Player Product Install (6.0r65)
			var hasProductInstall = DetectFlashVer(6, 0, 65);

			// Version check based upon the values defined in globals
			var hasRequestedVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);


			// Check to see if a player with Flash Product Install is available and the version does not meet the requirements for playback
			if ( hasProductInstall && !hasRequestedVersion ) {
				// MMdoctitle is the stored document.title value used by the installation process to close the window that started the process
				// This is necessary in order to close browser windows that are still utilizing the older version of the player after installation has completed
				// DO NOT MODIFY THE FOLLOWING FOUR LINES
				// Location visited after installation is complete if installation is required
				var MMPlayerType = (isIE == true) ? "ActiveX" : "PlugIn";
				var MMredirectURL = window.location;
			    document.title = document.title.slice(0, 47) + " - Flash Player Installation";
			    var MMdoctitle = document.title;

				AC_FL_RunContent(
					"src", "playerProductInstall",
					"FlashVars", "MMredirectURL="+MMredirectURL+'&MMplayerType='+MMPlayerType+'&MMdoctitle='+MMdoctitle+"",
					"width", "100%",
					"height", "100%",
					"align", "middle",
					"id", "ServerMonitorUI",
					"quality", "high",
					"bgcolor", "#869ca7",
					"name", "ServerMonitorUI",
					"allowScriptAccess","sameDomain",
					"type", "application/x-shockwave-flash",
					"pluginspage", "http://www.adobe.com/go/getflashplayer"
				);
			} else if (hasRequestedVersion) {
				// if we've detected an acceptable version
				// embed the Flash Content SWF when all tests are passed
				AC_FL_RunContent(
						"src", "ServerMonitorUI",
						"width", "100%",
						"height", "100%",
						"align", "middle",
						"id", "ServerMonitorUI",
						"quality", "high",
						"bgcolor", "#869ca7",
						"name", "ServerMonitorUI",
						"allowScriptAccess","sameDomain",
						"type", "application/x-shockwave-flash",
						"pluginspage", "http://www.adobe.com/go/getflashplayer"
				);
			  } else {  // flash is too old or we can't detect the plugin
			    //var alternateContent = 'This content requires the Adobe Flash Player. <a href=http://www.adobe.com/go/getflash/>Get Flash</a>';
			    document.write(alternatecontent_js);  // insert non-flash content
			  }
			// -->
		</script>
		<noscript>
		  	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
					id="ServerMonitorUI" width="100%" height="100%"
					codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
					<param name="movie" value="ServerMonitorUI.swf" />
					<param name="quality" value="high" />
					<param name="bgcolor" value="#869ca7" />
					<param name="allowScriptAccess" value="sameDomain" />
					<embed src="ServerMonitorUI.swf" quality="high" bgcolor="#869ca7"
						width="100%" height="100%" name="ServerMonitorUI" align="middle"
						play="true" loop="false"
						allowScriptAccess="sameDomain"
						type="application/x-shockwave-flash"
						pluginspage="http://www.adobe.com/go/getflashplayer">
					</embed>
			</object>
		</noscript>
	</body>
</html>
� metaData Ljava/lang/Object;��	 � this !Lcflaunch2dmonitor2ecfm551796945; varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; LocalVariableTable Code runPage ()Ljava/lang/Object; out Ljavax/servlet/jsp/JspWriter; value silent0  Lcoldfusion/tagext/io/SilentTag; mode0 I t6 Ljava/lang/Throwable; t7 t8 t9 t10 t11 include3 #Lcoldfusion/tagext/lang/IncludeTag; include4 include5 output7  Lcoldfusion/tagext/io/OutputTag; mode7 module6 $Lcoldfusion/tagext/lang/ImportedTag; mode6 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 include8 include9 abort10 !Lcoldfusion/tagext/lang/AbortTag; output11 mode11 t34 t35 t36 t37 module12 mode12 t40 t41 t42 t43 t44 t45 wddx13  Lcoldfusion/tagext/lang/WddxTag; LineNumberTable java/lang/Throwable� <clinit> getMetadata 1                      "     &     *     .     2     S T    � T    T   + T   ] T   } T   ��       �   �     g*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5�   �        g��     g��    g��  �� �  : 
 /  �*� <� BL*� FN*H� L*+N� R*� ^-� b� d:*� h� n� rY6� |*+� vL*	� h*x� zY|S� �� �� �Y� �� W*x� zY|S� �� �� *� )�� �� *� )�� �� ����� � :� �:*+� �L�� �� :� #�� � #:		� �� � :
� 
�:� ��*+�� R**� -��� �*+N� R**� !� �� /*+� zYS*� h*� h**� !� �� �� ĸ Ƕ �*+� zY�S� �Yѷ �*+� zYS� �� �� �ٶ ׶ ߶ �*+�� R**� � �*+N� R*� 5*� h*� � � �*+� R*� h**� � ��*� ޸ �� ����*+�� R*�-� b�:*� h
��� n�� �*+�� R*�-� b�:*� h��� n�� �*+�� R*�-� b�:*� h��� n�� �*+� R*� -� b�":*!� h� n�#Y6� �+%�**�/� b�1:*"� h357�;�=Y� �Y?SYAS�D�J� n�KY6� 6*+� vL+M�*�N���� � :� �:*+� �L�� �� :� &� y�� � #:�O� � :� �:�P�+R�*+**� 1� �� ��*�S���V� :� #�� � #:�W� � :� �:�X�*+�� R*�-� b�:*%� hZ��� n�� �*+�� R*�	-� b�:*&� h\��� n�� �*+�� R*�a
-� b�c:*'� h� n�� �*+N� R+e�**� -� b�": */� h � n �#Y6!� k+g�*+**� )� �� ��*+*x� zYiS� �� ��*+k�*+*x� zYmS� �� ��*+*/� h*�p�*+r�* �S��� �V� :"� #"�� � #:# #�W� � :$� $�:% �X�%+t�**�/-� b�1:&*F� h&357�;&�=Y� �Y?SYvSYxSYvS�D�J&� n&�KY6'� 6*&'+� vL+z�*&�N���� � :(� (�:)*'+� �L�)&� �� :*� #*�� � #:+&+�O� � :,� ,�:-&�P�-+|�**��-� b��:.*L� h.������.��**� %� �����.������.� n.�� �+��*� & > � �� � � �� 3 � �� � � �� 3 � �� � � �� � � �� � � ��	%(�(-(��KW�QTW��Kf�QTf�Wcf�fkf��K��Q��������K��Q����������������)�#&)��8�#&8�)58�8=8�������������������������� �  � /  ���    ���   ���   � C D   ���   ���   ���   ���   ���   ��� 	  ��� 
  ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���    ��� !  ��� "  ��� #  ��� $  ��� %  ��� &  ��� '  ��� (  ��� )  ��� *  ��� +  ��� ,  ��� -  ��� .�  � d   N 	 N 	 N 	 N 	 k 	 k 	 N 	 � 
 � 
 � 
 � 
 �  �  �  �  �  N 	   �  �  �  �  �  �  �    . . . . . .    R W W l N N B    � � ~ � � � � � � � � � � � +  h L � "� " $ $~ $� !� %� %/ & &P '� � /� /� /� /� /� /� /� /� /� /� /� /� /� F� FP F< LN MN Me N L    �  �   b     DV� \� ^ � \�� \� -� \�/_� \�a� \���=Y� ޷D���   �       D��   �� �   "     ���   �       ��      �   #     *� 
�   �       ��         6    7