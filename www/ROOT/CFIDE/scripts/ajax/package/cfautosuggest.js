/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Autosuggest){
ColdFusion.Autosuggest={};
}
var staticgifpath=_cf_ajaxscriptsrc+"/resources/cf/images/static.gif";
var dynamicgifpath=_cf_ajaxscriptsrc+"/resources/cf/images/loading.gif";
ColdFusion.Autosuggest.loadAutoSuggest=function(_1ca,_1cb){
var _1cc=ColdFusion.objectCache[_1cb.autosuggestid];
if(typeof (_1ca)=="string"){
_1ca=_1ca.split(",");
}else{
var _1cd=false;
if(_1ca&&ColdFusion.Util.isArray(_1ca)){
_1cd=true;
if(_1ca.length>0&&(typeof (_1ca[0])!="string"&&typeof (_1ca[0])!="number")){
_1cd=false;
}
}
if(!_1cd){
ColdFusion.handleError(_1cc.onbinderror,"autosuggest.loadautosuggest.invalidvalue","widget",[_1cb.autosuggestid]);
return;
}
}
var _1ce=document.getElementById(_1cb.autosuggestid).value;
if(_1ce.length==1&&_1ca.length==0){
var _1cf=new Array();
_1cc.dataSource.flushCache();
_1cc.dataSource=new YAHOO.widget.DS_JSArray(_1cf);
_1cc.autosuggestitems=_1cf;
}
if(_1ca.length>0){
var i=0;
var _1d1=false;
var _1cf=new Array();
for(i=0;i<_1ca.length;i++){
if(_1ca[i]){
if(typeof (_1ca[i])=="string"){
_1cf[i]=_1ca[i];
}else{
if(typeof (_1ca[i])=="number"){
_1cf[i]=_1ca[i]+"";
}else{
_1cf[i]=new String(_1ca[i]);
}
}
if(_1cf[i].indexOf(_1ce)==0){
_1d1=true;
}
}
}
if(_1d1==false&&_1cc.showloadingicon==true){
document.getElementById(_1cb.autosuggestid+"_cf_button").src=staticgifpath;
}
_1cc.dataSource.flushCache();
_1cc.dataSource=new YAHOO.widget.DS_JSArray(_1cf);
_1cc.autosuggestitems=_1cf;
if(_1cc.queryMatchContains){
_1cc.dataSource.queryMatchContains=_1cc.queryMatchContains;
}
_1cc._sendQuery(_1ce);
}else{
if(_1cc.showloadingicon==true){
document.getElementById(_1cb.autosuggestid+"_cf_button").src=staticgifpath;
_1cc.showloadingicon==false;
}
}
};
ColdFusion.Autosuggest.checkToMakeBindCall=function(arg,_1d3,_1d4,_1d5,_1d6){
var _1d5=document.getElementById(_1d3).value;
if(!_1d4.isContainerOpen()&&_1d5.length>0&&arg.keyCode!=39&&(arg.keyCode>31||(arg.keyCode==8&&_1d4.valuePresent==true))){
_1d4.valuePresent=false;
if(_1d4.showloadingicon==true){
document.getElementById(_1d3+"_cf_button").src=dynamicgifpath;
}
ColdFusion.Log.info("autosuggest.checktomakebindcall.fetching","widget",[_1d3,_1d5]);
if(_1d4.cfqueryDelay>0){
var _1d7=setTimeout(_1d6,_1d4.cfqueryDelay*1000,this);
if(_1d4._nDelayID!=-1){
clearTimeout(_1d4._cf_nDelayID);
}
_1d4._cf_nDelayID=_1d7;
}else{
_1d6.call(this);
}
}
};
ColdFusion.Autosuggest.checkValueNotInAutosuggest=function(_1d8,_1d9){
if(_1d8.autosuggestitems){
for(var i=0;i<_1d8.autosuggestitems.length;i++){
if(_1d9==_1d8.autosuggestitems[i]){
return false;
}
}
}
return true;
};
ColdFusion.Autosuggest.triggerOnChange=function(type,args){
var _1dd=args[0];
var _1de=document.getElementById(_1dd.id);
ColdFusion.Event.callBindHandlers(_1dd.id,null,"change");
};
ColdFusion.Autosuggest.init=function(_1df,_1e0,_1e1){
return new YAHOO.widget.AutoComplete(_1df,_1e0,_1e1);
};
ColdFusion.Autosuggest.getAutosuggestObject=function(_1e2){
var _1e3=ColdFusion.objectCache[_1e2];
if(_1e3==null||typeof (_1e3)=="undefined"){
ColdFusion.handleError(null,"autosuggest.getAutosuggestObject.notfound","widget",[_1e2],null,null,true);
}
return _1e3;
};
ColdFusion.Autosuggest.initJS_ARRAY=function(_1e4){
return new YAHOO.widget.DS_JSArray(_1e4);
};
