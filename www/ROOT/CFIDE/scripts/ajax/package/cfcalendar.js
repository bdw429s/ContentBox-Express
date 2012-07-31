/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Calendar){
ColdFusion.Calendar={};
}
ColdFusion.Calendar.monthNamesShort=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
ColdFusion.Calendar.monthNamesLong=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
ColdFusion.Calendar.dayNamesShort=new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat");
ColdFusion.Calendar.dayNamesLong=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
ColdFusion.Calendar.calTableIdCounter=0;
if(navigator.userAgent.toLowerCase().indexOf("safari")>-1){
var set_month=Date.prototype.setMonth;
Date.prototype.setMonth=function(num){
if(num<=-1){
var n=Math.ceil(-num);
var _287=Math.ceil(n/12);
var _288=(n%12)?12-n%12:0;
this.setFullYear(this.getFullYear()-_287);
return set_month.call(this,_288);
}else{
return set_month.apply(this,arguments);
}
};
}
if(!String.escape){
String.escape=function(_289){
return _289.replace(/('|\\)/g,"\\$1");
};
}
ColdFusion.Calendar.setUpCalendar=function(_28a,mask,_28c,_28d,_28e,_28f,_290){
var _291=ColdFusion.DOM.getElement(_28a+_28f+"_cf_button",_28f);
var _292=ColdFusion.DOM.getElement(_28a,_28f);
var _293=null;
var _294=null;
if(_292.value!=""){
_293=_292.value;
_294=_293.split("/");
}
var _295=_28a+"_cf_calendar"+ColdFusion.Calendar.calTableIdCounter;
ColdFusion.Calendar.calTableIdCounter++;
var _296=ColdFusion.DOM.getElement(_28a+_28f+"_cf_container",_28f);
var _297=_292.offsetLeft;
ColdFusion.DOM.getElement(_28a+_28f+"_cf_container",_28f).style.left=_297;
YAHOO.widget.Calendar.IMG_ROOT=_cf_ajaxscriptsrc+"/resources/yui/";
var _298;
if(_294&&_294[0]&&_294[2]){
_298=new YAHOO.widget.Calendar(_295,_28a+_28f+"_cf_container",{close:true,pagedate:_294[0]+"/"+_294[2]});
}else{
_298=new YAHOO.widget.Calendar(_295,_28a+_28f+"_cf_container",{close:true});
}
_298.calendarinputid=_28a;
_298.calendarinput=_292;
_298.mask=mask;
_298.formname=_28f;
_298.cfg.setProperty("MONTHS_LONG",_28e);
_298.cfg.setProperty("WEEKDAYS_SHORT",_28d);
_298.cfg.setProperty("START_WEEKDAY",_28c);
ColdFusion.objectCache[_295+_28f]=_298;
_298.select(_293);
_298.render();
_298.hide();
_298.selectEvent.subscribe(ColdFusion.Calendar.handleDateSelect,_298,true);
YAHOO.util.Event.addListener(_28a+_28f+"_cf_button","click",ColdFusion.Calendar.handleCalendarLinkClick,_298,true);
if(_290!=null){
var year=_290.year;
var _29a=_290.month;
var day=_290.day;
var _29c=new Date(year,_29a.valueOf()-1,day);
_292.value=ColdFusion.Calendar.createFormattedOutput(_28a,mask,year,_29a,day,_29c);
}
};
ColdFusion.Calendar.openedCalendarInstance=null;
ColdFusion.Calendar.handleCalendarLinkClick=function(type,args){
var _29f=args;
if(ColdFusion.Calendar.openedCalendarInstance){
ColdFusion.Calendar.openedCalendarInstance.hide();
}
if(!_29f.extMask){
var _2a0=ColdFusion.Calendar.convertToExtMask(_29f.mask);
_29f.extMask=_2a0;
}
var _2a1=ColdFusion.DOM.getElement(args.calendarinputid,_29f.formname).value;
var _2a2=null;
if(typeof (_2a1)!="undefined"&&ColdFusion.trim(_2a1)!=""){
_2a2=Date.parseDate(_2a1,_29f.extMask);
}
if(_2a2!=null){
_29f.setMonth(_2a2.getMonth());
_29f.setYear(_2a2.getFullYear());
_29f.select(_2a2);
_29f.render();
}
ColdFusion.Calendar.openedCalendarInstance=_29f;
_29f.show();
};
ColdFusion.Calendar.handleDateSelect=function(type,args,_2a5){
var _2a6=args[0];
var date=_2a6[0];
var year=date[0],month=date[1],day=date[2];
var _2a9=new Date(year,month.valueOf()-1,day);
_2a5.calendarinput.value=ColdFusion.Calendar.createFormattedOutput(_2a5.calendarinputid,_2a5.mask,year,month,day,_2a9);
ColdFusion.Event.callBindHandlers(_2a5.calendarinputid,null,"change");
_2a5.hide();
};
ColdFusion.Calendar.convertToExtMask=function(mask){
mask=mask.toUpperCase();
if(mask.indexOf("DD")!=-1){
mask=mask.replace(/DD/g,"d");
}
if(mask.indexOf("D")!=-1){
mask=mask.replace(/D/g,"d");
}
if(mask.indexOf("MMMM")!=-1){
mask=mask.replace(/MMMM/g,"F");
}else{
if(mask.indexOf("MMM")!=-1){
mask=mask.replace(/MMM/g,"M");
}else{
if(mask.indexOf("MM")!=-1){
mask=mask.replace(/MM/g,"m");
}else{
if(mask.indexOf("M")!=-1){
mask=mask.replace(/M/g,"m");
}
}
}
}
if(mask.indexOf("YYYY")!=-1){
mask=mask.replace(/YYYY/g,"Y");
}
if(mask.indexOf("YY")!=-1){
mask=mask.replace(/YY/g,"y");
}
if(mask.indexOf("EEEE")!=-1){
mask=mask.replace(/EEEE/g,"l");
}
if(mask.indexOf("EEE")!=-1){
mask=mask.replace(/EEE/g,"D");
}
if(mask.indexOf("E")!=-1){
mask=mask.replace(/E/g,"w");
}
return mask;
};
ColdFusion.Calendar.createFormattedOutput=function(_2ab,mask,year,_2ae,day,date){
mask=mask.toUpperCase();
year=new String(year);
_2ae=new String(_2ae);
day=new String(day);
var _2b1=date.getDay();
if(mask.indexOf("DD")!=-1){
if(day.length==1){
day="0"+day;
}
mask=mask.replace(/DD/g,day);
}
if(mask.indexOf("D"!=-1)){
if(day.length!=-1&&day.charAt(0)=="0"){
day=day.charAt(1);
}
mask=mask.replace(/D/g,day);
}
if(mask.indexOf("MMMM")!=-1){
_2ae=ColdFusion.Calendar.monthNamesLong[_2ae.valueOf()-1];
mask=mask.replace(/MMMM/g,_2ae);
}else{
if(mask.indexOf("MMM")!=-1){
_2ae=ColdFusion.Calendar.monthNamesShort[_2ae.valueOf()-1];
mask=mask.replace(/MMM/g,_2ae);
}else{
if(mask.indexOf("MM")!=-1){
if(_2ae.length==1){
_2ae="0"+_2ae;
}
mask=mask.replace(/MM/g,_2ae);
}else{
if(mask.indexOf("M")!=-1){
if(_2ae.length!=-1&&_2ae.charAt(0)=="0"){
_2ae=_2ae.charAt(1);
}
mask=mask.replace(/M/g,_2ae);
}
}
}
}
if(mask.indexOf("YYYY")!=-1){
mask=mask.replace(/YYYY/g,year);
}
if(mask.indexOf("YY")!=-1){
year=year.substring(2);
mask=mask.replace(/YY/g,year);
}
if(mask.indexOf("EEEE")!=-1){
_2b1=ColdFusion.Calendar.dayNamesLong[_2b1.valueOf()];
mask=mask.replace(/EEEE/g,_2b1);
}
if(mask.indexOf("EEE")!=-1){
_2b1=ColdFusion.Calendar.dayNamesShort[_2b1.valueOf()];
mask=mask.replace(/EEE/g,_2b1);
}
if(mask.indexOf("E")!=-1){
_2b1=_2b1.valueOf();
_2b1=new String(_2b1);
if(_2b1.length!=-1&&_2b1.charAt(0)=="0"&&_2b1.charAt(1)){
_2b1=_2b1.charAt(1);
}
mask=mask.replace(/E/g,_2b1);
}
return mask;
};
