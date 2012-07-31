/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.MessageBox){
ColdFusion.MessageBox={};
}
var $MB=ColdFusion.MessageBox;
var $XB=Ext.MessageBox;
var DEFAULT_OK=$XB.buttonText.ok;
var DEFAULT_NO=$XB.buttonText.no;
var DEFAULT_CANCEL=$XB.buttonText.cancel;
var DEFAULT_YES=$XB.buttonText.yes;
var DEFAULT_ALERT_BUTTON_TYPE=$XB.OK;
var DEFAULT_CONFIRM_BUTTON_TYPE=$XB.YESNO;
var DEFAULT_PROMPT_BUTTON_TYPE=$XB.OKCANCEL;
var CF_BEFORE_SHOW_HANDLER_ADDED=false;
var CURRENT_MESSAGEBOX_ID;
ColdFusion.MessageBox.init=function(_13f,type,_141,_142,_143,_144,_145,_146,_147,_148,_149,icon,_14b,x,y,_14e,_14f){
var _150={messageBoxId:_13f,type:type,callBack_Fn:_149,multiline:_147,modal:_148,width:_14b,bodyStyle:_14f};
if(_141==null||typeof (_141)=="undefined"){
_141="";
}
_141=ColdFusion.Util.replaceAll(_141,"\n","<br>");
_150.messageText=_141;
if(_143!=null&&typeof (_143)!="undefined"){
_150.label_OK=_143;
}
if(_144!=null&&typeof (_144)!="undefined"){
_150.label_NO=_144;
}
if(_146!=null&&typeof (_146)!="undefined"){
_150.label_YES=_146;
}
if(_145!=null&&typeof (_145)!="undefined"){
_150.label_CANCEL=_145;
}
if(_142==null||typeof (_142)=="undefined"){
type=type.toLowerCase();
if(type=="alert"){
_142="Alert";
}else{
if(type=="confirm"){
_142="Confirm";
}else{
if(type=="prompt"){
_142="Prompt";
}
}
}
}
_150.title=_142;
if(_14e&&typeof (_14e)=="string"){
_150.buttonType=_14e;
}
if(icon&&typeof (icon)=="string"){
_150.icon=icon;
}
if(typeof x=="number"&&x>=0){
_150.x=x;
}
if(typeof y=="number"&&y>=0){
_150.y=y;
}
ColdFusion.objectCache[_13f]=_150;
};
$MB.show=function(_151){
var _152=$MB.getMessageBoxObject(_151);
var type=_152.type;
type=(new String(type)).toLowerCase();
if(!CF_BEFORE_SHOW_HANDLER_ADDED){
var _154=Ext.MessageBox.getDialog();
_154.addListener("beforeshow",$MB.beforeShowHandler,_152);
CF_BEFORE_SHOW_HANDLER_ADDED=true;
}
CURRENT_MESSAGEBOX_ID=_151;
var _155=_152.buttonType;
var _156={ok:DEFAULT_OK,no:DEFAULT_NO,cancel:DEFAULT_CANCEL,yes:DEFAULT_YES};
if(_152.label_OK){
_156.ok=_152.label_OK;
}
if(_152.label_YES){
_156.yes=_152.label_YES;
}
if(_152.label_NO){
_156.no=_152.label_NO;
}
if(_152.label_CANCEL){
_156.cancel=_152.label_CANCEL;
}
Ext.MessageBox.buttonText=_156;
if(typeof _155!="undefined"){
_155=_155.toUpperCase();
if(_155&&_155!=="OKCANCEL"&&_155!=="OK"&&_155!=="YESNOCANCEL"&&_155!=="YESNO"){
ColdFusion.handleError(null,"messagebox.show.invalidbuttontype","widget",[messagebox,_155],null,null,true);
}
switch(_155){
case "OK":
_155=$XB.OK;
break;
case "OKCANCEL":
_155=$XB.OKCANCEL;
break;
case "YESNOCANCEL":
_155=$XB.YESNOCANCEL;
break;
case "YESNO":
_155=$XB.YESNO;
break;
}
}
var icon=_152.icon;
var _158="";
if(icon&&typeof (icon)==="string"){
icon=icon.toUpperCase();
switch(icon){
case "ERROR":
_158=$XB.ERROR;
break;
case "INFO":
_158=$XB.INFO;
break;
case "QUESTION":
_158=$XB.QUESTION;
break;
case "WARNING":
_158=$XB.WARNING;
break;
}
}
var _159={title:_152.title,msg:_152.messageText,fn:_152.callBack_Fn,modal:_152.modal,icon:_158,scope:null};
if(_152.width){
_159.width=_152.width;
if(_159.width>600){
_159.maxWidth=_159.width;
}
if(_159.width<100){
_159.minWidth=_159.width;
}
}
if(type==="alert"){
if(!_155){
_155=DEFAULT_ALERT_BUTTON_TYPE;
}
_159.buttons=_155;
$XB.show(_159);
}
if(type==="confirm"){
if(!_155){
_155=DEFAULT_CONFIRM_BUTTON_TYPE;
}
_159.buttons=_155;
$XB.show(_159);
}
if(type==="prompt"){
if(!_155){
_155=DEFAULT_PROMPT_BUTTON_TYPE;
}
_159.buttons=_155;
_159.prompt=true;
_159.multiline=_152.multiline;
_159.value="",$XB.show(_159);
}
ColdFusion.Log.info("messagebox.show.shown","widget",[_151]);
};
$MB.create=function(_15a,type,_15c,_15d,_15e,_15f){
if(_15a&&typeof _15a!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidname","widget",null,null,null,true);
return;
}
if(!_15a||ColdFusion.trim(_15a)==""){
ColdFusion.handleError(null,"messagebox.create.invalidname","widget",null,null,null,true);
return;
}
var _160=ColdFusion.objectCache[_15a];
if(_160!=null||typeof _160!="undefined"){
ColdFusion.handleError(null,"messagebox.create.duplicatename","widget",[_15a],null,null,true);
return;
}
if(_15d&&typeof _15d!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidmessage","widget",[_15a],null,null,true);
return;
}
if(!_15d||ColdFusion.trim(_15d)==""){
ColdFusion.handleError(null,"messagebox.create.invalidmessage","widget",[_15a],null,null,true);
return;
}
if(_15c&&typeof _15c!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidtitle","widget",[_15a],null,null,true);
return;
}
if(type&&typeof type!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidtype","widget",[_15a],null,null,true);
return;
}
if(!type||ColdFusion.trim(type)==""){
ColdFusion.handleError(null,"messagebox.create.emptytype","widget",[_15a],null,null,true);
return;
}
if(_15e&&typeof _15e!=="function"){
ColdFusion.handleError(null,"messagebox.create.invalidcallback","widget",[_15a],null,null,true);
return;
}
var _161=DEFAULT_CANCEL;
var _162=DEFAULT_NO;
var _163=DEFAULT_OK;
var _164=DEFAULT_YES;
var _165=true;
var _166=null;
var _167=false;
var icon;
var _169;
var x;
var y;
var _16c;
if(_15f&&_15f.labelok){
_163=_15f.labelok;
}
if(_15f&&_15f.labelno){
_162=_15f.labelno;
}
if(_15f&&_15f.labelyes){
_164=_15f.labelyes;
}
if(_15f&&_15f.labelcancel){
_161=_15f.labelcancel;
}
if(_15f&&typeof _15f.multiline==="boolean"){
_167=_15f.multiline;
}
if(_15f&&typeof _15f.modal==="boolean"){
_165=_15f.modal;
}
if(_15f&&_15f.buttontype){
_166=_15f.buttontype;
if(type.toUpperCase()!=="CONFIRM"){
ColdFusion.handleError(null,"messagebox.create.invalidtypeandbuttontypecombination","widget",[_15a],null,null,true);
}else{
if(_166.toUpperCase()!="YESNO"&&_166.toUpperCase()!="YESNOCANCEL"){
ColdFusion.handleError(null,"messagebox.create.invalidbuttontype","widget",[_15a,_166],null,null,true);
}
}
}
if(_15f&&_15f.width){
_169=_15f.width;
if(_169&&typeof _169!="number"){
ColdFusion.handleError(null,"messagebox.create.widthnotnumeric","widget",[_15a,_169],null,null,true);
}
}
if(_15f&&typeof _15f.x!="undefined "){
if(_15f.x&&typeof _15f.x!="number"){
ColdFusion.handleError(null,"messagebox.create.xnotnumeric","widget",[_15a,_15f.x],null,null,true);
return;
}
x=_15f.x;
}
if(_15f&&typeof _15f.y!="undefined"){
if(_15f.y&&typeof _15f.y!="number"){
ColdFusion.handleError(null,"messagebox.create.ynotnumeric","widget",[_15a,_15f.y],null,null,true);
return;
}
y=_15f.y;
}
if(_15f&&_15f.icon){
icon=_15f.icon;
if(icon){
icon=icon.toUpperCase();
if(icon!="ERROR"&&icon!="INFO"&&icon!="QUESTION"&&icon!="WARNING"){
ColdFusion.handleError(null,"messagebox.create.invalidicon","widget",[_15a,icon],null,null,true);
}
}
}
if(_15f&&_15f.bodystyle){
_16c=_15f.bodystyle;
}
$MB.init(_15a,type,_15d,_15c,_163,_162,_161,_164,_167,_165,_15e,icon,_169,x,y,_166,_16c);
ColdFusion.Log.info("messagebox.create.created","widget",[_15a,type]);
};
$MB.updateMessage=function(_16d,_16e){
var _16f=$MB.getMessageBoxObject(_16d);
_16f.messageText=_16e;
ColdFusion.Log.info("messagebox.updatemessage.updated","widget",[_16d]);
};
$MB.updateTitle=function(_170,_171){
var _172=$MB.getMessageBoxObject(_170);
_172.title=_171;
ColdFusion.Log.info("messagebox.updatetitle.updated","widget",[_170]);
};
$MB.update=function(_173,_174){
var _175=$MB.getMessageBoxObject(_173);
var _176={};
if(!_174||typeof _174!="object"){
ColdFusion.handleError(null,"messagebox.update.invalidconfigobject","widget",[_173],null,null,true);
return;
}
if(_174.name&&typeof _174.name=="string"){
ColdFusion.handleError(null,"messagebox.update.nameupdatenotallowed","widget",[_173],null,null,true);
return;
}
if(_174.type&&typeof _174.type=="string"){
ColdFusion.handleError(null,"messagebox.update.typeupdatenotallowed","widget",[_173],null,null,true);
return;
}
if(_174.message){
if(typeof _174.message==="string"||typeof _174.message=="object"){
_176.messageText=_174.message;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidmessage","widget",[_173],null,null,true);
return;
}
}
if(_174.title){
if(typeof _174.title==="string"||typeof _174.title=="object"){
_176.title=_174.title;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidtitle","widget",[_173],null,null,true);
return;
}
}
if(_174.labelok!=null||typeof _174.labelok!="undefined"){
if(typeof _174.labelok==="string"||typeof _174.labelok=="object"){
_176.label_OK=_174.labelok;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelok","widget",[_173],null,null,true);
return;
}
}
if(_174.labelno!=null||typeof _174.labelno!="undefined"){
if(typeof _174.labelno==="string"||typeof _174.labelno=="object"){
_176.label_NO=_174.labelno;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelno","widget",[_173],null,null,true);
return;
}
}
if(_174.labelyes!=null||typeof _174.labelyes!="undefined"){
if(typeof _174.labelyes==="string"||typeof _174.labelyes=="object"){
_176.label_YES=_174.labelyes;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelyes","widget",[_173],null,null,true);
return;
}
}
if(_174.labelcancel!=null||typeof _174.labelcancel!="undefined"){
if(typeof _174.labelcancel==="string"||typeof _174.labelcancel=="object"){
_176.label_CANCEL=_174.labelcancel;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelcancel","widget",[_173],null,null,true);
return;
}
}
if(typeof _174.modal=="boolean"){
_176.modal=_174.modal;
}
if(typeof _174.multiline==="boolean"){
if(_175.type.toLowerCase()!="prompt"){
ColdFusion.handleError(null,"messagebox.update.invalidtypeformultiline","widget",[_173],null,null,true);
return;
}
_176.multiline=_174.multiline;
}
if(_174&&_174.width){
if(typeof _174.width==="number"||typeof _174.width=="object"){
_176.width=_174.width;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidwidth","widget",[_173],null,null,true);
return;
}
}
if(_174.icon!=null||typeof _174.icon!="undefined"){
if(typeof _174.icon==="string"){
icon=_174.icon.toUpperCase();
if(icon!="ERROR"&&icon!="INFO"&&icon!="QUESTION"&&icon!="WARNING"){
ColdFusion.handleError(null,"messagebox.update.invalidicon","widget",[_173],null,null,true);
return;
}
_176.icon=_174.icon;
}else{
if(typeof _174.icon=="object"&&_174.icon==null){
_176.icon=null;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidicon","widget",[_173],null,null,true);
return;
}
}
}
if(_174.callbackhandler!=null||typeof _174.callbackhandler!="undefined"){
if(typeof _174.callbackhandler==="function"||typeof _174.callbackhandler==="object"){
_176.callBack_Fn=_174.callbackhandler;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidcallbackhandler","widget",[_173],null,null,true);
return;
}
}
if(_174.x!=null||typeof _174.x!="undefined"){
if(typeof _174.x==="number"||typeof _174.x=="object"){
_176.x=_174.x;
}else{
ColdFusion.handleError(null,"messagebox.update.xnotnumeric","widget",[_173,_174.x],null,null,true);
return;
}
}
if(_174.y!=null||typeof _174.y!="undefined"){
if(typeof _174.y==="number"||typeof _174.y=="object"){
_176.y=_174.y;
}else{
ColdFusion.handleError(null,"messagebox.update.ynotnumeric","widget",[_173,_174.y],null,null,true);
return;
}
}
if(_174.bodystyle!=null||typeof _174.bodystyle!="undefined"){
if(typeof _174.bodystyle==="string"||typeof _174.bodystyle=="object"){
_176.bodyStyle=_174.bodystyle;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidbodystyle","widget",[_173],null,null,true);
return;
}
}
if(_174.buttontype!=null||typeof _174.buttontype!="undefined"){
if(typeof _174.buttontype==="string"||typeof _174.buttontype==="object"){
buttonType=_174.buttontype;
if(_175.type.toUpperCase()!=="CONFIRM"){
ColdFusion.handleError(null,"messagebox.update.invalidtypeandbuttontypecombination","widget",[_173],null,null,true);
return;
}else{
if(buttonType.toUpperCase()!="YESNO"&&buttonType.toUpperCase()!="YESNOCANCEL"){
ColdFusion.handleError(null,"messagebox.update.invalidbuttontype","widget",[_173],null,null,true);
return;
}
}
_176.buttonType=_174.buttontype;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidbuttontype","widget",[_173],null,null,true);
return;
}
}
for(key in _176){
_175[key]=_176[key];
}
ColdFusion.Log.info("messagebox.update.updated","messagebox",[_173]);
};
$MB.getMessageBoxObject=function(_177){
var _178=ColdFusion.objectCache[_177];
if(_178==null||typeof (_178)=="undefined"){
ColdFusion.handleError(null,"messagebox.getmessageboxobject.missingmessageboxid","widget",[_177],null,null,true);
}
return _178;
};
$MB.isMessageBoxDefined=function(_179){
var _17a=ColdFusion.objectCache[_179];
if(_17a==null||typeof (_17a)=="undefined"){
return false;
}else{
return true;
}
};
$MB.beforeShowHandler=function(_17b){
var _17c=$MB.getMessageBoxObject(CURRENT_MESSAGEBOX_ID);
var _17d=_17c.x;
var _17e=_17c.y;
var _17f=_17c.bodyStyle;
var _180=_17b.body.parent();
var id=_180.id;
var ele=document.getElementById(id);
ele.style.cssText=_17f;
if(_17d&&_17e&&typeof _17d=="number"&&typeof _17e=="number"&&_17d>=0&&_17e>=0){
_17b.setPosition(_17d,_17e);
}else{
_17b.center();
}
};
