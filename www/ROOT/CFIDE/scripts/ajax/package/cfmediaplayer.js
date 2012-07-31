/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Mediaplayer){
ColdFusion.Mediaplayer={};
}
var $MP=ColdFusion.Mediaplayer;
$MP.defaultSWFLocation="/CFIDE/scripts/ajax/resources/cf/assets/mediaplayer.swf";
var isIE=(navigator.appVersion.indexOf("MSIE")!=-1)?true:false;
var isWin=(navigator.appVersion.toLowerCase().indexOf("win")!=-1)?true:false;
var isOpera=(navigator.userAgent.indexOf("Opera")!=-1)?true:false;
ColdFusion.Mediaplayer.init=function(_1e5,_1e6,_1e7,_1e8,_1e9,_1ea,_1eb,_1ec,_1ed,_1ee,_1ef,_1f0,_1f1,_1f2,_1f3,_1f4,_1f5,_1f6,_1f7,_1f8,_1f9,_1fa,_1fb,_1fc,_1fd,_1fe,_1ff,_200,_201){
var _202={divId:_1e5,playerName:_1e6,source:_1e7,align:_1ea,quality:_1eb,fullScreen:_1ec,onFinish:_1ee,onLoad:_1ef,onStart:_1f0,hideControlBar:_1f1,hideBorder:_1f2,hideTitle:_200,autoplay:_1f4,pageURL:_201};
if(_1e9!=null&&typeof (_1e9)!="undefined"){
_202.width=_1e9;
}else{
_202.width=480;
}
if(_1f5==null||typeof _1f5=="undefined"){
_1f5="window";
}
_202.wmode=_1f5;
_202.wmode=_1f5;
if(_1e8!=null&&typeof (_1e8)!="undefined"){
_202.height=_1e8;
}else{
_202.height=360;
}
if(_1ea!=null&&typeof (_1ea)!="undefined"){
_202.align=_1ea;
}else{
_202.align="center";
}
if(_1eb!=null&&typeof (_1eb)!="undefined"){
_202.quality=_1eb;
}else{
_202.quality="high";
}
if(_1ed==null||typeof _1ed=="undefined"){
_1ed="#4444444";
}
if(_1f3!=null&&typeof (_1f3)!="undefined"&&_1f3!="/"){
_202.swfLocation=_1f3+$MP.defaultSWFLocation;
}else{
_202.swfLocation=$MP.defaultSWFLocation;
}
if(_1f6==null){
_1f6="";
}
if(_1f7==null){
_1f7="";
}
if(_1f8==null){
_1f8="";
}
if(_1f9==null){
_1f9="";
}
if(_1fa==null){
_1fa="";
}
if(_1fb==null){
_1fb="";
}
if(_1fc==null){
_1fc="";
}
if(_1fd==null){
_1fd="";
}
if(_1fe==null){
_1fe="";
}
if(_1ff==null){
_1ff="";
}
_202.bgcolor=_1ed;
_202.controlscolor=_1f6;
_202.controlbarbgcolor=_1f7;
_202.titletextcolor=_1f8;
_202.titlebgcolor=_1f9;
_202.progresscolor=_1fa;
_202.progressbgcolor=_1fb;
_202.bordertop=_1fc;
_202.borderleft=_1fe;
_202.borderright=_1ff;
_202.borderbottom=_1fd;
ColdFusion.objectCache[_1e6]=_202;
var _203=$MP.constructMarkup(_202);
var _204=document.getElementById(_1e5);
_204.innerHTML=_203;
ColdFusion.Log.info("mediaplayer.initialized","widget",[_1e6]);
};
var defaultURL="";
$MP.constructMarkup=function(_205){
var str="";
if(isIE&&isWin&&!isOpera){
str+="<object width=\""+_205.width+"\" height=\""+_205.height+"\"";
str+=" id=\""+_205.playerName+"\" name=\""+_205.playerName+"\" type=\"application/x-shockwave-flash\" classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" ";
str+=" data=\""+_205.swfLocation+"\">";
str+="<param name=\"movie\" value=\""+_205.swfLocation+"\" />";
str+="<param name=\"quality\" value=\""+_205.quality+"\" />";
str+="<param name=\"backgroundColor\" value=\""+_205.bgcolor+"\" />";
str+="<param name=\"allowFullScreen\" value=\""+_205.fullScreen+"\" />";
str+="<param name=\"wmode\" value=\""+_205.wmode+"\" />";
str+="<param name=\"allowScriptAccess\" value=\"sameDomain\" />";
str+="<param name=\"flashvars\" value=\"uniqueid="+_205.playerName+"&autoPlay="+_205.autoplay+"&bgcolor="+_205.bgcolor+"&src="+_205.source+"&hideBorder="+_205.hideBorder+"&hideControlBar="+_205.hideControlBar+"&allowFullScreen="+_205.fullScreen;
str+="&controlscolor="+_205.controlscolor+"&controlbarbgcolor="+_205.controlbarbgcolor+"&titletextcolor="+_205.titletextcolor+"&titlebgcolor="+_205.titlebgcolor+"&progresscolor="+_205.progresscolor+"&progressbgcolor="+_205.progressbgcolor;
str+="&bordertop="+_205.bordertop+"&borderbottom="+_205.borderbottom+"&borderleft="+_205.borderleft+"&borderright="+_205.borderright+"&hideTitle="+_205.hideTitle+"\" />";
str+="</object>";
}else{
str="<embed src=\""+_205.swfLocation+"\" allowScriptAccess=\"samedomain\" pluginspage=\"http://www.adobe.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" wmode=\""+_205.wmode+"\" "+"allowFullScreen=\""+_205.fullScreen+"\"";
str+=" name=\""+_205.playerName+"\" width=\""+_205.width+"\" height=\""+_205.height+"\" quality=\" "+_205.quality+"\"";
str+=" flashvars=\"uniqueid="+_205.playerName+"&autoPlay="+_205.autoplay+"&bgcolor="+_205.bgcolor+"&src="+_205.source+"&hideBorder="+_205.hideBorder+"&hideControlBar="+_205.hideControlBar+"&allowFullScreen="+_205.fullScreen;
str+="&controlscolor="+_205.controlscolor+"&controlbarbgcolor="+_205.controlbarbgcolor+"&titletextcolor="+_205.titletextcolor+"&titlebgcolor="+_205.titlebgcolor+"&progresscolor="+_205.progresscolor+"&progressbgcolor="+_205.progressbgcolor;
str+="&bordertop="+_205.bordertop+"&borderbottom="+_205.borderbottom+"&borderleft="+_205.borderleft+"&borderright="+_205.borderright+"&hideTitle="+_205.hideTitle+"\" />";
}
return str;
};
$MP.setSource=function(_207,src){
var _209=$MP.getVideoComponent(_207);
if(_209==null||typeof (_209)=="undefined"){
ColdFusion.handleError(null,"mediaplayer.setsource.notfound","widget",[_207],null,null,true);
}
if(!src||src.length==0){
ColdFusion.handleError(null,"mediaplayer.setsource.invalidsource","widget",[_207],null,null,true);
}
var _20a=ColdFusion.objectCache[_207];
if(src.charAt(0)!="/"&&src.indexOf("://")<0){
var _20b=_20a.pageURL;
var _20c="";
if(_20b||_20b.indexOf("/")>-1){
_20c=_20b.substring(0,_20b.lastIndexOf("/")+1);
}
var _20d=_20c+src;
var _20e=_20d.split("/");
var _20f=new Array();
var _210=0;
for(var i=0;i<_20e.length;i++){
if(_20e[i]==".."){
_20f[--_210]="";
}else{
_20f[_210++]=_20e[i];
}
}
src=_20f[0];
for(var i=1;i<_210;i++){
src=src+"/"+_20f[i];
}
}
_209.setSrc(src);
ColdFusion.Log.info("mediaplayer.setsource.sourceset","widget",[_207,src]);
};
$MP.resize=function(_212,_213,_214){
var _215=$MP.getVideoComponent(_212);
var _216=ColdFusion.objectCache[_212];
if(_215==null||typeof (_215)=="undefined"){
ColdFusion.handleError(null,"mediaplayer.resize.notfound","widget",[_212],null,null,true);
}
if(_216==null||typeof (_216)=="undefined"){
ColdFusion.handleError(null,"mediaplayer.resize.notfound","widget",[_212],null,null,true);
}
var _217=_216.divId;
if(_217==null||typeof (_217)=="undefined"){
ColdFusion.handleError(null,"mediaplayer.resize.divnotfound","widget",[_212,_217],null,null,true);
}
var _218=document.getElementById(_217);
var _219;
if(navigator.appName.indexOf("Microsoft")!=-1){
_219=_218.getElementsByTagName("object")[0];
}else{
_219=_218.getElementsByTagName("embed")[0];
}
_219.height=_213;
_219.width=_214;
};
$MP.stopPlay=function(_21a){
var _21b=$MP.getVideoComponent(_21a);
if(_21b==null||typeof (_21b)=="undefined"){
ColdFusion.handleError(null,"mediaplayer.stopplay.notfound","widget",[_21a],null,null,true);
}
_21b.stopVideo(true);
};
$MP.setMute=function(_21c,mute){
var _21e=$MP.getVideoComponent(_21c);
if(_21e==null||typeof (_21e)=="undefined"){
ColdFusion.handleError(null,"mediaplayer.setmute.notfound","widget",[_21c],null,null,true);
}
_21e.setVideoMute(mute);
};
$MP.setVolume=function(_21f,_220){
var _221=$MP.getVideoComponent(_21f);
if(_221==null||typeof (_221)=="undefined"){
ColdFusion.handleError(null,"mediaplayer.setvolume.playerNotFound","widget",[_21f],null,null,true);
}
_221.setVideoVolume(_220);
};
$MP.startPlay=function(_222){
var _223=$MP.getVideoComponent(_222);
if(_223==null||typeof (_223)=="undefined"){
ColdFusion.handleError(null,"mediaplayer.startplay.playerNotFound","widget",[_222],null,null,true);
}
_223.startVideo();
};
coldfusion_mediaplayer_initPlayer=function(_224){
var _225=$MP.getVideoComponent(_224);
var _226=ColdFusion.objectCache[_224];
var _227=_226.onLoad;
if(_227!=null&&typeof _227=="function"){
_227.call(this);
}
ColdFusion.Log.info("mediaplayer.onload.called","widget",[_224]);
};
$MP.getVideoComponent=function(name){
if(navigator.appName.indexOf("Microsoft")!=-1){
return window[name];
}else{
return document[name];
}
};
coldfusion_FileUploadSwf_videoReadyHandler=function(_229){
var _22a=$MP.getVideoComponent(_229);
var _22b=ColdFusion.objectCache[_229];
var _22c=_22b.onStart;
if(_22c!=null&&typeof _22c=="function"){
_22c.call(this);
}
ColdFusion.Log.info("mediaplayer.onstart.called","widget",[_229]);
};
coldfusion_mediaplayer_videoCompleteHandler=function(_22d){
var _22e=$MP.getVideoComponent(_22d);
var _22f=ColdFusion.objectCache[_22d];
var _230=_22f.onFinish;
if(_230!=null&&typeof _230=="function"){
_230.call(this);
}
ColdFusion.Log.info("mediaplayer.onfinish.called","widget",[_22d]);
};
