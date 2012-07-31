/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.FileUpload){
ColdFusion.FileUpload={};
}
var $FS=ColdFusion.FileUpload;
$FS.defaultSWFLocation="/CFIDE/scripts/ajax/resources/cf/assets/MultiFileUpload.swf";
var isIE=(navigator.appVersion.indexOf("MSIE")!=-1)?true:false;
var isWin=(navigator.appVersion.toLowerCase().indexOf("win")!=-1)?true:false;
var isOpera=(navigator.userAgent.indexOf("Opera")!=-1)?true:false;
var defaultAddButtonLabel="Add Files";
var defaultUploadButtonLabel="Upload";
var defaultClearButtonLabel="Clear All";
var defaultDeleteButtonLabel="Delete";
var defaultAddIcon="/CFIDE/scripts/ajax/resources/cf/images/fileupload/addfile.png";
var defaultUploadIcon="/CFIDE/scripts/ajax/resources/cf/images/fileupload/upload.png";
var defaultClearIcon="/CFIDE/scripts/ajax/resources/cf/images/fileupload/clear.gif";
var defaultDeleteIcon="/CFIDE/scripts/ajax/resources/cf/images/fileupload/delete.png";
var defaultUploadSize=10*1024*1024;
var fileUploadPrefix="cf_fileUpload_";
ColdFusion.FileUpload.create=function(_60f,_610,_611,_612,_613,_614,_615,_616,_617,_618,_619,_61a,_61b,_61c,_61d,_61e,_61f,_620,_621,_622,_623,_624,_625,_626,_627,_628,_629,_62a,_62b,_62c){
var _62d={};
_62d.uploadDivId=_60f;
_62d.fileUploadName=fileUploadPrefix+_60f;
_62d.url_withoutQuery=_610;
_62d.url_queryString=_611;
_62d.url_CF_cookie=_612;
_62d.url=$FS.constructUrl(_610,_611,_612);
_62d.onCompleteHandler=_61a;
_62d.onUploadCompleteHandler=_61b;
_62d.onErrorHandler=_61c;
_62d.progressbar=_627;
if(_61f==null){
_61f="";
}
_62d.bgcolor=_61f;
if(_620==null){
_620="";
}
_62d.selectcolor=_620;
if(_621==null){
_621="";
}
_62d.rollovercolor=_621;
if(_622==null){
_622="";
}
_62d.textcolor=_622;
if(_625==null){
_625="left";
}
_62d.titletextalign=_625;
if(_623==null){
_623="";
}
_62d.titletextcolor=_623;
if(_624==null){
_624="";
}
_62d.headercolor=_624;
_62d.bgcolor=_61f;
_62d.bgcolor=_61f;
if(_626==null){
_626="";
}
_62d.fileFilter=_626;
_62d.disableUploadButton=_629;
if(_62b==null||typeof _62b=="undefined"){
_62b="window";
}
_62d.wmode=_62b;
_62d.stopOnError=_62a;
if(_613==null||typeof _613==="undefined"){
_613=defaultAddButtonLabel;
}
if(_628!=null&&typeof (_628)!="undefined"&&_628!="/"){
_62d.addIcon=_628+defaultAddIcon;
}else{
_62d.addIcon=defaultAddIcon;
}
_62d.addButtonLabel=_613;
if(_615==null||typeof _615==="undefined"){
_615=defaultUploadButtonLabel;
}
var _62e;
if(_628!=null&&typeof (_628)!="undefined"&&_628!="/"){
_62e=_628+defaultUploadIcon;
}else{
_62e=defaultUploadIcon;
}
_62d.uploadButtonLabel=_615;
_62d.uploadIcon=_62e;
if(_617==null||typeof _617==="undefined"){
_617="File Upload ";
}
_62d.title=_617;
if(_628!=null&&typeof (_628)!="undefined"&&_628!="/"){
_62d.swfLocation=_628+$FS.defaultSWFLocation;
}else{
_62d.swfLocation=$FS.defaultSWFLocation;
}
if(_614==null||typeof _614==="undefined"){
_614=defaultClearButtonLabel;
}
var _62f;
if(_628!=null&&typeof (_628)!="undefined"&&_628!="/"){
_62f=_628+_62f;
}else{
_62f=_62f;
}
_62d.clearButtonLabel=_614;
_62d.clearIcon=_62f;
if(_616==null||typeof _616==="undefined"){
_616=defaultDeleteButtonLabel;
}
_62d.deleteButtonLabel=_616;
var _630;
if(_628!=null&&typeof (_628)!="undefined"&&_628!="/"){
_630=_628+defaultDeleteIcon;
}else{
_630=defaultDeleteIcon;
}
_62d.deleteIcon=_630;
if(_618==null||!typeof _618==="Number"){
_618=-1;
}
_62d.maxFileSelect=_618;
if(_619==null||!typeof _619==="number"){
_619=defaultUploadSize;
}
_62d.maxUploadSize=_619;
if(_61d==null||typeof _61d==="undefined"){
_61d=420;
}
_62d.widthInPx=_61d+"px";
_62d.width=_61d;
if(_61e==null||typeof _61e==="undefined"){
_61e=300;
}
_62d.heightInPx=_61e+"px";
_62d.height=_61e;
_62d.align=_62c;
ColdFusion.objectCache[_60f]=_62d;
ColdFusion.objectCache[_62d.fileUploadName]=_62d;
var _631=$FS.constructMarkup(_62d);
var _632=document.getElementById(_60f);
_632.innerHTML=_631;
ColdFusion.Log.info("fileupload.initialized","widget",[_60f]);
};
$FS.constructMarkup=function(_633){
var str="";
if(isIE&&isWin&&!isOpera){
str+="<object width=\""+_633.width+"\" height=\""+_633.height+"\"";
str+=" id=\""+_633.fileUploadName+"\" name=\""+_633.playerName+"\" type=\"application/x-shockwave-flash\" classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" ";
str+=" data=\""+_633.swfLocation+"\">";
str+="<param name=\"movie\" value=\""+_633.swfLocation+"\" />";
str+="<param name=\"quality\" value=\""+_633.quality+"\" />";
str+="<param name=\"allowFullScreen\" value=\""+_633.fullScreen+"\" />";
str+="<param name=\"allowScriptAccess\" value=\"sameDomain\" />";
str+="<param name=\"wmode\" value=\""+_633.wmode+"\" />";
str+="<param name=\"flashvars\" value=\"uniqueid="+_633.fileUploadName+"&url="+_633.url+"&addLabel="+_633.addButtonLabel+"&deleteLabel="+_633.deleteButtonLabel;
str+="&clearLabel="+_633.clearButtonLabel+"&uploadLabel="+_633.uploadButtonLabel+"&maxUploadSize="+_633.maxUploadSize+"&maxFileSelect="+_633.maxFileSelect+"&progress="+_633.progressbar;
str+="&stopOnError="+_633.stopOnError+"&hideUpload="+_633.disableUploadButton+"&bgcolor="+_633.bgcolor+"&fileFilter="+_633.fileFilter+"&deleteIcon="+_633.deleteIcon+"&title="+_633.title;
str+="&uploadIcon="+_633.uploadIcon+"&textcolor="+_633.textcolor+"&titletextcolor="+_633.titletextcolor+"&headercolor="+_633.headercolor+"&titletextalign="+_633.titletextalign+"&rollovercolor="+_633.rollovercolor+"&selectcolor="+_633.selectcolor+"\" />";
str+="</object>";
}else{
str="<embed src=\""+_633.swfLocation+"\" allowScriptAccess=\"samedomain\" pluginspage=\"http://www.adobe.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" wmode=\""+_633.wmode+"\"";
str+=" name=\""+_633.fileUploadName+"\" width=\""+_633.width+"\" height=\""+_633.height+"\" quality=\" "+_633.quality+"\"";
str+=" flashvars=\"uniqueid="+_633.fileUploadName+"&url="+_633.url+"&addLabel="+_633.addButtonLabel+"&deleteLabel="+_633.deleteButtonLabel;
str+="&clearLabel="+_633.clearButtonLabel+"&uploadLabel="+_633.uploadButtonLabel+"&maxUploadSize="+_633.maxUploadSize+"&maxFileSelect="+_633.maxFileSelect+"&progress="+_633.progressbar;
str+="&stopOnError="+_633.stopOnError+"&hideUpload="+_633.disableUploadButton+"&bgcolor="+_633.bgcolor+"&fileFilter="+_633.fileFilter+"&deleteIcon="+_633.deleteIcon+"&title="+_633.title;
str+="&uploadIcon="+_633.uploadIcon+"&textcolor="+_633.textcolor+"&titletextcolor="+_633.titletextcolor+"&headercolor="+_633.headercolor+"&titletextalign="+_633.titletextalign+"&rollovercolor="+_633.rollovercolor+"&selectcolor="+_633.selectcolor+"\" />";
}
return str;
};
$FS.constructUrl=function(_635,_636,_637){
var url=_635;
if(_636!=null){
url+="?"+_636;
if(_637!=null){
url+="%26"+_637;
}
}else{
if(_637!=null){
url+="?"+_637;
}
}
return url;
};
coldfusion_FileUploadSwf_complete=function(name,_63a){
var _63b=$FS.getFileUploadComponent(name);
var _63c=ColdFusion.objectCache[name];
var _63d=_63c.onCompleteHandler;
if(_63d!=null&&typeof _63d=="function"){
_63d.call(this,_63a);
}
$FS.addResultToArray(_63a,_63c);
};
coldfusion_FileUploadSwf_onError=function(name,_63f){
var _640=$FS.getFileUploadComponent(name);
var _641=ColdFusion.objectCache[name];
var _642=_641.onErrorHandler;
if(_642!=null&&typeof _642=="function"){
_642.call(this,_63f);
}
$FS.addResultToArray(_63f,_641);
};
coldfusion_FileUploadSwf_UploadCompete=function(name){
var _644=$FS.getFileUploadComponent(name);
var _645=ColdFusion.objectCache[name];
var _646=_645.onUploadCompleteHandler;
var _647=_645.resultArray;
if(_646!=null&&typeof _646=="function"){
_646.call(this,_647);
}
_645.resultArray=new Array();
};
$FS.addResultToArray=function(_648,_649){
var _64a=_649.resultArray;
if(_64a==null||typeof _64a=="undefined"){
_64a=_649.resultArray=new Array();
}
_64a.push(_648);
};
$FS.cancelUpload=function(name){
var _64c=fileUploadPrefix+name;
var _64d=$FS.getFileUploadComponent(_64c);
if(_64d!=null){
_64d.cancelFileUpload();
}else{
ColdFusion.handleError(null,"fileupload.cancelupload.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.cancelupload.cancelled","widget",[name]);
};
$FS.getSelectedFiles=function(name){
var _64f=fileUploadPrefix+name;
var _650=$FS.getFileUploadComponent(_64f);
if(_650!=null){
return _650.getSelectedFileArray();
}else{
ColdFusion.handleError(null,"fileupload.getSelectedFiles.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.getSelectedFiles.selected","widget",[name]);
};
$FS.clearAllFiles=function(name){
var _652=fileUploadPrefix+name;
var _653=$FS.getFileUploadComponent(_652);
if(_653!=null){
_653.clearAllUpload();
}else{
ColdFusion.handleError(null,"fileupload.clearallfiles.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.clearallfiles.cleared","widget",[name]);
};
$FS.setURL=function(name,src){
var _656=$FS.getFileUploadComponent(fileUploadPrefix+name);
var _657=ColdFusion.objectCache[name];
if(_657==null||typeof (_657)=="undefined"){
ColdFusion.handleError(null,"fileupload.setURL.notfound","widget",[name],null,null,true);
}
if(!src||src.length==0){
ColdFusion.handleError(null,"fileupload.setURL.invalidurl","widget",[name],null,null,true);
}
var _658=null;
if(src.indexOf("?")>0){
_658=src.substring(src.indexOf("?")+1);
_658=escape(_658);
src=src.substring(0,src.indexOf("?"));
}
if(src.charAt(0)!="/"&&src.indexOf("://")<0){
var _659=_657.url_withoutQuery;
_659=unescape(_659);
var _65a="";
if(_659||_659.indexOf("/")>-1){
_65a=_659.substring(0,_659.lastIndexOf("/")+1);
}
var _65b=_65a+src;
var _65c=_65b.split("/");
var _65d=new Array();
var _65e=0;
for(var i=0;i<_65c.length;i++){
if(_65c[i]==".."){
_65d[--_65e]="";
}else{
_65d[_65e++]=_65c[i];
}
}
src=_65d[0];
for(var i=1;i<_65e;i++){
src=src+"/"+_65d[i];
}
}
var _660=$FS.constructUrl(src,_658,_657.url_CF_cookie);
_657.url=_660;
_656.setSrc(_660);
ColdFusion.Log.info("fileupload.setURL.urlset","widget",[name,_660]);
};
$FS.startUpload=function(name){
var _662=fileUploadPrefix+name;
var _663=$FS.getFileUploadComponent(_662);
if(_663!=null){
_663.submitUploadForm();
}else{
ColdFusion.handleError(null,"fileupload.startupload.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.startupload.started","widget",[name]);
};
$FS.getFileUploadComponent=function(name){
if(navigator.appName.indexOf("Microsoft")!=-1){
return window[name];
}else{
return document[name];
}
};
