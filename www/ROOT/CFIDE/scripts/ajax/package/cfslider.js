/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Slider){
ColdFusion.Slider={};
}
var $SL=ColdFusion.Slider;
ColdFusion.Slider.init=function(_2b2,name,_2b4,_2b5,_2b6,_2b7,_2b8,_2b9,_2ba,_2bb,tip,_2bd,_2be){
var _2bf={renderTo:_2b2,id:name};
if(_2ba!=null&&typeof (_2ba)!="undefined"){
_2bf.ClicktoChange=_2ba;
}else{
_2bf.ClicktoChange=false;
}
if(_2bb!=null&&typeof (_2bb)!="undefined"){
_2bf.increment=_2bb;
}else{
_2bf.increment=1;
}
if(_2b8!=null&&typeof (_2b8)!=undefined){
_2bf.minValue=_2b8;
}else{
_2bf.minValue=0;
}
if(_2b7!=null&&typeof (_2b7)!=undefined){
_2bf.value=_2b7;
}else{
_2bf.value=_2bf.minValue;
}
if(_2b5!=null&&typeof (_2b5)!=undefined){
_2bf.width=_2b5;
}else{
_2bf.width=200;
}
if(_2b6!=null&&typeof (_2b6)!="undefined"){
_2bf.height=_2b6;
}else{
_2bf.height=100;
}
if(_2b9!=null&&typeof (_2b9)!=undefined){
_2bf.maxValue=_2b9;
}else{
_2bf.maxValue=100;
}
if(_2b4!=null&&typeof (_2b4)!=undefined){
_2bf.vertical=_2b4;
}else{
_2bf.vertical=false;
}
if(_2bd!=null&&typeof (_2bd)=="function"){
_2bf.onChange=_2bd;
}
if(_2be!=null&&typeof (_2be)!="undefined"){
_2bf.onDrg=_2be;
}
Ext.ux.ST=Ext.extend(Ext.Tip,{minWidth:10,offsets:[0,-10],init:function(_2c0){
_2c0.on("dragstart",this.onSlide,this);
_2c0.on("drag",this.onSlide,this);
_2c0.on("dragend",this.hide,this);
_2c0.on("destroy",this.destroy,this);
},onSlide:function(_2c1){
this.show();
this.body.update(this.getText(_2c1));
this.el.alignTo(_2c1.thumb,"b-t?",this.offsets);
this.doAutoWidth();
},getText:function(_2c2){
return _2c2.getValue()==0?"0":_2c2.getValue();
}});
if(tip!=null&&typeof (tip)!="undefined"){
if(tip){
_2bf.plugins=new Ext.ux.ST();
}
}
var _2c3=new Ext.Slider(_2bf);
_2c3.on("drag",$SL.onDragHandler,_2bf);
_2c3.on("changecomplete",$SL.onChangeHandler,_2bf);
_2bf.sliderComp=_2c3;
ColdFusion.objectCache[name]=_2bf;
ColdFusion.Log.info("slider.initialized","widget",[name]);
};
$SL.onDragHandler=function(_2c4,_2c5){
var _2c6=this.onDrg;
if(_2c6!=null&&typeof (_2c6)=="function"){
_2c6.call(this,_2c4,_2c5);
}
};
$SL.onChangeHandler=function(_2c7,_2c8){
var _2c9=this.onChange;
if(_2c9!=null&&typeof (_2c9)=="function"){
_2c9.call(this,_2c7,_2c8);
}
};
$SL.getValue=function(_2ca){
var _2cb=ColdFusion.objectCache[_2ca];
if(_2cb!=null||typeof (_2cb)!="undefined"){
var _2cc=_2cb.sliderComp;
if(_2cc){
return _2cc.getValue();
}
}else{
ColdFusion.handleError(null,"slider.getvalue.notfound","widget",[_2ca],null,null,true);
}
};
$SL.getSliderObject=function(_2cd){
var _2ce=ColdFusion.objectCache[_2cd];
if(_2ce!=null||typeof (_2ce)!="undefined"){
return _2ce.sliderComp;
}else{
return null;
}
};
$SL.setValue=function(_2cf,_2d0){
var _2d1=ColdFusion.objectCache[_2cf];
if(_2d1!=null||typeof (_2d1)!="undefined"){
var _2d2=_2d1.sliderComp;
if(_2d2){
return _2d2.setValue(_2d0,true);
}
}else{
ColdFusion.handleError(null,"slider.setvalue.notfound","widget",[_2cf],null,null,true);
}
};
$SL.show=function(_2d3){
var _2d4=ColdFusion.objectCache[_2d3];
if(_2d4!=null||typeof (_2d4)!="undefined"){
var _2d5=_2d4.sliderComp;
if(_2d5){
return _2d5.show();
}
}else{
ColdFusion.handleError(null,"slider.show.notfound","widget",[_2d3],null,null,true);
}
ColdFusion.Log.info("slider.show.shown","widget",[_2d3]);
};
$SL.hide=function(_2d6){
var _2d7=ColdFusion.objectCache[_2d6];
if(_2d7!=null||typeof (_2d7)!="undefined"){
var _2d8=_2d7.sliderComp;
if(_2d8){
return _2d8.hide();
}
}else{
ColdFusion.handleError(null,"slider.hide.notfound","widget",[_2d6],null,null,true);
}
ColdFusion.Log.info("slider.hide.hidden","widget",[_2d6]);
};
$SL.enable=function(_2d9){
var _2da=ColdFusion.objectCache[_2d9];
if(_2da!=null||typeof (_2da)!="undefined"){
var _2db=_2da.sliderComp;
if(_2db){
return _2db.enable();
}
}else{
ColdFusion.handleError(null,"slider.enable.notfound","widget",[_2d9],null,null,true);
}
ColdFusion.Log.info("slider.enable.enabled","widget",[_2d9]);
};
$SL.disable=function(_2dc){
var _2dd=ColdFusion.objectCache[_2dc];
if(_2dd!=null||typeof (_2dd)!="undefined"){
var _2de=_2dd.sliderComp;
if(_2de){
return _2de.disable();
}
}else{
ColdFusion.handleError(null,"slider.disable.notfound","widget",[_2dc],null,null,true);
}
ColdFusion.Log.info("slider.disable.disabled","widget",[_2dc]);
};
