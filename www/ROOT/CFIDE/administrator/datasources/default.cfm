����  -f 
SourceFile HE:\cf9_final\cfusion\wwwroot\CFIDE\administrator\datasources\default.cfm cfdefault2ecfm269800684  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   STDSN Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   INTERVAL   	   SUBMIT   	    CANCEL " " 	  $ MAXCONNECTION & & 	  ( DRIVER_TITLE * * 	  , CFCATCH . . 	  0 TIMEOUT_TITLE 2 2 	  4 CONNECTIONSTRING_TITLE 6 6 	  8 I : : 	  < HIDEADVANCEDSETTINGS > > 	  @ BERRORSEXIST B B 	  D ENABLEMAXCONNECTIONS_TITLE F F 	  H THISLISTITEM J J 	  L LOCALE N N 	  P URL R R 	  T GETDATASOURCEDEFAULTS V V 	  X AERRORMESSAGES Z Z 	  \ SHOWADVANCEDSETTINGS ^ ^ 	  ` INTERVAL_TITLE b b 	  d 	URLENCHAR f f 	  h DATASOURCENAME_TITLE j j 	  l 
DRIVER_ERR n n 	  p MAINTAINCONNECTIONS_TITLE r r 	  t REQUEST v v 	  x TIMEOUT z z 	  | GETNEWDSNDEFAULTS ~ ~ 	  � KEY � � 	  � CLASS_TITLE � � 	  � NEWPASS � � 	  � JDBCURL_TITLE � � 	  � FORM � � 	  � USERNAME_TITLE � � 	  � ASTATUSMESSAGES � � 	  � THISDSN � � 	  � DSN � � 	  � PASSWORD_TITLE � � 	  � GETCFSETTINGDEFAULTS � � 	  � BSTATUSEXIST � � 	  � com.macromedia.SourceModTime  !��c( pageContext #Lcoldfusion/runtime/NeoPageContext; � �	  � getOut ()Ljavax/servlet/jsp/JspWriter; � � javax/servlet/jsp/PageContext �
 � � parent Ljavax/servlet/jsp/tagext/Tag; � �	  � com.adobe.coldfusion.* � bindImportPath (Ljava/lang/String;)V � �
  � 
 � _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V � �
  � 'class$coldfusion$tagext$lang$IncludeTag Ljava/lang/Class; !coldfusion.tagext.lang.IncludeTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � !coldfusion/tagext/lang/IncludeTag � _setCurrentLineNo (I)V � �
  � 	cfinclude � template � udflibrary.cfm � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
  � setTemplate � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
  � false � set (Ljava/lang/Object;)V � � coldfusion/runtime/Variable
  ArrayNew (I)Ljava/util/List;
  _Array .(Ljava/lang/Object;)Lcoldfusion/runtime/Array;	 coldfusion/runtime/Cast

 setArray (Lcoldfusion/runtime/Array;)V
 


 CANCELSUBMIT FORM.CANCELSUBMIT  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z
  
	 'class$coldfusion$tagext$net$LocationTag !coldfusion.tagext.net.LocationTag �	 ! !coldfusion/tagext/net/LocationTag# 
cflocation% addtoken' No) _boolean (Ljava/lang/String;)Z+,
- :(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z �/
 0 setAddtoken2 �
$3 url5 	index.cfm7 setUrl9 �
$: 

< ACTION> 
URL.ACTION@ _Object (Z)Ljava/lang/Object;BC
D (Ljava/lang/Object;)Z+F
G java/lang/StringI _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;KL
 M deleteO _compare '(Ljava/lang/Object;Ljava/lang/String;)DQR
 S SQLEXECUTIVEU DATASOURCESW _Map #(Ljava/lang/Object;)Ljava/util/Map;YZ
[ _String &(Ljava/lang/Object;)Ljava/lang/String;]^
_ StructDelete %(Ljava/util/Map;Ljava/lang/String;Z)Zab
 c  REQUEST.CLIENTSCOPE.CLIENTSTORESe isDefinedCanonicalNameg,
 h CLIENTSCOPEj CLIENTSTORESl StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Zno
 p _resolverL
 s _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;uv
 w TYPEy 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object;K{
 | COOKIE~ REGISTRY�ao
 � ADMINSUBMIT� FORM.ADMINSUBMIT� *coldfusion/runtime/TransientVariableHolder� &(Lcoldfusion/runtime/NeoPageContext;)V �
�� ORIGINALDSN� 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object;��
 � 	StructNew !()Lcoldfusion/util/FastHashtable;��
 � _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;��
 � getNewDSNDefaults� %coldfusion/runtime/ArgumentCollection� scope� java/lang/Object� _autoscalarize��
 � )([Ljava/lang/Object;[Ljava/lang/Object;)V �
�� 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;��
 � getCFSettingDefaults� getDatasourceDefaults� dsn� NAME� Trim &(Ljava/lang/String;)Ljava/lang/String;��
 � _structSetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V��
 � DRIVER� CLASS� USERNAME� 	EPASSWORD� Len (Ljava/lang/Object;)I��
 � (D)Z+�
� PASSWORD� '(Ljava/lang/Object;Ljava/lang/Object;)DQ�
 � encryptPassword� _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;��
 �  � _factor2 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;��
 � DESCRIPTION� ARGS� 	FORM.ARGS� URLMAP� THISDSN.URLMAP.ARGS� D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object;K�
 � :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V��
 � CONNECTIONPROPS� 1� _int��
� ;� 	ListGetAt 9(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;��
 � _LhsResolve��
 � =� 	ListFirst 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;� 
  ListLast 
  _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V
  _double (Ljava/lang/Object;)D

 (D)Ljava/lang/Object;B
 ListLen '(Ljava/lang/String;Ljava/lang/String;)I
  (I)Ljava/lang/Object;B
 ADVANCEDMODE FORM.ADVANCEDMODE FORM.TIMEOUT Val (Ljava/lang/String;)D
  @N       0$ FORM.INTERVAL& LOGIN_TIMEOUT( FORM.LOGIN_TIMEOUT* BUFFER, FORM.BUFFER. BLOB_BUFFER0 FORM.BLOB_BUFFER2 ENABLEMAXCONNECTIONS4 FORM.ENABLEMAXCONNECTIONS6 MAXCONNECTIONS8 	IsNumeric:F
 ; maxconnections= VALIDATIONQUERY? FORM.VALIDATIONQUERYA _factor0C�
 D POOLINGF FORM.POOLINGH trueJ DISABLEL FORM.DISABLEN ENABLE_CLOBP FORM.ENABLE_CLOBR DISABLE_CLOBT ENABLE_BLOBV FORM.ENABLE_BLOBX DISABLE_BLOBZ DISABLE_AUTOGENKEYS\ FORM.DISABLE_AUTOGENKEYS^ SELECT` FORM.SELECTb CREATEd FORM.CREATEf GRANTh 
FORM.GRANTj _factor1l�
 m INSERTo FORM.INSERTq DROPs 	FORM.DROPu REVOKEw FORM.REVOKEy UPDATE{ FORM.UPDATE} ALTER 
FORM.ALTER� 
STOREDPROC� FORM.STOREDPROC� DELETE� FORM.DELETE� _factor3��
 ��L
 � 

	� unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;�� coldfusion/runtime/NeoException�
�� t39 [Ljava/lang/String; Any���	 � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I��
�� bind '(Ljava/lang/String;Ljava/lang/Object;)V��
�� 
		� $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag�� �	 � coldfusion/tagext/io/OutputTag� 
doStartTag ()I��
�� 
			� (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag�� �	 � "coldfusion/tagext/lang/ImportedTag� l10n� 
../cftags/� admin� setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V��
�� &coldfusion/runtime/AttributeCollection� id� 
edit_error� var� 
driver_err� ([Ljava/lang/Object;)V �
�� setAttributecollection (Ljava/util/Map;)V��  coldfusion/tagext/lang/ModuleTag�
��
�� 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � '
				Error editing/creating this dsn (� write� � java/io/Writer�
�� )<br />
				� MESSAGE� <br />
				� DETAIL� <br />
			� doAfterBody��
�� _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � doEndTag�� #javax/servlet/jsp/tagext/TagSupport�
�� doCatch (Ljava/lang/Throwable;)V��
�� 	doFinally� 
� 
�� coldfusion/tagext/QueryLoop
�
�
�  

		 ArrayLen
�
 �
  unbind 
� _factor4�
  
	
	 index.cfm?verifyNewDsn= URLEncodedFormat 
  concat�
J 



 REQUEST.LOCALE! en# checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V%&
 ' isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z)*
 + LCase-�
 . 
LOCALEFILE0 java/lang/StringBuffer2 resources/datasources_4  �
36 append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;89
3: .xml< toString ()Ljava/lang/String;>?
�@ 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V%B
 C BSHOWADVANCEDE STDSN.BSHOWADVANCEDG STDSN.DRIVERI STDSN.CLASSK FORM.DSNM STDSN.ORIGINALDSNO &(Ljava/lang/String;)Ljava/lang/Object;�Q
 R java/util/MapT keySet ()Ljava/util/Set;VWUX java/util/SetZ iterator ()Ljava/util/Iterator;\][^ java/util/Iterator` next ()Ljava/lang/Object;bcad 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;uf
 g hasNext ()Zijak defaultdriverm pagenameo Default Driverq ../header.cfms ../include/margintop.cfmu ../include/errors.cfmw ../include/status.cfmy 

<h2 class="pageHeader">{ other_pageHeader} /Data &amp; Services &gt; Datasources &gt; Other &</h2>

<form name="editdsn" action="� CGI� SCRIPT_NAME� ?� QUERY_STRING� " method="post">
� 
STDSN.NAME� 0
	<input type="hidden" name="epassword" value="� ">
� 4
	<input type="hidden" name="epassword" value="">
� _factor7��
 � Z

<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
	<td bgcolor="#� 	GRAYLIGHT� *" class="cellBlueTopAndBottom">
		<b>
		� REQUEST.SQLEXECUTIVE.DRIVERS� DRIVERS�  :&nbsp;
		� �
		</b>
	</td>
</tr>
<tr>
	<td>
		
		<table border="0" cellspacing="0" cellpadding="2" width="100%">
		<tr>
			<td width="125">
				<label for="dsn">
					� datasourcename� CF Data Source Name� '
				</label>
			</td>
			<td>
				� datasourcename_title� ColdFusion datasouce name� ;
				<input type="text" maxlength="550" name="dsn" value="� 5"
					id="dsn" size="12" style="width:12em" title="� 7">
				<input type="hidden" name="originaldsn" value="� H">
			</td>
		</tr>
		<tr>
			<td>
				<label for="jdbcurl">
					� JDBCURL� JDBC URL� _factor8��
 � jdbcurl_title� 2Enter the JDBC Connection URL for this datasource.� e
				<textarea name="url" maxlength="550" id="jdbcurl" rows="3" cols="35" style="width:35em" title="� ">� U</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<label for="driverClass">
					� DriverClass� Driver Class� class_title� Enter the JDBC Class.� N
				<input type="text" maxlength="550" name="class" id="driverClass" value="� +"
					size="12"style="width:35em" title="� G">
			</td>
		</tr>
		<tr>
			<td>
				<label for="driver">
					� Driver Name� driver_title� Enter the JDBC Driver.� _factor9��
 � J
				<input type="text" maxlength="550" name="driver" id="driver" value="� I">
			</td>
		</tr>
		<tr>
			<td>
				<label for="username">
					� username� 	User name� username_title� <Enter the user name if the database requires authentication.� @
				<input type="text" maxlength="550" name="username" value="� 9"
					size="12"style="width:12em" id="username" title="� I">
			</td>
		</tr>
		<tr>
			<td>
				<label for="password">
					� password� Password� password_title� ZEnter the password corresponding to the user name if the database requires authentication.� 4
				<input type="password" name="password" value="� 9"
					size="12"style="width:12em" id="password" title="� ">
				� 	_factor10 �
  passwordCharLimit (16-character limit) J
			</td>
		</tr>
		<tr>
			<td>
				<label for="description">
					 description	 Description {
				</label>
			</td>
			<td>
				<textarea name="description" id="description" rows="6" cols="35" style="width:35em"> M</textarea>
			</td>
		</tr>
		<tr class="cellBlueTopAndBottom" bgcolor="# 	BLUELIGHT [">
			<td colspan="2">
				<table width="100%">
				<tr>
					<td align="left">
						 SHOWADVANCED FORM.SHOWADVANCED 	
							 hideAdvancedSettings Hide Advanced Settings 9
							<input type="Submit" name="hideAdvanced" value=" X" class="buttn" >
							<input type="hidden" name="advancedmode" value="true">
						! showAdvancedSettings# Show Advanced Settings% 9
							<input type="Submit" name="showAdvanced" value="' Y" class="buttn" >
							<input type="hidden" name="advancedmode" value="false">
						) 	_factor11+�
 , -
					</td>
					<td align="right">
						. submit0 Submit2 
						4 Cancel6 7
						<input type="Submit" name="adminsubmit" value="8 I" class="buttn" >
						<input type="Submit" name="cancelSubmit" value=": Q" class="buttn" >
					</td>
				</tr>
				</table>
			</td>
		</tr>
		
		< 4
			<tr>
				<td>
					<label for="args">
						> ConnectionString@ Connection StringB +
					</label>
				</td>
				<td>
					D ConnectionString_titleF kEnter name/value pairs for vendor-specific connection string arguments. The format is typically name=value.H A
					<textarea name="args" id="args" rows="3" cols="25" title="J i</textarea>
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="enablemaxconnections">
						L maxConnections_limitN Limit ConnectionsP enablemaxconnections_titleR 7Select the checkbox to enable the max connection limit.T o
					<input type="checkbox" name="enablemaxconnections" value="true"
						id="enablemaxconnections"
						V STDSN.URLMAP.MAXCONNECTIONSX checkedZ 
						title="\ 8">
					&nbsp;&nbsp;
					<label for="maxconnections">^ maxConnections_enable` Restrict connections tob _factor5d�
 e "</label>
					&nbsp;&nbsp;
					g 
					i K
					<input type="Text" name="maxconnections" id="maxconnections" value="k W" size="3">
				</td>
			</tr>
			<tr>
				<td>
					<label for="pooling">
						m maintainConnectionso Maintain Connectionsq maintainConnections_titles �Select the checkbox to enable server connection pooling for your data source. This is highly recommended to increase performance.u U
					<input type="checkbox" name="pooling" value="true"
						id="pooling"
						w <">
					&nbsp;&nbsp; --
					<label for="pooling">
						y !maintainConnectionsAcrossRequests{ ,Maintain connections across client requests.} [
					</label>
				</td>
			</tr>
			<tr>
				<td>
					<label for="timeout">
						 timeout� Timeout (min)� _factor6��
 � timeout_title� |Enter a time, in minutes, that the server allows a data source connection to remain inactive before closing that connection.� _div (DD)D��
 � Round (D)D��
 � @
					<input type="text" maxlength="550" name="timeout" value="� (D)Ljava/lang/String;]�
� &"
						size="4" id="timeout" title="� :">
					&nbsp;&nbsp;
					<label for="interval">
						� Interval� Interval (min)� )
					</label>
					&nbsp;&nbsp;
					� interval_title� aEnter a time, in minutes, that the server waits before closing an expired data source connection.� 2
					<input type="input" name="interval" value="� '"
						size="4" id="interval" title="� ">
				</td>
			</tr>
		� 	_factor12��
 � 1
		</table>
		
	</td>
</tr>
</table>



� _cfsettings.cfm� #
<br clear="left" /><br /><br />
� 	_factor13��
 � IsDebugMode�j
 � 	STDSN.DSN� dump� /WEB-INF/cftags� cfdump� \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object; ��
 � ../include/marginbottom.cfm� ../footer.cfm� metaData Ljava/lang/Object;��	 � this Lcfdefault2ecfm269800684; __factorParent out Ljavax/servlet/jsp/JspWriter; value module37 $Lcoldfusion/tagext/lang/ImportedTag; mode37 t6 Ljava/lang/Throwable; t7 t8 t9 t10 t11 module38 mode38 t14 t15 t16 t17 t18 t19 module48 mode48 t22 t23 t24 t25 t26 t27 module49 mode49 t30 t31 t32 t33 t34 t35 module50 mode50 t38 t40 t41 t42 t43 LocalVariableTable LineNumberTable java/lang/Throwable  Code module39 mode39 module40 mode40 module41 mode41 module42 mode42 module43 mode43 	include17 #Lcoldfusion/tagext/lang/IncludeTag; 	include18 	include19 module20 mode20 t12 t13 <clinit> module24 mode24 module25 mode25 module26 mode26 module27 mode27 module28 mode28 t4 ,Lcoldfusion/runtime/TransientVariableHolder; t5 #Lcoldfusion/runtime/AbortException; Ljava/lang/Exception; __cfcatchThrowable0 output4  Lcoldfusion/tagext/io/OutputTag; mode4 module3 mode3 t20 t21 !coldfusion/runtime/AbortException- java/lang/Exception/ module33 mode33 module34 mode34 module35 mode35 module36 mode36 module21 mode21 module22 mode22 module23 mode23 module44 mode44 module45 mode45 module46 mode46 module47 mode47 varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; runPage module53 	include54 	include55 module29 mode29 module30 mode30 module31 mode31 module32 mode32 include0 	location1 #Lcoldfusion/tagext/net/LocationTag; 	location2 	location5 Ljava/util/Iterator; module15 mode15 	include16 output52 mode52 	include51 t28 t29 getMetadata 1     -                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     �     �     �     �     �     �     �     �     �     �     �     � �    �   ��   � �   � �   ��    ��   	7  ,  ;,/��*��%+� ���:*�� ��������Y��Y�SY1SY�SY1S�Ҷ�� ���Y6� 6*,��M,3������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:��*,5� �*��&+� ���:*�� ��������Y��Y�SY7SY�SY7S�Ҷ�� ���Y6� 6*,��M,7������� � :� �:*,��M���� :� #�� � #:��� � :� �:��,9��,**� !���`��,;��,**� %���`��,=��**� ���W*+,�f� �*+,��� �,E��*��0+� ���:*޶ ��������Y��Y�SY�SY�SY�S�Ҷ�� ���Y6� 6*,��M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:��*,j� �*� }*߶ �**� �JY{S��"������,���,*� �**� }���������,���,**� 5���`��,���*��1+� ���:*� ��������Y��Y�SY�S�Ҷ�� ���Y6� 6*,��M,�������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#��#,���*��2+� ���:$*� �$�����$��Y��Y�SY�SY�SY�S�Ҷ�$� �$��Y6%� 6*$%,��M,���$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$��+*,j� �*� *� �**� �JYS��"������,���,**� ���`��,���,**� e���`��,���*� ( e � � � � � Z � � � � � Z � � � � � � � � � � �6RUUZU+u�{~�+u�{~�������b~����W�����W�����������������������������������e�����Z�����Z����������� �  � ,  ;��    ;� �   ;��   ;��   ;��   ;� :   ;��   ;��   ;��   ;�� 	  ;�� 
  ;��   ;��   ;� :   ;��   ;��   ;��   ;��   ;��   ;��   ;��   ;� :   ;��   ;��   ;��   ;��   ;��   ;��   ;��   ;� :   ;��   ;��   ;��    ;�� !  ;�� "  ;�� #  ;�� $  ;� : %  ;�� &  ;�� '  ;�� (  ;�� )  ;�� *  ;�� +�   � : >� J� ��� ������������������������;�G������������������������
�.�.�-�z�C�>�J�����������������������$�$�#��� C�   y 	   i**� �{�� 9**� ��JY{S*i� �*��JY{S�N�`�!"k���� **� ��JY{S%��**� �'�� 9**� ��JYS*l� �*��JYS�N�`�!"k���� **� ��JYS%��**� �)+�� 7**� ��JY)S*o� �*��JY)S�N�`�!���� **� ��JY)S%��**� �-/�� 4**� ��JY-S*r� �*��JY-S�N�`�!���**� �13�� 4**� ��JY1S*t� �*��JY1S�N�`�!���**� �57��EY�H�  W*v� �*��JY9S�N�<�E�H� 4**� ��JY�SY9S*��JY9S�N��� '*z� �***� ��JY�S��\>�dW**� �@B�� (**� ��JY@S*��JY@S�N��� **� ��JY@Sض�*�   �   *   i��    i� �   i��   i�� �  � s  h  h  h  h   h $ i $ i $ i $ i 9 i $ i $ i  i  i T j T j F j F j   h [ k [ k _ k a k Z k ~ l ~ l ~ l ~ l � l ~ l ~ l j l j l � m � m � m � m Z k � n � n � n � n � n � o � o � o � o � o � o p p � p � p � n q q q q q4 r4 r4 r4 r r r qQ sQ sU sX sP sv tv tv tv ta ta tP s� v� v� v� v� v� v� v� v� v� v� v� w� w� w� w� z� z z z� z� z� x� v } }! }$ } }< ~< ~- ~- ~a a R R  } d�   �  ,  X,?��*��'+� ���:*�� ��������Y��Y�SYAS�Ҷ�� ���Y6� 6*,��M,C������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:��,E��*��(+� ���:*�� ��������Y��Y�SYGSY�SYGS�Ҷ�� ���Y6� 6*,��M,I������� � :� �:*,��M���� :� #�� � #:��� � :� �:��,K��,**� 9���`��,ƶ�,**� �JY�SY�S��`��,M��*��)+� ���:*�� ��������Y��Y�SYOS�Ҷ�� ���Y6� 6*,��M,Q������� � :� �:*,��M���� :� #�� � #:��� � :� �:��,E��*��*+� ���:*�� ��������Y��Y�SYSSY�SYSS�Ҷ�� ���Y6� 6*,��M,U������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#��#,W��*Y�i� 
,[��,]��,**� I���`��,_��*��++� ���:$*�� �$�����$��Y��Y�SYaS�Ҷ�$� �$��Y6%� 6*$%,��M,c��$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$��+*� ( Y u x x } x N � � � � � N � � � � � � � � � � �)EHHMHhtnqth�nq�t�����)EHHMHhtnqth�nq�t�������8D>AD�8S>ASDPSSXS�


�*6036�*E03E6BEEJE �  � ,  X��    X� �   X��   X��   X�   X :   X��   X��   X��   X�� 	  X�� 
  X��   X�   X :   X��   X��   X��   X��   X��   X��   X�   X :   X��   X��   X��   X��   X��   X��   X	�   X
 :   X��   X��   X��    X�� !  X�� "  X�� #  X� $  X : %  X�� &  X�� '  X�� (  X�� )  X�� *  X�� +�   b  >� ��� �����������������������l�k�k����������� ��   � 	   x*,ʶ �*� �+� �� �:*� ���v� � �� �� �� �*,ʶ �*� �+� �� �:*� ���x� � �� �� �� �*,ʶ �*� �+� �� �:*� ���z� � �� �� �� �,|��*��+� ���:*� ��������Y��Y�SY~S�Ҷ�� ���Y6� 6*,��M,�������� � :	� 	�:
*,��M�
��� :� #�� � #:��� � :� �:��,���,*��JY�S�N�`��,���,*��JY�S�N�`��,���**� ����EY�H� @W*� �**w�JYVSYXS�N�\**� �JY�S��`�q�E�H� W,���,**w�JYVSYXS�t**� �JY�S��x�\�JY�S�}�`��,��� 
,���*� ,//4/O[UX[OjUXj[gjjoj �   �   x��    x� �   x��   x��   x   x   x   x�   x :   x�� 	  x�� 
  x��   x�   x�   x�� �   � " #  ` D � � � ��������������������$:##"o�      ]     ?Ҹ س � � س"�JY�S���� س��� س���Y���ҳα   �       ?��   ��   �  ,  e,���*��+� ���:*F� ��������Y��Y�SY�SY�SY�S�Ҷ�� ���Y6� 6*,��M,¶������ � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:��,Ķ�,**� ����`��,ƶ�,**� �JYSS��`��,ȶ�*��+� ���:*M� ��������Y��Y�SY�S�Ҷ�� ���Y6� 6*,��M,̶������ � :� �:*,��M���� :� #�� � #:��� � :� �:��,���*��+� ���:*Q� ��������Y��Y�SY�SY�SY�S�Ҷ�� ���Y6� 6*,��M,ж������ � :� �:*,��M���� :� #�� � #:��� � :� �:��,Ҷ�,**� �JY�S��`��,Զ�,**� ����`��,ֶ�*��+� ���:*Y� ��������Y��Y�SY�S�Ҷ�� ���Y6� 6*,��M,ض������ � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#��#,���*��+� ���:$*]� �$�����$��Y��Y�SY�SY�SY�S�Ҷ�$� �$��Y6%� 6*$%,��M,ܶ�$����� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$��+*� ( e � � � � � Z � � � � � Z � � � � � � � � � � �^z}}�}S�����S�����������.JMMRM#mysvy#m�sv�y�����(DGGLGgsmpsg�mp�s������7C=@C�7R=@RCORRWR �  � ,  e��    e� �   e��   e��   e�   e :   e��   e��   e��   e�� 	  e�� 
  e��   e�   e :   e��   e��   e��   e��   e��   e��   e�   e :   e��   e��   e��   e��   e��   e��   e�   e :   e��   e��   e��    e�� !  e�� "  e�� #  e� $  e : %  e�� &  e�� '  e�� (  e�� )  e�� *  e�� +�   f  >F JF F �G �G �G �G �G �GCMMQQ�Q�R�R�R�S�S�SY�Y�]�]�] �   � 
   3*,=� λ�Y*� ���:*,� �*+,��� :���*+,��� :���*��JY�S�N*��JY�S�N���~� <* �� �**w�JYVSYXS�N�\*��JY�S�N�`�dW*w�JYVSYXS����Y*��JY�S�NS**� ����	*,�� ΨD�J:�:��:		�����                /	��*,�� �*� EK�*,�� �*��+� ���:
* �� �
� �
��Y6�@*,�� �*��
� ���:* �� ��������Y��Y�SY�SY�SY�S�Ҷ�� ���Y6� �*,��M,߶�,**� ����`��,��,**� 1�JY�S��`��,��,**� 1�JY�S��`��,������� � :� �:*,��M���� :� )� q� ��� � #:��� � :� �:��*,�� �
����
�� :� &� �� � #:
�� � :� �:
��*,	� �**� ]��Y* ȶ �**� ]����c�S**� q���*,� Χ �� � :� �:��*� �588=8�^jdgj�^ydgyjvyy~yR^�d�����R^�d�����������  * �. 0 = �. C � �.  * �0 0 = �0 C � �0  *  0 =  C �  �^ d� �  %  �     3��    3� �   3��   3��   3 !   3"�   3��   3�#   3�$   3%� 	  3&' 
  3( :   3)�   3* :   3��   3��   3��   3��   3��   3��   3+�   3,�   3��   3��   3��   3�� �   � / C � R � C � t � t � � � � � � � s � s � s � C � � � � � � � � � � �  ) �) �% �% �� �� �� �� �� �� �� �� � � �
 �e �7 �� �� �� �� �� �� � � � �� �� �   +�   �  $  �*��!+� ���:*x� ��������Y��Y�SYS�Ҷ�� ���Y6� 6*,��M,������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:��,��*��"+� ���:*~� ��������Y��Y�SY
S�Ҷ�� ���Y6� 6*,��M,������� � :� �:*,��M���� :� #�� � #:��� � :� �:��,��,**� �JY�S��`��,��,*w�JYS�N�`��,��**� ��� �*,� �*��#+� ���:*�� ��������Y��Y�SYSY�SYS�Ҷ�� ���Y6� 6*,��M,������� � :� �:*,��M���� :� #�� � #:��� � :� �:��, ��,**� A���`��,"�� �*,� �*��$+� ���:*�� ��������Y��Y�SY$SY�SY$S�Ҷ�� ���Y6� 6*,��M,&������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#��#,(��,**� a���`��,*��*�   R n q q v q G � � � � � G � � � � � � � � � � �255:5Ua[^aUp[^pamppup=Y\\a\2|����2|����������.JMMRM#mysvy#m�sv�y����� �  j $  ���    �� �   ���   ���   �1�   �2 :   ���   ���   ���   ��� 	  ��� 
  ���   �3�   �4 :   ���   ���   ���   ���   ���   ���   �5�   �6 :   ���   ���   ���   ���   ���   ���   �7�   �8 :   ���   ���   ���    ��� !  ��� "  ��� #�   v  7x  x �~ �~�����������������������"�����������������������       #     *� 
�   �       ��   ��   V 	   �,���,*w�JY�S�N�`��,���**� �J��EY�H� W*��i�EY�H� @W*'� �**w�JYVSY�S�N�\**� �JY�S��`�q�E�H� U*,�� �,**w�JYVSY�S�t**� �JY�S��x�\�JY�S�}�`��,���*,�� �,**� ����`��,���*��+� ���:*5� ��������Y��Y�SY�S�Ҷ�� ���Y6� 6*,��M,�������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:��,���*��+� ���:*9� ��������Y��Y�SY�SY�SY�S�Ҷ�� ���Y6� 6*,��M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:��,���,**� �JY�S��`��,���,**� m���`��,���,**� �JY�S��`��,���*��+� ���:*B� ��������Y��Y�SY�S�Ҷ�� ���Y6� 6*,��M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:��*� TpssxsI�����I�����������$@CCHCcoiloc~il~o{~~�~=Y\\a\2|����2|���������� �     ���    �� �   ���   ���   �9�   �: :   ���   ���   ���   ��� 	  ��� 
  ���   �;�   �< :   ���   ���   ���   ���   ���   ���   �=�   �> :   ���   ���   ���   ���   ���   ��� �   � . % % % &' &' *' -' %' %' ?' >' >' %' %' X' X' q' q' W' W' %' �( �( �( �( �( %' �* �* �*955�9	9�9�:�:�:�;�;�;�<�<�<"B�B ��   �  $  �,h��*Y�i� E*,5� �*� )*�� �**� �JY�SY9S��`�!��*,j� Χ *,5� �*� )ض*,j� �,l��,**� )���`��,n��*��,+� ���:*ȶ ��������Y��Y�SYpS�Ҷ�� ���Y6� 6*,��M,r������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:��,E��*��-+� ���:*̶ ��������Y��Y�SYtSY�SYtS�Ҷ�� ���Y6� 6*,��M,v������� � :� �:*,��M���� :� #�� � #:��� � :� �:��,x��**� �JYGS��H� 
,[��,]��,**� u���`��,z��*��.+� ���:*Ӷ ��������Y��Y�SY|S�Ҷ�� ���Y6� 6*,��M,~������� � :� �:*,��M���� :� #�� � #:��� � :� �:��,���*��/+� ���:*ڶ ��������Y��Y�SY�S�Ҷ�� ���Y6� 6*,��M,�������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#��#*�   � � � �  � �'!$' �6!$6'366;6����������������������������������p�����e�����e����������� �  j $  ���    �� �   ���   ���   �?�   �@ :   ���   ���   ���   ��� 	  ��� 
  ���   �A�   �B :   ���   ���   ���   ���   ���   ���   �C�   �D :   ���   ���   ���   ���   ���   ���   �E�   �F :   ���   ���   ���    ��� !  ��� "  ��� #�   ~  � � $� $� $� $� � � _� _� [� [� S� � u� u� t� �� ������N���E�E�D���Z�U��          �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � ��   �       ���    �GH   �IJ  Kc   �    �*� �� �L*� �N*Ķ �*-+��� �*+=� �*�� �*���EY�H� W**� ����EY�H� ?W*�� �**w�JYVSYXS�N�\**� �JY�S��`�q�E�H� �*+� �*��5-� ���:*�� �����*w�JYVSYXS�t**� �JY�S��x:����W��Y��Y�SYS�Ҷ�� �� �� �*+ʶ �*+=� �*� �6-� �� �:*� ����� � �� �� �� �*+ʶ �*� �7-� �� �:*� ����� � �� �� �� �*+=� ��   �   R   ���    ���   ���   � � �   �L�   �"�   �M   �N �   n  .� .� >� >� B� D� =� =� .� .� ]� ]� v� v� \� \� .� �� �� �� �� .�P4�q    ��   � 	   �**� ��JY�S*��JY�S�N��**� ���� .**� ��JY�SY�S*��JY�S�N��� K*�i� .*��JY�S**� ��JY�SY�S��� *��JY�Sض�**� ��JY�SY�S*Y� ����**� ���� �*� =�� �*� M*`� �*��JY�S�N�`**� =��������**� ��JY�SY�S����Y*a� �**� M���`��S*a� �**� M���`���	*� =**� =���c��**� =��*^� �*��JY�S�N�`������t|���3**� ���EY�H� W*��JYS�N�H��*+,�E� �*+,�n� �**� �pr�� **� ��JYpSK��� **� ��JYpS���**� �tv�� **� ��JYtSK��� **� ��JYtS���**� �xz�� **� ��JYxSK��� **� ��JYxS���**� �|~�� **� ��JY|SK��� **� ��JY|S���**� ����� **� ��JY�SK��� **� ��JY�S���**� ����� **� ��JY�SK��� **� ��JY�S���**� ����� **� ��JY�SK��� **� ��JY�S���*�   �   *   ���    �� �   ���   ��� �  � �  O  O   O # Q # Q ' Q * Q " Q H R H R 3 R 3 R _ S ^ S u T u T h T h T � U � U � U � U ^ S " Q � Y � Y � Y � \ � \ � \ � \ � \ � ^ � ^ � ^ � ` � ` ` ` ` � ` � ` � ` a: a: aE a: aR aR a] aR aR a a � _j ^j ^u ^j ^j ^f ^} ^� ^� ^� ^� ^} ^ � ^ � ] � \� e� e� e� e� e� e� e� e� e� �� � � �� � � � � �4 �4 �% �% �� �: �: �> �A �9 �Y �Y �J �J �q �q �b �b �9 �w �w �{ �~ �v �� �� �� �� �� �� �� �� �v �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � �( �( � � �� �. �. �2 �5 �- �M �M �> �> �e �e �V �V �- �k �k �o �r �j �� �� �{ �{ �� �� �� �� �j �� f� e  �   �  $  �,��,**� �JY�S��`��,Զ�,**� -���`��,��*��+� ���:*e� ��������Y��Y�SY�S�Ҷ�� ���Y6� 6*,��M,������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:��,���*��+� ���:*i� ��������Y��Y�SY�SY�SY�S�Ҷ�� ���Y6� 6*,��M,������� � :� �:*,��M���� :� #�� � #:��� � :� �:��,���,**� �JY�S��`��,��,**� ����`��,��*��+� ���:*q� ��������Y��Y�SY�S�Ҷ�� ���Y6� 6*,��M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:��,���*�� +� ���:*u� ��������Y��Y�SY�SY�SY�S�Ҷ�� ���Y6� 6*,��M,�������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#��#,���,**� �JY�S��`��,���,**� ����`��,���*�   � � � � � � � � � � � � � � � � � � � � � � � �_{~~�~T�����T�����������Yuxx}xN�����N�����������)EHHMHhtnqth�nq�t����� �  j $  ���    �� �   ���   ���   �O�   �P :   ���   ���   ���   ��� 	  ��� 
  ���   �Q�   �R :   ���   ���   ���   ���   ���   ���   �S�   �T :   ���   ���   ���   ���   ���   ���   �U�   �V :   ���   ���   ���    ��� !  ��� "  ��� #�   r  ^ ^ ^ (_ (_ '_ te =e8iDii�j�j�j�k�k�k>qquu�u�v�v�v�w�w�w ��   :     	�*,ʶ �*,ʶ �*� �+� �� �:*� ����� � �� �� �� �*,ʶ �*� E��*,ʶ �*� ]*� �*���*,� �**� ��� a*,� �*�"+� ��$:*� �&(*�.�1�4&68� �;� �� �� �*,=� Χ�**� U?A��EY�H� #W*S�JY?S�NP�T�~��E�H��*,� �*� �**w�JYVSYXS�N�\*S�JY�S�N�`�dW*f�i�*� �**w�JYkSYmS�N�\*S�JY�S�N�`�q�EY�H� �W**w�JYkSYmS�t*S�JY�S�N�x�\�JYzS�}�T�~�EY�H� JW**w�JYkSYmS�t*S�JY�S�N�x�\�JYzS�}��T�~�E�H� 9*� �**w�JYkSYmS�N�\*S�JY�S�N�`��W*,� �*�"+� ��$:*� �&(*�.�1�4&68� �;� �� �� �*,=� Χ �**� ����� �*+,�� �*,� �**� E���H�� �*,�� �*�"+� ��$:* Ͷ �&(*�.�1�4&6* Ͷ �*��JY�S�N�`**� i���`��� �;� �� �� �*,� �*,ʶ �*, � �**� yO"$�(*,=� �**� Q�,� 1*w�JYOS* ٶ �* ٶ �**� Q���`���/��*w�JY1S�3Y5�7*w�JYOS�N�`�;=�;�A��*,=� �**� E��D*,ʶ �**� ���D*,ʶ �**� ]* � �*��D*,ʶ �**� �* � �*��D*,ʶ �**� FH��(*,� �**� �Jض(*,ʶ �**� �Lض(*,=� �**� ��N�� 5*,� �**� �JY�S*��JY�S�N��*,ʶ Χ 2*,� �**� �JY�S*S�JY�S�N��*,ʶ �*,=� �**� �P**� �JY�S��(*,=� �*� * �� �**� ����*��Y�JY�S��Y**� ��S�����*� * �� �**� ����*��Y�JY�S��Y**� ��S�����*� * �� �**� Y���*��Y�JY�SY�S��Y**� ��SY**� �JY�S��S�����**� �JY[S��H� **� �JYWS���� **� �JYWSK��**� �JYUS��H� **� �JYQS���� **� �JYQSK��**� ��,� Z*��S�\�Y �_ :� 8�e N*� �-�**� ��Y**� ���S*�**� ����h��l ���*, � �*��+� ���:	*� �	�����	��Y��Y�SYnSY�SYpS�Ҷ�	� �	��Y6
� 6*	
,��M,r��	����� � :� �:*
,��M�	��� :� #�� � #:	��� � :� �:	��*,=� �*� �+� �� �:*� ���t� � �� �� �� �*,� �*��4+� ���:*� �� ���Y6� �*,��� :��*,��� :� ��*,��� :� ��*,�� :� ��*,�-� :� ��*,��� :� ��,���**� ��� P*,� �*� �3� �� �:*�� ����� � �� �� �� :� K�*,ʶ �,�������� :� #�� � #:�� � :� �:��*� ������������������������az	p��	p��	p��	p��	p��	p�	<	p	B	d	p	j	m	paz	��	��	��	��	��	�	<		B	d		j	m		p	|			�	 �  B    	���    	�� �   	���   	���   	�W   	�XY   	�ZY   	�[Y   	��\   	�]� 	  	�^ : 
  	���   	��   	��   	���   	���   	���   	�_   	�`'   	�a :   	�+�   	�,�   	���   	���   	���   	���   	�b   	���   	�c�   	�d�   	���   	��� �  n �   '    K  K  G  G  a  `  `  W  W  t 
 t 
 x 
 { 
 s 
 �  �  �  �  �  �  �  �  �  �   �  �  � / / H H Z . . ` _ p p � � o o � � � � � � �  � 0 � � � � o J J c c I I I o o _ . � � � � � � � � � �� �� �1 �F �P �P �b �b �P �P �F � �� ��  �  s 
� �� �� �� �� �� �� �� �� �� �� �� �� �� � �	 �	 � �� �� �� �� �7 �7 �H �H �a �` �` �` �| �{ �{ �{ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �+ �+ � � � �� �W �W �W �~ �� �~ �~ �s �� �� �� �� �� �� � �) �� �� �� �D �k �k �\ �\ �� �� �s �s �D �� �� �� �� �� �� �� �� �� �� �����
�����s �my6#����������	!�	���E ��   �    �*"� �**w�JYVSYXS�N�\*��JY�S�N�`�q� ?*� �*$� �*w�JYVSYXS�t*��JY�S�N�x���� *� �*&� ���*� �**� �**� ����*��Y�JY�S��Y**� ���S�����*� �*+� �**� ����*��Y�JY�S��Y**� ���S�����*� �*,� �**� Y���*��Y�JY�SY�S��Y**� ���SY*��JY�S�NS�����**� ��JY�S*/� �*��JY�S�N�`����**� ��JYSS*0� �*��JYSS�N�`����**� ��JY�S*1� �*��JY�S�N�`����**� ��JY�S*2� �*��JY�S�N�`����**� ��JY�S*3� �*��JY�S�N�`����*5� �*5� �*��JY�S�N�`���ȇ�˙ �*��JY�S�N*��JY�S�N���~�� 4**� ��JY�S*��JY�S�N��� �*;� �*;� �*��JY�S�N�`���ȇ�˙ [*� �*=� �**w�JYVS�t���Y*��JY�S�NS�ֶ**� ��JY�S**� ������ **� ��JY�Sض�� �*��JY�S�N*��JY�S�N���~� [*� �*G� �**w�JYVS�t���Y*��JY�S�NS�ֶ**� ��JY�S**� ������ **� ��JY�Sض�*�   �   *   ���    �� �   ���   ��� �  � l  "  "   "   "  " C $ Y $ C $ C $ C $ C $ 9 $ 9 #  &  & u & u %  " � * � * � * � * � * � + � + � + � + � + ,- ,8 , , , � ,f /f /f /f /Q /� 0� 0� 0� 0~ 0� 1� 1� 1� 1� 1� 2� 2� 2� 2� 2 3 3 3 3 3@ 5@ 5@ 5@ 5@ 5` 7p 7` 7� 9� 9� 9� 8� ;� ;� ;� ;� ; =� =� =� =' >' > >� <D BD B5 B5 A� ;` 7` 6M E] EM E� G� G� Gw G� H� H� Hw F� L� L� L� KM E@ 5 ec    "     �ΰ   �       ��   l�   �    �**� �GI�� **� ��JYGSK��� **� ��JYGS���**� �MO�� **� ��JYMSK��� **� ��JYMS���**� �QS�� **� ��JYUS���� **� ��JYUSK��**� �WY�� **� ��JY[S���� **� ��JY[SK��**� �]_�� **� ��JY]SK��� **� ��JY]S���**� �ac�� **� ��JYaSK��� **� ��JYaS���**� �eg�� **� ��JYeSK��� **� ��JYeS���**� �ik�� **� ��JYiSK��� **� ��JYiS���*�   �   *   ���    �� �   ���   ��� �  � p  �  �  �  �   �   �   �  �  � 8 � 8 � ) � ) �   � > � > � B � E � = � ] � ] � N � N � u � u � f � f � = � { � { �  � � � z � � � � � � � � � � � � � � � � � z � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �, �, � � � � �2 �2 �6 �9 �1 �Q �Q �B �B �i �i �Z �Z �1 �o �o �s �v �n �� �� � � �� �� �� �� �n �� �� �� �� �� �� �� �� �� �� �� �� �� �� �       �    �