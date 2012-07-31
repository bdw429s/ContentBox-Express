/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Map){
ColdFusion.Map={};
}
var coldFusion_markerObjCache=new Array();
var $MAP=ColdFusion.Map;
$MAP.statusCodeObject={code200:"A directions request could not be successfully parsed. For example, the request may have been rejected if it contained more than the maximum number of waypoints allowed.",code400:"A directions request could not be successfully parsed. For example, the request may have been rejected if it contained more than the maximum number of waypoints allowed.",code500:"A geocoding or directions request could not be successfully processed, yet the exact reason for the failure is not known",code601:"The HTTP query parameter was either missing or had no value. For geocoding requests, this means that an empty address was specified as input. For directions requests, this means that no query was specified in the input",code602:"No corresponding geographic location could be found for the specified address. This may be due to the fact that the address is relatively new, or it may be incorrect",code603:"The geocode for the given address or the route for the given directions query cannot be returned due to legal or contractual reasons",code604:"The GDirections object could not compute directions between the points mentioned in the query. This is usually because there is no route available between the two points, or because we do not have data for routing in that region",code610:"The given key is either invalid or does not match the domain for which it was given",code620:"The given key has gone over the requests limit in the 24 hour period or has submitted too many requests in too short a period of time. If you are sending multiple requests in parallel or in a tight loop, use a timer or pause in your code to make sure you do not send the requests too quickly"};
ColdFusion.Map.init=function(_2df,_2e0,_2e1,type,_2e3,_2e4,_2e5,_2e6,_2e7,_2e8,_2e9,_2ea,_2eb,_2ec,_2ed,_2ee,_2ef,_2f0,_2f1,_2f2,_2f3,_2f4,_2f5,_2f6,_2f7,_2f8,_2f9,_2fa,_2fb,_2fc){
var _2fd={divName:_2df,type:type,layout:"fit",renderTo:_2df,centerAddress:_2f1,centerLatitude:_2f2,centerLongitude:_2f3,markerItems:_2f7,onLoad:_2f8,onError:_2f9,showCenterMarker:_2ec,showAllMarker:_2ed,markerColor:_2f5,markerIcon:_2f6,markerBindListener:_2fb,initShow:_2e6};
if(_2e1!=null&&typeof (_2e1)!="undefined"){
_2fd.width=_2e1;
}else{
_2fd.width=400;
}
if(_2e0!=null&&typeof (_2e0)!="undefined"){
_2fd.height=_2e0;
}else{
_2fd.height=400;
}
if(_2e3!=null&&typeof (_2e3)!="undefined"){
_2fd.zoomLevel=_2e3;
}else{
_2fd.zoomLevel=3;
}
_2fd.hideBorders=_2e5;
if(!_2e5){
if(_2e4==null||typeof _2e4==="undefined"||_2e4.length==0){
_2e4=" ";
}
_2fd.title=_2e4;
_2fd.collapsible=_2e7;
}
if(_2f5==null&&_2f6==null){
_2fd.markerColor="#00FF00";
}
var _2fe=new Ext.Panel(_2fd);
ColdFusion.objectCache[_2df]=_2fd;
_2fd.mapPanel=_2fe;
var _2ff=["enableDragging"];
if(_2e8){
_2ff.push("enableScrollWheelZoom");
}else{
_2ff.push("disableScrollWheelZoom");
}
if(_2e9){
_2ff.push("enableDoubleClickZoom");
}else{
_2ff.push("disableDoubleClickZoom");
}
if(_2ea){
_2ff.push("enableContinuousZoom");
}else{
_2ff.push("disableContinuousZoom");
}
var _300=$MAP.parseControlProperties(_2eb,_2ee,_2ef,_2f0);
var _301=[];
for(i=0;i<_2fd.markerItems.length;i++){
var _302=$MAP.parseMarker(_2fd.markerItems[i],_2df);
_301.push(_302);
}
if(_2f4==null||typeof _2f4==="undefined"){
_2f4="";
}
var _303={marker:{title:_2f4}};
if(_2fd.markerColor!=null&&typeof _2fd.markerColor!="undefined"){
_303.marker.markercolor=_2fd.markerColor;
}else{
if(_2fd.markerIcon!=null&&typeof _2fd.markerIcon!="undefined"){
_303.marker.markericon=_2fd.markerIcon;
}
}
if(_2fa===true){
_303.listeners={click:$MAP.markerOnClickHandler};
if(_2fc!=null){
_303.marker.markerwindowcontent=_2fc;
}else{
_303.marker.bindcallback=_2fb;
}
_303.marker.name=_2df;
}
if(_2fd.centerAddress!=null&&typeof _2fd.centerAddress==="string"){
_303.geoCodeAddr=_2fd.centerAddress;
_303.marker.address=_2fd.centerAddress;
}else{
_303.lat=_2fd.centerLatitude;
_303.lng=_2fd.centerLongitude;
_303.marker.address=_2fd.centerAddress;
}
var _304=false;
if(_2ef!=null&&typeof _2ef=="string"&&_2ef.toUpperCase()=="ADVANCED"){
_304=true;
}
var _305=new Ext.ux.GMapPanel({xtype:"gmappanel",region:"center",zoomLevel:_2fd.zoomLevel,gmapType:_2fd.type,mapConfOpts:_2ff,mapControls:_300,setCenter:_303,markers:_301,border:!_2fd.hideBorders,onLoadhandler:$MAP.onLoadCompleteHandler,onErrorhandler:$MAP.onErrorHandler,name:_2fd.divName,noCenterMarker:!_2ec,showAllMarker:_2ed,advanceMapTypeControl:_304});
_2fe.add(_305);
_2fd.mapPanelObject=_305;
if(_2e6===false){
_2fe.hide();
}else{
_2fe.doLayout();
}
ColdFusion.Log.info("map.initialized","widget",[_2df]);
return _2fe;
};
$MAP.addMarker=function(name,_307){
var _308=$MAP.getMapPanelObject(name);
var _309=$MAP.parseMarker(_307,name);
var _30a=[];
_30a.push(_309);
_308.addMarkers(_30a);
ColdFusion.Log.info("map.addmarker.markeradded","widget",[name,_30a.length]);
};
$MAP.setCenter=function(name,_30c){
var _30d=$MAP.getMapPanelObject(name);
var lat;
var lng;
if(_30c.latitude&&_30c.longitude){
if(typeof _30c.latitude!="number"||typeof _30c.longitude!="number"){
ColdFusion.handleError(null,"map.setcenter.latlngnonnumeric","widget",[name,_30c.latitude,_30c.longitude],null,null,true);
}else{
lat=_30c.latitude;
lng=_30c.longitude;
}
var _310=new GLatLng(lat,lng);
_30d.getMap().setCenter(_310,_30d.zoomLevel,_30d.parsedMapType);
}else{
if(_30c.address){
if(typeof _30c.address!="string"){
ColdFusion.handleError(null,"map.setcenter.addressnotstring","widget",[name,_30c.address],null,null,true);
}else{
_30d.geoCodeLookup(_30c.address);
}
}else{
ColdFusion.handleError(null,"map.setcenter.invalidcenter","widget",[name],null,null,true);
}
}
ColdFusion.Log.info("map.setcenter.centerset","widget",[name]);
};
$MAP.getLatitudeLongitude=function(_311,_312){
geocoder=new GClientGeocoder();
if(_312==null||!typeof _312==="function"){
_312=$MAP.LatitudeLongitudeHanlder;
}
geocoder.getLatLng(_311,_312);
};
$MAP.addEvent=function(name,_314,_315,_316){
var _317=$MAP.getMapPanelObject(name);
_317.addEventToMap(_314,_315,_316);
};
$MAP.setZoomLevel=function(name,_319){
var _31a=$MAP.getMapPanelObject(name);
_31a.zoomLevel=_319;
_31a.getMap().setZoom(_319);
};
$MAP.getMapObject=function(name){
var _31c=$MAP.getMapPanelObject(name);
if(_31c!=null){
return _31c.getMap();
}
};
$MAP.parseMarker=function(_31d,_31e){
var _31f={};
if(_31d.latitude&&_31d.longitude){
if(typeof _31d.latitude!="number"||typeof _31d.longitude!="number"){
ColdFusion.handleError(null,"map.marker.latlngnonnumeric","widget",[_31d.latitude,_31d.longitude],null,null,true);
}else{
_31f.lat=_31d.latitude;
_31f.lng=_31d.longitude;
}
}else{
if(_31d.address!=null){
if(typeof _31d.address!="string"){
ColdFusion.handleError(null,"map.marker.addressnotstring","widget",[_31d.address],null,null,true);
}else{
_31f.address=_31d.address;
}
}
}
var _320={};
if(_31d.tip==null){
_320.title="";
}else{
_320.title=_31d.tip;
}
if(_31d.markercolor!=null&&typeof _31d.markercolor!="undefined"){
_320.markercolor=_31d.markercolor;
}else{
if(_31d.markericon!=null&&typeof _31d.markericon!="undefined"){
_320.markericon=_31d.markericon;
}
}
if(_31d.showmarkerwindow===true||_31d.markerwindowcontent!=null){
var _321=ColdFusion.objectCache[_31e];
var _322;
if(_321!=null||typeof (_321)!="undefined"){
_322=_321.markerBindListener;
}
if(_322!=null||_31d.markerwindowcontent!=null){
_31f.listeners={click:$MAP.markerOnClickHandler};
if(_31d.markerwindowcontent!=null){
_320.markerwindowcontent=_31d.markerwindowcontent;
}else{
_320.bindcallback=_322;
}
_320.name=_31d.name;
}
}
_31f.marker=_320;
return _31f;
};
$MAP.parseControlProperties=function(_323,_324,_325,_326){
var _327=["NonExistantControl"];
if(_323){
_327.push("GScaleControl");
}
if(_325&&_325.toUpperCase()=="BASIC"){
_327.push("GMapTypeControl");
}else{
if(_325&&_325.toUpperCase()=="ADVANCED"){
_327.push("GMenuMapTypeControl");
}
}
if(_324){
_327.push("GOverviewMapControl");
}
if(_326!=null&&_326!="undefined"){
_326=_326.toUpperCase();
switch(_326){
case "SMALL":
_327.push("GSmallMapControl");
break;
case "SMALL3D":
_327.push("GSmallZoomControl3D");
break;
case "LARGE":
_327.push("GLargeMapControl");
break;
case "LARGE3D":
_327.push("GLargeMapControl3D");
break;
}
}
return _327;
};
$MAP.onErrorHandler=function(name,_329){
var _32a=ColdFusion.objectCache[name];
var _32b=$MAP.statusCodeObject;
var _32c=$MAP.retrieveStatueMessage(_329);
var _32d=_32a.onError;
if(_32d!=null&&typeof _32d==="function"){
_32d.call(null,_329,_32c);
}else{
alert("Error: "+_32c);
}
ColdFusion.handleError(null,"map.loadMap.error","map",[name,_329,_32c],null,null,true);
};
$MAP.onLoadCompleteHandler=function(name){
var _32f=ColdFusion.objectCache[name];
var _330=_32f.onLoad;
if(_330!=null&&typeof _330==="function"){
_330.call();
}
};
$MAP.retrieveStatueMessage=function(code){
var _332;
switch(code){
case 200:
_332=$MAP.statusCodeObject.code200;
break;
case 400:
_332=$MAP.statusCodeObject.code400;
break;
case 500:
_332=$MAP.statusCodeObject.code500;
break;
case 601:
_332=$MAP.statusCodeObject.code601;
break;
case 602:
_332=$MAP.statusCodeObject.code602;
break;
case 603:
_332=$MAP.statusCodeObject.code603;
break;
case 604:
_332=$MAP.statusCodeObject.code604;
break;
case 610:
_332=$MAP.statusCodeObject.code610;
break;
case 620:
_332=$MAP.statusCodeObject.code620;
break;
}
return _332;
};
$MAP.markerOnClickHandler=function(_333){
coldFusion_markerObjCache[this.name]=this.marker;
if(this.bindcallback!=null&&typeof this.bindcallback=="function"){
var _334=this.address;
if(_334==null||typeof _334=="undefined"){
_334="";
}
this.bindcallback.call(null,this.name,_333.lat(),_333.lng(),_334);
}else{
if(this.statictext!=null&&typeof this.statictext!="undefined"){
this.marker.openInfoWindowHtml(this.statictext);
}
}
};
ColdFusion.Map.loadMarkerWindowInfo=function(data,_336){
var _337=coldFusion_markerObjCache[_336._cf_marker_name];
_337.openInfoWindowHtml(data+"");
};
ColdFusion.Map.bindOnErrorHandler=function(data,_339){
ColdFusion.handleError(null,"map.markerbind.binderror","widget",[data],null,null,true);
};
$MAP.getMapPanelObject=function(name){
var _33b=ColdFusion.objectCache[name];
if(_33b==null||typeof (_33b)=="undefined"){
ColdFusion.handleError(null,"map.getmappanelobject.notfound","widget",[name],null,null,true);
}
return _33b.mapPanelObject;
};
$MAP.refresh=function(name){
var _33d=ColdFusion.objectCache[name];
if(_33d==null||typeof (_33d)=="undefined"){
ColdFusion.handleError(null,"map.refresh.notfound","widget",[name],null,null,true);
}
_33d.mapPanel.doLayout();
};
$MAP.hide=function(name){
var _33f=ColdFusion.objectCache[name];
if(_33f==null||typeof (_33f)=="undefined"){
ColdFusion.handleError(null,"map.hide.notfound","widget",[name],null,null,true);
}
_33f.mapPanel.hide();
};
$MAP.show=function(name){
var _341=ColdFusion.objectCache[name];
if(_341==null||typeof (_341)=="undefined"){
ColdFusion.handleError(null,"map.show.notfound","widget",[name],null,null,true);
}
_341.mapPanel.show();
_341.mapPanel.doLayout();
};
