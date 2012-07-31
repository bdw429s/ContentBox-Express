/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
function cfinit(){
if(!window.ColdFusion){
ColdFusion={};
var $C=ColdFusion;
if(!$C.Ajax){
$C.Ajax={};
}
var $A=$C.Ajax;
if(!$C.AjaxProxy){
$C.AjaxProxy={};
}
var $X=$C.AjaxProxy;
if(!$C.Bind){
$C.Bind={};
}
var $B=$C.Bind;
if(!$C.Event){
$C.Event={};
}
var $E=$C.Event;
if(!$C.Log){
$C.Log={};
}
var $L=$C.Log;
if(!$C.Util){
$C.Util={};
}
var $U=$C.Util;
if(!$C.DOM){
$C.DOM={};
}
var $D=$C.DOM;
if(!$C.Spry){
$C.Spry={};
}
var $S=$C.Spry;
if(!$C.Pod){
$C.Pod={};
}
var $P=$C.Pod;
if(!$C.objectCache){
$C.objectCache={};
}
if(!$C.required){
$C.required={};
}
if(!$C.importedTags){
$C.importedTags=[];
}
if(!$C.requestCounter){
$C.requestCounter=0;
}
if(!$C.bindHandlerCache){
$C.bindHandlerCache={};
}
window._cf_loadingtexthtml="<div style=\"text-align: center;\">"+window._cf_loadingtexthtml+"&nbsp;"+CFMessage["loading"]+"</div>";
$C.globalErrorHandler=function(_34c,_34d){
if($L.isAvailable){
$L.error(_34c,_34d);
}
if($C.userGlobalErrorHandler){
$C.userGlobalErrorHandler(_34c);
}
if(!$L.isAvailable&&!$C.userGlobalErrorHandler){
alert(_34c+CFMessage["globalErrorHandler.alert"]);
}
};
$C.handleError=function(_34e,_34f,_350,_351,_352,_353,_354,_355){
var msg=$L.format(_34f,_351);
if(_34e){
$L.error(msg,"http");
if(!_352){
_352=-1;
}
if(!_353){
_353=msg;
}
_34e(_352,_353,_355);
}else{
if(_354){
$L.error(msg,"http");
throw msg;
}else{
$C.globalErrorHandler(msg,_350);
}
}
};
$C.setGlobalErrorHandler=function(_357){
$C.userGlobalErrorHandler=_357;
};
$A.createXMLHttpRequest=function(){
try{
return new XMLHttpRequest();
}
catch(e){
}
var _358=["Microsoft.XMLHTTP","MSXML2.XMLHTTP.5.0","MSXML2.XMLHTTP.4.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP"];
for(var i=0;i<_358.length;i++){
try{
return new ActiveXObject(_358[i]);
}
catch(e){
}
}
return false;
};
$A.isRequestError=function(req){
return ((req.status!=0&&req.status!=200)||req.getResponseHeader("server-error"));
};
$A.sendMessage=function(url,_35c,_35d,_35e,_35f,_360,_361){
var req=$A.createXMLHttpRequest();
if(!_35c){
_35c="GET";
}
if(_35e&&_35f){
req.onreadystatechange=function(){
$A.callback(req,_35f,_360);
};
}
if(_35d){
_35d+="&_cf_nodebug=true&_cf_nocache=true";
}else{
_35d="_cf_nodebug=true&_cf_nocache=true";
}
if(window._cf_clientid){
_35d+="&_cf_clientid="+_cf_clientid;
}
if(_35c=="GET"){
if(_35d){
_35d+="&_cf_rc="+($C.requestCounter++);
if(url.indexOf("?")==-1){
url+="?"+_35d;
}else{
url+="&"+_35d;
}
}
$L.info("ajax.sendmessage.get","http",[url]);
req.open(_35c,url,_35e);
req.send(null);
}else{
$L.info("ajax.sendmessage.post","http",[url,_35d]);
req.open(_35c,url,_35e);
req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
if(_35d){
req.send(_35d);
}else{
req.send(null);
}
}
if(!_35e){
while(req.readyState!=4){
}
if($A.isRequestError(req)){
$C.handleError(null,"ajax.sendmessage.error","http",[req.status,req.statusText],req.status,req.statusText,_361);
}else{
return req;
}
}
};
$A.callback=function(req,_364,_365){
if(req.readyState!=4){
return;
}
req.onreadystatechange=new Function;
_364(req,_365);
};
$A.submitForm=function(_366,url,_368,_369,_36a,_36b){
var _36c=$C.getFormQueryString(_366);
if(_36c==-1){
$C.handleError(_369,"ajax.submitform.formnotfound","http",[_366],-1,null,true);
return;
}
if(!_36a){
_36a="POST";
}
_36b=!(_36b===false);
var _36d=function(req){
$A.submitForm.callback(req,_366,_368,_369);
};
$L.info("ajax.submitform.submitting","http",[_366]);
var _36f=$A.sendMessage(url,_36a,_36c,_36b,_36d);
if(!_36b){
$L.info("ajax.submitform.success","http",[_366]);
return _36f.responseText;
}
};
$A.submitForm.callback=function(req,_371,_372,_373){
if($A.isRequestError(req)){
$C.handleError(_373,"ajax.submitform.error","http",[req.status,_371,req.statusText],req.status,req.statusText);
}else{
$L.info("ajax.submitform.success","http",[_371]);
if(_372){
_372(req.responseText);
}
}
};
$C.empty=function(){
};
$C.setSubmitClicked=function(_374,_375){
var el=$D.getElement(_375,_374);
el.cfinputbutton=true;
$C.setClickedProperty=function(){
el.clicked=true;
};
$E.addListener(el,"click",$C.setClickedProperty);
};
$C.getFormQueryString=function(_377,_378){
var _379;
if(typeof _377=="string"){
_379=(document.getElementById(_377)||document.forms[_377]);
}else{
if(typeof _377=="object"){
_379=_377;
}
}
if(!_379||null==_379.elements){
return -1;
}
var _37a,elementName,elementValue,elementDisabled;
var _37b=false;
var _37c=(_378)?{}:"";
for(var i=0;i<_379.elements.length;i++){
_37a=_379.elements[i];
elementDisabled=_37a.disabled;
elementName=_37a.name;
elementValue=_37a.value;
if(!elementDisabled&&elementName){
switch(_37a.type){
case "select-one":
case "select-multiple":
for(var j=0;j<_37a.options.length;j++){
if(_37a.options[j].selected){
if(window.ActiveXObject){
_37c=$C.getFormQueryString.processFormData(_37c,_378,elementName,_37a.options[j].attributes["value"].specified?_37a.options[j].value:_37a.options[j].text);
}else{
_37c=$C.getFormQueryString.processFormData(_37c,_378,elementName,_37a.options[j].hasAttribute("value")?_37a.options[j].value:_37a.options[j].text);
}
}
}
break;
case "radio":
case "checkbox":
if(_37a.checked){
_37c=$C.getFormQueryString.processFormData(_37c,_378,elementName,elementValue);
}
break;
case "file":
case undefined:
case "reset":
break;
case "button":
_37c=$C.getFormQueryString.processFormData(_37c,_378,elementName,elementValue);
break;
case "submit":
if(_37a.cfinputbutton){
if(_37b==false&&_37a.clicked){
_37c=$C.getFormQueryString.processFormData(_37c,_378,elementName,elementValue);
_37b=true;
}
}else{
_37c=$C.getFormQueryString.processFormData(_37c,_378,elementName,elementValue);
}
break;
case "textarea":
var _37f;
if(window.FCKeditorAPI&&(_37f=$C.objectCache[elementName])&&_37f.richtextid){
var _380=FCKeditorAPI.GetInstance(_37f.richtextid);
if(_380){
elementValue=_380.GetXHTML();
}
}
_37c=$C.getFormQueryString.processFormData(_37c,_378,elementName,elementValue);
break;
default:
_37c=$C.getFormQueryString.processFormData(_37c,_378,elementName,elementValue);
break;
}
}
}
if(!_378){
_37c=_37c.substr(0,_37c.length-1);
}
return _37c;
};
$C.getFormQueryString.processFormData=function(_381,_382,_383,_384){
if(_382){
if(_381[_383]){
_381[_383]+=","+_384;
}else{
_381[_383]=_384;
}
}else{
_381+=encodeURIComponent(_383)+"="+encodeURIComponent(_384)+"&";
}
return _381;
};
$A.importTag=function(_385){
$C.importedTags.push(_385);
};
$A.checkImportedTag=function(_386){
var _387=false;
for(var i=0;i<$C.importedTags.length;i++){
if($C.importedTags[i]==_386){
_387=true;
break;
}
}
if(!_387){
$C.handleError(null,"ajax.checkimportedtag.error","widget",[_386]);
}
};
$C.getElementValue=function(_389,_38a,_38b){
if(!_389){
$C.handleError(null,"getelementvalue.noelementname","bind",null,null,null,true);
return;
}
if(!_38b){
_38b="value";
}
var _38c=$B.getBindElementValue(_389,_38a,_38b);
if(typeof (_38c)=="undefined"){
_38c=null;
}
if(_38c==null){
$C.handleError(null,"getelementvalue.elnotfound","bind",[_389,_38b],null,null,true);
return;
}
return _38c;
};
$B.getBindElementValue=function(_38d,_38e,_38f,_390,_391){
var _392="";
if(window[_38d]){
var _393=eval(_38d);
if(_393&&_393._cf_getAttribute){
_392=_393._cf_getAttribute(_38f);
return _392;
}
}
var _394=$C.objectCache[_38d];
if(_394&&_394._cf_getAttribute){
_392=_394._cf_getAttribute(_38f);
return _392;
}
var el=$D.getElement(_38d,_38e);
var _396=(el&&((!el.length&&el.length!=0)||(el.length&&el.length>0)||el.tagName=="SELECT"));
if(!_396&&!_391){
$C.handleError(null,"bind.getbindelementvalue.elnotfound","bind",[_38d]);
return null;
}
if(el.tagName!="SELECT"){
if(el.length>1){
var _397=true;
for(var i=0;i<el.length;i++){
var _399=(el[i].getAttribute("type")=="radio"||el[i].getAttribute("type")=="checkbox");
if(!_399||(_399&&el[i].checked)){
if(!_397){
_392+=",";
}
_392+=$B.getBindElementValue.extract(el[i],_38f);
_397=false;
}
}
}else{
_392=$B.getBindElementValue.extract(el,_38f);
}
}else{
var _397=true;
for(var i=0;i<el.options.length;i++){
if(el.options[i].selected){
if(!_397){
_392+=",";
}
_392+=$B.getBindElementValue.extract(el.options[i],_38f);
_397=false;
}
}
}
if(typeof (_392)=="object"){
$C.handleError(null,"bind.getbindelementvalue.simplevalrequired","bind",[_38d,_38f]);
return null;
}
if(_390&&$C.required[_38d]&&_392.length==0){
return null;
}
return _392;
};
$B.getBindElementValue.extract=function(el,_39b){
var _39c=el[_39b];
if((_39c==null||typeof (_39c)=="undefined")&&el.getAttribute){
_39c=el.getAttribute(_39b);
}
return _39c;
};
$L.init=function(){
if(window.YAHOO&&YAHOO.widget&&YAHOO.widget.Logger){
YAHOO.widget.Logger.categories=[CFMessage["debug"],CFMessage["info"],CFMessage["error"],CFMessage["window"]];
YAHOO.widget.LogReader.prototype.formatMsg=function(_39d){
var _39e=_39d.category;
return "<p>"+"<span class='"+_39e+"'>"+_39e+"</span>:<i>"+_39d.source+"</i>: "+_39d.msg+"</p>";
};
var _39f=new YAHOO.widget.LogReader(null,{width:"30em",fontSize:"100%"});
_39f.setTitle(CFMessage["log.title"]||"ColdFusion AJAX Logger");
_39f._btnCollapse.value=CFMessage["log.collapse"]||"Collapse";
_39f._btnPause.value=CFMessage["log.pause"]||"Pause";
_39f._btnClear.value=CFMessage["log.clear"]||"Clear";
$L.isAvailable=true;
}
};
$L.log=function(_3a0,_3a1,_3a2,_3a3){
if(!$L.isAvailable){
return;
}
if(!_3a2){
_3a2="global";
}
_3a2=CFMessage[_3a2]||_3a2;
_3a1=CFMessage[_3a1]||_3a1;
_3a0=$L.format(_3a0,_3a3);
YAHOO.log(_3a0,_3a1,_3a2);
};
$L.format=function(code,_3a5){
var msg=CFMessage[code]||code;
if(_3a5){
for(i=0;i<_3a5.length;i++){
if(!_3a5[i].length){
_3a5[i]="";
}
var _3a7="{"+i+"}";
msg=msg.replace(_3a7,_3a5[i]);
}
}
return msg;
};
$L.debug=function(_3a8,_3a9,_3aa){
$L.log(_3a8,"debug",_3a9,_3aa);
};
$L.info=function(_3ab,_3ac,_3ad){
$L.log(_3ab,"info",_3ac,_3ad);
};
$L.error=function(_3ae,_3af,_3b0){
$L.log(_3ae,"error",_3af,_3b0);
};
$L.dump=function(_3b1,_3b2){
if($L.isAvailable){
var dump=(/string|number|undefined|boolean/.test(typeof (_3b1))||_3b1==null)?_3b1:recurse(_3b1,typeof _3b1,true);
$L.debug(dump,_3b2);
}
};
$X.invoke=function(_3b4,_3b5,_3b6,_3b7,_3b8){
var _3b9="method="+_3b5+"&_cf_ajaxproxytoken="+_3b6;
var _3ba=_3b4.returnFormat||"json";
_3b9+="&returnFormat="+_3ba;
if(_3b4.queryFormat){
_3b9+="&queryFormat="+_3b4.queryFormat;
}
if(_3b4.formId){
var _3bb=$C.getFormQueryString(_3b4.formId,true);
if(_3b7!=null){
for(prop in _3bb){
_3b7[prop]=_3bb[prop];
}
}else{
_3b7=_3bb;
}
_3b4.formId=null;
}
var _3bc="";
if(_3b7!=null){
_3bc=$X.JSON.encode(_3b7);
_3b9+="&argumentCollection="+encodeURIComponent(_3bc);
}
$L.info("ajaxproxy.invoke.invoking","http",[_3b4.cfcPath,_3b5,_3bc]);
if(_3b4.callHandler){
_3b4.callHandler.call(null,_3b4.callHandlerParams,_3b4.cfcPath,_3b9);
return;
}
var _3bd;
if(_3b4.async){
_3bd=function(req){
$X.callback(req,_3b4,_3b8);
};
}
var req=$A.sendMessage(_3b4.cfcPath,_3b4.httpMethod,_3b9,_3b4.async,_3bd,null,true);
if(!_3b4.async){
return $X.processResponse(req,_3b4);
}
};
$X.callback=function(req,_3c1,_3c2){
if($A.isRequestError(req)){
$C.handleError(_3c1.errorHandler,"ajaxproxy.invoke.error","http",[req.status,_3c1.cfcPath,req.statusText],req.status,req.statusText,false,_3c2);
}else{
if(_3c1.callbackHandler){
var _3c3=$X.processResponse(req,_3c1);
_3c1.callbackHandler(_3c3,_3c2);
}
}
};
$X.processResponse=function(req,_3c5){
var _3c6=true;
for(var i=0;i<req.responseText.length;i++){
var c=req.responseText.charAt(i);
_3c6=(c==" "||c=="\n"||c=="\t"||c=="\r");
if(!_3c6){
break;
}
}
var _3c9=(req.responseXML&&req.responseXML.childNodes.length>0);
var _3ca=_3c9?"[XML Document]":req.responseText;
$L.info("ajaxproxy.invoke.response","http",[_3ca]);
var _3cb;
var _3cc=_3c5.returnFormat||"json";
if(_3cc=="json"){
_3cb=_3c6?null:$X.JSON.decode(req.responseText);
}else{
_3cb=_3c9?req.responseXML:(_3c6?null:req.responseText);
}
return _3cb;
};
$X.init=function(_3cd,_3ce){
var _3cf=_3ce.split(".");
var ns=self;
for(i=0;i<_3cf.length-1;i++){
if(_3cf[i].length){
ns[_3cf[i]]=ns[_3cf[i]]||{};
ns=ns[_3cf[i]];
}
}
var _3d1=_3cf[_3cf.length-1];
if(ns[_3d1]){
return ns[_3d1];
}
ns[_3d1]=function(){
this.httpMethod="GET";
this.async=false;
this.callbackHandler=null;
this.errorHandler=null;
this.formId=null;
};
ns[_3d1].prototype.cfcPath=_3cd;
ns[_3d1].prototype.setHTTPMethod=function(_3d2){
if(_3d2){
_3d2=_3d2.toUpperCase();
}
if(_3d2!="GET"&&_3d2!="POST"){
$C.handleError(null,"ajaxproxy.sethttpmethod.invalidmethod","http",[_3d2],null,null,true);
}
this.httpMethod=_3d2;
};
ns[_3d1].prototype.setSyncMode=function(){
this.async=false;
};
ns[_3d1].prototype.setAsyncMode=function(){
this.async=true;
};
ns[_3d1].prototype.setCallbackHandler=function(fn){
this.callbackHandler=fn;
this.setAsyncMode();
};
ns[_3d1].prototype.setErrorHandler=function(fn){
this.errorHandler=fn;
this.setAsyncMode();
};
ns[_3d1].prototype.setForm=function(fn){
this.formId=fn;
};
ns[_3d1].prototype.setQueryFormat=function(_3d6){
if(_3d6){
_3d6=_3d6.toLowerCase();
}
if(!_3d6||(_3d6!="column"&&_3d6!="row")){
$C.handleError(null,"ajaxproxy.setqueryformat.invalidformat","http",[_3d6],null,null,true);
}
this.queryFormat=_3d6;
};
ns[_3d1].prototype.setReturnFormat=function(_3d7){
if(_3d7){
_3d7=_3d7.toLowerCase();
}
if(!_3d7||(_3d7!="plain"&&_3d7!="json"&&_3d7!="wddx")){
$C.handleError(null,"ajaxproxy.setreturnformat.invalidformat","http",[_3d7],null,null,true);
}
this.returnFormat=_3d7;
};
$L.info("ajaxproxy.init.created","http",[_3cd]);
return ns[_3d1];
};
$U.isWhitespace=function(s){
var _3d9=true;
for(var i=0;i<s.length;i++){
var c=s.charAt(i);
_3d9=(c==" "||c=="\n"||c=="\t"||c=="\r");
if(!_3d9){
break;
}
}
return _3d9;
};
$U.getFirstNonWhitespaceIndex=function(s){
var _3dd=true;
for(var i=0;i<s.length;i++){
var c=s.charAt(i);
_3dd=(c==" "||c=="\n"||c=="\t"||c=="\r");
if(!_3dd){
break;
}
}
return i;
};
$C.trim=function(_3e0){
return _3e0.replace(/^\s+|\s+$/g,"");
};
$U.isInteger=function(n){
var _3e2=true;
if(typeof (n)=="number"){
_3e2=(n>=0);
}else{
for(i=0;i<n.length;i++){
if($U.isInteger.numberChars.indexOf(n.charAt(i))==-1){
_3e2=false;
break;
}
}
}
return _3e2;
};
$U.isInteger.numberChars="0123456789";
$U.isArray=function(a){
return (typeof (a.length)=="number"&&!a.toUpperCase);
};
$U.isBoolean=function(b){
if(b===true||b===false){
return true;
}else{
if(b.toLowerCase){
b=b.toLowerCase();
return (b==$U.isBoolean.trueChars||b==$U.isBoolean.falseChars);
}else{
return false;
}
}
};
$U.isBoolean.trueChars="true";
$U.isBoolean.falseChars="false";
$U.castBoolean=function(b){
if(b===true){
return true;
}else{
if(b===false){
return false;
}else{
if(b.toLowerCase){
b=b.toLowerCase();
if(b==$U.isBoolean.trueChars){
return true;
}else{
if(b==$U.isBoolean.falseChars){
return false;
}else{
return false;
}
}
}else{
return false;
}
}
}
};
$U.checkQuery=function(o){
var _3e7=null;
if(o&&o.COLUMNS&&$U.isArray(o.COLUMNS)&&o.DATA&&$U.isArray(o.DATA)&&(o.DATA.length==0||(o.DATA.length>0&&$U.isArray(o.DATA[0])))){
_3e7="row";
}else{
if(o&&o.COLUMNS&&$U.isArray(o.COLUMNS)&&o.ROWCOUNT&&$U.isInteger(o.ROWCOUNT)&&o.DATA){
_3e7="col";
for(var i=0;i<o.COLUMNS.length;i++){
var _3e9=o.DATA[o.COLUMNS[i]];
if(!_3e9||!$U.isArray(_3e9)){
_3e7=null;
break;
}
}
}
}
return _3e7;
};
$X.JSON=new function(){
var _3ea={}.hasOwnProperty?true:false;
var _3eb=/^("(\\.|[^"\\\n\r])*?"|[,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t])+?$/;
var pad=function(n){
return n<10?"0"+n:n;
};
var m={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r","\"":"\\\"","\\":"\\\\"};
var _3ef=function(s){
if(/["\\\x00-\x1f]/.test(s)){
return "\""+s.replace(/([\x00-\x1f\\"])/g,function(a,b){
var c=m[b];
if(c){
return c;
}
c=b.charCodeAt();
return "\\u00"+Math.floor(c/16).toString(16)+(c%16).toString(16);
})+"\"";
}
return "\""+s+"\"";
};
var _3f4=function(o){
var a=["["],b,i,l=o.length,v;
for(i=0;i<l;i+=1){
v=o[i];
switch(typeof v){
case "undefined":
case "function":
case "unknown":
break;
default:
if(b){
a.push(",");
}
a.push(v===null?"null":$X.JSON.encode(v));
b=true;
}
}
a.push("]");
return a.join("");
};
var _3f7=function(o){
return "\""+o.getFullYear()+"-"+pad(o.getMonth()+1)+"-"+pad(o.getDate())+"T"+pad(o.getHours())+":"+pad(o.getMinutes())+":"+pad(o.getSeconds())+"\"";
};
this.encode=function(o){
if(typeof o=="undefined"||o===null){
return "null";
}else{
if(o instanceof Array){
return _3f4(o);
}else{
if(o instanceof Date){
return _3f7(o);
}else{
if(typeof o=="string"){
return _3ef(o);
}else{
if(typeof o=="number"){
return isFinite(o)?String(o):"null";
}else{
if(typeof o=="boolean"){
return String(o);
}else{
var a=["{"],b,i,v;
for(var i in o){
if(!_3ea||o.hasOwnProperty(i)){
v=o[i];
switch(typeof v){
case "undefined":
case "function":
case "unknown":
break;
default:
if(b){
a.push(",");
}
a.push(this.encode(i),":",v===null?"null":this.encode(v));
b=true;
}
}
}
a.push("}");
return a.join("");
}
}
}
}
}
}
};
this.decode=function(json){
if(typeof json=="object"){
return json;
}
if($U.isWhitespace(json)){
return null;
}
var _3fd=$U.getFirstNonWhitespaceIndex(json);
if(_3fd>0){
json=json.slice(_3fd);
}
if(window._cf_jsonprefix&&json.indexOf(_cf_jsonprefix)==0){
json=json.slice(_cf_jsonprefix.length);
}
try{
if(_3eb.test(json)){
return eval("("+json+")");
}
}
catch(e){
}
throw new SyntaxError("parseJSON");
};
}();
if(!$C.JSON){
$C.JSON={};
}
$C.JSON.encode=$X.JSON.encode;
$C.JSON.decode=$X.JSON.decode;
$C.navigate=function(url,_3ff,_400,_401,_402,_403){
if(url==null){
$C.handleError(_401,"navigate.urlrequired","widget");
return;
}
if(_402){
_402=_402.toUpperCase();
if(_402!="GET"&&_402!="POST"){
$C.handleError(null,"navigate.invalidhttpmethod","http",[_402],null,null,true);
}
}else{
_402="GET";
}
var _404;
if(_403){
_404=$C.getFormQueryString(_403);
if(_404==-1){
$C.handleError(null,"navigate.formnotfound","http",[_403],null,null,true);
}
}
if(_3ff==null){
if(_404){
if(url.indexOf("?")==-1){
url+="?"+_404;
}else{
url+="&"+_404;
}
}
$L.info("navigate.towindow","widget",[url]);
window.location.replace(url);
return;
}
$L.info("navigate.tocontainer","widget",[url,_3ff]);
var obj=$C.objectCache[_3ff];
if(obj!=null){
if(typeof (obj._cf_body)!="undefined"&&obj._cf_body!=null){
_3ff=obj._cf_body;
}
}
$A.replaceHTML(_3ff,url,_402,_404,_400,_401);
};
$A.checkForm=function(_406,_407,_408,_409,_40a){
var _40b=_407.call(null,_406);
if(_40b==false){
return false;
}
var _40c=$C.getFormQueryString(_406);
$L.info("ajax.submitform.submitting","http",[_406.name]);
$A.replaceHTML(_408,_406.action,_406.method,_40c,_409,_40a);
return false;
};
$A.replaceHTML=function(_40d,url,_40f,_410,_411,_412){
var _413=document.getElementById(_40d);
if(!_413){
$C.handleError(_412,"ajax.replacehtml.elnotfound","http",[_40d]);
return;
}
var _414="_cf_containerId="+encodeURIComponent(_40d);
_410=(_410)?_410+"&"+_414:_414;
$L.info("ajax.replacehtml.replacing","http",[_40d,url,_410]);
if(_cf_loadingtexthtml){
try{
_413.innerHTML=_cf_loadingtexthtml;
}
catch(e){
}
}
var _415=function(req,_417){
var _418=false;
if($A.isRequestError(req)){
$C.handleError(_412,"ajax.replacehtml.error","http",[req.status,_417.id,req.statusText],req.status,req.statusText);
_418=true;
}
var _419=new $E.CustomEvent("onReplaceHTML",_417);
var _41a=new $E.CustomEvent("onReplaceHTMLUser",_417);
$E.loadEvents[_417.id]={system:_419,user:_41a};
if(req.responseText.search(/<script/i)!=-1){
try{
_417.innerHTML="";
}
catch(e){
}
$A.replaceHTML.processResponseText(req.responseText,_417,_412);
}else{
try{
_417.innerHTML=req.responseText;
}
catch(e){
}
}
$E.loadEvents[_417.id]=null;
_419.fire();
_419.unsubscribe();
_41a.fire();
_41a.unsubscribe();
$L.info("ajax.replacehtml.success","http",[_417.id]);
if(_411&&!_418){
_411();
}
};
try{
$A.sendMessage(url,_40f,_410,true,_415,_413);
}
catch(e){
try{
_413.innerHTML=$L.format(CFMessage["ajax.replacehtml.connectionerrordisplay"],[url,e]);
}
catch(e){
}
$C.handleError(_412,"ajax.replacehtml.connectionerror","http",[_40d,url,e]);
}
};
$A.replaceHTML.processResponseText=function(text,_41c,_41d){
var pos=0;
var _41f=0;
var _420=0;
_41c._cf_innerHTML="";
while(pos<text.length){
var _421=text.indexOf("<s",pos);
if(_421==-1){
_421=text.indexOf("<S",pos);
}
if(_421==-1){
break;
}
pos=_421;
var _422=true;
var _423=$A.replaceHTML.processResponseText.scriptTagChars;
for(var i=1;i<_423.length;i++){
var _425=pos+i+1;
if(_425>text.length){
break;
}
var _426=text.charAt(_425);
if(_423[i][0]!=_426&&_423[i][1]!=_426){
pos+=i+1;
_422=false;
break;
}
}
if(!_422){
continue;
}
var _427=text.substring(_41f,pos);
if(_427){
_41c._cf_innerHTML+=_427;
}
var _428=text.indexOf(">",pos)+1;
if(_428==0){
pos++;
continue;
}else{
pos+=7;
}
var _429=_428;
while(_429<text.length&&_429!=-1){
_429=text.indexOf("</s",_429);
if(_429==-1){
_429=text.indexOf("</S",_429);
}
if(_429!=-1){
_422=true;
for(var i=1;i<_423.length;i++){
var _425=_429+2+i;
if(_425>text.length){
break;
}
var _426=text.charAt(_425);
if(_423[i][0]!=_426&&_423[i][1]!=_426){
_429=_425;
_422=false;
break;
}
}
if(_422){
break;
}
}
}
if(_429!=-1){
var _42a=text.substring(_428,_429);
var _42b=_42a.indexOf("<!--");
if(_42b!=-1){
_42a=_42a.substring(_42b+4);
}
var _42c=_42a.lastIndexOf("//-->");
if(_42c!=-1){
_42a=_42a.substring(0,_42c-1);
}
if(_42a.indexOf("document.write")!=-1||_42a.indexOf("CF_RunContent")!=-1){
if(_42a.indexOf("CF_RunContent")!=-1){
_42a=_42a.replace("CF_RunContent","document.write");
}
_42a="var _cfDomNode = document.getElementById('"+_41c.id+"'); var _cfBuffer='';"+"if (!document._cf_write)"+"{document._cf_write = document.write;"+"document.write = function(str){if (_cfBuffer!=null){_cfBuffer+=str;}else{document._cf_write(str);}};};"+_42a+";_cfDomNode._cf_innerHTML += _cfBuffer; _cfBuffer=null;";
}
try{
eval(_42a);
}
catch(ex){
$C.handleError(_41d,"ajax.replacehtml.jserror","http",[_41c.id,ex]);
}
}
_421=text.indexOf(">",_429)+1;
if(_421==0){
_420=_429+1;
break;
}
_420=_421;
pos=_421;
_41f=_421;
}
if(_420<text.length-1){
var _427=text.substring(_420,text.length);
if(_427){
_41c._cf_innerHTML+=_427;
}
}
try{
_41c.innerHTML=_41c._cf_innerHTML;
}
catch(e){
}
_41c._cf_innerHTML="";
};
$A.replaceHTML.processResponseText.scriptTagChars=[["s","S"],["c","C"],["r","R"],["i","I"],["p","P"],["t","T"]];
$D.getElement=function(_42d,_42e){
var _42f=function(_430){
return (_430.name==_42d||_430.id==_42d);
};
var _431=$D.getElementsBy(_42f,null,_42e);
if(_431.length==1){
return _431[0];
}else{
return _431;
}
};
$D.getElementsBy=function(_432,tag,root){
tag=tag||"*";
var _435=[];
if(root){
root=$D.get(root);
if(!root){
return _435;
}
}else{
root=document;
}
var _436=root.getElementsByTagName(tag);
if(!_436.length&&(tag=="*"&&root.all)){
_436=root.all;
}
for(var i=0,len=_436.length;i<len;++i){
if(_432(_436[i])){
_435[_435.length]=_436[i];
}
}
return _435;
};
$D.get=function(el){
if(!el){
return null;
}
if(typeof el!="string"&&!(el instanceof Array)){
return el;
}
if(typeof el=="string"){
return document.getElementById(el);
}else{
var _439=[];
for(var i=0,len=el.length;i<len;++i){
_439[_439.length]=$D.get(el[i]);
}
return _439;
}
return null;
};
$E.loadEvents={};
$E.CustomEvent=function(_43b,_43c){
return {name:_43b,domNode:_43c,subs:[],subscribe:function(func,_43e){
var dup=false;
for(var i=0;i<this.subs.length;i++){
var sub=this.subs[i];
if(sub.f==func&&sub.p==_43e){
dup=true;
break;
}
}
if(!dup){
this.subs.push({f:func,p:_43e});
}
},fire:function(){
for(var i=0;i<this.subs.length;i++){
var sub=this.subs[i];
sub.f.call(null,this,sub.p);
}
},unsubscribe:function(){
this.subscribers=[];
}};
};
$E.windowLoadImpEvent=new $E.CustomEvent("cfWindowLoadImp");
$E.windowLoadEvent=new $E.CustomEvent("cfWindowLoad");
$E.windowLoadUserEvent=new $E.CustomEvent("cfWindowLoadUser");
$E.listeners=[];
$E.addListener=function(el,ev,fn,_447){
var l={el:el,ev:ev,fn:fn,params:_447};
$E.listeners.push(l);
var _449=function(e){
if(!e){
var e=window.event;
}
fn.call(null,e,_447);
};
if(el.addEventListener){
el.addEventListener(ev,_449,false);
return true;
}else{
if(el.attachEvent){
el.attachEvent("on"+ev,_449);
return true;
}else{
return false;
}
}
};
$E.isListener=function(el,ev,fn,_44e){
var _44f=false;
var ls=$E.listeners;
for(var i=0;i<ls.length;i++){
if(ls[i].el==el&&ls[i].ev==ev&&ls[i].fn==fn&&ls[i].params==_44e){
_44f=true;
break;
}
}
return _44f;
};
$E.callBindHandlers=function(id,_453,ev){
var el=document.getElementById(id);
if(!el){
return;
}
var ls=$E.listeners;
for(var i=0;i<ls.length;i++){
if(ls[i].el==el&&ls[i].ev==ev&&ls[i].fn._cf_bindhandler){
ls[i].fn.call(null,null,ls[i].params);
}
}
};
$E.registerOnLoad=function(func,_459,_45a,user){
if($E.registerOnLoad.windowLoaded){
if(_459&&_459._cf_containerId&&$E.loadEvents[_459._cf_containerId]){
if(user){
$E.loadEvents[_459._cf_containerId].user.subscribe(func,_459);
}else{
$E.loadEvents[_459._cf_containerId].system.subscribe(func,_459);
}
}else{
func.call(null,null,_459);
}
}else{
if(user){
$E.windowLoadUserEvent.subscribe(func,_459);
}else{
if(_45a){
$E.windowLoadImpEvent.subscribe(func,_459);
}else{
$E.windowLoadEvent.subscribe(func,_459);
}
}
}
};
$E.registerOnLoad.windowLoaded=false;
$E.onWindowLoad=function(fn){
if(window.addEventListener){
window.addEventListener("load",fn,false);
}else{
if(window.attachEvent){
window.attachEvent("onload",fn);
}else{
if(document.getElementById){
window.onload=fn;
}
}
}
};
$C.addSpanToDom=function(){
var _45d=document.createElement("span");
document.body.insertBefore(_45d,document.body.firstChild);
};
$E.windowLoadHandler=function(e){
if(window.Ext){
Ext.BLANK_IMAGE_URL=_cf_contextpath+"/CFIDE/scripts/ajax/resources/ext/images/default/s.gif";
}
$C.addSpanToDom();
$L.init();
$E.registerOnLoad.windowLoaded=true;
$E.windowLoadImpEvent.fire();
$E.windowLoadImpEvent.unsubscribe();
$E.windowLoadEvent.fire();
$E.windowLoadEvent.unsubscribe();
$E.windowLoadUserEvent.fire();
$E.windowLoadUserEvent.unsubscribe();
};
$E.onWindowLoad($E.windowLoadHandler);
$B.register=function(_45f,_460,_461,_462){
for(var i=0;i<_45f.length;i++){
var _464=_45f[i][0];
var _465=_45f[i][1];
var _466=_45f[i][2];
if(window[_464]){
var _467=eval(_464);
if(_467&&_467._cf_register){
_467._cf_register(_466,_461,_460);
continue;
}
}
var _468=$C.objectCache[_464];
if(_468&&_468._cf_register){
_468._cf_register(_466,_461,_460);
continue;
}
var _469=$D.getElement(_464,_465);
var _46a=(_469&&((!_469.length&&_469.length!=0)||(_469.length&&_469.length>0)||_469.tagName=="SELECT"));
if(!_46a){
$C.handleError(null,"bind.register.elnotfound","bind",[_464]);
}
if(_469.length>1&&!_469.options){
for(var j=0;j<_469.length;j++){
$B.register.addListener(_469[j],_466,_461,_460);
}
}else{
$B.register.addListener(_469,_466,_461,_460);
}
}
if(!$C.bindHandlerCache[_460.bindTo]&&typeof (_460.bindTo)=="string"){
$C.bindHandlerCache[_460.bindTo]=function(){
_461.call(null,null,_460);
};
}
if(_462){
_461.call(null,null,_460);
}
};
$B.register.addListener=function(_46c,_46d,_46e,_46f){
if(!$E.isListener(_46c,_46d,_46e,_46f)){
$E.addListener(_46c,_46d,_46e,_46f);
}
};
$B.assignValue=function(_470,_471,_472,_473){
if(!_470){
return;
}
if(_470.call){
_470.call(null,_472,_473);
return;
}
var _474=$C.objectCache[_470];
if(_474&&_474._cf_setValue){
_474._cf_setValue(_472);
return;
}
var _475=document.getElementById(_470);
if(!_475){
$C.handleError(null,"bind.assignvalue.elnotfound","bind",[_470]);
}
if(_475.tagName=="SELECT"){
var _476=$U.checkQuery(_472);
var _477=$C.objectCache[_470];
if(_476){
if(!_477||(_477&&(!_477.valueCol||!_477.displayCol))){
$C.handleError(null,"bind.assignvalue.selboxmissingvaldisplay","bind",[_470]);
return;
}
}else{
if(typeof (_472.length)=="number"&&!_472.toUpperCase){
if(_472.length>0&&(typeof (_472[0].length)!="number"||_472[0].toUpperCase)){
$C.handleError(null,"bind.assignvalue.selboxerror","bind",[_470]);
return;
}
}else{
$C.handleError(null,"bind.assignvalue.selboxerror","bind",[_470]);
return;
}
}
_475.options.length=0;
var _478;
var _479=false;
if(_477){
_478=_477.selected;
if(_478&&_478.length>0){
_479=true;
}
}
if(!_476){
for(var i=0;i<_472.length;i++){
var opt=new Option(_472[i][1],_472[i][0]);
_475.options[i]=opt;
if(_479){
for(var j=0;j<_478.length;j++){
if(_478[j]==opt.value){
opt.selected=true;
}
}
}
}
}else{
if(_476=="col"){
var _47d=_472.DATA[_477.valueCol];
var _47e=_472.DATA[_477.displayCol];
if(!_47d||!_47e){
$C.handleError(null,"bind.assignvalue.selboxinvalidvaldisplay","bind",[_470]);
return;
}
for(var i=0;i<_47d.length;i++){
var opt=new Option(_47e[i],_47d[i]);
_475.options[i]=opt;
if(_479){
for(var j=0;j<_478.length;j++){
if(_478[j]==opt.value){
opt.selected=true;
}
}
}
}
}else{
if(_476=="row"){
var _47f=-1;
var _480=-1;
for(var i=0;i<_472.COLUMNS.length;i++){
var col=_472.COLUMNS[i];
if(col==_477.valueCol){
_47f=i;
}
if(col==_477.displayCol){
_480=i;
}
if(_47f!=-1&&_480!=-1){
break;
}
}
if(_47f==-1||_480==-1){
$C.handleError(null,"bind.assignvalue.selboxinvalidvaldisplay","bind",[_470]);
return;
}
for(var i=0;i<_472.DATA.length;i++){
var opt=new Option(_472.DATA[i][_480],_472.DATA[i][_47f]);
_475.options[i]=opt;
if(_479){
for(var j=0;j<_478.length;j++){
if(_478[j]==opt.value){
opt.selected=true;
}
}
}
}
}
}
}
}else{
_475[_471]=_472;
}
$E.callBindHandlers(_470,null,"change");
$L.info("bind.assignvalue.success","bind",[_472,_470,_471]);
};
$B.localBindHandler=function(e,_483){
var _484=document.getElementById(_483.bindTo);
var _485=$B.evaluateBindTemplate(_483,true);
$B.assignValue(_483.bindTo,_483.bindToAttr,_485);
};
$B.localBindHandler._cf_bindhandler=true;
$B.evaluateBindTemplate=function(_486,_487,_488,_489,_48a){
var _48b=_486.bindExpr;
var _48c="";
if(typeof _48a=="undefined"){
_48a=false;
}
for(var i=0;i<_48b.length;i++){
if(typeof (_48b[i])=="object"){
var _48e=null;
if(!_48b[i].length||typeof _48b[i][0]=="object"){
_48e=$X.JSON.encode(_48b[i]);
}else{
var _48e=$B.getBindElementValue(_48b[i][0],_48b[i][1],_48b[i][2],_487,_489);
if(_48e==null){
if(_487){
_48c="";
break;
}else{
_48e="";
}
}
}
if(_488){
_48e=encodeURIComponent(_48e);
}
_48c+=_48e;
}else{
var _48f=_48b[i];
if(_48a==true&&i>0){
if(typeof (_48f)=="string"&&_48f.indexOf("&")!=0){
_48f=encodeURIComponent(_48f);
}
}
_48c+=_48f;
}
}
return _48c;
};
$B.jsBindHandler=function(e,_491){
var _492=_491.bindExpr;
var _493=new Array();
var _494=_491.callFunction+"(";
for(var i=0;i<_492.length;i++){
var _496;
if(typeof (_492[i])=="object"){
if(_492[i].length){
if(typeof _492[i][0]=="object"){
_496=_492[i];
}else{
_496=$B.getBindElementValue(_492[i][0],_492[i][1],_492[i][2],false);
}
}else{
_496=_492[i];
}
}else{
_496=_492[i];
}
if(i!=0){
_494+=",";
}
_493[i]=_496;
_494+="'"+_496+"'";
}
_494+=")";
var _497=_491.callFunction.apply(null,_493);
$B.assignValue(_491.bindTo,_491.bindToAttr,_497,_491.bindToParams);
};
$B.jsBindHandler._cf_bindhandler=true;
$B.urlBindHandler=function(e,_499){
var _49a=_499.bindTo;
if($C.objectCache[_49a]&&$C.objectCache[_49a]._cf_visible===false){
$C.objectCache[_49a]._cf_dirtyview=true;
return;
}
var url=$B.evaluateBindTemplate(_499,false,true,false,true);
var _49c=$U.extractReturnFormat(url);
if(_49c==null||typeof _49c=="undefined"){
_49c="JSON";
}
if(_499.bindToAttr||typeof _499.bindTo=="undefined"||typeof _499.bindTo=="function"){
var _499={"bindTo":_499.bindTo,"bindToAttr":_499.bindToAttr,"bindToParams":_499.bindToParams,"errorHandler":_499.errorHandler,"url":url,returnFormat:_49c};
try{
$A.sendMessage(url,"GET",null,true,$B.urlBindHandler.callback,_499);
}
catch(e){
$C.handleError(_499.errorHandler,"ajax.urlbindhandler.connectionerror","http",[url,e]);
}
}else{
$A.replaceHTML(_49a,url,null,null,null,_499.errorHandler);
}
};
$B.urlBindHandler._cf_bindhandler=true;
$B.urlBindHandler.callback=function(req,_49e){
if($A.isRequestError(req)){
$C.handleError(_49e.errorHandler,"bind.urlbindhandler.httperror","http",[req.status,_49e.url,req.statusText],req.status,req.statusText);
}else{
$L.info("bind.urlbindhandler.response","http",[req.responseText]);
var _49f;
try{
if(_49e.returnFormat==null||_49e.returnFormat==="JSON"){
_49f=$X.JSON.decode(req.responseText);
}else{
_49f=req.responseText;
}
}
catch(e){
if(req.responseText!=null&&typeof req.responseText=="string"){
_49f=req.responseText;
}else{
$C.handleError(_49e.errorHandler,"bind.urlbindhandler.jsonerror","http",[req.responseText]);
}
}
$B.assignValue(_49e.bindTo,_49e.bindToAttr,_49f,_49e.bindToParams);
}
};
$A.initSelect=function(_4a0,_4a1,_4a2,_4a3){
$C.objectCache[_4a0]={"valueCol":_4a1,"displayCol":_4a2,selected:_4a3};
};
$S.setupSpry=function(){
if(typeof (Spry)!="undefined"&&Spry.Data){
Spry.Data.DataSet.prototype._cf_getAttribute=function(_4a4){
var val;
var row=this.getCurrentRow();
if(row){
val=row[_4a4];
}
return val;
};
Spry.Data.DataSet.prototype._cf_register=function(_4a7,_4a8,_4a9){
var obs={bindParams:_4a9};
obs.onCurrentRowChanged=function(){
_4a8.call(null,null,this.bindParams);
};
obs.onDataChanged=function(){
_4a8.call(null,null,this.bindParams);
};
this.addObserver(obs);
};
if(Spry.Debug.trace){
var _4ab=Spry.Debug.trace;
Spry.Debug.trace=function(str){
$L.info(str,"spry");
_4ab(str);
};
}
if(Spry.Debug.reportError){
var _4ad=Spry.Debug.reportError;
Spry.Debug.reportError=function(str){
$L.error(str,"spry");
_4ad(str);
};
}
$L.info("spry.setupcomplete","bind");
}
};
$E.registerOnLoad($S.setupSpry,null,true);
$S.bindHandler=function(_4af,_4b0){
var url;
var _4b2="_cf_nodebug=true&_cf_nocache=true";
if(window._cf_clientid){
_4b2+="&_cf_clientid="+_cf_clientid;
}
var _4b3=window[_4b0.bindTo];
var _4b4=(typeof (_4b3)=="undefined");
if(_4b0.cfc){
var _4b5={};
var _4b6=_4b0.bindExpr;
for(var i=0;i<_4b6.length;i++){
var _4b8;
if(_4b6[i].length==2){
_4b8=_4b6[i][1];
}else{
_4b8=$B.getBindElementValue(_4b6[i][1],_4b6[i][2],_4b6[i][3],false,_4b4);
}
_4b5[_4b6[i][0]]=_4b8;
}
_4b5=$X.JSON.encode(_4b5);
_4b2+="&method="+_4b0.cfcFunction;
_4b2+="&argumentCollection="+encodeURIComponent(_4b5);
$L.info("spry.bindhandler.loadingcfc","http",[_4b0.bindTo,_4b0.cfc,_4b0.cfcFunction,_4b5]);
url=_4b0.cfc;
}else{
url=$B.evaluateBindTemplate(_4b0,false,true,_4b4);
$L.info("spry.bindhandler.loadingurl","http",[_4b0.bindTo,url]);
}
var _4b9=_4b0.options||{};
if((_4b3&&_4b3._cf_type=="json")||_4b0.dsType=="json"){
_4b2+="&returnformat=json";
}
if(_4b3){
if(_4b3.requestInfo.method=="GET"){
_4b9.method="GET";
if(url.indexOf("?")==-1){
url+="?"+_4b2;
}else{
url+="&"+_4b2;
}
}else{
_4b9.postData=_4b2;
_4b9.method="POST";
_4b3.setURL("");
}
_4b3.setURL(url,_4b9);
_4b3.loadData();
}else{
if(!_4b9.method||_4b9.method=="GET"){
if(url.indexOf("?")==-1){
url+="?"+_4b2;
}else{
url+="&"+_4b2;
}
}else{
_4b9.postData=_4b2;
_4b9.useCache=false;
}
var ds;
if(_4b0.dsType=="xml"){
ds=new Spry.Data.XMLDataSet(url,_4b0.xpath,_4b9);
}else{
ds=new Spry.Data.JSONDataSet(url,_4b9);
ds.preparseFunc=$S.preparseData;
}
ds._cf_type=_4b0.dsType;
var _4bb={onLoadError:function(req){
$C.handleError(_4b0.errorHandler,"spry.bindhandler.error","http",[_4b0.bindTo,req.url,req.requestInfo.postData]);
}};
ds.addObserver(_4bb);
window[_4b0.bindTo]=ds;
}
};
$S.bindHandler._cf_bindhandler=true;
$S.preparseData=function(ds,_4be){
var _4bf=$U.getFirstNonWhitespaceIndex(_4be);
if(_4bf>0){
_4be=_4be.slice(_4bf);
}
if(window._cf_jsonprefix&&_4be.indexOf(_cf_jsonprefix)==0){
_4be=_4be.slice(_cf_jsonprefix.length);
}
return _4be;
};
$P.init=function(_4c0){
$L.info("pod.init.creating","widget",[_4c0]);
var _4c1={};
_4c1._cf_body=_4c0+"_body";
$C.objectCache[_4c0]=_4c1;
};
$B.cfcBindHandler=function(e,_4c3){
var _4c4=(_4c3.httpMethod)?_4c3.httpMethod:"GET";
var _4c5={};
var _4c6=_4c3.bindExpr;
for(var i=0;i<_4c6.length;i++){
var _4c8;
if(_4c6[i].length==2){
_4c8=_4c6[i][1];
}else{
_4c8=$B.getBindElementValue(_4c6[i][1],_4c6[i][2],_4c6[i][3],false);
}
_4c5[_4c6[i][0]]=_4c8;
}
var _4c9=function(_4ca,_4cb){
$B.assignValue(_4cb.bindTo,_4cb.bindToAttr,_4ca,_4cb.bindToParams);
};
var _4cc={"bindTo":_4c3.bindTo,"bindToAttr":_4c3.bindToAttr,"bindToParams":_4c3.bindToParams};
var _4cd={"async":true,"cfcPath":_4c3.cfc,"httpMethod":_4c4,"callbackHandler":_4c9,"errorHandler":_4c3.errorHandler};
if(_4c3.proxyCallHandler){
_4cd.callHandler=_4c3.proxyCallHandler;
_4cd.callHandlerParams=_4c3;
}
$X.invoke(_4cd,_4c3.cfcFunction,_4c3._cf_ajaxproxytoken,_4c5,_4cc);
};
$B.cfcBindHandler._cf_bindhandler=true;
$U.extractReturnFormat=function(url){
var _4cf;
var _4d0=url.toUpperCase();
var _4d1=_4d0.indexOf("RETURNFORMAT");
if(_4d1>0){
var _4d2=_4d0.indexOf("&",_4d1+13);
if(_4d2<0){
_4d2=_4d0.length;
}
_4cf=_4d0.substring(_4d1+13,_4d2);
}
return _4cf;
};
$U.replaceAll=function(_4d3,_4d4,_4d5){
var _4d6=_4d3.indexOf(_4d4);
while(_4d6>-1){
_4d3=_4d3.replace(_4d4,_4d5);
_4d6=_4d3.indexOf(_4d4);
}
return _4d3;
};
$U.cloneObject=function(obj){
var _4d8={};
for(key in obj){
var _4d9=obj[key];
if(typeof _4d9=="object"){
_4d9=$U.cloneObject(_4d9);
}
_4d8.key=_4d9;
}
return _4d8;
};
$C.clone=function(obj,_4db){
if(typeof (obj)!="object"){
return obj;
}
if(obj==null){
return obj;
}
var _4dc=new Object();
for(var i in obj){
if(_4db===true){
_4dc[i]=$C.clone(obj[i]);
}else{
_4dc[i]=obj[i];
}
}
return _4dc;
};
$C.printObject=function(obj){
var str="";
for(key in obj){
str=str+"  "+key+"=";
value=obj[key];
if(typeof (value)=="object"){
value=$C.printObject(value);
}
str+=value;
}
return str;
};
}
}
cfinit();
