����  - � 
SourceFile FE:\cf9_updates_rc\cfusion\wwwroot\CFIDE\administrator\verity\index.cfm #cfindex2ecfm1285181838$funcREMOVELF  coldfusion/runtime/UDFMethod  <init> ()V  
  	 com.adobe.coldfusion.*  bindImportPath (Ljava/lang/String;)V   coldfusion/runtime/CfJspPage 
   coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	    RET " 1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  $
  % pageContext #Lcoldfusion/runtime/NeoPageContext; ' (	  ) getOut ()Ljavax/servlet/jsp/JspWriter; + , javax/servlet/jsp/PageContext .
 / - parent Ljavax/servlet/jsp/tagext/Tag; 1 2	  3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7   ; set (Ljava/lang/Object;)V = > coldfusion/runtime/Variable @
 A ? _setCurrentLineNo (I)V C D
  E _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; G H
  I _String &(Ljava/lang/Object;)Ljava/lang/String; K L coldfusion/runtime/Cast N
 O M Trim &(Ljava/lang/String;)Ljava/lang/String; Q R coldfusion/runtime/CFPage T
 U S 
 W ALL Y Replace \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; [ \
 U ]  _ 	 a java/lang/String c INPUT e removeLF g metaData Ljava/lang/Object; i j	  k &coldfusion/runtime/AttributeCollection m java/lang/Object o name q 
Parameters s NAME u input w REQUIRED y false { ([Ljava/lang/Object;)V  }
 n ~ getName ()Ljava/lang/String; this %Lcfindex2ecfm1285181838$funcREMOVELF; LocalVariableTable Code runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> getParamList ()[Ljava/lang/String; getMetadata ()Ljava/lang/Object; 1       i j     � �  �   !     h�    �        � �    � �  �  �     �-� +� � :+� !,� :	+#� &:
-� *� 0:-� 4:� ::
<� B
-Ķ F-� J� P� V� B
-Ŷ F-
� J� PX<Z� ^� B
-ƶ F-
� J� P`<Z� ^� B
-Ƕ F-
� J� Pb<Z� ^� B-
� J��    �   z    � � �     � � �    � � j    � � �    � � �    � � �    � � j    � 1 2    �  �    �  � 	   � " � 
   � e �  �   � % � 8� :� <� <� J� J� J� J� A� b� b� k� m� o� b� b� Y� �� �� �� �� �� �� �� w� �� �� �� �� �� �� �� �� �� �� ��  �   �   e     G� nY� pYrSYhSYtSY� pY� nY� pYvSYxSYzSY|S� SS� � l�    �       G � �    � �  �   (     
� dYfS�    �       
 � �    � �  �   "     � l�    �        � �       �   #     *� 
�    �        � �        ����  -� 
SourceFile FE:\cf9_updates_rc\cfusion\wwwroot\CFIDE\administrator\verity\index.cfm cfindex2ecfm1285181838  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   COL_OPT Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   DIALOGSTYLE   	   ISSOLRENABLED   	    CFCATCH " " 	  $ COMMONDIRECTORY & & 	  ( 
COLPATHDEF * * 	  , DEFAULTPATH . . 	  0 LOCALE 2 2 	  4 ERRORDELETECOLLECTION 6 6 	  8 QVGETCOLLECTIONS : : 	  < L10N_IDELETE > > 	  @ URL B B 	  D VERITY_PURGE_WARN F F 	  H IINDEX_3 J J 	  L AERRORMESSAGES N N 	  P 	TREEFIELD R R 	  T S V V 	  X L10N_ADDCOL Z Z 	  \ NL ^ ^ 	  ` L10N_IOPTIMIZE b b 	  d REQUEST f f 	  h L10N_IPURGE j j 	  l BROWSE_BUTTON n n 	  p ENGINE r r 	  t COLLECTIONMESSAGE v v 	  x QGETCOLLECTIONS z z 	  | TIMEARR ~ ~ 	  � COL_DEL � � 	  � VERITY_OPTIMIZE_WARN � � 	  � VERITY_DELETE_WARN � � 	  � SOLRSERVICE � � 	  � CREATECOLLECTION_SUBMIT � � 	  � BROWSESUBMIT � � 	  � VALID_SORTS � � 	  � OLDARR � � 	  � SORTBY � � 	  � SOLRDEFAULTDIRECTORY � � 	  � NEWCOLLECTIONNAME � � 	  � QSGETCOLLECTIONS � � 	  � QGETSOLRCOLLECTIONS � � 	  � BERRORSEXIST � � 	  � ERROR_CREATE � � 	  � VERITY_PATH_REQUIRED � � 	  � ISVERITYENABLED � � 	  � DOCATEGORIES � � 	  � ROOTDIRECTORY � � 	  � 	URLENCHAR � � 	  � COLLECTIONPATH � � 	  � VERITYROOTDIRECTORY � � 	  � VERITY_NAME_REQUIRED � � 	  � SOLRURL � � 	  � REMOVELF � � 	  � ERROR_OPTIMIZE � � 	  � LOCALVERITY � � 	  � 
COL_PURGED � � 	  � ERROR_PURGE � � 	  � FORM � � 	  � BSERVERDOWN � � 	  � LUCENEDEFAULTDIRECTORY � � 	   FORMATEDDATE 	  ERR_GET 	  com.macromedia.SourceModTime  %D;#  pageContext #Lcoldfusion/runtime/NeoPageContext;	  getOut ()Ljavax/servlet/jsp/JspWriter; javax/servlet/jsp/PageContext
 parent Ljavax/servlet/jsp/tagext/Tag;	  com.adobe.coldfusion.* bindImportPath (Ljava/lang/String;)V
  
! _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V#$
 % 'class$coldfusion$tagext$lang$IncludeTag Ljava/lang/Class; !coldfusion.tagext.lang.IncludeTag) forName %(Ljava/lang/String;)Ljava/lang/Class;+, java/lang/Class.
/-'(	 1 _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag;34
 5 !coldfusion/tagext/lang/IncludeTag7 _setCurrentLineNo (I)V9:
 ; 	cfinclude= template? ../header.cfmA _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;CD
 E setTemplateG
8H 	hasEndTag (Z)VJK coldfusion/tagext/GenericTagM
NL _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)ZPQ
 R�


<script type="text/javascript">
	<!-- open a browse dialog -->
	function wopen(formelem) {
		// CollectionPath is hardcoded here, how can I use the value of formelem?
		defpath = document.forms[0].elements.CollectionPath.value ;
		window.open("../filedialog/index.cfm?fromjscript=true&dialogStyle=selectDirectory&formelem=" + formelem + "&defaultPath=" + escape(defpath), "NewWindow","height=500,width=600,dependent=true,resizable=yes");
	}

</script>



T writeV java/io/WriterX
YW java/lang/String[ LICENSE] _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;_`
 a getAppServerPlatformc java/lang/Objecte _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;gh
 i sunonek _compare '(Ljava/lang/Object;Ljava/lang/String;)Dmn
 o _Object (Z)Ljava/lang/Object;qr coldfusion/runtime/Castt
us _boolean (Ljava/lang/Object;)Zwx
uy SERVER{ OS} ADDITIONALINFORMATION _resolveAndAutoscalarize�`
 � sunos� 
	� 'class$coldfusion$tagext$net$LocationTag !coldfusion.tagext.net.LocationTag��(	 � !coldfusion/tagext/net/LocationTag� 
cflocation� url� ../homepage.cfm� setUrl�
�� 


� 

� %class$coldfusion$tagext$net$CookieTag coldfusion.tagext.net.CookieTag��(	 � coldfusion/tagext/net/CookieTag� cfcookie� expires� 30� \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;C�
 � 
setExpires (Ljava/lang/Object;)V��
�� value� CGI� SCRIPT_NAME� _String &(Ljava/lang/Object;)Ljava/lang/String;��
u� setValue�
�� name� cfadmin_lastpage_� GetAuthUser ()Ljava/lang/String;��
 � concat &(Ljava/lang/String;)Ljava/lang/String;��
\� setName�
�� 



� $class$coldfusion$tagext$io$SilentTag coldfusion.tagext.io.SilentTag��(	 � coldfusion/tagext/io/SilentTag� 
doStartTag ()I��
�� 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � REQUEST.LOCALE� en� checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V��
 � isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z��
 � _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;��
 � Trim��
 � LCase��
 � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V��
 � 
LOCALEFILE� java/lang/StringBuffer� resources/verity_� 
�� append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;� 
� .xml toString�
f %class$coldfusion$tagext$lang$ParamTag coldfusion.tagext.lang.ParamTag	(	  coldfusion/tagext/lang/ParamTag cfparam bCollectionExists
� default false 
setDefault�
 type boolean setType
  RootDirectory"  $ string& FORM.ActionType( FORM.CollectionName* _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;,-
 . FORM.NewCollectionName0 FORM.CollectionPath2 FORM.CollectionLanguage4 engine6 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V�8
 9 java; coldfusion.tagext.search.Utils= CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;?@
 A IsVerityRunningC setE� coldfusion/runtime/VariableG
HF  coldfusion.server.ServiceFactoryJ getSolrServiceL _factor1N-
 O "coldfusion.tagext.search.SolrUtilsQ 
getSolrUrlS IsSolrRunningU ArrayNew (I)Ljava/util/List;WX
 Y _Array .(Ljava/lang/Object;)Lcoldfusion/runtime/Array;[\
u] setArray (Lcoldfusion/runtime/Array;)V_`
Ha VERITYc 
VERITYHOSTe IsLocalHost (Ljava/lang/String;)Zgh
 i YESk NOm Len (Ljava/lang/Object;)Iop
 q (I)Ljava/lang/Object;qs
ut (Ljava/lang/Object;D)Dmv
 w Left '(Ljava/lang/String;I)Ljava/lang/String;yz
 { doAfterBody}�
N~ _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � doEndTag�� #javax/servlet/jsp/tagext/TagSupport�
�� doCatch (Ljava/lang/Throwable;)V��
N� 	doFinally� 
N� 



  
� 
  	� *coldfusion/runtime/TransientVariableHolder� &(Lcoldfusion/runtime/NeoPageContext;)V �
�� 	
		
 		� No� 
		� ENABLECATEGORIES� FORM.ENABLECATEGORIES�  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z��
 � 
			� Yes� $
                
                � ENGINE_SELECT� solr� verity� 

		� 
	  		
	  		� DirectoryExists�h
 � 
	  			� 'class$coldfusion$tagext$io$DirectoryTag !coldfusion.tagext.io.DirectoryTag��(	 � !coldfusion/tagext/io/DirectoryTag� cfdirectory� action� CREATE� 	setAction�
�� 	directory� setDirectory�
�� mode� 644� _int (Ljava/lang/String;)I��
u� :(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)IC�
 � setMode�:
�� 
	  		� 

  		� ,class$coldfusion$tagext$search$CollectionTag &coldfusion.tagext.search.CollectionTag��(	 � &coldfusion/tagext/search/CollectionTag� cfcollection�
�� 
collection� setCollection�
�� path� setPath�
�� language� COLLECTIONLANGUAGE� setLanguage�
�� 	setEngine�
�� 
categories :(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)ZC
  setCategoriesK
� _factor2	-
 
 unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable; coldfusion/runtime/NeoException
 t61 [Ljava/lang/String; Any	  findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I
 bind '(Ljava/lang/String;Ljava/lang/Object;)V
� 
  			  true" 	

  			$ $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag'&(	 ) coldfusion/tagext/io/OutputTag+
,� 
  				. (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag10(	 3 "coldfusion/tagext/lang/ImportedTag5 l10n7 
../cftags/9 admin; :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V�=
6> &coldfusion/runtime/AttributeCollection@ idB error_createD varF ([Ljava/lang/Object;)V H
AI setAttributecollection (Ljava/util/Map;)VKL  coldfusion/tagext/lang/ModuleTagN
OM
O� %
  					Unable to create collection R .<br />
  					T MESSAGEV D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object;�X
 Y <br />
  					[ DETAIL] <br />
  				_
O~
O�
O�
,~ coldfusion/tagext/QueryLoope
f�
f�
,� 
  			
  			j ArrayLenlp
 m (D)Ljava/lang/Object;qo
up _arraySetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)Vrs
 t 
  		v unbindx 
�y 

	
	{ CollectionPath} selectDirectory 
	
	� &(Ljava/lang/String;)Ljava/lang/Object;��
 � _Map #(Ljava/lang/Object;)Ljava/util/Map;��
u� collectionPath� StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z��
 � ../filedialog/index.cfm� %class$coldfusion$tagext$lang$AbortTag coldfusion.tagext.lang.AbortTag��(	 � coldfusion/tagext/lang/AbortTag� INDEX� 	URL.INDEX� COLLECTIONNAME� 
 	� addtoken�wh
u� setAddtoken�K
�� #indexcollection.cfm?collectionname=� URLEncodedFormat 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;��
 � OPTIMIZE� URL.OPTIMIZE� 

	� optimize� col_optimized� col_opt� 
 Optimized� t62�	 � 

			� 
				� error_optimize� %
					Unable to optimize collection � .<br/>
					� <br/>
					� <br/>
				� 

			
			� _factor3�-
 � PURGE� 	URL.PURGE� 'class$coldfusion$tagext$search$IndexTag !coldfusion.tagext.search.IndexTag��(	 � !coldfusion/tagext/search/IndexTag� cfindex�
��
�� 
col_purged�  Purged� t63�	 � error_purge� "
					Unable to purge collection � _factor4�-
 � DELETE� 
URL.DELETE� delete� col_deleted� col_del� 	 removed.� t64�	 � errorDeleteCollection� #
					Unable to delete collection   _factor5-
  	

	

 	_factor25-
  
pagenameq8
 pagename ColdFusion Collections 

		     	 COLLECTIONDIR 
COLDFUSION ROOTDIR java.io.File SEPARATORCHAR 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object;�
  collections /../k2/common/! 


        # 

        % t65'	 ( 
errors_get* err_get, G
				Unable to retrieve the default collections directory.<br />
				. <br />
				0 <br />
			2 
		
		4 





6 
   8 list: qVGetCollections<
�� t66 any@?	 B Ename,doccount,size,lastmodified,lastmodified,language,categories,pathD QueryNew /(Ljava/lang/String;)Lcoldfusion/sql/QueryTable;FG
 H 
		
	J qSGetCollectionsL t67N	 O )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTagRQ(	 T #coldfusion/tagext/html/form/FormTagV cfformX
W� method[ post] 	setMethod_
W` ?RequestTimeout=300b
W�
W� 
<table>
f ../include/margintop.cfmh ../include/errors.cfmj "
	<p>
	<font color="#339933">
	l 
	</font>
	</p>
n 

<h2 class="pageHeader">p pageHeader_verityr /Data &amp; Services &gt; ColdFusion Collectionst </h2>
<br>

<p>
v verity_welcomex
The Verity or Solr indexing engines allows you to easily develop search capabilities for your ColdFusion applications. A Verity or Solr collection is a group of information that can be indexed and searched as a set. Use this form to create and manage your Verity or Solr collections.
z 

</p>

| g
	<table border="0" cellpadding="5" cellspacing="0" width="100%">
	<tr>
		<td colspan="2" bgcolor="#~ 	GRAYLIGHT� 8" class="cellBlueTopAndBottom">
			<b><label for="dsn">� l10n_add� Add New Verity/Solr Collections� F</label></b>
		</td>
	</tr>
	<tr>
		<td>
			<label for="newname">� Name� </label>
		</td>
		<td>
			� verity_name_required� 'A name for your collection is required.� *class$coldfusion$tagext$html$form$InputTag $coldfusion.tagext.html.form.InputTag��(	 � $coldfusion/tagext/html/form/InputTag� cfinput� NewCollectionName�
�� text�
�  	maxlength� 250� setMaxLength�:
�� required� setRequired�K
�� message� 
setMessage�
��
�� size� 15� newname� style� 
width:15em�
�M 7
		</td>
	</tr>
	<tr>
		<td>
			<label for="path">� Path� _factor6�-
 �  </label>
		</td>
		<td>

			� FORM.COLLECTIONPATH� verity_path_required� .A path for your verity collection is required.� 550� class� label� width:30em;� browse_button� Browse Server� 7
			<input type="button" name="content_browse" value="� 	" title="� j" class="buttn" onclick='wopen("CollectionPath");'>
		</td>
	</tr>
	<tr>
		<td>
			<label for="lang">� lang� Language� _factor7�-
 � +class$coldfusion$tagext$html$form$SelectTag %coldfusion.tagext.html.form.SelectTag��(	 � %coldfusion/tagext/html/form/SelectTag� cfselect� CollectionLanguage�
�� @cfc:CFIDE.administrator.verity.utils.getLocales({engine_select})� setBind�
�� 
bindonload� setBindOnLoad�K
�� (coldfusion/tagext/html/form/FormChildTag�
�M
��
�~
�� J
		</td>
	</tr>
	<tr>
		<td>
			<label for="enablecategories">
				  verity_enablecategories Enable Category Support #
			</label>
		</td>
		<td>
				 enablecategories checkbox 1 bindattribute disabled setBindAttribute
�
�� Ecfc:CFIDE.administrator.verity.utils.getEnableStatus({engine_select})
�� M
		</td>
	</tr>
	<tr>
		<TD>
			<label for="verity_selectEngine">
				  verity_selectengine Verity Collection  #
			</label>
		</TD>
		<TD>
			" engine_select$ radio& verity_engine( checked* 
                        , _factor8.-
 / K
		</td>
	</tr>
	<tr>
		<td>
			<label for="solr_selectEngine">
				 1 solr_selectengine3 Solr Collection5 solr_engine7  
                             	9 
					; G
		</TD>
	</tr>
	<tr>
		<td class="cellBlueTopAndBottom" bgcolor="#= 	BLUELIGHT? " colspan="2">
			A _factor9C-
 D l10n_addcolF Create CollectionH /
			<input type="Submit" class="buttn" title="J 
"  value="L Y" name="CreateCollection_submit" class="buttn">
		</td>
	</tr>
	</table>
<br /><br>
N 	_factor10P-
 Q
W~
W�
W�
W� 	_factor21W-
 X 0



<!-- Controls to add a collection. -->
Z \n\ verity_optimize_warn^ 2Optimizing a collection can take several minutes. ` 	 Proceed?b verity_purge_warnd 'Purging a collection cannot be undone. f ' Remove all indices in this collection?h verity_delete_warnj (Deleting a collection cannot be undone. l  Destroy this collection?n l10n_ioptimize3p l10n_ioptimizer Optimize Collectiont l10n_ipurge3v l10n_ipurgex Purge Collectionz 	_factor22|-
 } l10n_idelete3 l10n_idelete� Delete Collection� l10n_iindex3� iindex_3� Index Collection� 




	
	� <name,doccount,[size],lastmodified,[language],categories,path� ,� P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; �
 � java/util/StringTokenizer� '(Ljava/lang/String;Ljava/lang/String;)V �
�� 	nextToken��
�� ListFind '(Ljava/lang/String;Ljava/lang/String;)I��
 � (J)Zw�
u� CFLOOP� checkRequestTimeout�
 � hasMoreTokens ()Z��
�� 	_factor23�-
 � $class$coldfusion$tagext$sql$QueryTag coldfusion.tagext.sql.QueryTag��(	 � coldfusion/tagext/sql/QueryTag� cfquery� qGetCollections�
�� dbtype� query� 	setDbtype�
��
�� 2
		select *
		from qVGetCollections
		order by � _escapeSingleQuotes��
 �
�~
��
��
�� 

        

	� qGetSolrCollections� 2
		select *
		from qSGetCollections
		order by � Z

<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
	<td bgcolor="#� 7" class="cellBlueTopAndBottom">
		<b><label for="dsn">� conn1z2_verity� Verity Collections� �</label></b>
	</td>
</tr>
<tr>
	<td>
		
		<table border="0" cellpadding="2" cellspacing="0" width="100%">
		<tr>
			<th scope="col" nowrap bgcolor="#� ." class="cellBlueTopAndBottom">
				<a href="� ?sortby=� ">� actions� Actions� 0
			</th>
			<th scope="col" nowrap bgcolor="#� 	aliasname� 4</a>
			</th>
			<th scope="col" nowrap bgcolor="#� doccount,name� 	Documents� 	_factor16�-
 � [size],name� size_kb� 	Size (Kb)� lastmodified,name� lastmod� Last Modified� [language],name� 	_factor17-
  categories,name 
Categories 	path,name </a>
			</th>
		</tr>
		
 RECORDCOUNT $class$coldfusion$tagext$lang$LoopTag coldfusion.tagext.lang.LoopTag(	  coldfusion/tagext/lang/LoopTag cfloop setQuery
f
� �
		<tr>
			<td nowrap class="cell3BlueSides">
				
				<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<a href="index.cfm?CollectionName= NAME &Index= ">
						<img src="! THISURL# :images/iindex.gif" height="16" width="16" border="0" alt="% G"></a>
					</td>
					<td>
						<a href="index.cfm?CollectionName=' 
&Optimize=) #"
						 onClick="return confirm('+ _get-�
 . removeLF0 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;23
 4 ')">
						 <img src="6 =images/ioptimize.gif" height="16" width="16" border="0" alt="8 &Purge=: :images/ipurge.gif" height="16" width="16" border="0" alt="< &Delete=> ;images/idelete.gif" height="16" width="16" border="0" alt="@ �"></a>
					</td>
				</tr>
				</table>
				
			</td>
			<td nowrap class="cellRightAndBottomBlueSide">
				<a href="index.cfm?CollectionName=B 	_factor11D-
 E ">
				G G</a>
			</td>
			<td nowrap class="cellRightAndBottomBlueSide">
				I DOCCOUNTK LSNumberFormatM�
 N C
			</td>
			<td nowrap class="cellRightAndBottomBlueSide">
				P SIZER I
			</td>
			<td nowrap class="cellRightAndBottomBlueSide">
				
				T LASTMODIFIEDV 
					 X LSDateFormatZ�
 [  ] LSTimeFormat_�
 ` I&nbsp;
			</td>
			<td nowrap class="cellRightAndBottomBlueSide">
				b LANGUAGEd 
CATEGORIESf PATHh 
			</td>
		</tr>
		j
~
�
� 	_factor12o-
 p �
		</table>
		
	</td>
</tr>
</table>

<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
	<td bgcolor="#r conn1z2_solrt Solr Collectionsv 	_factor18x-
 y 	_factor19{-
 | 	_factor20~-
  </a>
			</th>
		� 	_factor13�-
 � B
			</td>
			<td nowrap class="cellRightAndBottomBlueSide">
			� ListToArray 6(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;��
 � 4� _arrayGetAt C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object;��
 � :� 6��p
u� _Date $(Ljava/lang/Object;)Ljava/util/Date;��
u� Month (Ljava/util/Date;)I��
 � 3� 2� CreateDateTime ((IIIIII)Lcoldfusion/runtime/OleDateTime;��
 � 	_factor14�-
 � �
			</td>
			<td nowrap class="cellRightAndBottomBlueSide">
				N/A
			</td>
			<td nowrap class="cellRightAndBottomBlueSide">
				N/A
			</td>
			<td nowrap class="cellRightAndBottomBlueSide">
				� 	_factor15�-
 � 
                � -
		</table>
		
	</td>
</tr>
</table>

� 	_factor24�-
 � �
<br><br>


<table border="0" cellpadding="2" cellspacing="1" width="100%">


 

		<tr>
			<td colspan="8" align="center">
				�  
				<span class="error">
				� 	no_server� �
					Unable to retrieve collections from any of the Search Services.<br />
					Please verify that atleast one of ColdFusion Search Services is
					installed and running.
				� 
				</span>
				� /
			</td>
		</tr>

</table>
<br /><br>

� 	_factor26�-
 � ../include/marginbottom.cfm� 
</table>
� ../footer.cfm� 

</body>
</html>
� Lcoldfusion/runtime/UDFMethod; #cfindex2ecfm1285181838$funcREMOVELF�
� 	0�	 � registerUDF 3(Ljava/lang/String;Lcoldfusion/runtime/UDFMethod;)V��
 � metaData Ljava/lang/Object;��	 � 	Functions�	�� this Lcfindex2ecfm1285181838; __factorParent out Ljavax/servlet/jsp/JspWriter; param4 !Lcoldfusion/tagext/lang/ParamTag; param5 param6 param7 LocalVariableTable LineNumberTable Code loop87  Lcoldfusion/tagext/lang/LoopTag; mode87 I t6 t7 t8 Ljava/lang/Throwable; t9 t10 java/lang/Throwable� module73 $Lcoldfusion/tagext/lang/ImportedTag; mode73 t11 module74 mode74 t14 t15 t16 t17 t18 t19 t20 Ljava/lang/String; t21 t22 t23 Ljava/util/StringTokenizer; module82 mode82 module83 mode83 module84 mode84 t24 t25 t26 t27 module52 mode52 input53 &Lcoldfusion/tagext/html/form/InputTag; module54 mode54 module55 mode55 t28 module62 mode62 input63 input64 input65 select56 'Lcoldfusion/tagext/html/form/SelectTag; mode56 module57 mode57 input58 module59 mode59 input60 input61 varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; runPage ()Ljava/lang/Object; 
include102 #Lcoldfusion/tagext/lang/IncludeTag; 
include103 form67 %Lcoldfusion/tagext/html/form/FormTag; mode67 t12 module90 mode90 module91 mode91 module92 mode92 directory14 #Lcoldfusion/tagext/io/DirectoryTag; collection15 (Lcoldfusion/tagext/search/CollectionTag; getMetadata registerUDFs module78 mode78 module79 mode79 module80 mode80 module81 mode81 t30 t31 t32 t33 t34 t35 t4 ,Lcoldfusion/runtime/TransientVariableHolder; collection31 output33  Lcoldfusion/tagext/io/OutputTag; mode33 module32 mode32 t13 #Lcoldfusion/runtime/AbortException; Ljava/lang/Exception; __cfcatchThrowable3 output35 mode35 module34 mode34 t29 t36 t37 t38 t39 !coldfusion/runtime/AbortExceptionh java/lang/Exceptionj <clinit> index26 #Lcoldfusion/tagext/search/IndexTag; output28 mode28 module27 mode27 __cfcatchThrowable2 output30 mode30 module29 mode29 output97 mode97 output98 mode98 include0 	location1 #Lcoldfusion/tagext/net/LocationTag; cookie2 !Lcoldfusion/tagext/net/CookieTag; silent13  Lcoldfusion/tagext/io/SilentTag; mode13 __cfcatchThrowable0 output17 mode17 module16 mode16 	include18 abort19 !Lcoldfusion/tagext/lang/AbortTag; 
location20 module68 mode68 module69 mode69 module70 mode70 module71 mode71 module72 mode72 t40 t41 t42 t43 module93 mode93 module94 mode94 module95 mode95 module47 mode47 module48 mode48 module49 mode49 input50 module51 mode51 module85 mode85 module86 mode86 module88 mode88 module89 mode89 loop99 mode99 module36 mode36 __cfcatchThrowable4 output38 mode38 module37 mode37 collection39 __cfcatchThrowable5 collection41 t44 __cfcatchThrowable6 t46 t47 	output101 mode101 t50 t51 t52 t53 	module100 mode100 t56 t57 t58 t59 t60 collection21 output23 mode23 module22 mode22 __cfcatchThrowable1 output25 mode25 module24 mode24 	include43 	include44 module45 mode45 module46 mode46 module66 mode66 query76  Lcoldfusion/tagext/sql/QueryTag; mode76 query77 mode77 module96 mode96 param8 param9 param10 param11 1     V                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �            '(   �(   �(   �(   (   �(   �(      &(   0(   �(   �   �(   �   �   '   ?   N   Q(   �(   �(   �(   (   0�   ��   ! ,- �   
   �**� i3���**� 5�� /*g�\Y3S*8�<*8�<**� 5�������*g�\Y�S��Y���*g�\Y3S���������*�+�6�:*=�<��F�����F�!�O�S� �*�+�6�:*>�<�#�F�%���'�F�!�O�S� �*�+�6�:*?�<�)�F�%���'�F�!�O�S� �*�+�6�:*@�<�+�F�%���'�F�!�O�S� �*�   �   R   ���    ��   ���   ���   ���   ���   ���   ��� �   � +         
 5 
 5     7  7  7 3 8 3 8 3 8 3 8 3 8 3 8  8  8  7 X 9 ^ 9 ^ 9 s 9 T 9 T 9 G 9  6 � = � = � =  = � > > > � >P ?b ?t ?3 ?� @� @� @� @ o- �  �    +*,��&*�W+�6�:*"�<���F��O�Y6��*,�F� :���, �Z,*@�<**� }�\YS�Z��**� Ѷ�����Z,H�Z,**� }�\YS�Z���Z,J�Z,*D�<***� }�\YLS�Z�O�Z,Q�Z,*G�<***� }�\YSS�Z�O�Z,U�Z**� }�\YWS�Z%�p�� ]*,Y�&,*L�<***� }�\YWS�Z�\�Z*,^�&,*L�<***� }�\YWS�Z�a�Z*,¶&,c�Z,*P�<**� }�\YeS�Z����Z,Q�Z,**� }�\YgS�Z���Z,Q�Z,**� }�\YiS�Z���Z,k�Z�l��S�m� :� #�� � #:�h� � :	� 	�:
�n�
*�  6 O	� U�	�	� 6 O� U���	�� �   p   +��    +�   +��   +��   +��   +��   +��   +��   +��   +�� 	  +�� 
�   � . &" d@ d@ y@ y@ d@ d@ \@ �A �A �A �D �D �D �D �D �G �G �G �G �GKK/L/L.L.L&LXLXLWLWLOLK�P�P�P�PP�S�S�S�V�V�V " �- �  �    |*,"�&*�4I+�6�6:*��<8:<�?�AY�fYCSY�SYGSY�S�J�P�O�QY6� 6*,��M,��Z�a���� � :� �:*,��M���� :� #�� � #:		�b� � :
� 
�:�c�*,"�&*�4J+�6�6:*��<8:<�?�AY�fYCSY�SYGSY�S�J�P�O�QY6� 6*,��M,��Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�*,��&*,��&**� ���:*,��&*� ���I*,��&**� ����:�:*W��:��Y��:� s��N-�I*,��&*Զ<**� ����**� Y���������� (*,��&*� ���I*,��&� !*,��&*,��&��������*�  f � �� � � �� [ � �� � � �� [ � �� � � �� � � �� � � ��7SV�V[V�,v��|��,v��|���������� �   �   |��    |�   |��   |��   |��   |��   |��   |��   |��   |�� 	  |�� 
  |��   |��   |��   |��   |��   | �   |�   |�   |�   |   |   |    |	 �   � ! ?� K� ��� �����7�7�����7��������������(�(����K�K�G�G�Y��w��� - �  _    �,�Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z,߶Z,*�<�**� Ѷ�����Z,�Z*�4R+�6�6:*�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,��Z�a���� � :� �:*,��M���� :� #�� � #:		�b� � :
� 
�:�c�,�Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z,߶Z,*�<�**� Ѷ�����Z,�Z*�4S+�6�6:*�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,��Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,�Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z,߶Z,*�< **� Ѷ�����Z,�Z*�4T+�6�6:*�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,�Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,�Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z*�  � � �� � � �� � �� �� � �� ������������(�"%(��7�"%7�(47�7<7� � % ��@L�FIL��@[�FI[�LX[�[`[� �     ���    ��   ���   ���   �
�   ��   ���   ���   ���   ��� 	  ��� 
  ���   ��   ��   ���   ���   � �   ��   ��   ��   ��   ��   ��   ��   ��   ��   ��   �� �   � 0    & & % L O O L L D � g,,+JJIpsspph��PPOnnm��������tts��� �- �  �    ,ƶZ**� ��ȶ��vY�z� -W*f�<*��\Y�S���r�u�x�t|�v�z� ,*,¶&*� -*��\Y�S���I*,��&� "*,¶&*� -**� Ͷ�I*,��&*,��&*�44+�6�6:*k�<8:<�?�AY�fYCSY�SYGSY�S�J�P�O�QY6� 6*,��M,̶Z�a���� � :� �:*,��M���� :� #�� � #:		�b� � :
� 
�:�c�*,��&*��5+�6��:*l�<��~�F�����F����θ��۶�����������**� �����F����**� -����F���AY�fY�SY�SY�SY�SY�SY�SYCSY�S�J���O�S� �*,��&*�46+�6�6:*m�<8:<�?�AY�fYCSY�SYGSY�S�J�P�O�QY6� 6*,��M,ضZ�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,ڶZ,**� q����Z,ܶZ,**� q����Z,޶Z*�47+�6�6:*s�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,�Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�*�  �� � �;G�ADG� �;V�ADV�GSV�V[V�������������������������������������
���
��
�

� �  $   ��    �   ��   ��   �   �   ��   ��   ��   �� 	  �� 
  ��      �   �   ��    �   �   �   �   �   �   �   �   �   �   �   �   � �   � 2 f f f f f f &f &f &f ;f &f &f f Zg Zg Vg Vg �i �i i i wh f �k �k �k�l�l�l�l�l�l�l�ll&l2l@lol�m�mbm3n3n2nInInHn�s^s C- �  <    �,2�Z*�4>+�6�6:*��<8:<�?�AY�fYCSY4S�J�P�O�QY6� 6*,��M,6�Z�a���� � :� �:*,��M���� :� #�� � #:		�b� � :
� 
�:�c�,#�Z**� !���x�� �*,¶&*��?+�6��:*��<��%�F���'�F������F���AY�fYCSY8SYSY#S�J���O�S� �*,��&�C*,:�&**� Ŷ��x�� �*,<�&*��@+�6��:*��<��%�F���'�F������F���AY�fYCSY8S�J���O�S� �*,¶&� �*,<�&*��A+�6��:*��<��%�F���'�F������F���AY�fYCSY8SY+SY#S�J���O�S� �*,¶&*,-�&,>�Z,*g�\Y@S�����Z,B�Z*�  Y u x� x } x� N � �� � � �� N � �� � � �� � � �� � � �� �   �   ���    ��   ���   ���   ��   ��   ���   ���   ���   ��� 	  ��� 
  ���   �   �    �! �   r  >� � �� ����&�B� ��{�������������=�O�a�}���{�s� �������� D- �  � 	   �,�Z,*)�<**� }�\YS�Z��**� Ѷ�����Z, �Z,*)�<**� }�\YS�Z��**� Ѷ�����Z,"�Z,*g�\Y$S�����Z,&�Z,**� M����Z,ܶZ,**� M����Z,(�Z,*-�<**� }�\YS�Z��**� Ѷ�����Z,*�Z,*-�<**� }�\YS�Z��**� Ѷ�����Z,,�Z,*.�<**� �/1*�fY**� ���S�5���Z,7�Z,*g�\Y$S�����Z,9�Z,**� e����Z,ܶZ,**� e����Z,(�Z,*2�<**� }�\YS�Z��**� Ѷ�����Z,;�Z,*2�<**� }�\YS�Z��**� Ѷ�����Z,,�Z,*3�<**� �/1*�fY**� I��S�5���Z,7�Z,*g�\Y$S�����Z,=�Z,**� m����Z,ܶZ,**� m����Z,(�Z,*7�<**� }�\YS�Z��**� Ѷ�����Z,?�Z,*7�<**� }�\YS�Z��**� Ѷ�����Z,,�Z,*8�<**� �/1*�fY**� ���S�5���Z,7�Z,*g�\Y$S�����Z,A�Z,**� A����Z,ܶZ,**� A����Z,C�Z,*@�<**� }�\YS�Z��**� Ѷ�����Z*�   �   *   ���    ��   ���   ��� �  � r ) ) $) $) ) ) ) D) D) Y) Y) D) D) <) r* r* q* �* �* �* �* �* �* �- �- �- �- �- �- �- �- �--- �- �- �--.?.-.-.%.Y/Y/X/w/w/v/�/�/�/�2�2�2�2�2�2�2�2�2�2�2�2�2�23&3333@4@4?4^4^4]4t4t4s4�7�7�7�7�7�7�7�7�7�7�7�7�7�7�88�8�8�8'9'9&9E9E9D9[9[9Z9x@x@�@�@x@x@p@ .- �      �,��Z*��8+�6��:*v�<����F������F����#������AY�fYCSY�SY�SY�S�J���O� Y6� 7*,��M*,��&���� � :� �:*,��M��� :� #�� � #:		��� � :
� 
�:���,�Z*�49+�6�6:*}�<8:<�?�AY�fYCSYS�J�P�O�QY6� 6*,��M,�Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,
�Z*��:+�6��:*��<���F����F�����F����F���#�������F��AY�fYCSYS�J���O�S� �,�Z*�4;+�6�6:*��<8:<�?�AY�fYCSYS�J�P�O�QY6� 6*,��M,!�Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,#�Z**� Ŷ��x�� �*,¶&*��<+�6��:*��<��%�F���'�F������F���AY�fYCSY)SY+SY#S�J���O�S� �*,-�&� �*,¶&*��=+�6��:*��<��%�F���'�F������F���AY�fYCSY)SYSY#S�J���O�S� �*,-�&*�  � � �� � � �� � � �� � � �� � � �� � � �� � � �� � � ��Tps�sxs�I�������I���������������������������*�*�'*�*/*� �  8   ���    ��   ���   ���   �"#   �$�   ���   ���   ���   ��� 	  ��� 
  ���   �%�   �&�   ���   ���   � �   ��   ��   ��   �'   �(�   �)�   ��   ��   ��   ��   ��   ��   �*   �+ �   �   %v 7v Iv hv tv v9}}������,�A�]�����~�B�J�y�������[��"�4�P�����B�    �      �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� �**+,� �**+,� �	�   �       ���    �,-   �./  01 �        �*��L*�N*� *-+�	� �*-+��� �*+"�&*�2f-�6�8:*�<>@��F�I�O�S� �+ɶZ*�2g-�6�8:*�<>@��F�I�O�S� �+ͶZ�   �   >    ���     ���    ���    �    �23    �43 �     R� 4� �� s�    W- �   	   *,��&*�UC+�6�W:*9�<Y� �F�ZY\^�F�aY�*��\Y�S����c���F�d�O�eY6� N*,��M*,�R� :� '� _�*,"�&�S��ܨ � :� �:*,��M��T� :	� #	�� � #:

�U� � :� �:�V�*�  | � �� � � �� � � �� q � �� � � �� � � �� q � �� � � �� � � �� � � �� � � �� �   �   ��    �   ��   ��   56   7�   ��   ��   ��   �� 	  �� 
  ��   8� �     &9 89 J9 J9 ^9 J9 9 {- �  _    �,�Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z,߶Z,*p�<�**� Ѷ�����Z,�Z*�4Z+�6�6:*p�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,��Z�a���� � :� �:*,��M���� :� #�� � #:		�b� � :
� 
�:�c�,�Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z,߶Z,*s�<�**� Ѷ�����Z,�Z*�4[+�6�6:*s�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,�Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,�Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z,߶Z,*v�<�**� Ѷ�����Z,�Z*�4\+�6�6:*v�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,��Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,�Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z*�  � � �� � � �� � �� �� � �� ������������(�"%(��7�"%7�(47�7<7� � % ��@L�FIL��@[�FI[�LX[�[`[� �     ���    ��   ���   ���   �9�   �:�   ���   ���   ���   ��� 	  ��� 
  ���   �;�   �<�   ���   ���   � �   ��   ��   ��   �=�   �>�   ��   ��   ��   ��   ��   �� �   � 0 o o o &p &p %p Lp Op Op Lp Lp Dp �p gp,r,r+rJsJsIspssssspspshs�s�sPuPuOunvnvmv�v�v�v�v�v�v�v�vtxtxsx�y�y�y 	- �  + 	   �*,��&*� ���I*,��&**� ������ *,��&*� ���I*,��&*,��&*��\Y�S����p��  *,��&*� u��I*,��&� *,��&*� u��I*,��&*,��&*��\Y�S*o�<*��\Y�S�������*,��&*��\Y�S*p�<*��\Y�S�������*,��&**� u����p�~��vY�z� W**� ���z� �*,��&*t�<**��\Y�S�������� �*,��&*��+�6��:*u�<����F����*��\Y�S�����F����Ը��۶��O�S� �*,�&*,��&*,�&*��+�6��:*y�<����F����*��\Y�S�����F����*��\Y�S�����F����*��\Y�S�����F���7**� u����F� �**� ɶ�z���O�S� �*�   �   >   ���    ��   ���   ���   �?@   �AB �   E  `  `  `  `  a  a  a " a  a 7 b 7 b 3 b 3 b  a M i ] i t j t j p j p j � l � l � l � l � k M i � o � o � o � o � o � o � p � p � p � p � p � p r r r r* r* r rG tG tF tF tF t� u� u� u� ui uF t r y z z> {> {_ |_ |� }� }� ~� ~� y C1 �   "     �۰   �       ��   D  �   (     
*�Ӷױ   �       
��   �- �  �  $  P,ӶZ,*g�\Y�S�����Z,նZ*�4N+�6�6:* �<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,ٶZ�a���� � :� �:*,��M���� :� #�� � #:		�b� � :
� 
�:�c�,۶Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z,߶Z,*	�<�**� Ѷ�����Z,�Z*�4O+�6�6:*	�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,�Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,�Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z,߶Z,*�<�**� Ѷ�����Z,�Z*�4P+�6�6:*�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,��Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,�Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z,߶Z,*�<�**� Ѷ�����Z,�Z*�4Q+�6�6:*�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,�Z�a���� � :� �:*,��M���� : � # �� � #:!!�b� � :"� "�:#�c�#*�   w � �� � � �� l � �� � � �� l � �� � � �� � � �� � � ��������������������������������������������
�
�����
�������".�(+.��"=�(+=�.:=�=B=� �  j $  P��    P�   P��   P��   PE�   PF�   P��   P��   P��   P�� 	  P�� 
  P��   PG�   PH�   P��   P��   P �   P�   P�   P�   PI�   PJ�   P�   P�   P�   P�   P�   P�   PK�   PL�   PM�   PN�   PO�    PP� !  PQ� "  PR� #�   � / � � � \  %  � � �			.	1	1	.	.	&	�	I	,,+RUURRJ�m221PPOvyyvvn�� - �  9 	 (  ]*,��&��Y*���:*,��&*��+�6��:* ޶<����F����*C�\Y�S�����F���O�S� :���*,��&*�*!+�6�,:* �<�O�-Y6�*,��&*�4 �6�6:	* �<	8:<�?	�AY�fYCSY�SYGSY�S�J�P	�O	�QY6
� M*	
,��M,*C�\Y�S�����Z,��Z	�a��ݨ � :� �:*
,��M�	��� :� )� q���� � #:	�b� � :� �:	�c�*,��&�d���g� :� &���� � #:�h� � :� �:�i�*,��&*� y**� ���I*,��&�L�R:�:�:����              #�*,��&*� �#�I*,��&*�*#+�6�,:* �<�O�-Y6�I*,¶&*�4"�6�6:* �<8:<�?�AY�fYCSY�SYGSY�S�J�P�O�QY6� �*,��M,�Z,*C�\Y�S�����Z,ȶZ,**� %�\YWS�Z���Z,ʶZ,**� %�\Y^S�Z���Z,̶Z�a���� � :� �:*,��M���� :� )� q� ��� � #:�b� � : �  �:!�c�!*,��&�d����g� :"� &� "�� � #:##�h� � :$� $�:%�i�%*,ζ&**� Q�fY* �<**� Q��n�c�qS**� 9��u*,��&� �� � :&� &�:'�z�'*� 0GJ�JOJ�	p|�vy|�	p��vy��|������� �p��v������� �p��v����������������_b�bgb�������������������������s�����������s�������������������  xi ~piv�i�	i  xk ~pkv�k�	k  xJ� ~pJ�v�J��	J��J���J��GJ�JOJ� �  � (  ]��    ]�   ]��   ]��   ]ST   ]UB   ]��   ]VW   ]X�   ]Y� 	  ]Z� 
  ]��   ]8�   ][�   ]��   ]��   ] �   ]�   ]�   ]�   ]�   ]\   ]]   ]^�   ]_W   ]`�   ]a�   ]b�   ]�   ]c�   ]M�   ]N�   ]O�    ]P� !  ]Q� "  ]R� #  ]d� $  ]e� %  ]f� &  ]g� '�   � , ; � M � M �  � � � � � � � � � � � �� �� �� �� �I �I �E �E �� �� �� �� �� � � � �5 �5 �4 �� �W � � � � �% � �+ �+ �+ � � �  � l  �  A 	   *�0�2��0����0��и0��
�0���0���0���\YS�(�0�*2�0�4��0���\YS��ظ0���\YS���\YS���\YS�)�\YAS�C�\YAS�PS�0�U��0���0����0���0���Y�ѳӻAY�fY�SY�fY��SS�J�۱   �      ��  �    � �- �  9 	 (  ]*,��&��Y*���:*,��&*��+�6��:* ¶<����F����*C�\Y�S�����F���O�S� :���*,��&*�*+�6�,:* ƶ<�O�-Y6�*,��&*�4�6�6:	* Ƕ<	8:<�?	�AY�fYCSY�SYGSY�S�J�P	�O	�QY6
� M*	
,��M,*C�\Y�S�����Z,�Z	�a��ݨ � :� �:*
,��M�	��� :� )� q���� � #:	�b� � :� �:	�c�*,��&�d���g� :� &���� � #:�h� � :� �:�i�*,��&*� y**� ��I*,��&�L�R:�:�:���              #�*,��&*� �#�I*,��&*�*+�6�,:* ζ<�O�-Y6�I*,¶&*�4�6�6:* ϶<8:<�?�AY�fYCSY�SYGSY�S�J�P�O�QY6� �*,��M,�Z,*C�\Y�S�����Z,ȶZ,**� %�\YWS�Z���Z,ʶZ,**� %�\Y^S�Z���Z,̶Z�a���� � :� �:*,��M���� :� )� q� ��� � #:�b� � : �  �:!�c�!*,��&�d����g� :"� &� "�� � #:##�h� � :$� $�:%�i�%*,ζ&**� Q�fY* ֶ<**� Q��n�c�qS**� ���u*,��&� �� � :&� &�:'�z�'*� 0GJ�JOJ�	p|�vy|�	p��vy��|������� �p��v������� �p��v����������������_b�bgb�������������������������s�����������s�������������������  xi ~piv�i�	i  xk ~pkv�k�	k  xJ� ~pJ�v�J��	J��J���J��GJ�JOJ� �  � (  ]��    ]�   ]��   ]��   ]ST   ]mn   ]��   ]oW   ]p�   ]q� 	  ]r� 
  ]��   ]8�   ][�   ]��   ]��   ] �   ]�   ]�   ]�   ]�   ]\   ]]   ]s�   ]tW   ]u�   ]v�   ]w�   ]�   ]c�   ]M�   ]N�   ]O�    ]P� !  ]Q� "  ]R� #  ]d� $  ]e� %  ]f� &  ]g� '�   � , ; � M � M �  � � � � � � � � � � � �� �� �� �� �I �I �E �E �� �� �� �� �� � � � �5 �5 �4 �� �W � � � � �% � �+ �+ �+ � � �  � �- �    
   �, �Z,*��<**� ��\YS�Z��**� Ѷ�����Z,H�Z,**� ��\YS�Z���Z,J�Z,*��<***� ��\YLS�Z�O�Z,Q�Z,*��<***� ��\YSS�Z�O�Z,��Z**� ��\YWS�Z%�p���*,-�&*� �*��<**� ��\YWS�Z��^���^�b*,-�&*� �*��<**� ����������^�b*,-�&*�*��<***� ������*��<***� ��\YWS�Z����**� ������**� �����**� ������**� ���������I*,-�&*�*a+�6�,:*��<�O�-Y6� ",*��<***���\�Z�d����g� :� #�� � #:�h� � :� �:	�i�	*,-�&*�*b+�6�,:
*��<
�O
�-Y6� ",*��<***���a�Z
�d���
�g� :� #�� � #:
�h� � :� �:
�i�*,��&*� ��
���
��$�T�������T��������������� �   �   ���    ��   ���   ���   �xW   �y�   ���   ���   ���   ��� 	  �zW 
  �{�   �8�   �[�   ���   ��� �  & I � � $� $� � � � =� =� <� e� e� d� d� \� �� �� �� �� �� �� �� �� �� �� �� �� �� ����������C�>�>�T�T�S�S�q�l�l��z�z�������������=�=�2�2�������������h�h�g�g�_�8� �� - �  S 
 )  	*,"�&*�2+�6�8:*�<>@B�F�I�O�S� �,U�Z*�<**g�\Y^S�bd�f�jl�p�~��vY�z� *W*|�\Y~SY�S����p�~��v�z� I*,��&*��+�6��:*�<����F���O�S� �*,"�&*,��&*,��&*��+�6��:*�<���������*��\Y�S�����F�����*�<*�Ķ��F���O�S� �*,Ͷ&*��+�6��:*�<�O��Y6�{*,��M*,�/� :	�T��	�*,�P� :
�=�u
�*� �*I�<**I�<*<R�BT�fY**� ���S�j�I*� !*J�<**J�<*<R�BV�fY**� ��S�j�I*� Q*L�<*�Z�^�b*N�<**g�\YdSYfS�����j� *� �l�I� *� �n�I*U�<*U�<*��\Y�S������r�u�x�� 9*��\Y�S*V�<*V�<*��\Y�S������ ��|������� � :� �:*,��M���� :� #�� � #:��� � :� �:���*,��&**� ����*,��&��Y*���:*+,�� :�X�*,�&�J�P:�:�:���             #�*,!�&*� �#�I*,%�&*�*+�6�,:* ��<�O�-Y6�H*,/�&*�4�6�6:* ��<8:<�?�AY�fYCSYESYGSYES�J�P�O�QY6� �*,��M,S�Z,*��\Y�S�����Z,U�Z,**� %�\YWS�Z���Z,\�Z,**� %�\Y^S�Z���Z,`�Z�a���� � :� �:*,��M���� :� )� q� ��� � #:�b� � :� �:�c�*,!�&�d����g� : � &�  �� � #:!!�h� � :"� "�:#�i�#*,k�&**� Q�fY* ��<**� Q��n�c�qS**� ���u*,w�&� �� � :$� $�:%�z�%*,|�&*��\Y�S%��*,��&�**� ��� �*,��&*� U~�I*,��&*� ��I*,��&*� 1**� ն�I*,��&* ��<**��������W*,��&*�2+�6�8:&* ��<&>@��F�I&�O&�S� �*,��&*��+�6��:'* ��<'�O'�S� �*,Ͷ&�(**� E�����vY�z� ;W* ��<* ��<*C�\Y�S������r�u�x�t|�v�z� �*,��&*��+�6��:(* ��<(��������(���* ��<*C�\Y�S����**� Ѷ�������F��(�O(�S� �*,��&�G**� E�����vY�z� ;W* ��<* ��<*C�\Y�S������r�u�x�t|�v�z� *+,��� �*,��&� �**� E�ն��vY�z� ;W* ��<* ��<*C�\Y�S������r�u�x�t|�v�z� *+,��� �*,��&� m**� E����vY�z� ;W* ۶<* ۶<*C�\Y�S������r�u�x�t|�v�z� *+,�� �*,�&*� (�����������4���4��(4�.14���C���C��(C�.1C�4@C�CHC�u�������j#� #�j2� 2�#/2�272�n�bn�hkn�}�b}�hk}�nz}�}�}�|��i���i|��k���k|����������b��h������� �  � )  	��    	�   	��   	��   	|3   	}~   	�   	��   	��   	�� 	  	�� 
  	��   	8�   	[�   	��   	��   	 �   	T   	�   	\   	]   	��   	�W   	��   	��   	��   	�   	�   	�   	c�   	M�   	N�   	O�    	P� !  	Q� "  	R� #  	d� $  	e� %  	�3 &  	�� '  	�~ (�  J � #    J  e  J  J  |  �  |  |  J  �  �  J  �  , , O X X O  � � I� I� I  I� I� I� I� I! J$ J  J3 J J J J JM LL LL LB LB L^ N^ N] N� O� O} O} O� Q� Q� Q� Q� P] N� U� U� U� U� U� U� V� V� V� V� V� V� V� V� V� U~ ] ]] ]\ ]� �� �� �� �N �Z �� �� �� �� �� �� �� �� �� � �� �� �� �� �� �� �� �� �� �� �� �� �o ^� �� �� �� � � � �& �& �" �" �8 �8 �4 �4 �J �J �F �F �e �e �n �d �d �d �� �} �� �� �� �� �� �� �� � � � � � �1 � � �� �j � �� �� �� �� �� �� � �L �� �� �� �� �� �� �� �� �� �� �� � �� �� �� �= �= �A �D �< �< �c �c �c �c �c � �c �c �< �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �< �� �� � �\ ]    �   #     *� 
�   �       ��   |- �  �  ,  j,[�Z*� a]�I*,"�&*�4D+�6�6:*��<8:<�?�AY�fYCSY_SYGSY_S�J�P�O�QY6� L*,��M,a�Z,**� a����Z,c�Z�a��ި � :� �:*,��M���� :� #�� � #:		�b� � :
� 
�:�c�*,"�&*�4E+�6�6:*��<8:<�?�AY�fYCSYeSYGSYeS�J�P�O�QY6� L*,��M,g�Z,**� a����Z,i�Z�a��ި � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�*,"�&*�4F+�6�6:*��<8:<�?�AY�fYCSYkSYGSYkS�J�P�O�QY6� L*,��M,m�Z,**� a����Z,o�Z�a��ި � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�*,��&*�4G+�6�6:*��<8:<�?�AY�fYCSYqSYGSYsS�J�P�O�QY6� 6*,��M,u�Z�a���� � :� �:*,��M���� : � # �� � #:!!�b� � :"� "�:#�c�#*,"�&*�4H+�6�6:$*��<$8:<�?$�AY�fYCSYwSYGSYyS�J�P$�O$�QY6%� 6*$%,��M,{�Z$�a���� � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)�b� � :*� *�:+$�c�+*� ( w � �� � � �� l � �� � � �� l � �� � � �� � � �� � � ��^�������S�������S���������������Ewz�zz�:�������:���������������,HK�KPK�!kw�qtw�!k��qt��w���������!��<H�BEH��<W�BEW�HTW�W\W� �  � ,  j��    j�   j��   j��   j��   j��   j��   j��   j��   j�� 	  j�� 
  j��   j��   j��   j��   j��   j �   j�   j�   j�   j��   j��   j�   j�   j�   j�   j�   j�   j��   j��   jM�   jN�   jO�    jP� !  jQ� "  jR� #  j�� $  j�� %  jf� &  jg� '  j�� (  j�� )  j�� *  j�� +�   r  � � � � P� \� �� �� �� �7�C�p�p�o� ��*�W�W�V������������� ~- �  E    �,߶Z,*y�<�**� Ѷ�����Z,�Z*�4]+�6�6:*y�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,��Z�a���� � :� �:*,��M���� :� #�� � #:		�b� � :
� 
�:�c�,�Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z,߶Z,*|�< **� Ѷ�����Z,�Z*�4^+�6�6:*|�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,�Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,�Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z,߶Z,*�<**� Ѷ�����Z,�Z*�4_+�6�6:*�<8:<�?�AY�fYCSYS�J�P�O�QY6� 6*,��M,�Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,�Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z,߶Z,*��<	**� Ѷ�����Z*�  | � �� � � �� q � �� � � �� q � �� � � �� � � �� � � ��������������������������������������������	���	��#� �     ���    ��   ���   ���   ���   ���   ���   ���   ���   ��� 	  ��� 
  ���   ���   ���   ���   ���   � �   ��   ��   ��   ���   ���   ��   ��   ��   ��   ��   �� �   � 0 y y y y y y ay *y �{ �{ �{|||3|6|6|3|3|+|�|N|~~~110WZZWWO�r7�7�6�U�U�T�{�~�~�{�{�s� �- �    %  !,�Z,*g�\Y�S�����Z,��Z*�4/+�6�6:*T�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,��Z�a���� � :� �:*,��M���� :� #�� � #:		�b� � :
� 
�:�c�,��Z*�40+�6�6:*Y�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,��Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,��Z*�41+�6�6:*\�<8:<�?�AY�fYCSY�SYGSY�S�J�P�O�QY6� 6*,��M,��Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�*,��&*��2+�6��:*]�<����F�����F��������۶�����������**� ݶ���F����**� �����F���AY�fY�SY�SYCSY�SY�SY�S�J���O�S� �,��Z*�43+�6�6:*b�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,��Z�a���� � :� �: *,��M� ��� :!� #!�� � #:""�b� � :#� #�:$�c�$*�   w � �� � � �� l � �� � � �� l � �� � � �� � � �� � � ��;WZ�Z_Z�0z������0z��������������'*�*/*� JV�PSV� Je�PSe�Vbe�eje�������������������������� �  t %  !��    !�   !��   !��   !��   !��   !��   !��   !��   !�� 	  !�� 
  !��   !��   !��   !��   !��   ! �   !�   !�   !�   !��   !��   !�   !�   !�   !�   !�   !�   !�   !��   !��   !N�   !O�    !P� !  !Q� "  !R� #  !d� $�   b  S S S \T %T Y �Y�\�\�\�]�]�]�]�]�]]])]5]A]~]�bbb x- �  v  $  F,߶Z,*�<**� Ѷ�����Z,�Z*�4U+�6�6:*�<8:<�?�AY�fYCSYS�J�P�O�QY6� 6*,��M,�Z�a���� � :� �:*,��M���� :� #�� � #:		�b� � :
� 
�:�c�,�Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z,߶Z,*�<	**� Ѷ�����Z,�Z*�4V+�6�6:*�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,��Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,�Z**� }�\YS�Z�z� *+,�q� �*,��&,s�Z,*g�\Y�S�����Z,նZ*�4X+�6�6:*d�<8:<�?�AY�fYCSYuS�J�P�O�QY6� 6*,��M,w�Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,۶Z,*g�\Y@S�����Z,ݶZ,*��\Y�S�����Z,߶Z,*m�<�**� Ѷ�����Z,�Z*�4Y+�6�6:*m�<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,�Z�a���� � :� �:*,��M���� : � # �� � #:!!�b� � :"� "�:#�c�#*�   | � �� � � �� q � �� � � �� q � �� � � �� � � �� � � �������������������������������������������� ��� ������� �����������$�!$��3�!3�$03�383� �  j $  F��    F�   F��   F��   F��   F��   F��   F��   F��   F�� 	  F�� 
  F��   F��   F��   F��   F��   F �   F�   F�   F�   F��   F��   F�   F�   F�   F�   F�   F�   F��   F��   FM�   FN�   FO�    FP� !  FQ� "  FR� #�   � +       a * � � �36633+�N!!FcFcEc�dcd(l(l'lFmFmEmlmomomlmlmdm�m�m �- �  �     �*,��&*�c+�6�:*��<���F��O�Y6� Z*,��� :� x�*,��� :� d�,��Z,**� ��\YiS�Z���Z,k�Z�l����m� :� #�� � #:		�h� � :
� 
�:�n�*� 
 6 O �� U c �� i � �� � � �� 6 O �� U c �� i � �� � � �� � � �� � � �� �   z    ���     ��    ���    ���    ���    ���    ���    ���    ���    ��� 	   ��� 
   ��� �     &� q� q� p� � �- �  � 	 B  *,��&*�4$+�6�6:* ��<8:<�?�AY�fYCSYSYGSYS�J�P�O�QY6� 6*,��M,�Z�a���� � :� �:*,��M���� :� #�� � #:		�b� � :
� 
�:�c�*,Ͷ&��Y*���:*,�&*� �*g�\YdSYS���I*� �*|�\YSYS����**�<*<�B���\YS����� �ȶI*� )**� ٶ��"�ȶI*,$�&*�%�I*,&�&*� �%�I*,��&�.�4:�:�:�)��              #�*,��&*� �#�I*,��&*�*&+�6�,:*�<�O�-Y6�+*,��&*�4%�6�6:*�<8:<�?�AY�fYCSY+SYGSY-S�J�P�O�QY6� v*,��M,/�Z,**� %�\YWS�Z���Z,1�Z,**� %�\Y^S�Z���Z,3�Z�a���� � :� �:*,��M���� :� )� q� ��� � #:�b� � :� �:�c�*,��&�d����g� :� &� �� � #:�h� � :� �:�i�*,5�&**� Q�fY*�<**� Q��n�c�qS**�	��u*,��&� �� � :� �:�z�*,7�&*� �n�I*,"�&**� !��z��vY�z� W**� Ŷ�z��v�z� *,9�&*� �l�I*,"�&*,"�&��Y*���: *,|�&*��'+�6��:!*#�<!��;�F��!��=�F�>!�7��F� !�O!�S� :"� �"�*,��&**� ���:*,��&� p� v:##�:$$�:%%�C��    C            #%�*,5�&*� =*)�<*E�I�I*,K�&� $�� � :&� &�:' �z�'*,"�&��Y*���:(*,��&*��)+�6��:)*.�<)��;�F��)��M�F�>)�7��F� )�O)�S� :*� �*�*,��&**� ���:*,��&� p� v:++�:,,�:--�P��    C           (#-�*,��&*� �*1�<*E�I�I*,��&� ,�� � :.� .�:/(�z�/*,Ͷ&*�*e+�6�,:0*7�<0�O0�-Y61�F*0,�Y� :2�d2�*0,�~� :3�P3�*0,��� :4�<4�*0,��� :5�(5�,��Z**� ���z� �,��Z*�4d0�6�6:6*۶<68:<�?6�AY�fYCSY�S�J�P6�O6�QY67� 6*67,��M,��Z6�a���� � :8� 8�:9*7,��M�96��� ::� &� q:�� � #:;6;�b� � :<� <�:=6�c�=,��Z,¶Z0�d���0�g� :>� #>�� � #:?0?�h� � :@� @�:A0�i�A*� G f � �� � � �� [ � �� � � �� [ � �� � � �� � � �� � � ��}�������r��r���"�Y�MY�SVY�h�Mh�SVh�Yeh�hmh� ���i ���k �������M��S�������L��i���iL��k���kL�:���:��7:�:?:�`��i���i`��k���k`�N���N��KN�NSN�Mil�lql�B�������B������������������������������������������������������������������������������� �  � B  ��    �   ��   ��   ��   ��   ��   ��   ��   �� 	  �� 
  ��   8T   [\   �]   ��   �W   ��   ��   ��   �   �   �   �   �   �   �   �   �   c�   M�   N�   OT    �B !  Q� "  R\ #  d] $  �� %  f� &  g� '  �T (  �B )  �� *  �\ +  �] ,  �� -  �� .  �� /  �W 0  �� 1  �� 2  �� 3  �� 4  �� 5  �� 6  �� 7  �� 8  �� 9  �� :  �� ;  �� <  � =  �� >  �� ?  �� @  '� A�  � q ? � K �  � �  �  � 251))Q^^i^^Z � �~~zz�����
�
�
�
Vb������������������ � ����������))%%�r#�#�#T#� � �%�%� )))))? �.�.�.h.�-�-�/�/�-110101%1%1S-��2�����g7 �- �  9 	 (  ]*,��&��Y*���:*,��&*��+�6��:* ��<����F����*C�\Y�S�����F���O�S� :���*,��&*�*+�6�,:* ��<�O�-Y6�*,��&*�4�6�6:	* ��<	8:<�?	�AY�fYCSY�SYGSY�S�J�P	�O	�QY6
� M*	
,��M,*C�\Y�S�����Z,��Z	�a��ݨ � :� �:*
,��M�	��� :� )� q���� � #:	�b� � :� �:	�c�*,��&�d���g� :� &���� � #:�h� � :� �:�i�*,��&*� y**� ��I*,��&�L�R:�:�:����              #�*,��&*� �#�I*,��&*�*+�6�,:* ��<�O�-Y6�I*,¶&*�4�6�6:* ��<8:<�?�AY�fYCSY�SYGSY�S�J�P�O�QY6� �*,��M,ƶZ,*C�\Y�S�����Z,ȶZ,**� %�\YWS�Z���Z,ʶZ,**� %�\Y^S�Z���Z,̶Z�a���� � :� �:*,��M���� :� )� q� ��� � #:�b� � : �  �:!�c�!*,��&�d����g� :"� &� "�� � #:##�h� � :$� $�:%�i�%*,ζ&**� Q�fY* ��<**� Q��n�c�qS**� ��u*,��&� �� � :&� &�:'�z�'*� 0GJ�JOJ�	p|�vy|�	p��vy��|������� �p��v������� �p��v����������������_b�bgb�������������������������s�����������s�������������������  xi ~piv�i�	i  xk ~pkv�k�	k  xJ� ~pJ�v�J��	J��J���J��GJ�JOJ� �  � (  ]��    ]�   ]��   ]��   ]ST   ]�B   ]��   ]�W   ]��   ]�� 	  ]�� 
  ]��   ]8�   ][�   ]��   ]��   ] �   ]�   ]�   ]�   ]�   ]\   ]]   ]��   ]�W   ]��   ]��   ]��   ]�   ]c�   ]M�   ]N�   ]O�    ]P� !  ]Q� "  ]R� #  ]d� $  ]e� %  ]f� &  ]g� '�   � , ; � M � M �  � � � � � � � � � � � �� �� �� �� �I �I �E �E �� �� �� �� �� � � � �5 �5 �4 �� �W � � � � �% � �+ �+ �+ � � �  � P- �  �    |,g�Z*�2++�6�8:*;�<>@i�F�I�O�S� �*,"�&*�2,+�6�8:*<�<>@k�F�I�O�S� �*,��&**� y��  ,m�Z,**� y����Z,o�Z,q�Z*�4-+�6�6:*G�<8:<�?�AY�fYCSYsS�J�P�O�QY6� 6*,��M,u�Z�a���� � :� �:	*,��M�	��� :
� #
�� � #:�b� � :� �:�c�,w�Z*�4.+�6�6:*K�<8:<�?�AY�fYCSYyS�J�P�O�QY6� 6*,��M,{�Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,}�Z**� ���z��/*+,��� �*+,��� �*+,�0� �*+,�E� �*�4B+�6�6:*��<8:<�?�AY�fYGSYGSYCSYGS�J�P�O�QY6� 6*,��M,I�Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,K�Z,**� ]����Z,M�Z,**� ]����Z,O�Z*� $'�','� �GS�MPS� �Gb�MPb�S_b�bgb�������������&�&�#&�&+&������ ���'�!$'��6�!$6�'36�6;6� �  .   |��    |�   |��   |��   |�3   |�3   |��   |��   |��   |�� 	  |�� 
  |��   |8�   |[�   |��   |��   | �   |�   |�   |�   |�   |�   |��   |��   |�   |�   |�   |�   |�   |c� �   r  %; ; e< G< �? �? �? �B �B �B �? �G �G�KzK>P>P>P����~�O�O�N�e�e�d�>P �- �      x*,��&*��L+�6��:*ڶ<����F������F���O��Y6� P*,��M,ĶZ,**� �����ǶZ*,��&�Ț�ڨ � :� �:*,��M���� :� #�� � #:		�ʨ � :
� 
�:�˩*,Ͷ&*��M+�6��:*�<����F������F���O��Y6� P*,��M,ѶZ,**� �����ǶZ*,��&�Ț�ڨ � :� �:*,��M���� :� #�� � #:�ʨ � :� �:�˩*,��&**� }���� (*,��&*� }*�<*E�I�I*,"�&*,��&**� ����� (*,��&*� �*��<*E�I�I*,"�&*,��&**� ���z��=*+,��� �*+,�� �*+,�z� �*+,�}� �*+,��� �,�Z*�4`+�6�6:*��<8:<�?�AY�fYCSY�S�J�P�O�QY6� 6*,��M,��Z�a���� � :� �:*,��M���� :� #�� � #:�b� � :� �:�c�,��Z**� ��\YS�Z�z� *+,��� �*,��&,��Z*�  S � �� � � �� H � �� � � �� H � �� � � �� � � �� � � ��+ad�did� ������� ���������������������������+�+�(+�+0+� �     x��    x�   x��   x��   x��   x��   x��   x��   x��   x�� 	  x�� 
  x��   x��   x��   x��   x��   x �   x�   x�   x�   x��   x��   x�   x�   x�   x�   x�   x� �   � * &� 8� e� e� d� � ���=�=�<� �����������������������������������������,�,�,����C�C�,� �- �  � 	   �,�Z,*��<**� ��\YS�Z��**� Ѷ�����Z, �Z,*��<**� ��\YS�Z��**� Ѷ�����Z,"�Z,*g�\Y$S�����Z,&�Z,**� M����Z,ܶZ,**� M����Z,(�Z,*��<**� ��\YS�Z��**� Ѷ�����Z,*�Z,*��<**� ��\YS�Z��**� Ѷ�����Z,,�Z,*��<**� �/1*�fY**� ���S�5���Z,7�Z,*g�\Y$S�����Z,9�Z,**� e����Z,ܶZ,**� e����Z,(�Z,*��<**� ��\YS�Z��**� Ѷ�����Z,;�Z,*��<**� ��\YS�Z��**� Ѷ�����Z,,�Z,*��<**� �/1*�fY**� I��S�5���Z,7�Z,*g�\Y$S�����Z,=�Z,**� m����Z,ܶZ,**� m����Z,(�Z,*��<**� ��\YS�Z��**� Ѷ�����Z,?�Z,*��<**� ��\YS�Z��**� Ѷ�����Z,,�Z,*��<**� �/1*�fY**� ���S�5���Z,7�Z,*g�\Y$S�����Z,A�Z,**� A����Z,ܶZ,**� A����Z,C�Z,*��<**� ��\YS�Z��**� Ѷ�����Z*�   �   *   ���    ��   ���   ��� �  � r � � $� $� � � � D� D� Y� Y� D� D� <� r� r� q� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ���� �� �� ��-�?�-�-�%�Y�Y�X�w�w�v������������������������������������&����@�@�?�^�^�]�t�t�s��������������������������������������'�'�&�E�E�D�[�[�Z�x�x�����x�x�p� N- �  �    �*�+�6�:*A�<�1�F�%���'�F�!�O�S� �*�	+�6�:*B�<�3�F�%���'�F�!�O�S� �*�
+�6�:*C�<�5�F�%���'�F�!�O�S� �*�+�6�:*D�<�7�F�%���'�F�!�O�S� �**� ��:*� �*G�<**G�<*<>�BD�f�j�I*� �*H�<**H�<*<K�BM�f�j�I*�   �   R   ���    ��   ���   ���   ���   ���   ���   ��� �   � #  A / A A A   A x B � B � B [ B � C � C � C � C. D@ DR D Dm m q Eq El � G� G� G� G� Gw Gw G� H� H� H� H� H� H� H      
   