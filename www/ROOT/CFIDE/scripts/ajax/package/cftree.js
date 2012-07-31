/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Tree){
ColdFusion.Tree={};
}
ColdFusion.Tree.AttributesCollection=function(){
this.cache=true;
this.fontname=null;
this.bold=false;
this.italic=false;
this.completepath=false;
this.appendkey=false;
this.delimiter=null;
this.formname=null;
this.fontsize=null;
this.formparamname=null;
this.prevspanid=null;
this.prevspanbackground=null;
this.images={};
this.images.folder=_cf_ajaxscriptsrc+"/resources/cf/images/FolderClose.gif";
this.images.cd=_cf_ajaxscriptsrc+"/resources/cf/images/Cd.png";
this.images.computer=_cf_ajaxscriptsrc+"/resources/cf/images/Computer.png";
this.images.document=_cf_ajaxscriptsrc+"/resources/cf/images/Document.gif";
this.images.element=_cf_ajaxscriptsrc+"/resources/cf/images/Elements.png";
this.images.floppy=_cf_ajaxscriptsrc+"/resources/cf/images/Floppy.png";
this.images.fixed=_cf_ajaxscriptsrc+"/resources/cf/images/HardDrive.png";
this.images.remote=_cf_ajaxscriptsrc+"/resources/cf/images/NetworkDrive.png";
this.imagesopen={};
this.imagesopen.folder=_cf_ajaxscriptsrc+"/resources/cf/images/FolderOpen.gif";
this.imagesopen.cd=_cf_ajaxscriptsrc+"/resources/cf/images/Cd.png";
this.imagesopen.computer=_cf_ajaxscriptsrc+"/resources/cf/images/Computer.png";
this.imagesopen.document=_cf_ajaxscriptsrc+"/resources/cf/images/Document.gif";
this.imagesopen.element=_cf_ajaxscriptsrc+"/resources/cf/images/Elements.png";
this.imagesopen.floppy=_cf_ajaxscriptsrc+"/resources/cf/images/Floppy.png";
this.imagesopen.fixed=_cf_ajaxscriptsrc+"/resources/cf/images/HardDrive.png";
this.imagesopen.remote=_cf_ajaxscriptsrc+"/resources/cf/images/NetworkDrive.png";
this.eventcount=0;
this.eventHandlers=new Array();
this.nodeCounter=0;
};
ColdFusion.Tree.refresh=function(_231){
var tree=ColdFusion.objectCache[_231];
var _233=ColdFusion.objectCache[_231+"collection"];
if(!tree||YAHOO.widget.TreeView.prototype.isPrototypeOf(tree)==false){
ColdFusion.handleError(null,"tree.refresh.notfound","widget",[_231],null,null,true);
return;
}
if(!_233.dynLoadFunction){
ColdFusion.Log.info("tree.refresh.statictree","widget");
return;
}
_233.dynLoadFunction.call(null,tree.getRoot());
ColdFusion.Log.info("tree.refresh.success","widget",[_231]);
};
ColdFusion.Tree.getTreeObject=function(_234){
if(!_234){
ColdFusion.handleError(null,"tree.gettreeobject.emptyname","widget",null,null,null,true);
return;
}
var _235=ColdFusion.objectCache[_234];
if(_235==null||YAHOO.widget.TreeView.prototype.isPrototypeOf(_235)==false){
ColdFusion.handleError(null,"tree.gettreeobject.notfound","widget",[_234],null,null,true);
return;
}
return _235;
};
ColdFusion.Tree.loadNodes=function(_236,_237){
var i=0;
var _239=ColdFusion.objectCache[_237.treeid+"collection"];
var tree=ColdFusion.objectCache[_237.treeid];
var _23b;
var _23c=false;
if(_236&&typeof (_236.length)=="number"&&!_236.toUpperCase){
if(_236.length>0&&typeof (_236[0])!="object"){
_23c=true;
}
}else{
_23c=true;
}
if(_23c){
ColdFusion.handleError(tree.onbinderror,"tree.loadnodes.invalidbindvalue","widget",[_237.treeid]);
return;
}
if(_237.parent&&!_237.parent.isRoot()){
tree.removeChildren(_237.parent);
}else{
if(_237.parent&&_237.parent.hasChildren()){
tree.removeChildren(_237.parent);
_237.parent=tree.getRoot();
}
}
if(!_237.parent.leafnode){
for(i=0;i<_236.length;i++){
var _23d=_239.nodeCounter++;
var node={};
node.id=_236[i].VALUE;
if(typeof (_236[i].DISPLAY)==undefined||_236[i].DISPLAY==null){
node.label=_236[i].VALUE;
}else{
node.label=_236[i].DISPLAY;
}
node.expand=_236[i].EXPAND;
node.appendkey=_236[i].APPENDKEY;
node.href=_236[i].HREF;
node.img=_236[i].IMG;
node.imgOpen=_236[i].IMGOPEN;
node.imgid="_cf_image"+_23d;
node.spanid="_cf_span"+_23d;
node.target=_236[i].TARGET;
if(_239.appendkey&&_239.appendkey==true&&node.href){
var _23f=new String(node.href);
_23f=_23f.toLowerCase();
if(_23f.indexOf("javascript")<0){
if(_23f.indexOf("?")>=0){
node.href=_236[i].HREF+"&";
}else{
node.href=_236[i].HREF+"?";
}
node.href=node.href+"CFTREEITEMKEY="+node.id;
}
}
var _240="";
if(node.img){
if(_239.images[node.img]){
_240="<img src='"+_239.images[node.img]+"' id='"+node.imgid+"' style='border:0'/>&nbsp;";
}else{
_240="<img src='"+node.img+"' id='"+node.imgid+"' style='border:0'/>&nbsp;";
}
}
if(_239.fontname||_239.italic==true||_239.bold==true||_239.fontsize){
_240=_240+"<span id='"+node.spanid+"' style='";
if(_239.fontname){
_240=_240+"font-family:"+_239.fontname+";";
}
if(_239.italic==true){
_240=_240+"font-style:italic;";
}
if(_239.bold==true){
_240=_240+"font-weight:bold;";
}
if(_239.fontsize){
_240=_240+"font-size:"+_239.fontsize+";";
}
_240=_240+"'>"+node.label+"</span>";
node.label=_240;
}else{
node.label=_240+"<span id='"+node.spanid+"'  >"+node.label+"</span>";
}
node.childrenFetched=false;
var _241=new YAHOO.widget.TextNode(node,_237.parent,false);
var _242=false;
if(_236[i].LEAFNODE&&_236[i].LEAFNODE==true){
_242=true;
_241.leafnode=true;
_241.iconMode=1;
}
if(_242==true||(node.expand&&node.expand==true)){
_241.expand();
}
}
}
if(!_237.parent.isRoot()){
_237.parent.data.childrenFetched=true;
}
if(_237.onCompleteCallBack){
_237.onCompleteCallBack.call();
}else{
_237.parent.tree.draw();
}
ColdFusion.Log.info("tree.loadnodes.success","widget",[_237.treeid]);
};
ColdFusion.Tree.onExpand=function(node){
if(node.isRoot()){
return;
}
var _244=ColdFusion.objectCache[node.tree.id+"collection"];
if(node.data.imgOpen&&typeof (node.leafnode)=="undefined"){
var _245=ColdFusion.DOM.getElement(node.data.imgid,node.tree.id);
var src;
if(_244.imagesopen[node.data.imgOpen]){
src=_244.imagesopen[node.data.imgOpen];
}else{
src=node.data.imgOpen;
}
_245.src=src;
}
if(_244.cache==false&&node.data.childrenFetched==false&&_244.dynLoadFunction){
node.tree.removeChildren(node);
}
};
ColdFusion.Tree.onCollapse=function(node){
if(node.isRoot()){
return;
}
var _248=ColdFusion.objectCache[node.tree.id+"collection"];
if(node.data.img){
var _249=ColdFusion.DOM.getElement(node.data.imgid,node.tree.id);
var src;
if(_248.images[node.data.img]){
src=_248.images[node.data.img];
}else{
src=node.data.img;
}
_249.src=src;
}
node.data.childrenFetched=false;
};
ColdFusion.Tree.formPath=function(node,_24c){
var _24d=ColdFusion.objectCache[node.tree.id+"collection"];
if(_24d.completepath==true&&node.isRoot()){
return "";
}else{
if(_24d.completepath==false&&node.parent.isRoot()){
return "";
}
}
if(!_24c){
_24c=node;
}
var _24e=ColdFusion.Tree.formPath(node.parent,_24c);
_24e=_24e+node.data.id;
if(_24c.data.id!=node.data.id){
_24e=_24e+_24d.delimiter;
}
return _24e;
};
ColdFusion.Tree.onLabelClick=function(node){
var _250="";
var _251=ColdFusion.objectCache[node.tree.id+"collection"];
var _250=ColdFusion.Tree.formPath(node);
if(_251.prevspanid){
var _252=ColdFusion.DOM.getElement(_251.prevspanid,node.tree.id);
if(_252.style){
_252.style.backgroundColor=_251.prevspanbackground;
}
}
var _253=ColdFusion.DOM.getElement(node.data.spanid,node.tree.id);
if(_253&&_253.style){
_251.prevspanbackground=_253.style.backgroundColor;
}
_253.style.backgroundColor="lightblue";
_251.prevspanid=node.data.spanid;
node.tree._cf_path=_250;
node.tree._cf_node=node.data.id;
var val="PATH="+_250+"; NODE="+node.data.id;
updateHiddenValue(val,_251.formname,_251.formparamname);
ColdFusion.Tree.fireSelectionChangeEvent(node.tree.id,_251.formname);
};
ColdFusion.Tree.fireSelectionChangeEvent=function(id,_256){
ColdFusion.Log.info("tree.fireselectionchangeevent.fire","widget",[id]);
ColdFusion.Event.callBindHandlers(id,_256,"change");
};
ColdFusion.Tree.getObject=function(_257){
var _258={};
_258.id=_257.value;
if(_257.href&&_257.href!="null"){
_258.href=_257.href;
}
_258.target=_257.target;
_258.label=_257.label;
_258.display=_257.display;
_258.img=_257.img;
_258.imgOpen=_257.imgOpen;
_258.imgid=_257.imgid;
_258.spanid=_257.spanid;
_258.childrenfetched=_257.childrenfetched;
return _258;
};
ColdFusion.Tree.initializeTree=function(_259,_25a,_25b,bold,_25d,_25e,_25f,_260,_261,_262,_263,_264){
var _265=new YAHOO.widget.TreeView(_259);
_265.subscribe("expand",ColdFusion.Tree.onExpand);
_265.subscribe("collapse",ColdFusion.Tree.onCollapse);
_265.subscribe("labelClick",ColdFusion.Tree.onLabelClick);
_265._cf_getAttribute=function(_266){
_266=_266.toUpperCase();
if(_266=="PATH"){
return _265._cf_path;
}else{
if(_266=="NODE"){
return _265._cf_node;
}else{
return null;
}
}
};
_265.onbinderror=_262;
ColdFusion.objectCache[_259]=_265;
var _267=new ColdFusion.Tree.AttributesCollection();
_267.cache=_25a;
_267.italic=_25b;
_267.bold=bold;
_267.completepath=_25d;
_267.delimiter=_25f;
_267.appendkey=_25e;
_267.formname=_260;
_267.formparamname=_261;
_267.fontsize=_263;
_267.fontname=_264;
ColdFusion.objectCache[_259+"collection"]=_267;
ColdFusion.Log.info("tree.initializetree.success","widget",[_259]);
return _265;
};
