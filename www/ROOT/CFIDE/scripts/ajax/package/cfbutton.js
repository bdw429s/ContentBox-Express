/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Button){
ColdFusion.Button={};
}
var $BT=ColdFusion.Button;
ColdFusion.Button.init=function(_268,_269,icon,tips,_26c,_26d,_26e,_26f,_270){
var _271={renderTo:_268,enableToggle:_270,text:_269,onClick:_26c,onToggle:_26d,onMouseOver:_26e,onMouseout:_26f,tooltip:tips,icon:icon};
var _272={renderTo:_268,enableToggle:_270,text:_269};
if(tips!=null&&typeof tips!="undefined"){
_272.tooltip=tips;
Ext.QuickTips.init();
}
if(icon!=null&&typeof icon!="undefined"){
_272.icon=icon;
}
if(icon&&_269){
_272.iconCls="x-btn-text-icon";
}else{
if(icon&&!_269){
_272.iconCls="x-btn-icon";
}
}
var _273=new Ext.Button(_272);
if(_26c!=null&&typeof _26c=="function"){
_273.on("click",_26c,_271);
}
if(_26d!=null&&typeof _26d=="function"){
_273.on("toggle",_26d,_271);
}
if(_26e!=null&&typeof _26e=="function"){
_273.on("mouseover",_26e,_271);
}
if(_26f!=null&&typeof _26f=="function"){
_273.on("mouseout",_26f,_271);
}
_271.buttonComp=_273;
ColdFusion.objectCache[_268]=_271;
ColdFusion.Log.info("button.initialized","widget",[_268]);
};
$BT.show=function(_274){
var _275=$BT.getButtonObject(_274);
if(_275!=null){
_275.show();
}
ColdFusion.Log.info("button.show.shown","widget",[_274]);
};
$BT.hide=function(_276){
var _277=$BT.getButtonObject(_276);
if(_277!=null){
_277.hide();
}
ColdFusion.Log.info("button.hide.hidden","widget",[_276]);
};
$BT.disable=function(_278){
var _279=$BT.getButtonObject(_278);
if(_279!=null){
_279.disable();
}
ColdFusion.Log.info("button.disable.disabled","widget",[_278]);
};
$BT.enable=function(_27a){
var _27b=$BT.getButtonObject(_27a);
if(_27b!=null){
_27b.enable();
}
ColdFusion.Log.info("button.enable.enabled","widget",[_27a]);
};
$BT.getButtonObject=function(_27c){
var _27d=$BT.getButtonConfigObj(_27c);
if(_27d!=null){
return _27d.buttonComp;
}else{
ColdFusion.handleError(null,"button.component.notFound","widget",[_27c],null,null,true);
}
};
$BT.setLabel=function(_27e,_27f){
var _280=$BT.getButtonObject(_27e);
if(_280!=null){
_280.text=_27f;
}
};
$BT.getButtonConfigObj=function(_281){
var _282=ColdFusion.objectCache[_281];
if(_282==null||typeof (_282)=="undefined"){
ColdFusion.handleError(null,"button.component.notFound","widget",[_281],null,null,true);
}
return _282;
};
$BT.toggle=function(_283){
var _284=$BT.getButtonObject(_283);
if(_284!=null){
_284.toggle();
}
};
