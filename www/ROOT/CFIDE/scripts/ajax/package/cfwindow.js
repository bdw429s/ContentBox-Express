/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Window){
ColdFusion.Window={};
}
ColdFusion.Window.windowIdCounter=1;
ColdFusion.Window.TITLE_BGCOLOR_TEMPLATE="WINDOW_DIV_ID .x-window-tc , WINDOW_DIV_ID .x-window-tl, WINDOW_DIV_ID .x-window-tr, WINDOW_DIV_ID .x-window-bc, WINDOW_DIV_ID .x-window-br, WINDOW_DIV_ID"+" .x-window-bl, WINDOW_DIV_ID  .x-window-ml, WINDOW_DIV_ID .x-window-mr { background-image: none; background-color: COLOR_ID; }";
ColdFusion.Window.create=function(_c1,_c2,url,_c4){
if(_c1==null){
ColdFusion.handleError(null,"window.create.nullname","widget",null,null,null,true);
return;
}
if(_c1==""){
ColdFusion.handleError(null,"window.create.emptyname","widget",null,null,null,true);
return;
}
var _c5=ColdFusion.objectCache[_c1];
var _c6=false;
if(typeof (_c5)!="undefined"&&_c5!=null){
if(_c5.callfromtag){
ColdFusion.handleError(null,"window.create.duplicatename","widget",[_c1]);
}
if(typeof (_c5.isConfObj)!="undefined"&&_c5.isConfObj==true){
_c6=true;
if(_c4!=null&&typeof (_c4.initshow)!="undefined"){
if(_c4.initshow==false){
return;
}
}
}else{
if(!_c4||(_c4&&_c4.initshow!==false)){
ColdFusion.Window.show(_c1);
}
return;
}
}
if(!_c5){
ColdFusion.Log.info("window.create.creating","widget",[_c1]);
}
var _c7=ColdFusion.Window.createHTML(_c1,_c2,url,_c4,_c6);
var _c8=ColdFusion.objectCache[_c1];
if(_c8!=null&&typeof (_c8.isConfObj)!="undefined"&&_c8.isConfObj==true){
return;
}
return ColdFusion.Window.createJSObj(_c1,url,_c7);
};
ColdFusion.Window.createHTML=function(_c9,_ca,url,_cc,_cd){
var _ce=null;
var _cf=null;
if(_cc&&_cc.divid){
_ce=document.getElementById(_cc.divid);
}
if(_ce==null){
_ce=document.createElement("div");
_cf="cf_window"+ColdFusion.Window.windowIdCounter;
ColdFusion.Window.windowIdCounter++;
_ce.id=_cf;
_ce.className="x-hidden";
}
document.body.appendChild(_ce);
var _d0=false;
var _d1=null;
if(_cc!=null&&typeof (_cc.headerstyle)!="undefined"&&_cc.headerstyle!=null){
var _d2=new String(_cc.headerstyle);
_d2=_d2.toLowerCase();
var _d3=_d2.indexOf("background-color");
if(_d3>=0){
_d0=true;
var _d4=_d2.indexOf(";",_d3+17);
if(_d4<0){
_d4=_d2.length;
}
_d1=_d2.substring(_d3+17,_d4);
}
}
var _d5=document.getElementById(_c9+"_title");
if(_d0==true&&_d1){
var _d6="#"+_cc.divid;
var _d7="NAME_ID .x-window-tc , NAME_ID .x-window-tl, NAME_ID .x-window-tr, NAME_ID .x-window-bc, NAME_ID .x-window-br, NAME_ID .x-window-bl,NAME_ID .x-window-ml, NAME_ID .x-window-mr { background-image: none; background-color: COLOR_ID; }";
var _d8=ColdFusion.Util.replaceAll(ColdFusion.Window.TITLE_BGCOLOR_TEMPLATE,"WINDOW_DIV_ID",_d6);
var _d8=ColdFusion.Util.replaceAll(_d8,"COLOR_ID",_d1);
Ext.util.CSS.createStyleSheet(_d8);
}
if(_d5==null){
_d5=document.createElement("div");
_d5.id=_c9+"_title";
var _d9="x-window-header";
_d5.className=_d9;
if(_ca){
_d5.innerHTML=_ca;
}else{
_d5.innerHTML="&nbsp;";
}
_ce.appendChild(_d5);
}
var _da=document.getElementById(_c9+"_body");
if(_da==null){
_da=document.createElement("div");
_da.id=_c9+"_body";
_da.className="x-window-body";
_ce.appendChild(_da);
}
var _db;
_db=ColdFusion.Window.getUpdatedConfigObj(_cc,_c9);
if(typeof (_db)=="undefined"){
_ce.innerHTML="";
return;
}
if(_cf){
_db.divid=_cf;
}
_db.title=_ca;
if(typeof (_db.initshow)!="undefined"&&_db.initshow===false){
_db.url=url;
ColdFusion.objectCache[_c9]=_db;
ColdFusion.objectCache[_c9+"_body"]=_db;
}
return _db;
};
ColdFusion.Window.createJSObj=function(_dc,url,_de){
var _df;
var _e0=false;
if(typeof (_de.childlayoutid)&&_de.childlayoutid!=null){
_e0=true;
_de.layout="border";
_de.items=ColdFusion.objectCache[_de.childlayoutid];
}else{
_de.layout="fit";
}
if(typeof (_de.autoScroll)=="undefined"){
_de.autoScroll=true;
}
_de.el=_de.divid;
_df=new Ext.Window(_de);
_df.cfwindowname=_dc;
_df.tempx=_de.tempx;
_df.tempy=_de.tempy;
_df.divid=_de.divid;
if(typeof (_de.headerstyle)!="undefined"&&_de.headerstyle!=null){
var _e1=document.getElementById(_dc+"_title");
if(_e1!=null){
_e1.style.cssText="background:none;"+_de.headerstyle;
}
}
if(typeof (_de.bodystyle)!="undefined"&&_de.bodystyle!=null){
var _e2=document.getElementById(_dc+"_body");
var _e3=_e2.parentNode;
if(_e3!=null){
_e3.style.cssText=_de.bodystyle;
}
}
_df.isConfObj=false;
_df._cf_body=_dc+"_body";
ColdFusion.objectCache[_dc]=_df;
if(_e0){
var _e4=_df.getLayout();
var _e5=ColdFusion.objectCache[_de.childlayoutid];
}
_df.addListener("beforeclose",ColdFusion.Window.beforeCloseHandler);
var _e6=null;
if(typeof (url)!="undefined"&&url!=""){
_e6=url;
}
if(_e6==null){
if(typeof (_de.initshow)=="undefined"||_de.initshow==true){
_df.addListener("beforeshow",ColdFusion.Window.beforeShowHandler);
ColdFusion.Window.showandhide(_df,_de);
}
return;
}
ColdFusion.objectCache[_dc+"_body"]=_df;
if(typeof (_de.callfromtag)=="undefined"){
var _e7;
var _e8;
_df._cf_visible=false;
_df._cf_dirtyview=true;
_df.addListener("show",ColdFusion.Window.showHandler);
_df.addListener("hide",ColdFusion.Window.hideHandler);
_df.url=_e6;
if(_de){
if(typeof (_de.initshow)=="undefined"||_de.initshow==true){
ColdFusion.Window.showandhide(_df,_de);
}
_e7=_de.callbackHandler;
_e8=_de.errorHandler;
}
}else{
_df.callfromtag=true;
_df._cf_visible=false;
_df._cf_dirtyview=true;
_df.addListener("show",ColdFusion.Window.showHandler);
_df.addListener("beforeshow",ColdFusion.Window.beforeShowHandler);
_df.addListener("hide",ColdFusion.Window.hideHandler);
if(typeof (_de.initshow)=="undefined"||_de.initshow==true){
ColdFusion.Window.showandhide(_df,_de);
}
}
};
ColdFusion.Window.showandhide=function(_e9,_ea){
if(typeof (_ea.tempinitshow)!="undefined"&&_ea.tempinitshow==false){
var _eb=Ext.Element.get(_e9.el);
if(typeof _eb!="undefined"){
_eb.show();
}
_eb.hide();
}else{
_e9.show();
}
};
ColdFusion.Window.destroy=function(_ec,_ed){
if(_ec){
var _ee=ColdFusion.Window.getWindowObject(_ec);
if(_ee){
if(_ed===true){
_ee.destroy(true);
}else{
_ee.destroy();
}
ColdFusion.objectCache[_ec]=null;
}
}
};
ColdFusion.Window.resizeHandler=function(_ef,_f0,_f1){
if(typeof (_ef.fixedcenter)!="undefined"&&_ef.fixedcenter==true){
_ef.center();
}
};
ColdFusion.Window.beforeShowHandler=function(_f2){
if(typeof (_f2.fixedcenter)!="undefined"&&_f2.fixedcenter==true){
_f2.center();
}
};
ColdFusion.Window.beforeCloseHandler=function(_f3){
if(_f3.destroyonclose!="undefined"&&_f3.destroyonclose==true){
ColdFusion.objectCache[_f3.cfwindowname]=null;
return true;
}else{
_f3.hide();
return false;
}
};
ColdFusion.Window.showHandler=function(_f4){
_f4._cf_visible=true;
if(_f4._cf_dirtyview){
if(typeof (_f4.callfromtag)=="undefined"){
ColdFusion.Ajax.replaceHTML(_f4._cf_body,_f4.url,"GET",null,_f4.callbackHandler,_f4.errorHandler);
}else{
var _f5=ColdFusion.bindHandlerCache[_f4._cf_body];
if(_f5){
_f5();
}
}
_f4._cf_dirtyview=false;
}
};
ColdFusion.Window.hideHandler=function(_f6){
_f6._cf_visible=false;
if(_f6._cf_refreshOnShow){
_f6._cf_dirtyview=true;
}
};
ColdFusion.Window.xPosition=50;
ColdFusion.Window.yPosition=50;
ColdFusion.Window.resetHTML=function(_f7){
var _f8=document.getElementById(_f7);
if(_f8){
_f8.innerHTML="";
}
};
ColdFusion.Window.getUpdatedConfigObj=function(_f9,_fa){
var _fb={};
if(_f9!=null){
if(typeof (_f9)!="object"){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidconfig","widget",[_fa],null,null,true);
return;
}
for(var key in _f9){
if(key=="center"&&ColdFusion.Util.isBoolean(_f9["center"])){
_fb["fixedcenter"]=_f9["center"];
}else{
_fb[key]=_f9[key];
}
}
}
if(typeof (_fb.initshow)!="undefined"){
if(ColdFusion.Util.isBoolean(_fb.initshow)==false){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidinitshow","widget",[_fa],null,null,true);
return;
}else{
_fb.initshow=ColdFusion.Util.castBoolean(_fb.initshow);
_fb._cf_visible=_fb.initshow;
}
}
_fb.tempcenter=null;
if(typeof (_fb.fixedcenter)!="undefined"){
if(ColdFusion.Util.isBoolean(_fb.fixedcenter)==false){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidcenter","widget",[_fa],null,null,true);
return;
}else{
_fb.fixedcenter=ColdFusion.Util.castBoolean(_fb.fixedcenter);
}
}
if(typeof (_fb.resizable)!="undefined"){
if(ColdFusion.Util.isBoolean(_fb.resizable)==false){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidresizable","widget",[_fa],null,null,true);
return;
}else{
_fb.resizable=ColdFusion.Util.castBoolean(_fb.resizable);
}
}
if(typeof (_fb.draggable)!="undefined"){
if(ColdFusion.Util.isBoolean(_fb.draggable)==false){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invaliddraggable","widget",[_fa],null,null,true);
return;
}else{
_fb.draggable=ColdFusion.Util.castBoolean(_fb.draggable);
}
}
if(typeof (_fb.closable)!="undefined"){
if(ColdFusion.Util.isBoolean(_fb.closable)==false){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidclosable","widget",[_fa],null,null,true);
return;
}else{
_fb.closable=ColdFusion.Util.castBoolean(_fb.closable);
}
}
if(typeof (_fb.modal)!="undefined"){
if(ColdFusion.Util.isBoolean(_fb.modal)==false){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidmodal","widget",[_fa],null,null,true);
return;
}else{
_fb.modal=ColdFusion.Util.castBoolean(_fb.modal);
}
}
if(typeof (_fb.refreshonshow)!="undefined"){
if(ColdFusion.Util.isBoolean(_fb.refreshonshow)==false){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidrefreshonshow","widget",[_fa],null,null,true);
return;
}else{
_fb._cf_refreshOnShow=ColdFusion.Util.castBoolean(_fb.refreshonshow);
}
}
_fb.shadow=true;
if(!_fb.height){
_fb.height=300;
}else{
if(ColdFusion.Util.isInteger(_fb.height)==false){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidheight","widget",[_fa],null,null,true);
return;
}
}
if(!_fb.width){
_fb.width=500;
}else{
if(ColdFusion.Util.isInteger(_fb.width)==false){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidwidth","widget",[_fa],null,null,true);
return;
}
}
var _fd=false;
if(_fb.minwidth){
if(ColdFusion.Util.isInteger(_fb.minwidth)==false){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidminwidth","widget",[_fa],null,null,true);
return;
}
var _fe=_fb.minwidth;
var _ff=_fb.width;
if(typeof (_fe)!="number"){
_fe=parseInt(_fe);
}
if(typeof (_ff)!="number"){
_ff=parseInt(_ff);
}
if(_fe>_ff){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidminwidth","widget",[_fa],null,null,true);
return;
}
_fb.minWidth=_fb.minwidth;
_fd=true;
}
if(_fb.minheight){
if(ColdFusion.Util.isInteger(_fb.minheight)==false){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidminheight","widget",[_fa],null,null,true);
return;
}
var _100=_fb.minheight;
var _101=_fb.height;
if(typeof (_100)!="number"){
_100=parseInt(_100);
}
if(typeof (_101)!="number"){
_101=parseInt(_101);
}
if(_100>_101){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidheightvalue","widget",[_fa],null,null,true);
return;
}
_fb.minHeight=_fb.minheight;
_fd=true;
}
if(_fb.x){
if(ColdFusion.Util.isInteger(_fb.x)==false){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidx","widget",[_fa],null,null,true);
return;
}
}
if(_fb.y){
if(ColdFusion.Util.isInteger(_fb.y)==false){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidy","widget",[_fa],null,null,true);
return;
}
}
if(typeof (_fb.x)=="undefined"&&(typeof (_fb.fixedcenter)=="undefined"||_fb.fixedcenter==false)){
_fb.x=ColdFusion.Window.xPosition;
ColdFusion.Window.xPosition+=15;
}
if(typeof (_fb.y)=="undefined"&&(typeof (_fb.fixedcenter)=="undefined"||_fb.fixedcenter==false)){
_fb.y=ColdFusion.Window.yPosition;
ColdFusion.Window.yPosition+=15;
}
if(typeof (_fb.initshow)!="undefined"&&_fb.initshow===false){
_fb.tempinitshow=false;
if(typeof (_fb.fixedcenter)!="undefined"&&_fb.fixedcenter===true){
_fb.tempcenter=_fb.fixedcenter;
_fb.fixedcenter=null;
}else{
_fb.tempx=_fb.x;
_fb.tempy=_fb.y;
}
_fb.x=-10000;
_fb.y=-10000;
}
_fb.constraintoviewport=true;
_fb.initshow=true;
if(_fb.resizable!=null&&_fb.resizable==false&&_fd==true){
ColdFusion.Window.resetHTML(_fa);
ColdFusion.handleError(null,"window.getupdatedconfigobject.minhwnotallowed","widget",[_fa],null,null,true);
return;
}
_fb.collapsible=false;
_fb.shadow=true;
_fb.isConfObj=true;
return _fb;
};
ColdFusion.Window.show=function(_102){
var _103=ColdFusion.objectCache[_102];
if(typeof (_103)!="undefined"&&_103!=null){
if(typeof (_103.isConfObj)!="undefined"&&_103.isConfObj==true){
_103.initshow=true;
var _104=ColdFusion.Window.createHTML(_102,null,_103.url,_103,true);
ColdFusion.Window.createJSObj(_102,_103.url,_104);
}else{
if(_103.isVisible()==false){
_103.show();
ColdFusion.Log.info("window.show.shown","widget",[_102]);
}
if(_103.tempcenter!=null){
_103.center();
_103.tempcenter=null;
}else{
if(_103.getEl()&&_103.getEl().getX()>0&&_103.getEl().getY()>0){
_103.tempx=null;
_103.tempy=null;
}else{
if(_103.tempx!=null&&_103.tempy!=null){
_103.setPosition(_103.tempx,_103.tempy);
_103.tempx=null;
_103.tempy=null;
}else{
var x=_103.getEl().getX();
var y=_103.getEl().getY();
_103.setPosition(x+1,y+1);
_103.setPosition(x,y);
}
}
}
}
}else{
ColdFusion.handleError(null,"window.show.notfound","widget",[_102],null,null,true);
}
};
ColdFusion.Window.hide=function(_107){
var _108=ColdFusion.objectCache[_107];
if(_108){
if(_108.isVisible&&_108.isVisible()==true){
_108.hide();
ColdFusion.Log.info("window.hide.hidden","widget",[_107]);
}
}else{
ColdFusion.handleError(null,"window.hide.notfound","widget",[_107],null,null,true);
}
};
ColdFusion.Window.onShow=function(_109,_10a){
var _10b=ColdFusion.objectCache[_109];
if(typeof (_10b)!="undefined"&&_10b!=null){
_10b.onShow=_10a;
if(_10b.addListener){
_10b.addListener("show",ColdFusion.Window.onShowWrapper);
}
}else{
ColdFusion.handleError(null,"window.onshow.notfound","widget",[_109],null,null,true);
}
};
ColdFusion.Window.onShowWrapper=function(_10c){
_10c.onShow.call(null,_10c.cfwindowname);
};
ColdFusion.Window.onHide=function(_10d,_10e){
var _10f=ColdFusion.objectCache[_10d];
if(typeof (_10f)!="undefined"&&_10f!=null){
_10f.onHide=_10e;
if(_10f.addListener){
_10f.addListener("hide",ColdFusion.Window.onHideWrapper);
}
}else{
ColdFusion.handleError(null,"window.onhide.notfound","widget",[_10d],null,null,true);
}
};
ColdFusion.Window.onHideWrapper=function(_110){
_110.onHide.call(null,_110.cfwindowname);
};
ColdFusion.Window.getWindowObject=function(_111){
if(!_111){
ColdFusion.handleError(null,"window.getwindowobject.emptyname","widget",null,null,null,true);
return;
}
var _112=ColdFusion.objectCache[_111];
if(_112==null||(typeof (_112.isConfObj)=="undefined"&&Ext.Window.prototype.isPrototypeOf(_112)==false)){
ColdFusion.handleError(null,"window.getwindowobject.notfound","widget",[_111],null,null,true);
return;
}
if(typeof (_112.isConfObj)!="undefined"&&_112.isConfObj==true){
_112.initshow=true;
var _113=ColdFusion.Window.createHTML(_111,null,_112.url,_112,true);
ColdFusion.Window.createJSObj(_111,_112.url,_113);
ColdFusion.Window.hide(_111);
_112=ColdFusion.objectCache[_111];
}
return _112;
};
