����  -� 
SourceFile JE:\cf9_updates_rc\cfusion\wwwroot\CFIDE\administrator\entman\addserver.cfm cfaddserver2ecfm915124676  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   ISMULTISERVERINSTANCEAVAILABLE Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   CANCELX   	   REQUEST   	    
ADD_BUTTON " " 	  $ JRUNROOTDIR & & 	  ( IPADD * * 	  , LOCALE . . 	  0 REMOTESERVERNAME 2 2 	  4 URL 6 6 	  8 SVROBJ : : 	  < FILESEPARATOR > > 	  @ JRUN B B 	  D JRUNSERVERROOT F F 	  H FEATURE_NOT_AVAILABLE_MSG J J 	  L RPRT N N 	  P com.macromedia.SourceModTime  )�3� pageContext #Lcoldfusion/runtime/NeoPageContext; U V	  W getOut ()Ljavax/servlet/jsp/JspWriter; Y Z javax/servlet/jsp/PageContext \
 ] [ parent Ljavax/servlet/jsp/tagext/Tag; _ `	  a com.adobe.coldfusion.* c bindImportPath (Ljava/lang/String;)V e f
  g 

 i _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V k l
  m 
 o _checkCFImport q 
  r 


 t REQUEST.LOCALE v en x checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V z {
  | isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z ~ 
  � java/lang/String � _setCurrentLineNo (I)V � �
  � _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � Trim &(Ljava/lang/String;)Ljava/lang/String; � �
  � LCase � �
  � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
  � 
LOCALEFILE � java/lang/StringBuffer � resources/entman_ �  f
 � � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
  � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 � � .xml � toString ()Ljava/lang/String; � � java/lang/Object �
 � � $class$coldfusion$tagext$io$OutputTag Ljava/lang/Class; coldfusion.tagext.io.OutputTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � coldfusion/tagext/io/OutputTag � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 � � 
	 � 
SERVERNAME � URL.SERVERNAME �  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z � �
  � 
		 � (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag � � �	  � "coldfusion/tagext/lang/ImportedTag � l10n � 
../cftags/ � admin � setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V � �
 � � &coldfusion/runtime/AttributeCollection � id � entman_pagename_editserver � var � pagename � ([Ljava/lang/Object;)V  �
 � � setAttributecollection (Ljava/util/Map;)V � �  coldfusion/tagext/lang/ModuleTag �
 � �
 � � 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;
  Edit Server:  write f java/io/Writer

	 doAfterBody �
 � _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;
  doEndTag � #javax/servlet/jsp/tagext/TagSupport
 doCatch (Ljava/lang/Throwable;)V
 � 	doFinally 
 � entman_pagename_addserver  
Add Server"
 � coldfusion/tagext/QueryLoop%
&
&
 � 'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTag+* �	 - !coldfusion/tagext/lang/IncludeTag/ 	cfinclude1 template3 ../header.cfm5 _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;78
 9 setTemplate; f
0< _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z>?
 @ ../include/margintop.cfmB _getD �
 E IsMultiServerInstanceAvailableG 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;IJ
 K _boolean (Ljava/lang/Object;)ZMN
 �O 

	<br>
	Q ../include/marginbottom.cfmS ../footer.cfmU %class$coldfusion$tagext$lang$AbortTag coldfusion.tagext.lang.AbortTagXW �	 Z coldfusion/tagext/lang/AbortTag\ %class$coldfusion$tagext$lang$ParamTag coldfusion.tagext.lang.ParamTag_^ �	 a coldfusion/tagext/lang/ParamTagc cfparame defaultg addlocali \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;7k
 l 
setDefault (Ljava/lang/Object;)Vno
dp namer url.servertypet � f
dv typex stringz setType| f
d} 
SERVERTYPE _compare '(Ljava/lang/Object;Ljava/lang/String;)D��
 �  
	<p><font class="sentance">
	� entman_description� h
		ColdFusion Enterprise lets you create and manage multiple ColdFusion servers on the same computer
	� 
	</font></p>



	� java� jrunx.kernel.JRun� CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;��
 � set�o coldfusion/runtime/Variable�
�� getRootDirectory� _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;��
 � java.io.File� _Map #(Ljava/lang/Object;)Ljava/util/Map;��
 �� SEPARATORCHAR� 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; ��
 � concat� �
 �� servers� _serverexists� $The following server name is in use:� �
	<script>
		var keepDefault = true;
		function writeToServerDir(name) {
			if (keepDefault) {
				var dir = document.forms[0].elements.directory.value;
				dir = '� JSStringFormat� �
 ��' + name;
				document.forms[0].elements.directory.value = dir;
			}
		}

		function yourjobnow() {
			keepDefault = false;
		}

		function wopen(formelem) {
			window.open("../filedialog/index.cfm?fromjscript=true&formelem=" + formelem, "NewWindow","height=500,width=600,dependent=true,resizable=yes");
		}

	</script>

	<form action="processaddserver.cfm" method="post" onsubmit="writeToServerDir(forms[0].elements.serverName.value);">
	� _addserver.cfm� 
	</form>
	� 	editlocal� :
	<form action="processeditserver.cfm" method="post">
		� _editserver.cfm� 
	</form>
� 	addremote� _Object (Z)Ljava/lang/Object;��
 �� 
editremote�  � ,class$jrunx$jmc$management$tags$GetServerTag &jrunx.jmc.management.tags.GetServerTag�� �	 � &jrunx/jmc/management/tags/GetServerTag�
�v svrObj� setId� f
�� 	_emptyTag�?
 � getPort� getHost� getServerName� 

	� entman_addserver_description� �
		ColdFusion Enterprise lets you add remote servers that can participate in clusters
		with servers located on the local machine. The Instance Name must match an instance name on the remote host.
	� J
	</font></p>
	<form action="index.cfm?addremote=true" method="post">
	� !entman_editremoteserverproperties� $
		Edit Remote Server Properties
	� >
	</font></p>
	<form action="index.cfm?action=delete&server=� getName� "&addremote=true" method="post">
	� g
	<table border="0" cellpadding="2" cellspacing="1" width="100%">
	<tr>
		<td height="20" bgcolor="#� 	GRAYLIGHT� :" class="cellBlueTopAndBottom">
			<b class="form-title">� addremoteserver� Add Remote ColdFusion Instance �</b>
		</td>
	</tr>
	<tr>
		<td>
			<table border="0" cellpadding="0" cellspacing="0">
			<tr><td height="2"></td></tr>
			<tr>
				<td nowrap>
					<font class="label">&nbsp; <label for="name"> remote_server_name ColdFusion Instance Name �</label> &nbsp;</font>
				</td>
				<td colspan="4">
					<input type="text" maxlength="300" class="label" name="remoteservername" size="20" style="width:15em;" value="	 �">
				</td>
			</tr>
			<tr><td height="2"></td></tr>
			<tr>
				<td nowrap>
					<font class="label">&nbsp; <label for="name"> remote_server_ip $Remote Host (IP Address or DNS Name) �</label> &nbsp;</font>
				</td>
				<td colspan="4">
					<input type="text" maxlength="300" class="label" name="host" size="15" style="width:15em;" value=" ">
				</td>
			</tr>
			<tr><td height="2"></td></tr>
			<tr>
				<td nowrap><font class="label">&nbsp; <label for="new"> remote_server_port Remote Port �</label> &nbsp;</font></td>
				<td colspan="2">
					<input type="text" maxlength="300" class="label" name="remoteport" size="15" style="width:15em;" value=" �">
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<script>
		function opn() {
			window.open("index.cfm", "_self");
			return false;
		}
	</script>

		<td align="right" class="cellBlueTopAndBottom" bgcolor="# 	BLUELIGHT ">
			<table>
			<tr>
				 button_gatewaty_addz! 
add_button# Submit% 
				' button_gatewaty_addx) cancelx+ Cancel- &
				<td><input type="submit" title="/ " name="addsubmit" value="1 =" class="buttn" ></td>
				<td><input type="submit"  title="3 r" class="buttn"  onclick="return opn();"></td>
			</tr>
			</table>
		</td>
	</tr>

	</table>

	</form>
	5 metaData Ljava/lang/Object;78	 9 this Lcfaddserver2ecfm915124676; varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; LocalVariableTable Code runPage ()Ljava/lang/Object; out Ljavax/servlet/jsp/JspWriter; value output3  Lcoldfusion/tagext/io/OutputTag; mode3 I module1 $Lcoldfusion/tagext/lang/ImportedTag; mode1 t8 Ljava/lang/Throwable; t9 t10 t11 t12 t13 module2 mode2 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 include4 #Lcoldfusion/tagext/lang/IncludeTag; include5 output6 mode6 t30 t31 t32 t33 include7 include8 abort9 !Lcoldfusion/tagext/lang/AbortTag; param10 !Lcoldfusion/tagext/lang/ParamTag; output14 mode14 module11 mode11 t42 t43 t44 t45 t46 t47 module12 mode12 t50 t51 t52 t53 t54 t55 	include13 t57 t58 t59 t60 t61 	include15 output25 mode25 getServer16 (Ljrunx/jmc/management/tags/GetServerTag; t66 module17 mode17 t69 t70 t71 t72 t73 t74 module18 mode18 t77 t78 t79 t80 t81 t82 module19 mode19 t85 t86 t87 t88 t89 t90 module20 mode20 t93 t94 t95 t96 t97 t98 module21 mode21 t101 t102 t103 t104 t105 t106 module22 mode22 t109 t110 t111 t112 t113 t114 module23 mode23 t117 t118 t119 t120 t121 t122 module24 mode24 t125 t126 t127 t128 t129 t130 t131 t132 t133 t134 	include26 	include27 LineNumberTable java/lang/Throwable� <clinit> getMetadata 1                      "     &     *     .     2     6     :     >     B     F     J     N     � �    � �   * �   W �   ^ �   � �   78       B   �     �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q�   A        �;<     �=>    �?@  CD B  � 
 �  r*� X� ^L*� bN*d� h*+j� n*+p� n*� s*+u� n**� !/wy� }*+p� n**� 1� �� /*� �Y/S*
� �*
� �**� 1� �� �� �� �� �*� �Y�S� �Y�� �*� �Y/S� �� �� ��� �� �� �*+u� n*� �-� �� �:*� �� �� �Y6��*+Ҷ n**� 9�ֶ ڙ �*+ܶ n*� �� �� �:*� ����� �� �Y� �Y�SY�SY�SY�S� �� � ��Y6� L*+�L+�+*7� �Y�S� �� �����ި � :� �:	*+�L�	�� :
� &�G
�� � #:�� � :� �:��*+Ҷ n� �*+ܶ n*� �� �� �:*� ����� �� �Y� �Y�SY!SY�SY�S� �� � ��Y6� 6*+�L+#������ � :� �:*+�L��� :� &� q�� � #:�� � :� �:��*+Ҷ n*+p� n�$�� �'� :� #�� � #:�(� � :� �:�)�*+p� n*�.-� ��0:*� �246�:�=� ��A� �*+p� n*�.-� ��0:*� �24C�:�=� ��A� �*+j� n*� �**� �FH*� ��L�P��.+R�*� �-� �� �:*� �� �� �Y6� +**� M� �� ���$����'� :� #�� � #:�(� � : �  �:!�)�!+R�*�.-� ��0:"*� �"24T�:�="� �"�A� �*+Ҷ n*�.-� ��0:#*� �#24V�:�=#� �#�A� �*+Ҷ n*�[	-� ��]:$*� �$� �$�A� �*+p� n*+j� n*�b
-� ��d:%*"� �%fhj�m�q%fsu�:�w%fy{�:�~%� �%�A� �*+u� n*7� �Y�S� �j����*+p� n*� �-� �� �:&*&� �&� �&� �Y6'��+��*� �&� �� �:(*(� �(���� �(� �Y� �Y�SY�S� �� (� �(�Y6)� 6*()+�L+��(����� � :*� *�:+*)+�L�+(�� :,� &�7,�� � #:-(-�� � :.� .�:/(��/+��*� E*0� �*������*� )*1� �***� E�F�� �����*� A**2� �*������� �Y�S����*� I**� )� �� �**� A� �� ������**� A� �� �����*+Ҷ n*� �&� �� �:0*5� �0���� �0� �Y� �Y�SY�SY�SY�S� �� 0� �0�Y61� 6*01+�L+��0����� � :2� 2�:3*1+�L�30�� :4� &� �4�� � #:505�� � :6� 6�:70��7+��+*;� �**� I� �� ����+��*�.&� ��0:8*K� �824��:�=8� �8�A� :9� D9�+��&�$��d&�'� ::� #:�� � #:;&;�(� � :<� <�:=&�)�=*+j� n�	�*7� �Y�S� ������ K+¶*�.-� ��0:>*Q� �>24��:�=>� �>�A� �+ƶ�	8*7� �Y�S� �ȸ��~���Y�P� #W*7� �Y�S� �θ��~��̸P��*+Ҷ n*� �-� �� �:?*T� �?� �?� �Y6@��*+Ҷ n*� 5ж�*+Ҷ n*� -ж�*+Ҷ n*� Qж�*+Ҷ n*7� �Y�S� �θ��� �*+ܶ n*��?� ���:AA*7� �Y�S� �� ���Aڶ�A��� :B�B�*+ܶ n*� Q*[� �***� =�F�� �����*� -*\� �***� =�F�� �����*� 5*]� �***� =�F�� �����*+Ҷ n*+� n*7� �Y�S� �ȸ��� �+��*� �?� �� �:C*c� �C���� �C� �Y� �Y�SY�S� �� C� �C�Y6D� 6*CD+�L+�C����� � :E� E�:F*D+�L�FC�� :G� &��G�� � #:HCH�� � :I� I�:JC��J+�� �+��*� �?� �� �:K*k� �K���� �K� �Y� �Y�SY�S� �� K� �K�Y6L� 6*KL+�L+�K����� � :M� M�:N*L+�L�NK�� :O� &�O�� � #:PKP�� � :Q� Q�:RK��R+��+*o� �***� =�F�� ���� ��+��+��+*� �Y�S� �� ��+��*� �?� �� �:S*t� �S���� �S� �Y� �Y�SY S� �� S� �S�Y6T� 6*ST+�L+�S����� � :U� U�:V*T+�L�VS�� :W� &�W�� � #:XSX�� � :Y� Y�:ZS��Z+�*� �?� �� �:[*}� �[���� �[� �Y� �Y�SYS� �� [� �[�Y6\� 6*[\+�L+�[����� � :]� ]�:^*\+�L�^[�� :_� &�I_�� � #:`[`�� � :a� a�:b[��b+
�+**� 5� �� ��+�*� �?� �� �:c* �� �c���� �c� �Y� �Y�SYS� �� c� �c�Y6d� 6*cd+�L+�c����� � :e� e�:f*d+�L�fc�� :g� &�og�� � #:hch�� � :i� i�:jc��j+�+**� -� �� ��+�*� �?� �� �:k* �� �k���� �k� �Y� �Y�SYS� �� k� �k�Y6l� 6*kl+�L+�k����� � :m� m�:n*l+�L�nk�� :o� &��o�� � #:pkp�� � :q� q�:rk��r+�+**� Q� �� ��+�+*� �YS� �� ��+ �*� �?� �� �:s* �� �s���� �s� �Y� �Y�SY"SY�SY$S� �� s� �s�Y6t� 6*st+�L+&�s����� � :u� u�:v*t+�L�vs�� :w� &��w�� � #:xsx�� � :y� y�:zs��z*+(� n*� �?� �� �:{* �� �{���� �{� �Y� �Y�SY*SY�SY,S� �� {� �{�Y6|� 6*{|+�L+.�{����� � :}� }�:~*|+�L�~{�� :� &� ��� � #:�{��� � :�� ��:�{���+0�+**� %� �� ��+2�+**� %� �� ��+4�+**� � �� ��+2�+**� � �� ��+6�?�$���?�'� :�� #��� � #:�?��(� � :�� ��:�?�)��*+p� n*+p� n*�.-� ��0:�* �� ��24T�:�=�� ���A� �*+p� n*�.-� ��0:�* �� ��24V�:�=�� ���A� �*+p� n� �L~������A�������A���������������8TW�W\W�-z������-z�������������� �����z���������� �����z���������������������������������������������	���	$�$�!$�$)$�/KN�NSN�$q}�wz}�$q��wz��}�������g	)�q)�w�)�)�#&)�g	8�q8�w�8�8�#&8�)58�8=8�
�
�
��
�
�
��
�
�
��
�
�
��
�
��
�
��
���~�������s�������s�����������������������������������������������Plo�oto�E�������E���������������*FI�INI�lx�rux�l��ru��x������� #�#(#��FR�LOR��Fa�LOa�R^a�afa�#&�&+&��IU�ORU��Id�ORd�Uad�did����������%�"%��4�"4�%14�494�	$	���	�
���
�������������l��rF��LI��O���������	$	���	�
���
�������������l��rF��LI��O����������������� A  \ �  r;<    rEF   rG8   r _ `   rHI   rJK   rLM   rNK   rOP   rQ8 	  rR8 
  rSP   rTP   rU8   rVM   rWK   rXP   rY8   rZ8   r[P   r\P   r]8   r^8   r_P   r`P   ra8   rbc   rdc   reI   rfK   rg8   rhP   riP    rj8 !  rkc "  rlc #  rmn $  rop %  rqI &  rrK '  rsM (  rtK )  ruP *  rv8 +  rw8 ,  rxP -  ryP .  rz8 /  r{M 0  r|K 1  r}P 2  r~8 3  r8 4  r�P 5  r�P 6  r�8 7  r�c 8  r�8 9  r�8 :  r�P ;  r�P <  r�8 =  r�c >  r�I ?  r�K @  r�� A  r�8 B  r�M C  r�K D  r�P E  r�8 F  r�8 G  r�P H  r�P I  r�8 J  r�M K  r�K L  r�P M  r�8 N  r�8 O  r�P P  r�P Q  r�8 R  r�M S  r�K T  r�P U  r�8 V  r�8 W  r�P X  r�P Y  r�8 Z  r�M [  r�K \  r�P ]  r�8 ^  r�8 _  r�P `  r�P a  r�8 b  r�M c  r�K d  r�P e  r�8 f  r�8 g  r�P h  r�P i  r�8 j  r�M k  r�K l  r�P m  r�8 n  r�8 o  r�P p  r�P q  r�8 r  r�M s  r�K t  r�P u  r�8 v  r�8 w  r�P x  r�P y  r�8 z  r�M {  r�K |  r�P }  r�8 ~  r�8   r�P �  r�P �  r�8 �  r�8 �  r�P �  r�P �  r�8 �  r�c �  r�c ��  Z �   5  5  B 	 B 	 A 	 d 
 d 
 d 
 d 
 d 
 d 
 L 
 L 
 A 	 �  �  �  �  �  �  x  A  �  �  �  �  � ( 2 ^ ^ ]  �   � �  �  �  � T 8 { { { { � � � � 6  t W � { � "� "	 "� "* %: %� (y (G 0J 0F 0F 0< 0^ 1] 1] 1S 1 2� 2~ 2w 2w 2s 2� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3< /	 5 5� 5� ;� ;� ;� ;� ;� K� KL &S Oc O� Qu Q� S� S� S� S� S� S� S� S� S	: U	: U	6 U	6 U	K V	K V	G V	G V	\ W	\ W	X W	X W	i X	y X	� Y	� Y	� Y	� Y	� [	� [	� [	� [	� \	� \	� \	� \
 ]
 ]
 ]
 ]	� Z	i X
A a
Q a
� c
c cc k0 k� o� o� o� o) i
A a" s" s! sr t? t5 } }� �� �� � �� �� �� �� �� �� �z �z �y �� �� �� �� �� �� �� �� �} �M �M �L �c �c �b �y �y �x �� �� �� �		 T� SS O* % �� �O �1 �    �  B   a     C�� �� �߸ �� �,� ��.Y� ��[`� ��bӸ ��ջ �Y� �� ��:�   A       C;<   �D B   "     �:�   A       ;<      B   #     *� 
�   A       ;<         R    S