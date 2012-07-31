/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Layout){
ColdFusion.Layout={};
}
var ACCORDION_TITLE_ICON_CSS_TEMPLATE=".{0} { background-image:url({1}); }";
ColdFusion.Layout.initializeTabLayout=function(id,_2,_3,_4,_5){
Ext.QuickTips.init();
var _6;
if(_3){
_6={renderTo:id,height:_3};
}else{
_6={renderTo:id,autoHeight:true};
}
if(_4&&_4!="undefined"){
_6.width=_4;
}else{
_6.autoWidth=true;
}
if(_2){
_6.tabPosition="bottom";
}else{
_6.enableTabScroll=true;
}
_6.plain=!_5;
var _7=new Ext.TabPanel(_6);
ColdFusion.objectCache[id]=_7;
return _7;
};
ColdFusion.Layout.getTabLayout=function(_8){
var _9=ColdFusion.objectCache[_8];
if(!_9||!(_9 instanceof Ext.TabPanel)){
ColdFusion.handleError(null,"layout.gettablayout.notfound","widget",[_8],null,null,true);
}
return _9;
};
ColdFusion.Layout.onTabActivate=function(_a){
_a._cf_visible=true;
if(_a._cf_dirtyview){
var _b=ColdFusion.bindHandlerCache[_a.contentEl];
if(_b){
_b();
}
_a._cf_dirtyview=false;
}
var el=Ext.get(_a.contentEl);
el.move("left",1);
el.move("right",1);
};
ColdFusion.Layout.onTabDeactivate=function(_d){
_d._cf_visible=false;
if(_d._cf_refreshOnActivate){
_d._cf_dirtyview=true;
}
};
ColdFusion.Layout.onTabClose=function(_e){
_e._cf_visible=false;
};
ColdFusion.Layout.addTab=function(_f,_10,_11,_12,_13,_14,_15,_16,_17){
if(_13!=null&&_13.length==0){
_13=null;
}
var _18=_f.initialConfig.autoHeight;
if(typeof _18=="undefined"){
_18=false;
}
var _19=new Ext.Panel({title:_12,contentEl:_10,_cf_body:_10,id:_11,closable:_14,tabTip:_13,autoScroll:_17,autoShow:true,autoHeight:_18});
var tab=_f.add(_19);
if(_16){
_19.setDisabled(true);
}
tab._cf_visible=false;
tab._cf_dirtyview=true;
tab._cf_refreshOnActivate=_15;
tab.addListener("activate",ColdFusion.Layout.onTabActivate);
tab.addListener("deactivate",ColdFusion.Layout.onTabDeactivate);
tab.addListener("close",ColdFusion.Layout.onTabClose);
ColdFusion.objectCache[_11]=tab;
var _1b=tab.height;
if(_1b&&_1b>1){
var _1c=document.getElementById(_10);
_1c.style.height=_1b;
}
};
ColdFusion.Layout.enableTab=function(_1d,_1e){
var _1f=ColdFusion.objectCache[_1d];
var _20=ColdFusion.objectCache[_1e];
if(_1f&&(_1f instanceof Ext.TabPanel)&&_20){
_20.setDisabled(false);
ColdFusion.Log.info("layout.enabletab.enabled","widget",[_1e,_1d]);
}else{
ColdFusion.handleError(null,"layout.enabletab.notfound","widget",[_1d],null,null,true);
}
};
ColdFusion.Layout.disableTab=function(_21,_22){
var _23=ColdFusion.objectCache[_21];
var _24=ColdFusion.objectCache[_22];
if(_23&&(_23 instanceof Ext.TabPanel)&&_24){
_24.setDisabled(true);
ColdFusion.Log.info("layout.disabletab.disabled","widget",[_22,_21]);
}else{
ColdFusion.handleError(null,"layout.disabletab.notfound","widget",[_21],null,null,true);
}
};
ColdFusion.Layout.selectTab=function(_25,_26){
var _27=ColdFusion.objectCache[_25];
var tab=ColdFusion.objectCache[_26];
if(_27&&(_27 instanceof Ext.TabPanel)&&tab){
_27.setActiveTab(tab);
ColdFusion.Log.info("layout.selecttab.selected","widget",[_26,_25]);
}else{
ColdFusion.handleError(null,"layout.selecttab.notfound","widget",[_25],null,null,true);
}
};
ColdFusion.Layout.hideTab=function(_29,_2a){
var _2b=ColdFusion.objectCache[_29];
if(_2b&&(_2b instanceof Ext.TabPanel)){
var _2c=ColdFusion.objectCache[_2a];
var _2d=false;
if(_2c){
if(_2b.getActiveTab()&&_2b.getActiveTab().getId()==_2a){
var i;
for(i=0;i<_2b.items.length;i++){
var _2f=_2b.getComponent(i);
if(_2f.hidden==false){
_2d=true;
_2f.show();
break;
}
}
if(_2d==false){
document.getElementById(_2a).style.display="none";
}
}
_2b.hideTabStripItem(_2c);
ColdFusion.Log.info("layout.hidetab.hide","widget",[_2a,_29]);
}
}else{
ColdFusion.handleError(null,"layout.hidetab.notfound","widget",[_29],null,null,true);
}
};
ColdFusion.Layout.showTab=function(_30,_31){
var _32=ColdFusion.objectCache[_30];
var _33=ColdFusion.objectCache[_31];
if(_32&&(_32 instanceof Ext.TabPanel)&&_33){
_32.unhideTabStripItem(_33);
ColdFusion.Log.info("layout.showtab.show","widget",[_31,_30]);
}else{
ColdFusion.handleError(null,"layout.showtab.notfound","widget",[_30],null,null,true);
}
};
ColdFusion.Layout.disableSourceBind=function(_34){
var _35=ColdFusion.objectCache[_34];
if(_35==null||_35=="undefined"){
ColdFusion.handleError(null,"layout.disableSourceBind.notfound","widget",[_34],null,null,true);
}
_35._cf_dirtyview=false;
};
ColdFusion.Layout.enableSourceBind=function(_36){
var _37=ColdFusion.objectCache[_36];
if(_37==null||_37=="undefined"){
ColdFusion.handleError(null,"layout.enableSourceBind.notfound","widget",[_36],null,null,true);
}
_37._cf_dirtyview=true;
};
ColdFusion.Layout.createTab=function(_38,_39,_3a,_3b,_3c){
var _3d=ColdFusion.objectCache[_38];
var _3e=_39;
if(_38&&typeof (_38)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidname","widget",null,null,null,true);
return;
}
if(!_38||ColdFusion.trim(_38)==""){
ColdFusion.handleError(null,"layout.createtab.emptyname","widget",null,null,null,true);
return;
}
if(_39&&typeof (_39)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidareaname","widget",null,null,null,true);
return;
}
if(!_39||ColdFusion.trim(_39)==""){
ColdFusion.handleError(null,"layout.createtab.emptyareaname","widget",null,null,null,true);
return;
}
if(_3a&&typeof (_3a)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidtitle","widget",null,null,null,true);
return;
}
if(!_3a||ColdFusion.trim(_3a)==""){
ColdFusion.handleError(null,"layout.createtab.emptytitle","widget",null,null,null,true);
return;
}
if(_3b&&typeof (_3b)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidurl","widget",null,null,null,true);
return;
}
if(!_3b||ColdFusion.trim(_3b)==""){
ColdFusion.handleError(null,"layout.createtab.emptyurl","widget",null,null,null,true);
return;
}
_39="cf_layoutarea"+_39;
if(_3d&&(_3d instanceof Ext.TabPanel)){
var _3f=null;
var ele=document.getElementById(_39);
if(ele!=null){
ColdFusion.handleError(null,"layout.createtab.duplicateel","widget",[_39],null,null,true);
return;
}
var _41=false;
var _42=false;
var _43=false;
var _44=false;
var _45=false;
var _46=null;
if((_3d.items.length<=0)){
_43=true;
}
if(_3c!=null){
if(typeof (_3c)!="object"){
ColdFusion.handleError(null,"layout.createtab.invalidconfig","widget",null,null,null,true);
return;
}
if(typeof (_3c.closable)!="undefined"&&_3c.closable==true){
_41=true;
}
if(typeof (_3c.disabled)!="undefined"&&_3c.disabled==true){
_42=true;
}
if(typeof (_3c.selected)!="undefined"&&_3c.selected==true){
_43=true;
}
if(typeof (_3c.inithide)!="undefined"&&_3c.inithide==true){
_44=true;
}
if(typeof (_3c.tabtip)!="undefined"&&_3c.tabtip!=null){
_46=_3c.tabtip;
}
}
var _47=document.getElementById(_38);
if(_47){
var _48=document.getElementById(_38);
var _49=document.createElement("div");
_49.id=_39;
_49.className="ytab";
if(_3c!=null&&typeof (_3c.align)!="undefined"){
_49.align=_3c.align;
}
var _4a="";
if(_3d.tabheight){
_4a="height:"+_3d.tabheight+";";
}
if(_3c!=null&&typeof (_3c.style)!="undefined"){
var _4b=new String(_3c.style);
_4b=_4b.toLowerCase();
_4a=_4a+_4b;
}
if(_3c!=null&&typeof (_3c.overflow)!="undefined"){
var _4c=new String(_3c.overflow);
_4c=_4c.toLowerCase();
if(_4c!="visible"&&_4c!="auto"&&_4c!="scroll"&&_4c!="hidden"){
ColdFusion.handleError(null,"layout.createtab.invalidoverflow","widget",null,null,null,true);
return;
}
if(_4c.toLocaleLowerCase()==="hidden"){
_45=false;
}
_4a=_4a+"overflow:"+_4c+";";
}else{
_4a=_4a+"; overflow:auto;";
}
_49.style.cssText=_4a;
_48.appendChild(_49);
}
ColdFusion.Layout.addTab(_3d,_39,_3e,_3a,_46,_41,false,_42,_45);
ColdFusion.Log.info("layout.createtab.success","http",[_39,_38]);
if(_43==true){
ColdFusion.Layout.selectTab(_38,_3e);
}
if(_44==true){
ColdFusion.Layout.hideTab(_38,_3e);
}
if(_3b!=null&&typeof (_3b)!="undefined"&&_3b!=""){
if(_3b.indexOf("?")!=-1){
_3b=_3b+"&";
}else{
_3b=_3b+"?";
}
var _4d;
var _4e;
if(_3c){
_4d=_3c.callbackHandler;
_4e=_3c.errorHandler;
}
ColdFusion.Ajax.replaceHTML(_39,_3b,"GET",null,_4d,_4e);
}
}else{
ColdFusion.handleError(null,"layout.createtab.notfound","widget",[_38],null,null,true);
}
};
ColdFusion.Layout.getBorderLayout=function(_4f){
var _50=ColdFusion.objectCache[_4f];
if(!_50){
ColdFusion.handleError(null,"layout.getborderlayout.notfound","widget",[_4f],null,null,true);
}
return _50;
};
ColdFusion.Layout.showArea=function(_51,_52){
var _53=ColdFusion.Layout.convertPositionToDirection(_52);
var _54=ColdFusion.objectCache[_51];
var _55;
if(_54){
var _56=_54.items;
for(var i=0;i<_56.getCount();i++){
var _58=_56.itemAt(i);
if(_58 instanceof Ext.Panel&&_58.region==_53){
_55=_58;
break;
}
}
if(_55){
_55.show();
_55.expand();
ColdFusion.Log.info("layout.showarea.shown","widget",[_52,_51]);
}else{
ColdFusion.handleError(null,"layout.showarea.areanotfound","widget",[_52],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.showarea.notfound","widget",[_51],null,null,true);
}
};
ColdFusion.Layout.hideArea=function(_59,_5a){
var _5b=ColdFusion.Layout.convertPositionToDirection(_5a);
var _5c=ColdFusion.objectCache[_59];
var _5d;
if(_5c){
var _5e=_5c.items;
for(var i=0;i<_5e.getCount();i++){
var _60=_5e.itemAt(i);
if(_60 instanceof Ext.Panel&&_60.region==_5b){
_5d=_60;
break;
}
}
if(_5d){
_5d.hide();
ColdFusion.Log.info("layout.hidearea.hidden","widget",[_5a,_59]);
}else{
ColdFusion.handleError(null,"layout.hidearea.areanotfound","widget",[_5a],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.hidearea.notfound","widget",[_59],null,null,true);
}
};
ColdFusion.Layout.collapseArea=function(_61,_62){
var _63=ColdFusion.Layout.convertPositionToDirection(_62);
var _64=ColdFusion.objectCache[_61];
var _65;
if(_64){
var _66=_64.items;
for(var i=0;i<_66.getCount();i++){
var _68=_66.itemAt(i);
if(_68 instanceof Ext.Panel&&_68.region==_63){
_65=_68;
break;
}
}
if(_65){
_65.collapse(true);
ColdFusion.Log.info("layout.collpasearea.collapsed","widget",[_62,_61]);
}else{
ColdFusion.handleError(null,"layout.collpasearea.areanotfound","widget",[_62],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.collpasearea.notfound","widget",[_62],null,null,true);
}
};
ColdFusion.Layout.expandArea=function(_69,_6a){
var _6b=ColdFusion.Layout.convertPositionToDirection(_6a);
var _6c=ColdFusion.objectCache[_69];
var _6d;
if(_6c){
var _6e=_6c.items;
for(var i=0;i<_6e.getCount();i++){
var _70=_6e.itemAt(i);
if(_70 instanceof Ext.Panel&&_70.region==_6b){
_6d=_70;
break;
}
}
if(_6d){
_6d.expand();
ColdFusion.Log.info("layout.expandarea.expanded","widget",[_6a,_69]);
}else{
ColdFusion.handleError(null,"layout.expandarea.areanotfound","widget",[_6a],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.expandarea.notfound","widget",[_6a],null,null,true);
}
};
ColdFusion.Layout.printObject=function(obj){
var str="";
for(key in obj){
str=str+"  "+key+"=";
value=obj[key];
if(typeof (value)==Object){
value=$G.printObject(value);
}
str+=value;
}
return str;
};
ColdFusion.Layout.InitAccordion=function(_73,_74,_75,_76,_77,_78,_79,_7a){
var _7b=false;
if(_75.toUpperCase()=="LEFT"){
_7b=true;
}
if(_78==null||typeof (_78)=="undefined"){
_77=false;
}
var _7c={activeOnTop:_74,collapseFirst:_7b,titleCollapse:_76,fill:_77};
var _7d={renderTo:_73,layoutConfig:_7c,items:_7a,layout:"accordion"};
if(_78==null||typeof (_78)=="undefined"){
_7d.autoHeight=true;
}else{
_7d.height=_78;
}
if(_79==null||typeof (_79)=="undefined"){
_7d.autoWidth=true;
}else{
_7d.width=_79;
}
var _7e=new Ext.Panel(_7d);
ColdFusion.objectCache[_73]=_7e;
ColdFusion.Log.info("layout.accordion.initialized","widget",[_73]);
return _7e;
};
ColdFusion.Layout.InitAccordionChildPanel=function(_7f,_80,_81,_82,_83,_84,_85,_86){
if(_81==null||typeof (_81)==undefined||_81.length==0){
_81="  ";
}
var _87={contentEl:_7f,id:_80,title:_81,collapsible:_82,closable:_83,animate:true,autoScroll:_84,_cf_body:_7f};
if(_85&&typeof _85=="string"){
_87.iconCls=_85;
}
var _88=new Ext.Panel(_87);
_88._cf_visible=false;
_88._cf_dirtyview=true;
_88._cf_refreshOnActivate=_86;
_88.on("expand",ColdFusion.Layout.onAccordionPanelExpand,this);
_88.on("collapse",ColdFusion.Layout.onAccordionPanelCollapse,this);
_88.on("hide",ColdFusion.Layout.onAccordionPanelHide,this);
_88.on("show",ColdFusion.Layout.onAccordionPanelExpand,this);
ColdFusion.objectCache[_80]=_88;
ColdFusion.Log.info("layout.accordion.childinitialized","widget",[_80]);
return _88;
};
ColdFusion.Layout.getAccordionLayout=function(_89){
var _8a=ColdFusion.objectCache[_89];
if(!_8a||!(_8a instanceof Ext.Panel)){
ColdFusion.handleError(null,"layout.getaccordionlayout.notfound","widget",[_89],null,null,true);
}
return _8a;
};
ColdFusion.Layout.onAccordionPanelExpand=function(_8b){
_8b._cf_visible=true;
if(_8b._cf_dirtyview){
var _8c=ColdFusion.bindHandlerCache[_8b.contentEl];
if(_8c){
_8c();
}
_8b._cf_dirtyview=false;
}
var el=Ext.get(_8b.contentEl);
el.move("left",1);
el.move("right",1);
};
ColdFusion.Layout.onAccordionPanelCollapse=function(_8e){
_8e._cf_visible=false;
if(_8e._cf_refreshOnActivate){
_8e._cf_dirtyview=true;
}
};
ColdFusion.Layout.onAccordionPanelHide=function(_8f){
_8f._cf_visible=false;
};
ColdFusion.Layout.hideAccordion=function(_90,_91){
var _92=ColdFusion.objectCache[_90];
var _93=ColdFusion.objectCache[_91];
if(!_92||!_92 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.hideaccordion.layoutnotfound","widget",[_90],null,null,true);
}
if(!_93||!_93 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.hideaccordion.panelnotfound","widget",[_91],null,null,true);
}
_93.hide();
ColdFusion.Log.info("layout.hideaccordion.hidden","widget",[_91,_90]);
};
ColdFusion.Layout.showAccordion=function(_94,_95){
var _96=ColdFusion.objectCache[_94];
var _97=ColdFusion.objectCache[_95];
if(!_96||!_96 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.showaccordion.layoutnotfound","widget",[_94],null,null,true);
}
if(!_97||!_97 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.showaccordion.panelnotfound","widget",[_95],null,null,true);
}
_97.show();
ColdFusion.Log.info("layout.showaccordion.shown","widget",[_95,_94]);
};
ColdFusion.Layout.expandAccordion=function(_98,_99){
var _9a=ColdFusion.objectCache[_98];
var _9b=ColdFusion.objectCache[_99];
if(!_9a||!_9a instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.expandaccordion.layoutnotfound","widget",[_98],null,null,true);
}
if(!_9b||!_9b instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.expandaccordion.panelnotfound","widget",[_99],null,null,true);
}
_9b.expand();
ColdFusion.Log.info("layout.expandaccordion.expanded","widget",[_99,_98]);
};
ColdFusion.Layout.selectAccordion=function(_9c,_9d){
return ColdFusion.Layout.expandAccordion(_9c,_9d);
};
ColdFusion.Layout.collapseAccordion=function(_9e,_9f){
var _a0=ColdFusion.objectCache[_9e];
var _a1=ColdFusion.objectCache[_9f];
if(!_a0||!_a0 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.collapseaccordion.layoutnotfound","widget",[_9e],null,null,true);
}
if(!_a1||!_a1 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.collapseaccordion.panelnotfound","widget",[_9f],null,null,true);
}
_a1.collapse();
ColdFusion.Log.info("layout.collapseaccordion.collapsed","widget",[_9f,_9e]);
};
ColdFusion.Layout.createAccordionPanel=function(_a2,_a3,_a4,url,_a6){
var _a7=ColdFusion.objectCache[_a2];
var _a8=_a3;
if(_a2&&typeof (_a2)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidname","widget",[_a2],null,null,true);
return;
}
if(!_a2||ColdFusion.trim(_a2)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.emptyname","widget",[_a2],null,null,true);
return;
}
if(_a3&&typeof (_a3)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidaccordionpanelname","widget",[_a3],null,null,true);
return;
}
if(!_a3||ColdFusion.trim(_a3)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.emptyaccordionpanelname","widget",[_a3],null,null,true);
return;
}
if(_a4&&typeof (_a4)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidtitle","widget",[_a3],null,null,true);
return;
}
if(!_a4||ColdFusion.trim(_a4)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidtitle","widget",[_a3],null,null,true);
return;
}
if(url&&typeof (url)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidurl","widget",[_a3],null,null,true);
return;
}
if(!url||ColdFusion.trim(url)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidurl","widget",[_a3],null,null,true);
return;
}
_a3="cf_layoutarea"+_a8;
if(_a7&&(_a7 instanceof Ext.Panel)){
var _a9=null;
var ele=document.getElementById(_a3);
if(ele!=null){
ColdFusion.handleError(null,"layout.createaccordionpanel.duplicateel","widget",[_a3],null,null,true);
return;
}
var _ab=true;
var _ac;
var _ad=false;
var _ae=null;
if(_a6!=null){
if(typeof (_a6)!="object"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidconfig","widget",[_a3],null,null,true);
return;
}
}
if(_a6&&typeof (_a6.selected)!="undefined"&&_a6.selected==true){
_ad=true;
}
if(_a6&&_a6.titleicon){
if(typeof _a6.titleicon!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidtitleicon","widget",[_a3],null,null,true);
return;
}
var _af=String.format(ACCORDION_TITLE_ICON_CSS_TEMPLATE,_a3,_a6.titleicon);
Ext.util.CSS.createStyleSheet(_af,_a3+"_cf_icon");
_ae=_a3;
}
var _b0=_a7.layoutConfig;
var _b1=true;
if(_b0&&typeof _b0.fill!="undefined"){
_b1=_b0.fill;
}
if(_a6!=null&&typeof (_a6.overflow)!="undefined"){
var _ac=new String(_a6.overflow);
_ac=_ac.toLowerCase();
if(_ac!="visible"&&_ac!="auto"&&_ac!="scroll"&&_ac!="hidden"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidoverflow","widget",[_a3],null,null,true);
return;
}
if(!_b1&&(_ac=="auto"||_ac=="scroll")){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidoverflowforfillheight","widget",[_a3],null,null,true);
return;
}
if(_ac=="hidden"){
_ab=false;
}
}else{
_ac="auto";
_ab=true;
}
var _b2=document.getElementById(_a2);
if(_b2){
var _b3=document.getElementById(_a2);
var _b4=document.createElement("div");
_b4.id=_a3;
if(_a6!=null&&typeof (_a6.align)!="undefined"){
_b4.align=_a6.align;
}
var _b5="";
if(_a7.height){
_b5="height:"+_a7.height+";";
}
if(_a6!=null&&typeof (_a6.style)!="undefined"){
var _b6=new String(_a6.style);
_b6=_b6.toLowerCase();
_b5=_b5+_b6;
}
_b5=_b5+"overflow:"+_ac+";";
_b4.style.cssText=_b5;
_b3.appendChild(_b4);
}
var _b7=true;
var _b8=true;
itemobj=ColdFusion.Layout.InitAccordionChildPanel(_a3,_a8,_a4,_b8,_b7,_ab,_ae,false);
_a7.add(itemobj);
if(url!=null&&typeof (url)!="undefined"&&url!=""){
if(url.indexOf("?")!=-1){
url=url+"&";
}else{
url=url+"?";
}
var _b9;
var _ba;
if(_a6){
_b9=_a6.callbackHandler;
_ba=_a6.errorHandler;
}
ColdFusion.Ajax.replaceHTML(_a3,url,"GET",null,_b9,_ba);
}
_a7.doLayout();
if(_ad){
ColdFusion.Layout.expandAccordion(_a2,_a8);
}
ColdFusion.Log.info("layout.createaccordionpanel.created","widget",[_a3]);
}else{
ColdFusion.handleError(null,"layout.createaccordionpanel.layoutnotfound","widget",[_a2],null,null,true);
}
};
ColdFusion.Layout.initViewport=function(_bb,_bc){
var _bd=new Array();
_bd[0]=_bc;
var _be={items:_bd,layout:"fit",name:_bb};
var _bf=new Ext.Viewport(_be);
return _bf;
};
ColdFusion.Layout.convertPositionToDirection=function(_c0){
if(_c0.toUpperCase()=="LEFT"){
return "west";
}else{
if(_c0.toUpperCase()=="RIGHT"){
return "east";
}else{
if(_c0.toUpperCase()=="CENTER"){
return "center";
}else{
if(_c0.toUpperCase()=="BOTTOM"){
return "south";
}else{
if(_c0.toUpperCase()=="TOP"){
return "north";
}
}
}
}
}
};
