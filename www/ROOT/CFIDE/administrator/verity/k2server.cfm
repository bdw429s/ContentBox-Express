����  -& 
SourceFile DE:\cf9_final\cfusion\wwwroot\CFIDE\administrator\verity\k2server.cfm cfk2server2ecfm1606403220  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   K2INDEXPORT Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   K2ADMINUSER   	   
ERROR_HOST   	    CFCATCH " " 	  $ K2ADMINPASSWORD & & 	  ( HIDEADVANCEDSETTINGS * * 	  , BERRORSEXIST . . 	  0 LOCALE 2 2 	  4 SUCCESSMESSAGE 6 6 	  8 AERRORMESSAGES : : 	  < SHOWADVANCEDSETTINGS > > 	  @ K2ADMINALIAS B B 	  D ERROR_ADMINPORT F F 	  H REQUEST J J 	  L ERROR_INDEXALIAS N N 	  P K2SERVERALIAS R R 	  T ERROR_K2UPDATE V V 	  X FORM Z Z 	  \ K2ADMINPORT ^ ^ 	  ` K2INDEXALIAS b b 	  d ERROR_SERVERPORT f f 	  h 
VERITYHOST j j 	  l ERROR_INDEXPORT n n 	  p ERROR_ADMINALIAS r r 	  t K2SERVERPORT v v 	  x ERROR_SERVERALIAS z z 	  | com.macromedia.SourceModTime  �W�� pageContext #Lcoldfusion/runtime/NeoPageContext; � �	  � getOut ()Ljavax/servlet/jsp/JspWriter; � � javax/servlet/jsp/PageContext �
 � � parent Ljavax/servlet/jsp/tagext/Tag; � �	  � com.adobe.coldfusion.* � bindImportPath (Ljava/lang/String;)V � �
  � _setCurrentLineNo (I)V � �
  � java/lang/String � LICENSE � _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
  � getAppServerPlatform � java/lang/Object � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
  � sunone � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
  � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � SERVER � OS � ADDITIONALINFORMATION � _resolveAndAutoscalarize � �
  � sunos � 
	 � _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V � �
  � 'class$coldfusion$tagext$net$LocationTag Ljava/lang/Class; !coldfusion.tagext.net.LocationTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � !coldfusion/tagext/net/LocationTag � 
cflocation � url � ../homepage.cfm � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
  � setUrl � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
  � %class$coldfusion$tagext$net$CookieTag coldfusion.tagext.net.CookieTag � � �	  � coldfusion/tagext/net/CookieTag � cfcookie � expires � NEVER � \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object; � 
  
setExpires (Ljava/lang/Object;)V
 � name cfadmin_lastpage_	 GetAuthUser ()Ljava/lang/String;
  concat &(Ljava/lang/String;)Ljava/lang/String;
 � setName �
 � 
 


 30 value CGI SCRIPT_NAME  _String &(Ljava/lang/Object;)Ljava/lang/String;"#
 �$ setValue& �
 �' 

) $class$coldfusion$tagext$io$SilentTag coldfusion.tagext.io.SilentTag,+ �	 . coldfusion/tagext/io/SilentTag0 
doStartTag ()I23
14 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;67
 8 REQUEST.LOCALE: en< checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V>?
 @ isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)ZBC
 D _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;FG
 H TrimJ
 K LCaseM
 N _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)VPQ
 R 
LOCALEFILET java/lang/StringBufferV resources/verity_X  �
WZ append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;\]
W^ .xml` toStringb
 �c falsee setg coldfusion/runtime/Variablei
jh ArrayNew (I)Ljava/util/List;lm
 n _Array .(Ljava/lang/Object;)Lcoldfusion/runtime/Array;pq
 �r setArray (Lcoldfusion/runtime/Array;)Vtu
jv ADMINSUBMITx FORM.ADMINSUBMITz  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z|}
 ~ *coldfusion/runtime/TransientVariableHolder� &(Lcoldfusion/runtime/NeoPageContext;)V �
�� VERITY� ADVANCEDMODE� FORM.ADVANCEDMODE� int� JavaCast 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;��
 � EK2ADMINPASSWORD� '(Ljava/lang/Object;Ljava/lang/Object;)D ��
 � $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag�� �	 � coldfusion/tagext/io/OutputTag�
�4 (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag�� �	 � "coldfusion/tagext/lang/ImportedTag� l10n� 
../cftags/� admin� :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V�
�� &coldfusion/runtime/AttributeCollection� id� 	k2updated� var� SuccessMessage� ([Ljava/lang/Object;)V �
�� setAttributecollection (Ljava/util/Map;)V��  coldfusion/tagext/lang/ModuleTag�
��
�4 >
				Verity K2 Server Configuration information updated.
			� write� � java/io/Writer�
�� doAfterBody�3
�� _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � doEndTag�3 #javax/servlet/jsp/tagext/TagSupport�
�� doCatch (Ljava/lang/Throwable;)V��
�� 	doFinally� 
��
�� coldfusion/tagext/QueryLoop�
��
��
�� _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;��
 � unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;�� coldfusion/runtime/NeoException�
�� t26 [Ljava/lang/String; ANY���	 � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I��
�� bind '(Ljava/lang/String;Ljava/lang/Object;)V��
�� error_k2update� K
				An error occurred while attempting to save your changes. <br />
				� MESSAGE� D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � 
  <br />
				 DETAIL <br />
			 true	 ArrayLen (Ljava/lang/Object;)I
  (D)Ljava/lang/Object; �
 � _arraySetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V
  unbind 
� _factor1�
 
 ��
 ��
 �� k2_pagename pagename! Verity K2 Server# 


	% %class$coldfusion$tagext$lang$ParamTag coldfusion.tagext.lang.ParamTag(' �	 * coldfusion/tagext/lang/ParamTag, cfparam. 
VerityHost0
- default3 	localhost5 
setDefault7
-8 type: string< setType> �
-? K2adminuserA  C K2adminpasswordE 'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTagHG �	 J !coldfusion/tagext/lang/IncludeTagL 	cfincludeN templateP ../header.cfmR setTemplateT �
MU )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTagXW �	 Z #coldfusion/tagext/html/form/FormTag\ cfform^ method` postb 	setMethodd �
]e actiong 	setActioni �
]j
]4 ../include/buttonbar.cfmm ../include/margintop.cfmo ../include/errors.cfmq 
	<span style="color:green">s </span>
	<br><br>
u 

<h2 class="pageHeader">w pageHeader_k2verityy )Data &amp; Services &gt; Verity K2 Server{ </h2>
<br>

} K2config_welcome7
	You can install and configure the Verity K2 search service on a host other than the one
	on which ColdFusion is running.	In this case, you can configure the host
	that ColdFusion uses when performing search operations. If you have purchased
	the Verity K2 Enterprise product, you may need to configure the aliases, ports and login information
	of the services that ColdFusion uses.
	Click the Advanced button to configure these values.
	You should not need to change the advanced values if you are running with the ColdFusion-installed
	version of Verity.
� _factor6��
 � h
<br><br>



<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
	<td bgcolor="#� 	GRAYLIGHT� &" class="cellBlueTopAndBottom">
		<b>� 
l10n_addk2� Configure Verity K2 Server� �</b>
	</td>
</tr>
</table>

<table border="0" cellpadding="5" cellspacing="0">
<tr>
	<td width="120">
		<label for="VerityHost">� k2_host� Verity Host Name� </label>
		&nbsp;&nbsp;
		� 
error_host� APlease enter a valid host name or IP address ( xxx.xxx.xxx.xxx ).� 
	</td>
	<td>
		� *class$coldfusion$tagext$html$form$InputTag $coldfusion.tagext.html.form.InputTag�� �	 � $coldfusion/tagext/html/form/InputTag� cfinput�
� text�
�? 	maxlength� 150� _int (Ljava/lang/String;)I��
 �� :(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)I ��
 � setMaxLength� �
��
�' required� (Ljava/lang/String;)Z ��
 �� :(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z ��
 � setRequired� �
�� message� 
setMessage� �
�� size�
�� 
	</td>
</tr>
� SHOWADVANCED� FORM.SHOWADVANCED� .
	<tr>
		<td>
			<label for="K2adminAlias">� k2_adminalias� K2 Admin Alias� </label>
			&nbsp;&nbsp;
			� error_adminalias� DPlease enter an alias. The default K2 Admin alias is 'ColdFusionK2'.� 
		</td>
		<td>
			� K2adminAlias� Yes� >
		</td>
	</tr>
	<tr>
		<td>
			<label for="K2adminPort">� k2_adminport� K2 Admin Port� error_adminport� FPlease enter a valid K2 Admin port. The default K2 Admin port is 9950.� _factor2��
 � K2adminPort� 20� validate� integer� setValidate� �
�� 5� @
		</td>
	</tr>
	<tr>
		<td>
			<label for="K2serverAlias">� k2_serveralias K2 Server Alias error_serveralias MPlease enter an alias. The default K2 server alias is 'ColdFusionK2_server1'. K2serverAlias	 ?
		</td>
	</tr>
	<tr>
		<td>
			<label for="K2serverPort"> k2_serverport K2 Server Port _factor3�
  error_serverport HPlease enter a valid K2 Server port. The default K2 Server port is 9920. K2serverPort ?
		</td>
	</tr>
	<tr>
		<td>
			<label for="K2indexAlias"> k2_indexalias K2 Index Alias error_indexalias  QPlease enter an alias. The default K2 index alias is 'ColdFusionK2_indexserver1'." K2indexAlias$ _factor4&�
 ' >
		</td>
	</tr>
	<tr>
		<td>
			<label for="K2indexPort">) k2_indexport+ K2 Index Port- error_indexport/ FPlease enter a valid K2 Index port. The default K2 Index port is 9960.1 K2indexPort3 3
		</td>
	</tr>
 	<tr>
	  <td colspan="2">
	  5 k2desc7 �
	By default, the K2 Enterprise product requires authentication for the K2 Administration server.
	You will need to enter a user name and password below if you have installed the K2 product
	so that it requires authentication.
	9 8
	</td>
	</tr>
	<tr>
		<td>
			<label for="K2user">; k2_user= K2 Admin User Name? _factor5A�
 B /</label>
			&nbsp;&nbsp;
		</td>
		<td>
			D 100F NoH K2userJ B
		</td>
	</tr>
	<tr>
		<td>
			<label for="K2adminpassword">L k2_adminpasswordN K2 Admin PasswordP c</label>
			&nbsp;&nbsp;
		</td>
		<td>
			<input type="hidden" name="eK2adminpassword" value="R ">
			T passwordV 
		</td>
	</tr>
X _factor7Z�
 [ �
</table>

<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
	<td class="cellBlueTopAndBottom" bgcolor="#] 	BLUELIGHT_ ">
		a 
			c hideAdvancedSettingse Hide Advanced Settingsg 5
			<input type="Submit" name="hideAdvanced" title="i 	" value="k O" class="buttn">
			<input type="hidden" name="advancedmode" value="true">
		m showAdvancedSettingso Show Advanced Settingsq 5
			<input type="Submit" name="showAdvanced" title="s P" class="buttn">
			<input type="hidden" name="advancedmode" value="false">
		u '
	</td>
</tr>
</table>

<br />

w ../include/marginbottom.cfmy _factor8{�
 |
]�
]�
]�
]� _factor9��
 � 	_factor10��
 � ../footer.cfm� metaData Ljava/lang/Object;��	 � this Lcfk2server2ecfm1606403220; __factorParent out Ljavax/servlet/jsp/JspWriter; output5  Lcoldfusion/tagext/io/OutputTag; mode5 I module4 $Lcoldfusion/tagext/lang/ImportedTag; mode4 t8 Ljava/lang/Throwable; t9 t10 t11 t12 t13 t14 t15 t16 t17 LocalVariableTable LineNumberTable java/lang/Throwable� Code module38 mode38 t6 t7 module39 mode39 t18 t19 input40 &Lcoldfusion/tagext/html/form/InputTag; module41 mode41 t23 t24 t25 t27 t28 module42 mode42 t31 t32 t33 t34 t35 t36 module19 mode19 module20 mode20 module21 mode21 t22 input22 input43 module44 mode44 t37 input45 <clinit> form50 %Lcoldfusion/tagext/html/form/FormTag; mode50 module33 mode33 input34 module35 mode35 t20 module36 mode36 input37 module46 mode46 module47 mode47 	include48 #Lcoldfusion/tagext/lang/IncludeTag; 	include49 varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; 	include14 	include15 	include16 module17 mode17 module18 mode18 t21 runPage ()Ljava/lang/Object; 	include52 input28 module29 mode29 module30 mode30 input31 module32 mode32 t29 	location0 #Lcoldfusion/tagext/net/LocationTag; cookie1 !Lcoldfusion/tagext/net/CookieTag; cookie2 silent8  Lcoldfusion/tagext/io/SilentTag; mode8 module9 mode9 param10 !Lcoldfusion/tagext/lang/ParamTag; param11 param12 	include13 output51 mode51 t30 module23 mode23 module24 mode24 input25 module26 mode26 module27 mode27 getMetadata t4 ,Lcoldfusion/runtime/TransientVariableHolder; t5 #Lcoldfusion/runtime/AbortException; Ljava/lang/Exception; __cfcatchThrowable0 output7 mode7 module6 mode6 !coldfusion/runtime/AbortException" java/lang/Exception$ 1     %                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     � �    � �   + �   � �   � �   ��   ' �   G �   W �   � �   ��    �� �  �    *K� �Y�SYkS*.� �**� m�I�%�L�S**� ]���� �Y� �� W*[� �Y�S� �� ���*K� �Y�SYCS*1� �**� E�I�%�L�S*K� �Y�SY_S*2� �*�*2� �**� a�I�%�L���S*K� �Y�SYSS*3� �**� U�I�%�L�S*K� �Y�SYwS*4� �*�*4� �**� y�I�%�L���S*K� �Y�SYcS*5� �**� e�I�%�L�S*K� �Y�SYS*6� �*�*6� �**� �I�%�L���S*K� �Y�SYS*7� �**� �I�%�L�S*[� �Y'S� �*[� �Y�S� ����~�  *K� �Y�SY'S**� )�I�S*��+� ���:*>� �� ���Y6� �*��� ���:*?� ��������Y� �Y�SY�SY�SY�S����� ���Y6� 6*,�9M,ö��˚��� � :� �:	*,��M�	��� :
� &� c
�� � #:�ب � :� �:�۩�ܚ�0��� :� #�� � #:�� � :� �:��*� f�������[�������[������������������������������������� �� �   �   ��    � �   ��   �   ��   ��   ��   ��   ��   �� 	  �� 
  ��   ��   ��   ��   ��   ��   �� �  & I  .  .  .  .   . * / * / . / 1 / ) / ) / B / B / ) / p 1 p 1 p 1 p 1 X 1 � 2 � 2 � 2 � 2 � 2 � 2 � 2 � 2 � 3 � 3 � 3 � 3 � 3 � 4 4 4 4 4 � 4 � 4 � 4. 5. 5. 5. 5 5X 6a 6a 6a 6a 6W 6W 6? 6� 7� 7� 7� 7u 7� 8� 8� 8� :� :� :� 9� 8 X 0 ) /   -? ?K ?	 ?� > A� �  �  %  ,*��*��&+� ���:* ׶ ��������Y� �Y�SY,S����� ���Y6� 6*,�9M,.���˚��� � :� �:*,��M���� :� #�� � #:		�ب � :
� 
�:�۩,ڶ�*��'+� ���:* ٶ ��������Y� �Y�SY0SY�SY0S����� ���Y6� 6*,�9M,2���˚��� � :� �:*,��M���� :� #�� � #:�ب � :� �:�۩,��*��(+� ���:* ܶ ��4� ���;�� ������������**� �I�%� ������������**� q�I�%� ������ ����Y� �Y�SY�SY�SY4S����� �� � �,6��*��)+� ���:* � ��������Y� �Y�SY8S����� ���Y6� 6*,�9M,:���˚��� � :� �:*,��M���� :� #�� � #:�ب � :� �:�۩,<��*��*+� ���:* � ��������Y� �Y�SY>S����� ���Y6� 6*,�9M,@���˚��� � :� �: *,��M� ��� :!� #!�� � #:""�ب � :#� #�:$�۩$*�   Y u x� x } x� N � �� � � �� N � �� � � �� � � �� � � ��)EH�HMH�ht�nqt�h��nq��t����������������!�!��0�0�!-0�050��������������������������������� �  t %  ��    � �   ��   �   ��   ��   ��   ��   ��   �� 	  �� 
  ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��    �� !  �� "  �� #  �� $�   V  > �  � � � � �� �� �� �� �� � �! �! �; �W �c �� �� �� � �H � Z� �  	\  '  �,���,*K� �Y�S� ��%��,���*��+� ���:* �� ��������Y� �Y�SY�S����� ���Y6� 6*,�9M,����˚��� � :� �:*,��M���� :� #�� � #:		�ب � :
� 
�:�۩,���*��+� ���:* �� ��������Y� �Y�SY�S����� ���Y6� 6*,�9M,����˚��� � :� �:*,��M���� :� #�� � #:�ب � :� �:�۩,���*��+� ���:* �� ��������Y� �Y�SY�SY�SY�S����� ���Y6� 6*,�9M,����˚��� � :� �:*,��M���� :� #�� � #:�ب � :� �:�۩,���*��+� ���:* �� ��1� ���;�� ������������**� m�I�%� ����
��������**� !�I�%� ����Y� �Y�SYSY�SY1S����� �� � �,ζ�**� ]�Ҷ��*+,��� �*+,�� �*+,�(� �*+,�C� �,E��*��++� ���:* � ��B� ���;�� ����G�������**� �I�%� ����I��������Y� �Y�SYSY�SYKS����� �� � �,M��*��,+� ���:* �� ��������Y� �Y�SYOS����� ���Y6� 6*,�9M,Q���˚��� � : �  �:!*,��M�!��� :"� #"�� � #:##�ب � :$� $�:%�۩%,S��,**� )�I�%��,U��*��-+� ���:&* �� �&�F� ��&�;W� ��&��G������&�**� )�I�%� ��&��I������&��Y� �Y�SYSY�SYFS����&� �&� � �,Y��*�   w � �� � � �� l � �� � � �� l � �� � � �� � � �� � � ��;WZ�Z_Z�0z������0z��������������'*�*/*� JV�PSV� Je�PSe�Vbe�eje�������������������������
� �  � '  ���    �� �   ���   ��   ���   ���   ���   ���   ���   ��� 	  ��� 
  ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���    ��� !  ��� "  ��� #  ��� $  ��� %  ��� &�   � 2  �  �  � \ � % �  � � �� �� �� �� �� �� �� �� �� � � �' �3 �} �U �U �Y �\ �T �� �� �� �� �� � �, �8 �� �� �Y � � � �Q �c �u �� �� �� �� �� �3 �T � �  �   �     k͸ ӳ ��� ӳ �-� ӳ/�� ӳ��� ӳ�� �Y�S��)� ӳ+I� ӳKY� ӳ[�� ӳ���Y� ������   �       k��   �� �  ` 	   *,� �*�[2+� ��]:*n� �_ac� �f_h*� �Y!S� ��%� �k� ��lY6� |*,�9M*,��� :� U� ��*,�\� :� >� v�*,�}� :� '� _�*,*� ��~���� � :	� 	�:
*,��M�
�� :� #�� � #:��� � :� �:���*�  c ~ �� � � �� � � �� � � �� � � �� X ~ �� � � �� � � �� � � �� � � �� X ~� � �� � �� � �� � �� � �� �   �   ��    � �   ��   �   ��   ��   ��   ��   ��   �� 	  �� 
  ��   ��   ��   �� �     % n 7 n 7 n  n &� �  �    &,ڶ�*��!+� ���:* Ķ ��������Y� �Y�SYSY�SYS����� ���Y6� 6*,�9M,���˚��� � :� �:*,��M���� :� #�� � #:		�ب � :
� 
�:�۩,��*��"+� ���:* Ƕ ��� ���;�� ������������**� y�I�%� ������������**� i�I�%� ������ ����Y� �Y�SY�SY�SYS����� �� � �,��*��#+� ���:* ̶ ��������Y� �Y�SYS����� ���Y6� 6*,�9M,���˚��� � :� �:*,��M���� :� #�� � #:�ب � :� �:�۩,ڶ�*��$+� ���:* ζ ��������Y� �Y�SY!SY�SY!S����� ���Y6� 6*,�9M,#���˚��� � :� �:*,��M���� :� #�� � #:�ب � :� �:�۩,��*��%+� ���:* Ѷ ��%� ���;�� ������������**� e�I�%� ������������**� Q�I�%� ����Y� �Y�SYSY�SY%S����� �� � �*�  e � �� � � �� Z � �� � � �� Z � �� � � �� � � �� � � ��.1�161�Q]�WZ]�Ql�WZl�]il�lql������!-�'*-��!<�'*<�-9<�<A<� �  .   &��    &� �   &��   &�   &��   &��   &��   &��   &��   &�� 	  &�� 
  &��   &��   &��   &��   &��   &��   &��   &��   &��   &��   &��   &��   &��   &��   &��   &��   &��   &��   &�� �   ~  > � J �  � � � � �. �. �H �] �] �w �� �� � � �� �� �� �� �� �r �� �� �� �� �� �� �� �� �
 �T � {� �  �    �,^��,*K� �Y`S� ��%��,b��**� ]�Ҷ�
*,d� �*��.+� ���:*� ��������Y� �Y�SYfSY�SYfS����� ���Y6� 6*,�9M,h���˚��� � :� �:*,��M���� :� #�� � #:		�ب � :
� 
�:�۩,j��,**� -�I�%��,l��,**� -�I�%��,n�ȧ*,d� �*��/+� ���:*	� ��������Y� �Y�SYpSY�SYpS����� ���Y6� 6*,�9M,r���˚��� � :� �:*,��M���� :� #�� � #:�ب � :� �:�۩,t��,**� A�I�%��,l��,**� A�I�%��,v��,x��*�K0+� ��M:*� �OQz� �V� �� � �*,� �*�K1+� ��M:*� �OQn� �V� �� � �*�  � � �� � � �� � � �� � � �� � � �� � � �� � � �� � � ��������������������������������� �   �   ���    �� �   ���   ��   ���   ���   ���   ���   ���   ��� 	  ��� 
  ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ��� �   �      & & * - % u � >%%$|	�	E	


,
,
+
= %fH��    �   #     *� 
�   �       ��      �  q    ?*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }�   �       ?��    ?��   ?��  �� �  ;    u*,� �*�K+� ��M:*o� �OQn� �V� �� � �*,� �*�K+� ��M:*p� �OQp� �V� �� � �*,� �*�K+� ��M:*q� �OQr� �V� �� � �*,� �**� 9�E�  ,t��,**� 9�I�%��,v��,x��*��+� ���:*y� ��������Y� �Y�SYzS����� ���Y6� 6*,�9M,|���˚��� � :	� 	�:
*,��M�
��� :� #�� � #:�ب � :� �:�۩,~��*��+� ���:*|� ��������Y� �Y�SY�S����� ���Y6� 6*,�9M,����˚��� � :� �:*,��M���� :� #�� � #:�ب � :� �:�۩*� Ead�did�:�������:���������������$'�','��GS�MPS��Gb�MPb�S_b�bgb� �   �   u��    u� �   u��   u�   u��   u��   u��   u��   u��   u�� 	  u�� 
  u��   u��   u��   u��   u��   u��   u��   u��   u��   u��   u��   u�� �   F  % o  o d p G p � q � q � t � t � t � u � u � u � t* y � y� |� | �� �   �     i*� �� �L*� �N*�� �*-+��� �*+*� �*�K4-� ��M:*� �OQ�� �V� �� � �*+� ��   �   4    i��     i��    i�    i � �    i�� �     E '    � �  �    ,��*��+� ���:* �� ���� ���;�� ������������**� a�I�%� ������������**� I�I�%� ������ ����Y� �Y�SY�SY�SY�S����� �� � �, ��*��+� ���:* �� ��������Y� �Y�SYS����� ���Y6� 6*,�9M,���˚��� � :� �:*,��M���� :	� #	�� � #:

�ب � :� �:�۩,ڶ�*��+� ���:* �� ��������Y� �Y�SYSY�SYS����� ���Y6� 6*,�9M,���˚��� � :� �:*,��M���� :� #�� � #:�ب � :� �:�۩,��*��+� ���:* �� ��
� ���;�� ������������**� U�I�%� ������������**� }�I�%� ����Y� �Y�SYSY�SY
S����� �� � �,��*�� +� ���:* ¶ ��������Y� �Y�SYS����� ���Y6� 6*,�9M,���˚��� � :� �:*,��M���� :� #�� � #:�ب � :� �:�۩*� B^a�afa�7�������7���������������.1�161�Q]�WZ]�Ql�WZl�]il�lql�������������������������� �  .   ��    � �   ��   �   ��   ��   ��   ��   ��   �� 	  �� 
  ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   �� �   z  % � 7 � I � ^ � ^ � x � � � � � � � � � � �  �' � � �� �� �� �� �� �� �� �� �� �
 �
 �. �: �� �� �[ � �� �  	b 	 #  �*� �**K� �Y�S� ��� �� ��� ��~�� �Y� �� &W*�� �Y�SY�S� �ø ��~�� �� �� �*,Ŷ �*� �+� �� �:*� ����� � �� �� � �*,Ŷ �*� �+� �� �:*� �������
*� �*��� �� �� � �*,� �*,� �*� �+� �� �:*� ������*� �Y!S� ��%� �(�
*� �*��� �� �� � �*,� �*,*� �*�/+� ��1:*� �� ��5Y6� F*,�9M*,�� :	� � W	����� � :
� 
�:*,��M���� :� #�� � #:�� � :� �:��*,*� �*��	+� ���:*V� ��������Y� �Y�SY SY�SY"S����� ���Y6� 6*,�9M,$���˚��� � :� �:*,��M���� :� #�� � #:�ب � :� �:�۩*,&� �*� m*K� �Y�SYkS� ��k*� E*K� �Y�SYCS� ��k*� a*K� �Y�SY_S� ��k*� U*K� �Y�SYSS� ��k*� y*K� �Y�SYwS� ��k*� e*K� �Y�SYcS� ��k*� *K� �Y�SYS� ��k*� *K� �Y�SYS� ��k*� )*K� �Y�SY'S� ��k*,� �*�+
+� ��-:*f� �/1� �2/46��9/;=� �@� �� � �*,� �*�++� ��-:*g� �/B� �2/4D��9/;=� �@� �� � �*,� �*�++� ��-:*h� �/F� �2/4D��9/;=� �@� �� � �*,� �*�K+� ��M:*k� �OQS� �V� �� � �*,*� �*��3+� ���:*m� �� ���Y6� '*,��� :� E�*,� ��ܚ����� :� #�� � #:  �� � :!� !�:"��"*� �������������� ��� ��� ���������� ����������z�������z��������������������������������������������� �  ` #  ���    �� �   ���   ��   ���   ���   � �   �   ��   ��� 	  ��� 
  ���   ���   ���   ���   ���   ��   ��   ���   ���   ���   ���   ���   ���   �   �   �	   �
�   ��   ��   ��   ���   ���    ��� !  ��� "�  * J         4  H  4  4    |  c  �  �  �  �  �  �    & & H Q Q H  � w 
 ^ Vj V( V� \� \� \ ] ] ]4 ^4 ^0 ^P _P _L _l `l `h `� a� a� a� b� b� b� c� c� c� d� d� d� [ f+ f= f� f| g� g� g_ g� h� h h� hB k% kd m �� �  �  %  ,Զ�*��+� ���:* �� ��������Y� �Y�SY�S����� ���Y6� 6*,�9M,ض��˚��� � :� �:*,��M���� :� #�� � #:		�ب � :
� 
�:�۩,ڶ�*��+� ���:* �� ��������Y� �Y�SY�SY�SY�S����� ���Y6� 6*,�9M,޶��˚��� � :� �:*,��M���� :� #�� � #:�ب � :� �:�۩,��*��+� ���:* �� ���� ���;�� ������������**� E�I�%� ������������**� u�I�%� ����Y� �Y�SYSY�SY�S����� �� � �,��*��+� ���:* �� ��������Y� �Y�SY�S����� ���Y6� 6*,�9M,���˚��� � :� �:*,��M���� :� #�� � #:�ب � :� �:�۩,ڶ�*��+� ���:* �� ��������Y� �Y�SY�SY�SY�S����� ���Y6� 6*,�9M,���˚��� � :� �: *,��M� ��� :!� #!�� � #:""�ب � :#� #�:$�۩$*�   Y u x� x } x� N � �� � � �� N � �� � � �� � � �� � � ��)EH�HMH�ht�nqt�h��nq��t�����������������	���	��#��������������������������������� �  t %  ��    � �   ��   �   �   �   ��   ��   ��   �� 	  �� 
  ��   �   �   ��   ��   ��   ��   ��   ��   �   �   �   ��   ��   ��   ��   ��   ��   �   �   ��   ��    �� !  �� "  �� #  �� $�   V  > �  � � � � �� �� �� �� �� � �! �! �E �Q �� �� �r �m �y �6 � � �   "     ���   �       ��   � �  � 
   �**� M3;=�A**� 5�E� /*K� �Y3S*!� �*!� �**� 5�I�%�L�O�S*K� �YUS�WYY�[*K� �Y3S� ��%�_a�_�d�S*� 1f�k*� =*&� �*�o�s�w**� ]y{��&��Y*� ���:*+,��� :� ���� :�:��:����  �           #��*��+� ���:	*D� �	� �	��Y6
�*��	� ���:*E� ��������Y� �Y�SY�SY�SY�S����� ���Y6� v*,�9M,���,**� %� �Y�S��%��,��,**� %� �YS��%��,���˚��� � :� �:*,��M���� :� )� i� ��� � #:�ب � :� �:�۩	�ܚ��	��� :� &� x�� � #:	�� � :� �:	��*� 1
�k**� =� �Y*N� �**� =�I��c�S**� Y�I�� �� � :� �:��*� ��������~��~)�)�&)�).)� ]�Q]�WZ]� l�Ql�WZl�]il�lql� � � �# � � �# � � �% � � �% � ��� � ��� ���Q��W������� �   �   ���    �� �   ���   ��   �   ��   ��   ��   ��   �� 	  �� 
  � �   �!�   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ��� �   A         
  
              3 ! 3 ! 3 ! 3 ! 3 ! 3 !  !  !    X " ^ " ^ " s " T " T " G "   � % � %  % � & � & � & � &  $ � * � * � * � * � *b En E� G� G� G� H� H� H+ E D� L� L} L� N� N� N� N� N� N� N� N� N} K � , � *       ~    