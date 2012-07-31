/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.ProgressBar){
ColdFusion.ProgressBar={};
}
var $P=ColdFusion.ProgressBar;
ColdFusion.ProgressBar.create=function(_193,_194,_195,_196,_197,_198,_199,_19a,_19b,_19c){
var _19d={renderTo:_193,interval:_196,onComplete:_19a,autodisplay:_199,onError:_19c};
var _19e={renderTo:_193};
if(_198!=null&&typeof (_198)!=undefined){
_19d.width=_198;
_19e.width=_198;
}else{
_19e.width=400;
}
if(_197!=null&&typeof (_197)!=undefined){
_19d.height=_197;
_19e.height=_197;
}else{
_19d.autoHeight=true;
_19e.autoHeight=true;
}
if(_194!=null){
_19d.manual=true;
_19d.status_retrieval_fn=_194;
}else{
_19d.manual=false;
_19d.duration=_195;
}
_19d.hidden=!_199;
_19e.hidden=_19d.hidden;
if(_19b!=null&&typeof _19b!="undefined"){
_19d.cls=_19b;
_19e.cls=_19b;
}
var _19f=new Ext.ProgressBar(_19e);
_19d.progressBarComp=_19f;
ColdFusion.objectCache[_193]=_19d;
ColdFusion.Log.info("progressbar.create.created","widget",[_193]);
};
$P.start=function(_1a0){
var _1a1=$P.getProgressBarObject(_1a0);
var _1a2=ColdFusion.objectCache[_1a0];
if(!_1a1.isVisible()){
_1a1=_1a1.show();
}
_1a2.started=true;
if(_1a2.manual==false){
var _1a3=_1a2.interval;
var _1a4=_1a2.duration;
var _1a5=_1a4/_1a3;
_1a1.wait({interval:_1a3,duration:_1a4,increment:_1a5,fn:$P.automaticPBCompleteHandler,scope:_1a2});
}else{
var _1a6=setInterval(_1a2.status_retrieval_fn,_1a2.interval);
_1a2.processId=_1a6;
}
ColdFusion.Log.info("progressbar.start.started","widget",[_1a0]);
};
$P.stop=function(_1a7,_1a8){
var pBar=$P.getProgressBarObject(_1a7);
var _1aa=ColdFusion.objectCache[_1a7];
var _1ab=_1aa.processId;
if(typeof _1aa.started!="undefined"&&_1aa.started==true){
_1aa.started=false;
}else{
ColdFusion.Log.info("progressbar.stop.nonrunning","widget",[_1a7]);
return;
}
if(_1ab!=null&&typeof (_1ab)!="undefined"){
clearInterval(_1ab);
}
if(typeof _1aa.manual!="undefined"&&_1aa.manual==false){
pBar.reset();
}
if(_1a8&&_1a8==true){
var _1ac=_1aa.onComplete;
if(_1ac!=null&&_1ac.call){
_1ac.call();
}
}
ColdFusion.Log.info("progressbar.stop.stopped","widget",[_1a7]);
};
$P.hide=function(_1ad){
var pBar=$P.getProgressBarObject(_1ad);
if(pBar.isVisible()){
pBar.hide();
}
ColdFusion.Log.info("progressbar.hide.hidden","widget",[_1ad]);
};
$P.show=function(_1af){
var pBar=$P.getProgressBarObject(_1af);
if(!pBar.isVisible()){
pBar.show();
}
ColdFusion.Log.info("progressbar.show.shown","widget",[_1af]);
};
$P.reset=function(_1b1){
var pBar=$P.getProgressBarObject(_1b1);
if(typeof pBar!="undefined"){
pBar.reset();
}
ColdFusion.Log.info("progressbar.reset.reset","widget",[_1b1]);
};
$P.updateStatus=function(_1b3,_1b4,_1b5){
var pBar=$P.getProgressBarObject(_1b3);
if(typeof (_1b4)=="undefined"||typeof (_1b4)!="number"){
ColdFusion.handleError(null,"progressbar.updatestatus.invalidstatus","widget",[_1b3,_1b4],null,null,true);
return;
}
if(typeof pBar!="undefined"){
pBar.updateProgress(_1b4,_1b5);
}
ColdFusion.Log.info("progressbar.updatestatus.updated","widget",[_1b3]);
};
$P.update=function(_1b7,_1b8){
var _1b9={};
var _1ba=ColdFusion.objectCache[_1b7];
if(_1ba==null||typeof (_1ba)=="undefined"){
ColdFusion.handleError(null,"progressbar.update.notfound","widget",[_1b7],null,null,true);
return;
}
if(_1b8.duration){
if(typeof _1b8.duration==="number"||typeof _1b8.duration=="object"){
_1b9.duration=_1b8.duration;
}else{
ColdFusion.handleError(null,"progressbar.update.invalidduration","widget",[_1b7],null,null,true);
return;
}
}
if(_1b8.interval){
if(typeof _1b8.interval==="number"||typeof _1b8.interval=="object"){
_1b9.interval=_1b8.interval;
}else{
ColdFusion.handleError(null,"progressbar.update.invalidinterval","widget",[_1b7],null,null,true);
return;
}
}
if(_1b8.oncomplete){
if(typeof _1b8.oncomplete==="function"||typeof _1b8.oncomplete=="object"){
_1b9.onComplete=_1b8.oncomplete;
}else{
ColdFusion.handleError(null,"progressbar.update.invalidoncomplete","widget",[_1b7],null,null,true);
return;
}
}
for(key in _1b9){
_1ba[key]=_1b9[key];
}
ColdFusion.Log.info("progressbar.update.updated","widget",[_1b7]);
};
$P.loadStatus=function(data,_1bc){
var _1bd=ColdFusion.AjaxProxy.JSON.decode(data);
var _1be=_1bd.MESSAGE;
var _1bf=_1bd.STATUS;
var pBar=$P.getProgressBarObject(_1bc._cf_progressbarid);
pBar.updateProgress(_1bf,_1be);
if(_1bf&&(_1bf===1||_1bf==1||_1bf>1)){
$P.stop(_1bc._cf_progressbarid,true);
}
};
$P.automaticPBCompleteHandler=function(){
var _1c1=this.progressBarComp;
_1c1.updateProgress(1);
if(this.onComplete&&typeof this.onComplete=="function"){
this.onComplete.call(_1c1,_1c1);
}
};
$P.errorHandler=function(_1c2,_1c3,_1c4){
var pbId=_1c4.bindToParams._cf_progressbarid;
var _1c6=ColdFusion.objectCache[pbId];
var _1c7=_1c6.onError;
if(_1c7!=null&&typeof _1c7==="function"){
_1c7.call(null,_1c2,_1c3);
}
$P.stop(pbId);
};
$P.getProgressBarObject=function(_1c8){
var _1c9=ColdFusion.objectCache[_1c8];
if(_1c9==null||typeof (_1c9)=="undefined"){
ColdFusion.handleError(null,"progressbar.getProgressBarObject.missingprogressbarid","widget",[_1c8],null,null,true);
return;
}
if(_1c9.progressBarComp&&typeof _1c9.progressBarComp!="undefined"){
return _1c9.progressBarComp;
}else{
ColdFusion.handleError(null,"progressbar.getProgressBarObject.missingprogressbarcomponent","widget",[_1c8],null,null,true);
return;
}
};
