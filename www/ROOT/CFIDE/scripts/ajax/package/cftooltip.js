/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Tooltip){
ColdFusion.Tooltip={};
}
ColdFusion.Tooltip.setToolTipOut=function(_183,_184){
var _185=_184.tooltip;
_185.tooltipout=true;
};
ColdFusion.Tooltip.getToolTip=function(_186,_187){
var _188=ColdFusion.objectCache[_187.context];
if(!_188){
if(_187.style){
_187.styleObj=ColdFusion.Tooltip.parseStyle(_187.style);
}
_188=new YAHOO.widget.Tooltip(_187.context+"_cf_tooltip",_187);
ColdFusion.objectCache[_187.context]=_188;
_188.doShow(_186,_187.context);
if(_187._cf_url){
var _189=function(req,_18b){
_18b.tooltip.cfg.setProperty("text",req.responseText);
if(_18b.tooltip.tooltipout==false){
_18b.tooltip.doShow(_18b.event,_18b.id);
}
};
YAHOO.util.Event.addListener(_187.context,"mouseout",ColdFusion.Tooltip.setToolTipOut,{"tooltip":_188});
_188.cfg.setProperty("text",_cf_loadingtexthtml);
_188.doShow(_186,_187.context);
try{
ColdFusion.Log.info("tooltip.gettooltip.fetch","widget",[_187.context]);
ColdFusion.Ajax.sendMessage(_187._cf_url,"GET",_187._cf_query,true,_189,{tooltip:_188,event:_186,id:_187.context});
}
catch(e){
tooltipdiv=ColdFusion.DOM.getElement(_187.context);
tooltipdiv.innerHTML="";
ColdFusion.globalErrorHandler(null,e,tooltipdiv);
}
}
}
_188.tooltipout=false;
};
ColdFusion.Tooltip.parseStyle=function(_18c){
var _18d={};
if(_18c&&typeof _18c==="string"){
var _18e=_18c.split(";");
for(var i=0;i<_18e.length;i++){
var temp=_18e[i];
tempArray=temp.split(":");
if(tempArray.length===2){
var key=tempArray[0];
key=key.toLowerCase();
var _192=tempArray[1];
switch(key){
case "width":
_18d.width=_192;
break;
case "color":
_18d.color=_192;
break;
case "background-color":
_18d[key]=_192;
break;
case "padding":
_18d.padding=_192;
break;
default:
_18d[key]=_192;
}
}
}
}
return _18d;
};
