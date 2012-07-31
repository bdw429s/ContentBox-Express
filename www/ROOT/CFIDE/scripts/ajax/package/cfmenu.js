/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Menu){
ColdFusion.Menu={};
}
ColdFusion.Menu.menuItemMouseOver=function(id,_666){
var _667=document.getElementById(id);
_667.tempfontcolor=_667.firstChild.style.color;
if(_666){
_667.firstChild.style.color=_666;
}
};
ColdFusion.Menu.menuItemMouseOut=function(id){
var _669=document.getElementById(id);
if(_669.tempfontcolor){
_669.firstChild.style.color=_669.tempfontcolor;
}else{
_669.firstChild.style.color="black";
}
};
ColdFusion.Menu.initMenu=function(_66a,_66b){
return new YAHOO.widget.Menu(_66a,_66b);
};
ColdFusion.Menu.initMenuBar=function(_66c,_66d){
return new YAHOO.widget.MenuBar(_66c,_66d);
};
