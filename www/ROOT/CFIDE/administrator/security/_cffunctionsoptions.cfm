����  -� 
SourceFile VE:\cf9_updates_rc\cfusion\wwwroot\CFIDE\administrator\security\_cffunctionsoptions.cfm $cf_cffunctionsoptions2ecfm1096052521  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   L10N_FINISH Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   CFADMIN_GETENABLEDCFFUNCTIONS   	   FUNCTION   	    TEMP " " 	  $ 
AFUNCTIONS & & 	  ( 	DIRECTORY * * 	  , FORM . . 	  0 CFADMIN_GETALLCFFUNCTIONS 2 2 	  4 WEBAPP 6 6 	  8 ATAGS : : 	  < AENABLEDFUNCTIONS > > 	  @ CFADMIN_REMOVECFFUNCTIONS B B 	  D CFADMIN_ADDCFFUNCTIONS F F 	  H X J J 	  L com.macromedia.SourceModTime  &���� pageContext #Lcoldfusion/runtime/NeoPageContext; Q R	  S getOut ()Ljavax/servlet/jsp/JspWriter; U V javax/servlet/jsp/PageContext X
 Y W parent Ljavax/servlet/jsp/tagext/Tag; [ \	  ] com.adobe.coldfusion.* _ bindImportPath (Ljava/lang/String;)V a b
  c 

 e _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V g h
  i 


 k $class$coldfusion$tagext$io$SilentTag Ljava/lang/Class; coldfusion.tagext.io.SilentTag o forName %(Ljava/lang/String;)Ljava/lang/Class; q r java/lang/Class t
 u s m n	  w _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; y z
  { coldfusion/tagext/io/SilentTag } _setCurrentLineNo (I)V  �
  � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 ~ � 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � _factor2 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object; � �
  � _factor3 � �
  � _factor4 � �
  � _factor5 � �
  � doAfterBody � �
 � � _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � doEndTag � � #javax/servlet/jsp/tagext/TagSupport �
 � � doCatch (Ljava/lang/Throwable;)V � �
 � � 	doFinally � 
 � � 



 � ADDFUNCTIONS_SUBMIT � FORM.ADDFUNCTIONS_SUBMIT �  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z � �
  � 
	 � DISABLEDFUNCTIONS � FORM.DISABLEDFUNCTIONS � 
		 � java/lang/String � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � , � P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  �
  � java/util/StringTokenizer � '(Ljava/lang/String;Ljava/lang/String;)V  �
 � � 	nextToken ()Ljava/lang/String; � �
 � � set (Ljava/lang/Object;)V � � coldfusion/runtime/Variable �
 � � 
				 � _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
  � cfadmin_addCFFunctions � java/lang/Object � _autoscalarize � �
  � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
  � CFLOOP � checkRequestTimeout � b
  � hasMoreTokens ()Z � �
 � � DISABLEFUNCTIONS_SUBMIT � FORM.DISABLEFUNCTIONS_SUBMIT � ENABLEDFUNCTIONS FORM.ENABLEDFUNCTIONS cfadmin_removeCFFunctions 
 





	 cfadmin_getAllcfFunctions cfadmin_getEnabledcfFunctions _List $(Ljava/lang/Object;)Ljava/util/List;
 � ArrayToList $(Ljava/util/List;)Ljava/lang/String;
  * ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I
  _boolean (J)Z
 � $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag"! n	 $ coldfusion/tagext/io/OutputTag&
' � 'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTag*) n	 , !coldfusion/tagext/lang/IncludeTag. 	cfinclude0 template2 ../include/errors.cfm4 _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;67
 8 setTemplate: b
/; _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z=>
 ? q
<table border="0" cellpadding="0" cellspacing="0">
<tr>
	<td>&nbsp;</td>
	<td nowrap height="25"  bgcolor="#A writeC b java/io/WriterE
FD REQUESTH 	BLUELIGHTJ 5">&nbsp;&nbsp; <a href="javascript:changeTab('dsn')">L (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTagON n	 Q "coldfusion/tagext/lang/ImportedTagS l10nU 
../cftags/W adminY setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V[\
T] &coldfusion/runtime/AttributeCollection_ ida l10n_secdsourcec ([Ljava/lang/Object;)V e
`f setAttributecollection (Ljava/util/Map;)Vhi  coldfusion/tagext/lang/ModuleTagk
lj
l � Data Sourceso
l �
l �
l � M</a> &nbsp;&nbsp;</td>
	<td>&nbsp;</td>
	<td nowrap height="25"  bgcolor="#t 8">&nbsp;&nbsp; <a href="javascript:changeTab('cftags')">v l10n_cftagsx CF Tagsz 	GRAYLIGHT| =">&nbsp;&nbsp; <a href="javascript:changeTab('cffunctions')">~ l10n_cffunctions� CF Functions� L</a> &nbsp;&nbsp;</td>
	<td>&nbsp;</td>
	<td nowrap height="25" bgcolor="#� 7">&nbsp;&nbsp; <a href="javascript:changeTab('files')">� l10n_cfilesdir� 
Files/Dirs� _factor6� �
 � 8">&nbsp;&nbsp; <a href="javascript:changeTab('ipport')">� ipports� Server/Ports� 8">&nbsp;&nbsp; <a href="javascript:changeTab('Others')">� Others� z</a> &nbsp;&nbsp;</td>
</tr>
</table>

<table border="0" cellpadding="0" cellspacing="1" width="100%">
<tr bgcolor="#� i" class="cellBlueTopAndBottom">
	<td height="20"><font class="label">&nbsp;&nbsp; <b class="form-title">� cffunctionPermissions� CF Function Permissions:�  � _compare '(Ljava/lang/Object;Ljava/lang/String;)D��
 � 
			� /*� (� rootsecuritycntx� Root Security Context� )� _factor7� �
 �&
	</b></font></td>
</tr>
<tr >
	<td align="center">
		<table border="0" cellpadding="0" cellspacing="0">
		<tr><td height="5"></td></tr>
		<tr>
			<td nowrap><font class="label">&nbsp;&nbsp;</font></td>
			<td width="210" nowrap><font class="label">&nbsp;<label for="enabledFunctions">� l10n_enfunc� Enabled Functions� �</label></font></td>
			<td width="40" nowrap></td>
			<td width="210" nowrap><font class="label">&nbsp;<label for="disabledFunctions">� l10n_disfunc� Disabled Functions�</label></font></td>
			<td nowrap><font class="label">&nbsp;&nbsp;</font></td>
		</tr>
		<tr><td height="5"></td></tr>
		<tr>
			<td></td>
			<td>
				<select name="enabledFunctions" id="enabledFunctions" size="12" multiple style="width:20em" class="label">
					� ArrayLen (Ljava/lang/Object;)I��
 � 1� _double (Ljava/lang/String;)D��
 �� _Object (D)Ljava/lang/Object;��
 �� 
						<option value="� _arrayGetAt C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object;��
 � ">� 
					� _checkCondition (DDD)Z��
 �v
				</select>
			</td>
			<td align="center">
				<input type="Submit" title="Add" name="disableFunctions_submit" value=">>"><br />
				<input type="Submit" title="Remove"name="addFunctions_submit" value="<<">	<br />
				<br />
			</td>
			<td>
				<select name="disabledFunctions" id="disabledFunctions" size="12" multiple style="width:20em" class="label">
					� 
						� 
							<option value="� a
				</select>
			</td>
		</tr>
		<tr><td height="10"></td></tr>
		</table>
	</td>
</tr>
� finish� var� l10n_finish� Finish� _factor8� �
 � -
<tr class="cellBlueTopAndBottom" bgcolor="#� �">
	<td height="30" colspan="3">
		<table border="0" cellpadding="0" cellspacing="0"><tr>
		<td nowrap><font class="label">&nbsp;&nbsp;</font></td>
		<td><input type="Submit" title="� " class="buttn-fix" value="� �" name="finish"></td>
		</tr></table></td>
</tr>
</table>

<br />
<table border="0" cellpadding="0" cellspacing="0" width="80%">
<tr><td>
<font class="sentance">
� step_functions� �
	Select ColdFusion functions that you want to disable.
	ColdFusion pages in this sandbox cannot use functions that are listed in the Disabled Functions box.
� 7
<br />
<br />
<br />
</font>
</td></tr></table>
� IsDebugMode �
  dump /WEB-INF/cftags SECURITY CONTEXTS
 _resolve �
  9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;�
  cfdump \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;6
 
' � coldfusion/tagext/QueryLoop
 �
 �
' � _factor9 �
  Lcoldfusion/runtime/UDFMethod; Bcf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_GETALLCFFUNCTIONS!
" 	 	 $ registerUDF 3(Ljava/lang/String;Lcoldfusion/runtime/UDFMethod;)V&'
 ( Fcf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_GETENABLEDCFFUNCTIONS*
+ 	 	 - &cfadmin_findFunctionPermissionPosition Ocf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_FINDFUNCTIONPERMISSIONPOSITION0
1 	/ 	 3 &CFADMIN_FINDFUNCTIONPERMISSIONPOSITION5 ?cf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_ADDCFFUNCTIONS7
8 	 � 	 : Bcf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_REMOVECFFUNCTIONS<
= 	 	 ? metaData Ljava/lang/Object;AB	 C 	FunctionsE	"C	+C	1C	8C	=C this &Lcf_cffunctionsoptions2ecfm1096052521; __factorParent out Ljavax/servlet/jsp/JspWriter; value LocalVariableTable LineNumberTable Code module6 $Lcoldfusion/tagext/lang/ImportedTag; mode6 I t6 Ljava/lang/Throwable; t7 t8 t9 t10 t11 module7 mode7 t14 t15 t16 t17 t18 t19 module8 mode8 t22 t23 t24 t25 t26 t27 module9 mode9 t30 t31 t32 t33 t34 t35 java/lang/Throwablex <clinit> silent0  Lcoldfusion/tagext/io/SilentTag; mode0 t12 t13 Ljava/lang/String; Ljava/util/StringTokenizer; t20 output15  Lcoldfusion/tagext/io/OutputTag; mode15 module13 mode13 t28 t29 module14 t36 t37 t38 t39 t40 module10 mode10 module11 mode11 D module12 mode12 t41 varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; include1 #Lcoldfusion/tagext/lang/IncludeTag; module2 mode2 module3 mode3 module4 mode4 module5 mode5 runPage ()Ljava/lang/Object; getMetadata registerUDFs 1                      "     &     *     .     2     6     :     >     B     F     J     m n   ! n   ) n   N n           /     �        AB     � � T   n     &*+,� �� �*+,� �� �*+,� �� �*�   R   *    &LM     &N \    &OP    &QB S       
 � � T  �  $  �,u�G,*I� �YKS� ȸ ζG,��G*�R+� |�T:*�� �VXZ�^�`Y� �YbSY�S�g�m� ��nY6� 6*,� �M,��G�q���� � :� �:*,� �M�� �� :� #�� � #:		�r� � :
� 
�:�s�,u�G,*I� �YKS� ȸ ζG,��G*�R+� |�T:*�� �VXZ�^�`Y� �YbSY�S�g�m� ��nY6� 6*,� �M,��G�q���� � :� �:*,� �M�� �� :� #�� � #:�r� � :� �:�s�,��G,*I� �Y}S� ȸ ζG,��G*�R+� |�T:*�� �VXZ�^�`Y� �YbSY�S�g�m� ��nY6� 6*,� �M,��G�q���� � :� �:*,� �M�� �� :� #�� � #:�r� � :� �:�s�*,¶ j**� -� ������ *,¶ j�*,�� j**� -� ������ �,��G*�R	+� |�T:*�� �VXZ�^�`Y� �YbSY�S�g�m� ��nY6� 6*,� �M,��G�q���� � :� �:*,� �M�� �� : � # �� � #:!!�r� � :"� "�:#�s�#,��G� ,**� -� � ζG*,¶ j*�   x � �y � � �y m � �y � � �y m � �y � � �y � � �y � � �y[wzyzzyP��y���yP��y���y���y���y>Z]y]b]y3}�y���y3}�y���y���y���yA]`y`e`y6��y���y6��y���y���y���y R  j $  �LM    �N \   �OP   �QB   �UV   �WX   �YZ   �[B   �\B   �]Z 	  �^Z 
  �_B   �`V   �aX   �bZ   �cB   �dB   �eZ   �fZ   �gB   �hV   �iX   �jZ   �kB   �lB   �mZ   �nZ   �oB   �pV   �qX   �rZ   �sB   �tB    �uZ !  �vZ "  �wB #S   r  � � � ]� &� �� �� ��@�	�������#�����������&����������������� z  T   � 	    �p� v� x#� v�%+� v�-P� v�R�"Y�#�%�+Y�,�.�1Y�2�4�8Y�9�;�=Y�>�@�`Y� �YFSY� �Y�GSY�HSY�ISY�JSY�KSS�g�D�   R       �LM  S     k  q ] wG } � � �  � T  	� 	 )  �*,f� j*,l� j*� x+� |� ~:*� �� �� �Y6� F*,� �M*,� �� :� � W�� ���� � :� �:*,� �M�� �� :	� #	�� � #:

� �� � :� �:� ��*,�� j**� 1��� �� �*,�� j**� 1��� �� �*,¶ j*/� �Y�S� ȸ �:�:*� �:� �Y� �:� c� �N-� �*,� j*� %*p� �**� I� ��*� �Y**� !� �SY**� 9� �SY**� -� �S� � �*,¶ j�� �� ����*,�� j*,�� j� �**� 1� � �� �*,�� j**� 1� �� �*,¶ j*/� �YS� ȸ �:�:*� �:� �Y� �:� d� �N-� �*,� j*� %*{� �**� E� �*� �Y**� !� �SY**� 9� �SY**� -� �S� � �*,¶ j�� �� ����*,�� j*,� j*,
� j*� =*�� �**� 5� �*� � � �*� A*�� �**� � �*� �Y**� 9� �SY**� -� �S� � �*�� �*�� �**� A� ����� � *� A**� )� � �*,l� j*�%+� |�':*�� �� ��(Y6� *,��� :�>�*,��� :�*�*,��� :��,��G,*I� �YKS� ȸ ζG,��G,**� � � ζG,��G,**� � � ζG,��G*�R� |�T:*� �VXZ�^�`Y� �YbSY�S�g�m� ��nY6� 6*,� �M,��G�q���� � :� �:*,� �M�� �� :� &�)�� � #:�r� � : �  �:!�s�!, �G*�� �*�� �*,�� j*�R� |�T:"*�� �"�^**I� �Y	SYS�� �Y**� 9� �SY**� -� �S�:#�#�W"�`Y� �Y�SY#S�g�m"� �"�@� :$� M$�*,� j*,� j������ :%� #%�� � #:&&�� � :'� '�:(��(*� # 3 N by T _ by b g by ( N �y T � �y � � �y ( N �y T � �y � � �y � � �y � � �y'*y*/*y MYySVYy MhySVhyYehyhmhy8_y>L_yR`_yfM_yS)_y/S_yY\_y8ny>LnyR`nyfMnyS)ny/SnyY\ny_knynsny R  � )  �LM    �N \   �OP   �QB   �{|   �}X   �YB   �[Z   �\B   �]B 	  �^Z 
  �_Z   �~B   ��   �b�   �c    �d�   �e�   �f�   �g    ���   ���   ��X   �kB   �lB   �mB   ��V   ��X   ��Z   ��B   �rB   �sZ   �tZ    �uB !  ��V "  �wB #  ��B $  ��B %  ��Z &  ��Z '  ��B (S  n [     �m �m �m �m �m �n �n �n �n �n �o �o0pApLpWp0p0p%p%pwo �o �n�x�x�x�x�x�y�y�y�y�y�z�z
{{'{2{
{
{�{�{Rz�z�y�x �mw�w�w�l�����������������������������������l�n�n�m��������������������������������  � � T   >     *�   R   *    LM     N \    OP    QB     T   #     *� 
�   R       LM   � � T  �  *  �,��G*�R
+� |�T:*�� �VXZ�^�`Y� �YbSY�S�g�m� ��nY6� 6*,� �M,��G�q���� � :� �:*,� �M�� �� :� #�� � #:		�r� � :
� 
�:�s�,��G*�R+� |�T:*�� �VXZ�^�`Y� �YbSY�S�g�m� ��nY6� 6*,� �M,��G�q���� � :� �:*,� �M�� �� :� #�� � #:�r� � :� �:�s�,öG9*ƶ �**� A� �Ǉ9ɸ�9��N*K� �:-� � ^,ӶG,**� A**� M� �׸ ζG,ٶG,**� A**� M� �׸ ζG*,۶ jc\9��N-� ��� ��ߚ��,�G9*Ҷ �**� )� �Ǉ9ɸ�9��N*K� �:!!-� � �*,� j*Ӷ �*Ӷ �**� A� ��**� )**� M� �׸ θ�� �� G,�G,**� )**� M� �׸ ζG,ٶG,**� )**� M� �׸ ζG*,� j*,۶ jc\9��N!-� ��� ��ߚ�Q,�G*�R+� |�T:"*޶ �"VXZ�^"�`Y� �YbSY�SY�SY�S�g�m"� �"�nY6#� 6*"#,� �M,�G"�q���� � :$� $�:%*#,� �M�%"� �� :&� #&�� � #:'"'�r� � :(� (�:)"�s�)*�  Y u xy x } xy N � �y � � �y N � �y � � �y � � �y � � �y9<y<A<y\hybehy\wybewyhtwyw|wy���y���yy��y���yy��y���y���y���y R  j $  �LM    �N \   �OP   �QB   ��V   ��X   �YZ   �[B   �\B   �]Z 	  �^Z 
  �_B   ��V   ��X   �bZ   �cB   �dB   �eZ   �fZ   �gB   ���   �j�   �l�   �n    �o�   ���   �s�   �u  !  ��V "  ��X #  ��Z $  ��B %  ��B &  ��Z '  ��Z (  ��B )S   � 0 >� �� ����������������������������+���?�?�?�?�M����������������������������������������5�]�i�&�    T   �     �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M�   R        �LM     ���    ���  � � T  �  %  �*,� j*�-+� |�/:*�� �135�9�<� ��@� �,B�G,*I� �YKS� ȸ ζG,M�G*�R+� |�T:*�� �VXZ�^�`Y� �YbSYdS�g�m� ��nY6� 6*,� �M,p�G�q���� � :� �:*,� �M�� �� :	� #	�� � #:

�r� � :� �:�s�,u�G,*I� �YKS� ȸ ζG,w�G*�R+� |�T:*�� �VXZ�^�`Y� �YbSYyS�g�m� ��nY6� 6*,� �M,{�G�q���� � :� �:*,� �M�� �� :� #�� � #:�r� � :� �:�s�,u�G,*I� �Y}S� ȸ ζG,�G*�R+� |�T:*�� �VXZ�^�`Y� �YbSY�S�g�m� ��nY6� 6*,� �M,��G�q���� � :� �:*,� �M�� �� :� #�� � #:�r� � :� �:�s�,��G,*I� �YKS� ȸ ζG,��G*�R+� |�T:*�� �VXZ�^�`Y� �YbSY�S�g�m� ��nY6� 6*,� �M,��G�q���� � :� �: *,� �M� � �� :!� #!�� � #:""�r� � :#� #�:$�s�$*�   � � �y � � �y � �y � �y � �y � �yyy���y���y���y���y���y���y���y���yz��y���yo��y���yo��y���y���y���y\x{y{�{yQ��y���yQ��y���y���y���y R  t %  �LM    �N \   �OP   �QB   ���   ��V   ��X   �[Z   �\B   �]B 	  �^Z 
  �_Z   �~B   ��V   ��X   �cZ   �dB   �eB   �fZ   �gZ   ��B   ��V   ��X   �kZ   �lB   �mB   �nZ   �oZ   ��B   ��V   ��X   �sZ   �tB    �uB !  �vZ "  �wZ #  ��B $S   Z  %� � G� G� F� �� e�)�)�(�}�G���
�_�)�������A�� �� T   p     (*� T� ZL*� ^N*`� d*-+�� �*+l� j�   R   *    (LM     (OP    (QB    ( [ \ S         � � T   >     *�   R   *    LM     N \    OP    QB   � � T   >     *�   R   *    LM     N \    OP    QB  �� T   "     �D�   R       LM   �  T   M     /*3�%�)*�.�)*6�4�)*G�;�)*C�@�)�   R       /LM         N    O����  - � 
SourceFile VE:\cf9_updates_rc\cfusion\wwwroot\CFIDE\administrator\security\_cffunctionsoptions.cfm Ocf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_FINDFUNCTIONPERMISSIONPOSITION  coldfusion/runtime/UDFMethod  <init> ()V  
  	 com.adobe.coldfusion.*  bindImportPath (Ljava/lang/String;)V   coldfusion/runtime/CfJspPage 
   coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	    PERMISSIONS " 1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  $
  % APOS ' pageContext #Lcoldfusion/runtime/NeoPageContext; ) *	  + getOut ()Ljavax/servlet/jsp/JspWriter; - . javax/servlet/jsp/PageContext 0
 1 / parent Ljavax/servlet/jsp/tagext/Tag; 3 4	  5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 _setCurrentLineNo (I)V = >
  ? ArrayNew (I)Ljava/util/List; A B coldfusion/runtime/CFPage D
 E C set (Ljava/lang/Object;)V G H coldfusion/runtime/Variable J
 K I 0 M request.security.contexts O 	IsDefined (Ljava/lang/String;)Z Q R
 E S REQUEST U java/lang/String W SECURITY Y CONTEXTS [ _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; ] ^
  _ IsStruct (Ljava/lang/Object;)Z a b
 E c _resolve e ^
  f java/lang/Object h _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; j k
  l _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; n o
  p 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; r s
 E t I v 1 x _set '(Ljava/lang/String;Ljava/lang/Object;)V z {
  | &(Ljava/lang/String;)Ljava/lang/Object; j ~
   C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; n �
  � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; ] �
  � %coldfusion.runtime.FunctionPermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
  � _double (Ljava/lang/Object;)D � �
 � � _Object (D)Ljava/lang/Object; � �
 � � ArrayLen (Ljava/lang/Object;)I � �
 E � (I)Ljava/lang/Object; � �
 � � '(Ljava/lang/Object;Ljava/lang/Object;)D � �
  � WEBAPP � 	DIRECTORY � &cfadmin_findFunctionPermissionPosition � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � version � 1,  January 10, 2002 � hint � >utility udf, Find the array position in the permissions array. � author � "Mike Nimer (mnimer@macromedia.com) � param � /directory - working security context/directory. � return � *Returns the permissions array index (int). � 
Parameters � NAME � webapp � REQUIRED � false � ([Ljava/lang/Object;)V  �
 � � 	directory � getName ()Ljava/lang/String; this QLcf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_FINDFUNCTIONPERMISSIONPOSITION; LocalVariableTable Code runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> getParamList ()[Ljava/lang/String; getMetadata ()Ljava/lang/Object; 1       � �     � �  �   !     ��    �        � �    � �  �  �    P-� +� � :+� !,� :	+#� &:
+(� &:-� ,� 2:-� 6:� <:� <:
-J� @-� F� LN� L-M� @-P� T� a-O� @-V� XYZSY\S� `� d� @
-Q� @--V� XYZSY\S� g� iY-� mSY-� mS� q� u� L-wy� }� H--
-w� �� �� �� XY�S� ��� ��� -w� �� L-w-w� �� �c� �� }-w� �-X� @-
� m� �� �� ��t|����-� m��    �   �   P � �    P � �   P � �   P � �   P � �   P � �   P � �   P 3 4   P  �   P  � 	  P " � 
  P ' �   P � �   P � �  �   � 5 G @G JJ TJ SJ SJ [K ]K ]K jM iM yO yO yO �Q �Q �Q �Q �Q �Q �Q �Q �P yO yN iM �X �X �X �[ �[ �[]]]\ �[ �YXXXXXX X-X-X-X X �XGaGaGa  �   �   �     �� �Y� iY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY�SY�SY� iY� �Y� iY�SY�SY�SY�S� �SY� �Y� iY�SY�SY�SY�S� �SS� ճ ��    �       � � �    � �  �   -     � XY�SY�S�    �        � �    � �  �   "     � ��    �        � �       �   #     *� 
�    �        � �        ����  - 
SourceFile VE:\cf9_updates_rc\cfusion\wwwroot\CFIDE\administrator\security\_cffunctionsoptions.cfm Bcf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_REMOVECFFUNCTIONS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 com.adobe.coldfusion.*  bindImportPath (Ljava/lang/String;)V   coldfusion/runtime/CfJspPage 
   coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	    	TARGETPOS " 1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  $
  % I ' PERMISSIONS ) ARRAYPOS + 
TARGETTEMP - TARGET / pageContext #Lcoldfusion/runtime/NeoPageContext; 1 2	  3 getOut ()Ljavax/servlet/jsp/JspWriter; 5 6 javax/servlet/jsp/PageContext 8
 9 7 parent Ljavax/servlet/jsp/tagext/Tag; ; <	  = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A 1 E set (Ljava/lang/Object;)V G H coldfusion/runtime/Variable J
 K I _setCurrentLineNo (I)V M N
  O ArrayNew (I)Ljava/util/List; Q R coldfusion/runtime/CFPage T
 U S   W 0 Y request.security.contexts [ 	IsDefined (Ljava/lang/String;)Z ] ^
 U _ REQUEST a java/lang/String c SECURITY e CONTEXTS g _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; i j
  k IsStruct (Ljava/lang/Object;)Z m n
 U o _resolve q j
  r java/lang/Object t _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; v w
  x _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; z {
  | 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; ~ 
 U � &CFADMIN_FINDFUNCTIONPERMISSIONPOSITION � _get &(Ljava/lang/String;)Ljava/lang/Object; � �
  � &cfadmin_findFunctionPermissionPosition � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
  � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; z �
  � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; i �
  � * � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
  � *- � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � LCase &(Ljava/lang/String;)Ljava/lang/String; � �
 U � concat � �
 d � Left '(Ljava/lang/String;I)Ljava/lang/String; � �
 U � RemoveChars ((Ljava/lang/String;II)Ljava/lang/String; � �
 U � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I � �
 U � _Object (I)Ljava/lang/Object; � �
 � � (Ljava/lang/Object;D)D � �
  � 
ListAppend 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 U � _structSetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V � �
  � _LhsResolve � j
  � _arraySetAt � �
  � FUNCTIONTOREMOVE � WEBAPP � 	DIRECTORY � cfadmin_removeCFFunctions � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � version � 1,  January 06, 2002 � hint � �remove a single cftag from the permissions array  it will also handle the * wildcard. If the permissions array is handling all the tags with the wildcard. When you remove a tag. it will also remove the wildcard and add all of the remaining tags. � author � "Mike Nimer (mnimer@macromedia.com) � param � a2 - directory � return � Returns the permissions array. � 
Parameters � NAME � functionToRemove � REQUIRED � false � ([Ljava/lang/Object;)V  �
 � � webapp � 	directory getName ()Ljava/lang/String; this DLcf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_REMOVECFFUNCTIONS; LocalVariableTable Code runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> getParamList ()[Ljava/lang/String; getMetadata ()Ljava/lang/Object; 1       � �        !     հ             	
   � 	   �-� +� � :+� !,� :	+#� &:
+(� &:+*� &:+,� &:+.� &:+0� &:-� 4� ::-� >:� D:� D:� D:F� L- �� P-� V� LF� LX� L
Z� LX� L-� P-\� `� a-� P-b� dYfSYhS� l� p� @-� P--b� dYfSYhS� s� uY-� ySY-� yS� }� �� L-� P-�� ��-� uY-� ySY-� yS� �� L---� y� �� �� dY0S� �� L-� y�� ��� 8�� L-� y� �-� P-� y� �� �� �� L� �-� P-� y� �� ��� ��� �-� P-� y� �� �� L
-� P-� y� �-� P-� y� �� �� �� �� L-
� y� ��� .-#� P-� y� �-#� P-� y� �� �� ö L---� y� �� �� dY0S-� y� �-.� P-\� `� W-0� P-b� dYfSYhS� l� p� 6-b� dYfSYhS� �� uY-� ySY-� yS-� y� �-� y��      �   �    �   � �   �   �   �   � �   � ; <   �    �  	  � " 
  � '   � )   � +   � -   � /   � �   � �   � �   � {  � ` � r � t � t � y � � � � � � � � � � � � � � � � � � � � � � � � � �  �  �  � � � � � � � � � � � � � � � �,5HDDBciuus||����||zs���������������������  ##/#/#/#/####! ���cE(Z(Z(A(k.j.z0z0z0�2�2�2�2�2�2�1z0z/j.�8�8�8      �     Ȼ �Y� uY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY�SY�SY� uY� �Y� uY�SY�SY�SY�S� �SY� �Y� uY�SY SY�SY�S� �SY� �Y� uY�SYSY�SY�S� �SS� �� ٱ          �       2     � dY�SY�SY�S�                 "     � ٰ                   #     *� 
�                  ����  - � 
SourceFile VE:\cf9_updates_rc\cfusion\wwwroot\CFIDE\administrator\security\_cffunctionsoptions.cfm Bcf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_GETALLCFFUNCTIONS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 com.adobe.coldfusion.*  bindImportPath (Ljava/lang/String;)V   coldfusion/runtime/CfJspPage 
   coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	    pageContext #Lcoldfusion/runtime/NeoPageContext; " #	  $ getOut ()Ljavax/servlet/jsp/JspWriter; & ' javax/servlet/jsp/PageContext )
 * ( parent Ljavax/servlet/jsp/tagext/Tag; , -	  . 
AFUNCTIONS 0 _setCurrentLineNo (I)V 2 3
  4 ArrayNew (I)Ljava/util/List; 6 7 coldfusion/runtime/CFPage 9
 : 8 _set '(Ljava/lang/String;Ljava/lang/Object;)V < =
  > _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; @ A
  B _List $(Ljava/lang/Object;)Ljava/util/List; D E coldfusion/runtime/Cast G
 H F CreateObject J ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z L M
 : N CreateObject(COM) P CreateObject(CORBA) R CreateObject(Java) T CreateObject(.NET) V CreateObject(WebService) X DirectoryExists Z 
ExpandPath \ FileOpen ^ 
FileExists ` FileCopy b FileMove d 
FileDelete f FileRead h 
FileUpload j FileUploadAll l 	FileWrite n FileSetAttribute p FileSetAccessmode r FileSetLastModified t GetFileInfo v DirectoryCreate x DirectoryList z _factor0 j(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;Lcoldfusion/runtime/CFPage;)Ljava/lang/Object; | }
  ~ DirectoryDelete � DirectoryRename � GetDirectoryFromPath � GetFileFromPath � GetGatewayHelper � GetPrinterInfo � GetProfileString � GetTempDirectory � GetTempFile � GetTemplatePath � GetBaseTemplatePath � LoadCFObject � SaveCFObject � SendGatewayMessage � SetProfileString � CacheGetSession � CachePut � CacheGet � CacheGetMetadata � CacheGetAllIds � CacheRemove � CacheSetProperties � CacheGetProperties � 
textnocase � asc � 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z � �
 : � _factor1 � }
  � java/lang/String � cfadmin_getAllcfFunctions � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � java/lang/Object � name � version � 1,  January 06, 2002 � hint � return a hard coded array � author � "Mike Nimer (mnimer@macromedia.com) � param � - none � return � Returns an array. � 
Parameters � ([Ljava/lang/Object;)V  �
 � � getName ()Ljava/lang/String; this DLcf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_GETALLCFFUNCTIONS; LocalVariableTable Code __factorParent out Ljavax/servlet/jsp/JspWriter; 
parentPage Lcoldfusion/runtime/CFPage; value LineNumberTable runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance __arguments 'Lcoldfusion/runtime/ArgumentCollection; Lcoldfusion/runtime/Variable; <clinit> getParamList ()[Ljava/lang/String; getMetadata ()Ljava/lang/Object; 1       � �     � �  �   !     ��    �        � �    | }  �  �    -1-� 5-� ;� ?-� 5--1� C� IK� OW-� 5--1� C� IQ� OW-� 5--1� C� IS� OW-� 5--1� C� IU� OW-� 5--1� C� IW� OW-� 5--1� C� IY� OW-� 5--1� C� I[� OW- � 5--1� C� I]� OW-!� 5--1� C� I_� OW-"� 5--1� C� Ia� OW-#� 5--1� C� Ic� OW-$� 5--1� C� Ie� OW-%� 5--1� C� Ig� OW-&� 5--1� C� Ii� OW-'� 5--1� C� Ik� OW-(� 5--1� C� Im� OW-)� 5--1� C� Io� OW-*� 5--1� C� Iq� OW-+� 5--1� C� Is� OW-,� 5--1� C� Iu� OW--� 5--1� C� Iw� OW-.� 5--1� C� Iy� OW-/� 5--1� C� I{� OW-�    �   4    � �     � -    � �    � �    � �  �  : � 
  	  	         !  !      .  .  7  7  -  -  D  D  M  M  C  C  Z  Z  c  c  Y  Y  p  p  y  y  o  o  �  �  �  �  �  �  �  �  �  �  �  �  �   �   �   �   �   �   � ! � ! � ! � ! � ! � ! � " � " � " � " � " � " � # � # � # � # � # � #
 $
 $ $ $	 $	 $  %  %) %) % % %6 &6 &? &? &5 &5 &L 'L 'U 'U 'K 'K 'b (b (k (k (a (a (x )x )� )� )w )w )� *� *� *� *� *� *� +� +� +� +� +� +� ,� ,� ,� ,� ,� ,� -� -� -� -� -� -� .� .� .� .� .� .� /� / / /� /� /  � �  �   �  
   Q-� +� � :+� !,� :	-� %� +:-� /:*-� � �*-� �� �-1� C��    �   f 
   Q � �     Q � �    Q � �    Q � �    Q � �    Q � �    Q � �    Q , -    Q  �    Q  � 	 �       *  H P H P H P  �   �   ~     `� �Y� �Y�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY�SY�SY� �S� ߳ ��    �       ` � �    � �  �   #     � ��    �        � �    � �  �   "     � ��    �        � �    � }  �  �    -0� 5--1� C� I�� OW-1� 5--1� C� I�� OW-2� 5--1� C� I�� OW-3� 5--1� C� I�� OW-4� 5--1� C� I�� OW-5� 5--1� C� I�� OW-6� 5--1� C� I�� OW-7� 5--1� C� I�� OW-8� 5--1� C� I�� OW-9� 5--1� C� I�� OW-:� 5--1� C� I�� OW-;� 5--1� C� I�� OW-<� 5--1� C� I�� OW-=� 5--1� C� I�� OW->� 5--1� C� I�� OW-A� 5--1� C� I�� OW-B� 5--1� C� I�� OW-C� 5--1� C� I�� OW-D� 5--1� C� I�� OW-E� 5--1� C� I�� OW-F� 5--1� C� I�� OW-G� 5--1� C� I�� OW-H� 5--1� C� I�� OW-O� 5-1� C� I��� �W-�    �   4    � �     � -    � �    � �    � �  �  B �  0  0  0  0  0  0  1  1 & 1 & 1  1  1 3 2 3 2 < 2 < 2 2 2 2 2 I 3 I 3 R 3 R 3 H 3 H 3 _ 4 _ 4 h 4 h 4 ^ 4 ^ 4 u 5 u 5 ~ 5 ~ 5 t 5 t 5 � 6 � 6 � 6 � 6 � 6 � 6 � 7 � 7 � 7 � 7 � 7 � 7 � 8 � 8 � 8 � 8 � 8 � 8 � 9 � 9 � 9 � 9 � 9 � 9 � : � : � : � : � : � : � ; � ; ; ; � ; � ; < < < < < <% =% =. =. =$ =$ =; >; >D >D >: >: >Q AQ AZ AZ AP AP Ag Bg Bp Bp Bf Bf B} C} C� C� C| C| C� D� D� D� D� D� D� E� E� E� E� E� E� F� F� F� F� F� F� G� G� G� G� G� G� H� H� H� H� H� H  O  O	 O O  O  O     �   #     *� 
�    �        � �        ����  -3 
SourceFile VE:\cf9_updates_rc\cfusion\wwwroot\CFIDE\administrator\security\_cffunctionsoptions.cfm ?cf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_ADDCFFUNCTIONS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 com.adobe.coldfusion.*  bindImportPath (Ljava/lang/String;)V   coldfusion/runtime/CfJspPage 
   coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	    	TARGETPOS " 1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  $
  % PERMISSIONS ' AENABLEDCFFUNCTIONS ) ARRAYPOS + 
TARGETTEMP - TARGET / pageContext #Lcoldfusion/runtime/NeoPageContext; 1 2	  3 getOut ()Ljavax/servlet/jsp/JspWriter; 5 6 javax/servlet/jsp/PageContext 8
 9 7 parent Ljavax/servlet/jsp/tagext/Tag; ; <	  = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _setCurrentLineNo (I)V E F
  G ArrayNew (I)Ljava/util/List; I J coldfusion/runtime/CFPage L
 M K set (Ljava/lang/Object;)V O P coldfusion/runtime/Variable R
 S Q CFADMIN_GETENABLEDCFFUNCTIONS U _get &(Ljava/lang/String;)Ljava/lang/Object; W X
  Y cfadmin_getEnabledcfFunctions [ java/lang/Object ] _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; _ `
  a 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; c d
  e _List $(Ljava/lang/Object;)Ljava/util/List; g h coldfusion/runtime/Cast j
 k i ArrayToList $(Ljava/util/List;)Ljava/lang/String; m n
 M o 1 q   s 0 u request.security.contexts w 	IsDefined (Ljava/lang/String;)Z y z
 M { REQUEST } java/lang/String  SECURITY � CONTEXTS � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
  � IsStruct (Ljava/lang/Object;)Z � �
 M � _resolve � �
  � _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
  � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 M � &CFADMIN_FINDFUNCTIONPERMISSIONPOSITION � &cfadmin_findFunctionPermissionPosition � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; � �
  � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 k � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
  � * � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 k � Left '(Ljava/lang/String;I)Ljava/lang/String; � �
 M � *- � RemoveChars ((Ljava/lang/String;II)Ljava/lang/String; � �
 M � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I � �
 M � _Object (I)Ljava/lang/Object; � �
 k � Val (Ljava/lang/String;)D � �
 M � (D)Ljava/lang/Object; � �
 k � (Ljava/lang/Object;D)D � �
  � _int (Ljava/lang/Object;)I � �
 k � ListDeleteAt � �
 M � ListLen (Ljava/lang/String;)I � �
 M � concat &(Ljava/lang/String;)Ljava/lang/String; � �
 � � _structSetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V � �
  � _LhsResolve � �
  � _arraySetAt � �
  � FUNCTIONTOADD � WEBAPP � 	DIRECTORY � cfadmin_addCFFunctions � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � version � 1,  January 06, 2002 � hint � +add a single cftag to the permissions array � author � "Mike Nimer (mnimer@macromedia.com) � param a2 - directory return Returns the permissions array. 
Parameters	 NAME functionToAdd REQUIRED false ([Ljava/lang/Object;)V 
 � webapp 	directory getName ()Ljava/lang/String; this ALcf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_ADDCFFUNCTIONS; LocalVariableTable Code runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> getParamList ()[Ljava/lang/String; getMetadata ()Ljava/lang/Object; 1       � �        !     �              !   / 	   )-� +� � :+� !,� :	+#� &:
+(� &:+*� &:+,� &:+.� &:+0� &:-� 4� ::-� >:� D:� D:� D:- �� H-� N� T- �� H- �� H-V� Z\-� ^Y-� bSY-� bS� f� l� p� Tr� Tt� T
v� Tt� T- �� H-x� |� a- �� H-~� �Y�SY�S� �� �� @- �� H--~� �Y�SY�S� �� ^Y-� bSY-� bS� �� �� T- �� H-�� Z�-� ^Y-� bSY-� bS� f� T---� b� �� �� �Y0S� �� T-� b�� ��� � �- �� H-� b� �� ��� ��� �- ¶ H-� b� �� �� T
- ö H-� b� �-� b� �� �� �� T- Ķ H-
� b� �� Ÿ �� ��� $- ƶ H-� b� �-
� b� ϸ Ҷ T- ˶ H-� b� �� ָ �� ��� �� T� $�� T-� b� �-� b� �� ڶ T� 
�� T---� b� �� �� �Y0S-� b� �- ۶ H-x� |� W- ݶ H-~� �Y�SY�S� �� �� 6-~� �Y�SY�S� �� ^Y-� bSY-� bS-� b� �-� b��      �   )    )"#   )$ �   )%&   )'(   ))*   )+ �   ) ; <   ) ,   ) , 	  ) ", 
  ) ',   ) ),   ) +,   ) -,   ) /,   ) �,   ) �,   ) �, -  . �  � ` � r � | � { � { � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �/ �8 � � � � � � � � � � � � �Q �` �i �Q �Q �H �| �x �x �v �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � �. �. �7 �7 �. �. �% �% � �M �M �M �\ �g �g �e �e �q �q �o �x �x �� �� �x �x �v �o �o �M �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � �� �� �� �� �� �  �  �  � .     �     ػ �Y� ^Y�SY�SY�SY�SY�SY�SY�SY SYSY	SY
SYSY
SY� ^Y� �Y� ^YSYSYSYS�SY� �Y� ^YSYSYSYS�SY� �Y� ^YSYSYSYS�SS�� �          �   /0    2     � �Y�SY�SY�S�             12    "     � �                   #     *� 
�                  ����  -6 
SourceFile VE:\cf9_updates_rc\cfusion\wwwroot\CFIDE\administrator\security\_cffunctionsoptions.cfm Fcf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_GETENABLEDCFFUNCTIONS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 com.adobe.coldfusion.*  bindImportPath (Ljava/lang/String;)V   coldfusion/runtime/CfJspPage 
   coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	    I " 1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  $
  % AENABLEDFUNCTIONS ' 	ADISABLED ) ANEWENABLED + PERMISSIONS - ARRAYPOS / AENABLED 1 pageContext #Lcoldfusion/runtime/NeoPageContext; 3 4	  5 getOut ()Ljavax/servlet/jsp/JspWriter; 7 8 javax/servlet/jsp/PageContext :
 ; 9 parent Ljavax/servlet/jsp/tagext/Tag; = >	  ? getVariable  (I)Lcoldfusion/runtime/Variable; A B %coldfusion/runtime/ArgumentCollection D
 E C _setCurrentLineNo (I)V G H
  I ArrayNew (I)Ljava/util/List; K L coldfusion/runtime/CFPage N
 O M set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S 1 W   Y request.security.contexts [ 	IsDefined (Ljava/lang/String;)Z ] ^
 O _ REQUEST a java/lang/String c SECURITY e CONTEXTS g _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; i j
  k IsStruct (Ljava/lang/Object;)Z m n
 O o _resolve q j
  r java/lang/Object t _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; v w
  x _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; z {
  | 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; ~ 
 O � &CFADMIN_FINDFUNCTIONPERMISSIONPOSITION � _get &(Ljava/lang/String;)Ljava/lang/Object; � �
  � &cfadmin_findFunctionPermissionPosition � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
  � TARGET � C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object; z �
  � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; i �
  � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
  � v �
  � * � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � ListToArray $(Ljava/lang/String;)Ljava/util/List; � �
 O � Left '(Ljava/lang/String;I)Ljava/lang/String; � �
 O � *- � 	_contains '(Ljava/lang/String;Ljava/lang/String;)Z � �
  � Replace J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 O � CFADMIN_GETALLCFFUNCTIONS � cfadmin_getAllcfFunctions � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I � �
 O � _boolean (J)Z � �
 � � _List $(Ljava/lang/Object;)Ljava/util/List; � �
 � � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z � �
 O � _double (Ljava/lang/Object;)D � �
 � � _Object (D)Ljava/lang/Object; � �
 � � ArrayLen (Ljava/lang/Object;)I � �
 O � (I)Ljava/lang/Object; � �
 � � '(Ljava/lang/Object;Ljava/lang/Object;)D � �
  � 
textnocase � asc � 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z � �
 O � WEBAPP � 	DIRECTORY � cfadmin_getEnabledcfFunctions � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � version � 1,  January 06, 2002 � hint � SLoop through the security context and build an array of tags that have been enabled  author "Mike Nimer (mnimer@macromedia.com) param a2 - directory return
  Returns an array of enabled tag. 
Parameters NAME webapp REQUIRED false ([Ljava/lang/Object;)V 
 � 	directory getName ()Ljava/lang/String; this HLcf_cffunctionsoptions2ecfm1096052521$funcCFADMIN_GETENABLEDCFFUNCTIONS; LocalVariableTable Code runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> getParamList ()[Ljava/lang/String; getMetadata ()Ljava/lang/Object; 1       � �     "   !     �   !           #$ "  � 	   �-� +� � :+� !,� :	+#� &:
+(� &:+*� &:+,� &:+.� &:+0� &:+2� &:-� 6� <:-� @:� F:� F:-_� J-� P� V-`� J-� P� V
X� VX� VZ� V-d� J-� P� V-e� J-� P� V-h� J-\� `� _-j� J-b� dYfSYhS� l� p� ?-l� J--b� dYfSYhS� s� uY-� ySY-� yS� }� �� V-s� J-�� ��-� uY-� ySY-� yS� �� V-�---� y� �� �� dY�S� �� �-�� ��� ��� #-z� J-�� �� �� �� V� �-{� J-�� �� �� ��� �� �-� J-�� �� ��Z� �� V- �� J-�� ��-� u� �� V
X� V� b- �� J-� y� �--
� y� �� �� Ņ� ��� $- �� J--� y� �--
� y� �� �W
-
� y� �c� ٶ V-
� y- �� J-� y� ݸ � ��t|����-� y� V- �� J-� y� ��� �W-� y��   !   �   �     �%&   �' �   �()   �*+   �,-   �. �   � = >   � /   � / 	  � "/ 
  � '/   � )/   � +/   � -/   � //   � 1/   � �/   � �/ 0   �  ] h ] r _ { _ z _ z _ � ` � ` � ` � ` � a � a � a � b � b � b � c � c � c � d � d � d � d � e � e � e � e � h � h � j � j � j � l l" l � l � l � l � l � l � k � j � i � h: sI sR s: s: s2 sf vb vb v_ v� w� w� z� z� z� z� z� x� {� {� {� {� {� {� {� � � � � � � � �� �� �� �� �� �� � � � � � � � � �: �: �F �C �C �9 �9 �9 � � �U �U �^ �U �U �S �f �s �s �s �f �� �� �� �� �� {� {� {� w� �� �� �� �� �� �� �� �� � 1  "   �     �� �Y� uY�SY�SY�SY�SY�SYSYSYSYSY		SY
SYSYSY� uY� �Y� uYSYSYSYS�SY� �Y� uYSYSYSYS�SS�� ��   !       �    23 "   -     � dY�SY�S�   !           45 "   "     � ��   !              "   #     *� 
�   !                