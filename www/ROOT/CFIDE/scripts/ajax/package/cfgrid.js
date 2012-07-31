/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
cfinitgrid=function(){
if(!ColdFusion.Grid){
ColdFusion.Grid={};
}
var $G=ColdFusion.Grid;
var $L=ColdFusion.Log;
$G.init=function(id,name,_4e4,_4e5,edit,_4e7,_4e8,_4e9,_4ea,_4eb,_4ec,_4ed,_4ee,_4ef,_4f0,_4f1,_4f2,_4f3,_4f4,_4f5,_4f6,_4f7,_4f8,_4f9,_4fa,_4fb,_4fc,_4fd,_4fe){
var grid;
var _500;
var _501=false;
if(_4f3&&typeof (_4f3)!="undefined"){
_500=_4f3;
_501=true;
}else{
_500=new Ext.grid.RowSelectionModel({singleSelect:true});
}
var _502=new Ext.grid.ColumnModel(_4ea);
var _503={ds:_4eb,cm:_502,sm:_500,autoSizeColumns:_4e8,autoSizeHeaders:_4e8,stripeRows:_4ee,autoExpandColumnId:_4e9};
if(_4fd!=null&&typeof _4fd!="undefined"){
_503.plugins=_4fd;
}
if(!_4ec||typeof (_4ec)=="undefined"){
_4ec=100*(_4ea.length-1);
}
var _504=ColdFusion.objectCache[id];
var _505=document.getElementById(_504.gridId);
if(_505!=null){
var _506=_505.style.cssText;
if(typeof _506=="undefined"){
_506="";
}
_506="width:"+_4ec+"px;"+_506;
_505.style.cssText=_506;
}
_503.width=_4ec;
if(_4e8===true){
_503.viewConfig={forceFit:true};
}else{
if(_4f3&&typeof (_4f3)!="undefined"){
_503.autoExpandColumn=_4e9;
}else{
_503.autoExpandColumn=_4e9;
}
}
if(_4ed){
_503.height=_4ed;
}else{
_503.autoHeight=true;
var _507=".x-grid3-header {position: relative;}";
Ext.util.CSS.createStyleSheet(_507,"_cf_grid"+id);
}
if(_4f5&&typeof (_4f5)!="undefined"){
_503.view=new Ext.grid.GroupingView({forceFit:false,groupTextTpl:"{[values.text.indexOf(\"x-grid3-check-col\") > 0 ? (values.text.indexOf(\"x-grid3-check-col-on\") > 0 ? \"Yes\" : \"No\") : values.text]} ({[values.rs.length]} {[values.rs.length > 1 ? \"Items\" : \"Item\"]})"});
}
_503.title=_4f6;
_503.collapsible=_4f4;
if(_4f4&&_4f6==null){
_503.title="  ";
}
var _508=ColdFusion.objectCache[id];
_508.bindOnLoad=_4e7;
_508.dynamic=_4e5;
_508.styles=_4ef;
_508.grouping=_4f5;
_508.onLoadFunction=_4fc;
_508.multiRowSelection=_501;
_503.renderTo=_508.gridId;
_503.tbar=new Ext.Toolbar({hidden:true});
if(_4e5){
_503.bbar=new Ext.PagingToolbar({pageSize:_4f0,store:_4eb,emptyMsg:"No topics to display"});
if(_4fa&&(_4f7||_4f8)){
var _509=_503.bbar;
if(_4f7){
_509.addButton({text:_4f7,handler:$G.insertRow,scope:_508});
_509.addButton({text:" save ",handler:$G.saveNewRecord,scope:_508});
_509.addButton({text:" cancel ",handler:$G.cancelNewRecord,scope:_508});
}
if(_4f8){
_509.addButton({text:_4f8,handler:$G.deleteRow,scope:_508});
}
}
}
if(edit&&!_4e5){
if(_4f7||_4f8){
var bbar=new Ext.Toolbar();
if(_4f7){
bbar.addButton({text:_4f7,xtype:"button",handler:$G.insertRow,scope:_508});
}
if(_4f8){
bbar.addButton({text:_4f8,handler:$G.deleteRow,scope:_508});
}
}else{
var bbar=new Ext.Toolbar({hidden:true});
}
_503.bbar=bbar;
}
if(edit){
_503.clicksToEdit=1;
grid=new Ext.grid.EditorGridPanel(_503);
}else{
grid=new Ext.grid.GridPanel(_503);
}
$G.Ext_caseInsensitive_sorting();
_4eb.addListener("load",$G.Actions.onLoad,_508,{delay:50});
grid.view.colMenu.addListener("beforeshow",function(menu){
var _50c=_502.getColumnCount();
for(var i=0;i<_50c;i++){
if("CFGRIDROWINDEX"==_502.getDataIndex(i)){
menu.remove(menu.items["items"][i]);
break;
}
}
},this);
_508.grid=grid;
grid.render();
if(!_4e5){
_4eb.addListener("load",$G.Actions.onLoad,_508,{delay:50});
_4eb.load();
}
if(_4e5){
_4eb.addListener("load",$G.Actions.onLoad,_508,{delay:50});
_4eb._cf_errorHandler=_4fb;
_4eb.proxy._cf_actions=_508;
_4eb.load({params:{start:0,limit:_4f0}});
}else{
$G.applyStyles(_508);
}
if(_4fe){
ColdFusion.Bind.register(_4fe,{actions:_508},$G.bindHandler,false);
}
$L.info("grid.init.created","widget",[id]);
_508.init(id,name,_4e4,_4f9,_4e5,edit,_4fa,_4fb,_4f2,_4f0,_4f1,_4f5);
};
$G.applyStyles=function(_50e){
if(_50e.stylesApplied){
return;
}
Ext.util.CSS.createStyleSheet(_50e.styles);
_50e.stylesApplied=true;
};
$G.bindHandler=function(e,_510){
$G.refresh(_510.actions.id);
};
$G.bindHandler._cf_bindhandler=true;
$G.refresh=function(_511,_512){
var _513=ColdFusion.objectCache[_511];
if(_513&&$G.Actions.prototype.isPrototypeOf(_513)==true){
var _514=_513.grid.getStore();
if(_513.dynamic){
_513.editOldValue=null;
_513.selectedRow=-1;
if(_512){
_514.reload();
}else{
_514.reload({params:{start:0,limit:_513.pageSize}});
}
}
}else{
ColdFusion.handleError(null,"grid.refresh.notfound","widget",[_511],null,null,true);
return;
}
if(_513.multiRowSelection){
var _515=_513.grid.getView().getHeaderCell(0);
if(_515!=null){
var _516=Ext.Element.get(_515).first();
if(_516){
_516.replaceClass("x-grid3-hd-checker-on");
}
}
}
$L.info("grid.refresh.success","widget",[_511]);
};
$G.Ext_caseInsensitive_sorting=function(){
Ext.data.Store.prototype.sortData=function(f,_518){
_518=_518||"ASC";
var st=this.fields.get(f).sortType;
var fn=function(r1,r2){
var v1=st(r1.data[f]),v2=st(r2.data[f]);
if(v1.toLowerCase){
v1=v1.toLowerCase();
v2=v2.toLowerCase();
}
return v1>v2?1:(v1<v2?-1:0);
};
this.data.sort(_518,fn);
if(this.snapshot&&this.snapshot!=this.data){
this.snapshot.sort(_518,fn);
}
};
};
$G.getTopToolbar=function(_51e){
var _51f=ColdFusion.objectCache[_51e];
if(!_51f){
ColdFusion.handleError(null,"grid.getTopToolbar.notfound","widget",[_51e],null,null,true);
return;
}
return _51f.grid.getTopToolbar();
};
$G.showTopToolbar=function(_520){
var _521=ColdFusion.objectCache[_520];
if(!_521){
ColdFusion.handleError(null,"grid.showTopToolbar.notfound","widget",[_520],null,null,true);
return;
}
var tbar=_521.grid.getTopToolbar();
if(!tbar){
ColdFusion.handleError(null,"grid.showTopToolbar.toolbarNotDefined","widget",[_520],null,null,true);
return;
}
tbar.show();
};
$G.hideTopToolbar=function(_523){
var _524=ColdFusion.objectCache[_523];
if(!_524){
ColdFusion.handleError(null,"grid.hideTopToolbar.notfound","widget",[_523],null,null,true);
return;
}
var tbar=_524.grid.getTopToolbar();
if(!tbar){
ColdFusion.handleError(null,"grid.hideTopToolbar.toolbarNotDefined","widget",[_523],null,null,true);
return;
}
tbar.hide();
};
$G.refreshTopToolbar=function(_526){
var _527=ColdFusion.objectCache[_526];
if(!_527){
ColdFusion.handleError(null,"grid.refreshTopToolbar.notfound","widget",[_526],null,null,true);
return;
}
var tbar=_527.grid.getTopToolbar();
if(!tbar){
ColdFusion.handleError(null,"grid.refreshTopToolbar.toolbarNotDefined","widget",[_526],null,null,true);
return;
}
tbar.doLayout();
if(tbar.isVisible()==false){
tbar.show();
}
};
$G.getBottomToolbar=function(_529){
var _52a=ColdFusion.objectCache[_529];
if(!_52a){
ColdFusion.handleError(null,"grid.getBottomToolbar.notfound","widget",[_529],null,null,true);
return;
}
return _52a.grid.getBottomToolbar();
};
$G.showBottomToolbar=function(_52b){
var _52c=ColdFusion.objectCache[_52b];
if(!_52c){
ColdFusion.handleError(null,"grid.showBottomToolbar.notfound","widget",[_52b],null,null,true);
return;
}
var tbar=_52c.grid.getBottomToolbar();
if(!tbar){
ColdFusion.handleError(null,"grid.showBottomToolbar.toolbarNotDefined","widget",[_52b],null,null,true);
return;
}
tbar.show();
};
$G.hideBottomToolbar=function(_52e){
var _52f=ColdFusion.objectCache[_52e];
if(!_52f){
ColdFusion.handleError(null,"grid.hideBottomToolbar.notfound","widget",[_52e],null,null,true);
return;
}
var tbar=_52f.grid.getBottomToolbar();
if(!tbar){
ColdFusion.handleError(null,"grid.hideBottomToolbar.toolbarNotDefined","widget",[_52e],null,null,true);
return;
}
tbar.hide();
};
$G.refreshBottomToolbar=function(_531){
var _532=ColdFusion.objectCache[_531];
if(!_532){
ColdFusion.handleError(null,"grid.refreshBottomToolbar.notfound","widget",[_531],null,null,true);
return;
}
var tbar=_532.grid.getBottomToolbar();
if(!tbar){
ColdFusion.handleError(null,"grid.refreshBottomToolbar.toolbarNotDefined","widget",[_531],null,null,true);
return;
}
tbar.doLayout();
if(tbar.isVisible()==false){
tbar.show();
}
};
$G.sort=function(_534,_535,_536){
var _537=ColdFusion.objectCache[_534];
if(!_537){
ColdFusion.handleError(null,"grid.sort.notfound","widget",[_534],null,null,true);
return;
}
_535=_535.toUpperCase();
var _538=-1;
var _539=_537.grid.getColumnModel().config;
for(var i=0;i<_539.length-1;i++){
if(_535==_539[i].colName){
_538=i;
break;
}
}
if(_538==-1){
ColdFusion.handleError(null,"grid.sort.colnotfound","widget",[_535,_534],null,null,true);
return;
}
if(!_536){
_536="ASC";
}
_536=_536.toUpperCase();
if(_536!="ASC"&&_536!="DESC"){
ColdFusion.handleError(null,"grid.sort.invalidsortdir","widget",[_536,_534],null,null,true);
return;
}
var _53b=_537.grid.getStore();
_53b.sort(_535,_536);
};
$G.getGridObject=function(_53c){
if(!_53c){
ColdFusion.handleError(null,"grid.getgridobject.missinggridname","widget",null,null,null,true);
return;
}
var _53d=ColdFusion.objectCache[_53c];
if(_53d==null||$G.Actions.prototype.isPrototypeOf(_53d)==false){
ColdFusion.handleError(null,"grid.getgridobject.notfound","widget",[_53c],null,null,true);
return;
}
return _53d.grid;
};
$G.getSelectedRows=function(_53e){
if(!_53e){
ColdFusion.handleError(null,"grid.getSelectedRowData.missinggridname","widget",null,null,null,true);
return;
}
var _53f=ColdFusion.objectCache[_53e];
var _540=new Array();
var _541=_53f.grid.getSelectionModel();
var _542=_541.getSelections();
var _543=_53f.grid.getColumnModel();
var _544=0;
if(_53f.multiRowSelection===true&&_53f.dynamic===false){
_544++;
}
for(i=0;i<_542.length;i++){
var _545=_542[i].data;
var _546={};
for(var _547=_544;_547<_543.getColumnCount()-1;_547++){
var key=_543.getDataIndex(_547);
_546[key]=_545[key];
}
_540[i]=_546;
}
return _540;
};
$G.clearSelectedRows=function(_549){
if(!_549){
ColdFusion.handleError(null,"grid.getSelectedRowData.missinggridname","widget",null,null,null,true);
return;
}
var _54a=ColdFusion.objectCache[_549];
var _54b=_54a.grid.getSelectionModel();
_54b.clearSelections();
if(_54a.multiRowSelection){
var _54c=_54a.grid.getView().getHeaderCell(0);
if(_54c!=null){
var _54d=Ext.Element.get(_54c).first();
if(_54d){
_54d.replaceClass("x-grid3-hd-checker-on");
}
}
}
};
$G.Actions=function(_54e){
this.gridId=_54e;
this.init=$G.Actions.init;
this.onChangeHandler=$G.Actions.onChangeHandler;
this.onChangeHandler_MultiRowsDelete=$G.Actions.onChangeHandler_MultiRowsDelete;
this.selectionChangeEvent=new ColdFusion.Event.CustomEvent("cfGridSelectionChange",_54e);
this.fireSelectionChangeEvent=$G.fireSelectionChangeEvent;
this._cf_getAttribute=$G.Actions._cf_getAttribute;
this._cf_register=$G.Actions._cf_register;
};
$G.Actions.init=function(id,_550,_551,_552,_553,edit,_555,_556,_557,_558,_559,_55a){
this.id=id;
this.gridName=_550;
this.formId=_551;
this.form=document.getElementById(_551);
this.cellClickInfo=_552;
this.edit=edit;
this.onChangeFunction=_555;
this.onErrorFunction=_556;
this.preservePageOnSort=_557;
this.pageSize=_558;
this.selectedRow=-1;
this.selectOnLoad=_559;
this.grouping=_55a;
this.grid.addListener("cellclick",$G.cellClick,this,true);
this.editField=document.createElement("input");
this.editField.setAttribute("name",_550);
this.editField.setAttribute("type","hidden");
this.form.appendChild(this.editField);
if(edit){
if(!_553){
var _55b=this.grid.getColumnModel().config;
this.editFieldPrefix="__CFGRID__EDIT__=";
var i=0;
var _55d=_55b.length-1;
if(this.multiRowSelection===true&&this.dynamic===false){
i++;
_55d--;
}
this.editFieldPrefix+=_55d+$G.Actions.fieldSep;
var _55e=true;
for(i;i<_55b.length-1;i++){
if(!_55e){
this.editFieldPrefix+=$G.Actions.fieldSep;
}
this.editFieldPrefix+=_55b[i].colName;
this.editFieldPrefix+=$G.Actions.valueSep;
if(_55b[i].editor){
this.editFieldPrefix+="Y";
}else{
this.editFieldPrefix+="N";
}
_55e=false;
}
this.editFieldPrefix+=$G.Actions.fieldSep;
}
this.editFieldState=[];
this.editFieldState.length=this.grid.getStore().getTotalCount();
$G.Actions.computeEditField(this);
this.insertInProgress=false;
this.insertEvent=null;
this.grid.addListener("beforeedit",$G.Actions.beforeEdit,this,true);
this.grid.addListener("afteredit",$G.Actions.afterEdit,this,true);
}
if(_553){
this.grid.getStore().addListener("beforeload",$G.Actions.beforeLoad,this,true);
}
this.grid.getSelectionModel().addListener("rowselect",$G.rowSelect,this,true);
this.grid.getSelectionModel().addListener("beforerowselect",$G.beforeRowSelect,this,true);
if(_559&&!_55a){
this.grid.getSelectionModel().selectFirstRow();
}
};
$G.Actions.beforeLoad=function(_55f,_560){
var _561=_55f.getSortState();
var _562=((typeof this.sortCol!="undefined"&&_561.field!=this.sortCol)||(typeof this.direction!="undefined"&&_561.direction!=this.sortDir));
if(_562&&!this.preservePageOnSort){
_560.params.start=0;
}
this.sortCol=_561.field;
this.sortDir=_561.direction;
};
$G.Actions.onLoad=function(){
this.editOldValue=null;
this.selectedRow=-1;
this.insertInProgress=false;
var _563=0;
if((this.bindOnLoad||!this.dynamic)&&this.selectOnLoad&&!this.grouping){
this.grid.getSelectionModel().selectRow(_563,false);
}
if(!this.gridRendered&&this.onLoadFunction&&typeof this.onLoadFunction=="function"){
this.gridRendered=true;
this.onLoadFunction.call(null,this.grid);
}
};
$G.Actions._cf_getAttribute=function(_564){
_564=_564.toUpperCase();
var _565=this.selectedRow;
var _566=null;
if(_565!=0&&(!_565||_565==-1)){
return _566;
}
var ds=this.grid.getStore();
var _568=(this.dynamic)?ds.getAt(_565):ds.getById(_565);
_566=_568.get(_564);
return _566;
};
$G.Actions._cf_register=function(_569,_56a,_56b){
this.selectionChangeEvent.subscribe(_56a,_56b);
};
$G.rowSelect=function(_56c,row){
var _56e="";
var _56f=_56c.getSelected();
var _570=_56f.get("CFGRIDROWINDEX")||row;
if(this.selectedRow!=_570){
this.selectedRow=_570;
var _571=true;
for(col in _56f.data){
if(col=="CFGRIDROWINDEX"){
continue;
}
if(typeof col=="undefined"||col=="undefined"){
continue;
}
if(!_571){
_56e+="; ";
}
_56e+="__CFGRID__COLUMN__="+col+"; ";
_56e+="__CFGRID__DATA__="+_56f.data[col];
_571=false;
}
this.fireSelectionChangeEvent();
this.insertInProgress=false;
}
};
$G.beforeRowSelect=function(_572,row){
var ds=this.grid.getStore();
var _575=ds.getAt(row);
return !$G.isNullRow(_575.data);
};
$G.isNullRow=function(data){
var _577=true;
for(col in data){
if(data[col]!=null){
_577=false;
break;
}
}
return _577;
};
$G.fireSelectionChangeEvent=function(){
$L.info("grid.fireselectionchangeevent.fire","widget",[this.id]);
this.selectionChangeEvent.fire();
};
$G.cellClick=function(grid,_579,_57a){
var _57b=this.cellClickInfo.colInfo[_57a];
if(_57b){
var _57c=grid.getSelectionModel().getSelected();
var url=_57c.get(_57b.href.toUpperCase());
if(!url){
url=_57b.href;
}
var _57e=_57b.hrefKey;
var _57f=_57b.target;
var _580=this.appendKey;
if(this.cellClickInfo.appendKey){
var _581;
if(_57e||_57e==0){
var _582=grid.getStore().getAt(_579);
var _583=grid.getColumnModel().config[_57e].dataIndex;
_581=_582.get(_583);
}else{
var _584=this.grid.getColumnModel().config;
_581=_57c.get(_584[0].dataIndex);
for(var i=1;i<_584.length-1;i++){
_581+=","+_57c.get(_584[i].dataIndex);
}
}
if(url.indexOf("?")!=-1){
url+="&CFGRIDKEY="+_581;
}else{
url+="?CFGRIDKEY="+_581;
}
}
if(_57f){
_57f=_57f.toLowerCase();
if(_57f=="_top"){
_57f="top";
}else{
if(_57f=="_parent"){
_57f="parent";
}else{
if(_57f=="_self"){
_57f=window.name;
}else{
if(_57f=="_blank"){
window.open(encodeURI(url));
return;
}
}
}
}
if(!parent[_57f]){
ColdFusion.handleError(null,"grid.cellclick.targetnotfound","widget",[_57f]);
return;
}
parent[_57f].location=encodeURI(url);
}else{
window.location=encodeURI(url);
}
}
};
$G.insertRow=function(){
if(this.insertInProgress&&this.dynamic){
ColdFusion.handleError(null,"Multiple row insert is not supported","Grid",[this.gridId],null,null,true);
return;
}
var _586={action:"I",values:[]};
var _587=this.grid.getColumnModel();
var _588=this.grid.getStore();
var _589={};
for(var i=0;i<_587.getColumnCount()-1;i++){
var _58b="";
var _58c=_587.getCellEditor(i,0);
if(_58c&&Ext.form.Checkbox.prototype.isPrototypeOf(_58c.field)){
_58b=false;
}
_586.values[i]=[_58b,_58b];
_589[_587.getDataIndex(i)]=_58b;
}
_589["CFGRIDROWINDEX"]=_588.getCount()+1;
_588.add(new Ext.data.Record(_589));
if(this.dynamic==true){
this.selectedRow=_588.getCount();
}
this.editFieldState.push(_586);
this.grid.getSelectionModel().selectRow(_588.getCount()-1);
this.insertInProgress=true;
$G.Actions.computeEditField(this);
};
$G.saveNewRecord=function(){
if(!this.insertInProgress){
return;
}
var _58d=this.selectedRow;
var _58e=this.insertEvent;
if(_58d==-1){
return;
}
if(this.onChangeFunction){
this.onChangeHandler("I",_58d-1,_58e,$G.insertRowCallback);
}else{
if(this.dynamic==false){
var _58f=this.grid.getStore();
var _590=_58e.record;
var _591=new Array(1);
_591[0]=_590;
var _592=_58f.getAt(this.selectedRow-1);
_58f.remove(_592);
_58f.add(_591);
}
}
this.insertInProgress=false;
this.insertEvent=null;
};
$G.cancelNewRecord=function(){
if(!this.insertInProgress){
return;
}
this.editFieldState.pop();
var _593=this.grid.getStore();
var _594=_593.getAt(this.selectedRow-1);
_593.remove(_594);
this.insertInProgress=false;
this.insertEvent=null;
this.selectedRow=this.selectedrow-1;
};
$G.deleteRow=function(){
var _595=null;
var _596;
if(this.multiRowSelection===true){
var _597=this.grid.getSelectionModel();
_595=_597.getSelections();
}
if(_595==null){
_596=this.selectedRow;
}
if(_596==-1&&_595==null){
return;
}
if(this.onChangeFunction){
if(_595!=null){
this.onChangeHandler_MultiRowsDelete("D",_595,null,$G.deleteRowCallback);
}else{
this.onChangeHandler("D",_596,null,$G.deleteRowCallback);
}
}else{
if(!this.dynamic){
var _598=this.grid.getStore();
if(_595!=null){
for(i=0;i<_595.length;i++){
var _599=_598.indexOf(_595[i]);
var _59a=this.editFieldState[_599];
if(_59a){
_59a.action="D";
}else{
_59a=$G.Actions.initEditState(this,"D",_595[i],_599+1);
}
}
for(i=0;i<_595.length;i++){
_598.remove(_595[i]);
}
}else{
var _59a=this.editFieldState[_596-1];
if(_59a){
_59a.action="D";
}else{
var _59b=this.grid.getStore().getById(_596);
_59a=$G.Actions.initEditState(this,"D",_59b,_596);
}
_598.remove(this.grid.getSelectionModel().getSelected());
}
$G.Actions.computeEditField(this);
this.grid.stopEditing();
this.selectedRow=-1;
}
}
};
$G.deleteRowCallback=function(_59c,_59d){
var _59e=_59d._cf_grid.getStore();
var _59f=_59d._cf_grid_properties;
var _59d=_59e.lastOptions.params;
var key="start";
if(_59e.getCount()==1){
if(_59d.start>=_59d.limit){
_59d.start=_59d.start-_59d.limit;
}
_59e.reload(_59d);
}else{
_59e.reload();
}
if(_59f.multiRowSelection){
var _5a1=_59f.grid.getView().getHeaderCell(0);
if(_5a1!=null){
var _5a2=Ext.Element.get(_5a1).first();
if(_5a2){
_5a2.replaceClass("x-grid3-hd-checker-on");
}
}
}
};
$G.insertRowCallback=function(_5a3,_5a4){
var _5a5=_5a4._cf_grid.getStore();
var _5a6=_5a4._cf_grid.actions;
_5a5.reload();
};
$G.Actions.beforeEdit=function(_5a7){
if($G.isNullRow(_5a7.record.data)){
return false;
}
this.editColumn=_5a7.column;
this.editOldValue=_5a7.value;
};
$G.Actions.afterEdit=function(_5a8){
var _5a9=_5a8.value;
if(this.insertInProgress==false&&this.onChangeFunction){
this.onChangeHandler("U",this.selectedRow,_5a8);
}else{
if(!this.dynamic){
var _5aa=$G.computeActualRow_editField(this.editFieldState,this.selectedRow);
var _5ab=this.editFieldState[_5aa-1];
if(_5ab){
var _5ac=_5a8.column;
if(this.multiRowSelection===true&&this.insertInProgress==true){
_5ac=_5ac-1;
}
_5ab.values[_5ac][1]=_5a9;
}else{
var _5ad=this.grid.getStore().getById(this.selectedRow);
_5ab=$G.Actions.initEditState(this,"U",_5ad,_5aa);
var _5ae=this.editOldValue+"";
if(_5a9.getDayOfYear){
if(_5ae&&typeof _5ae=="string"){
_5ae=new Date(_5ae);
}
_5ab.values[_5a8.column][1]=_5a9.format("F, j Y H:i:s");
_5ab.values[_5a8.column][0]=_5ae?_5ae.format("F, j Y H:i:s"):_5ae;
}else{
_5ab.values[_5a8.column][0]=_5ae;
_5ab.values[_5a8.column][1]=_5a9;
}
}
$G.Actions.computeEditField(this);
}
}
this.editOldValue=null;
this.fireSelectionChangeEvent();
};
$G.computeActualRow_editField=function(_5af,_5b0){
if(_5af.length==_5b0){
return _5b0;
}
var _5b1=0;
var _5b2=0;
for(;_5b2<_5af.length&&_5b1<_5b0;_5b2++){
var _5b3=_5af[_5b2];
if(!_5b3||_5b3.action!="D"){
_5b1++;
}
}
return _5b2;
};
$G.Actions.onChangeHandler=function(_5b4,_5b5,_5b6,_5b7){
var _5b8={};
var _5b9={};
var data=_5b6?_5b6.record.data:this.grid.getStore().getAt(_5b5).data;
for(col in data){
_5b8[col]=data[col];
}
if(_5b4=="U"){
if((_5b6.value==null||_5b6.value=="")&&(_5b6.originalValue==null||_5b6.originalValue=="")){
return;
}
if(_5b6.value&&_5b6.value.getDayOfYear){
if(typeof _5b6.originalValue=="string"){
var _5bb=new Date(_5b6.originalValue);
}
if(_5bb!=null&&_5bb.getElapsed(_5b6.value)==0){
return;
}else{
_5b8[_5b6.field]=_5b6.originalValue;
_5b9[_5b6.field]=_5b6.value.format("F, j Y H:i:s");
}
}else{
_5b8[_5b6.field]=_5b6.originalValue;
_5b9[_5b6.field]=_5b6.value;
}
}
this.onChangeFunction(_5b4,_5b8,_5b9,_5b7,this.grid,this.onErrorFunction,this);
};
$G.Actions.onChangeHandler_MultiRowsDelete=function(_5bc,_5bd,_5be,_5bf){
var _5c0=new Array();
var _5c1={};
for(i=0;i<_5bd.length;i++){
_5c0[i]=_5bd[i].data;
}
this.onChangeFunction(_5bc,_5c0,_5c1,_5bf,this.grid,this.onErrorFunction,this);
};
$G.Actions.initEditState=function(_5c2,_5c3,_5c4,_5c5){
var _5c6={action:_5c3,values:[]};
var _5c7=_5c2.grid.getColumnModel();
var _5c8=_5c7.getColumnCount()-1;
_5c6.values.length=_5c8;
var i=0;
if(_5c2.multiRowSelection===true&&_5c2.dynamic===false){
i=i++;
}
for(i;i<_5c8;i++){
var _5ca=_5c4.get(_5c7.getDataIndex(i));
_5c6.values[i]=[_5ca,_5ca];
}
_5c2.editFieldState[_5c5-1]=_5c6;
return _5c6;
};
$G.Actions.fieldSep=eval("'\\u0001'");
$G.Actions.valueSep=eval("'\\u0002'");
$G.Actions.nullValue=eval("'\\u0003'");
$G.Actions.computeEditField=function(_5cb){
if(_5cb.dynamic){
return;
}
var _5cc=_5cb.editFieldPrefix;
var _5cd=_5cb.editFieldState;
var _5ce=_5cb.grid.getColumnModel().config;
var _5cf=0;
var _5d0="";
for(var i=0;i<_5cd.length;i++){
var _5d2=_5cd[i];
if(_5d2){
_5cf++;
_5d0+=$G.Actions.fieldSep;
_5d0+=_5d2.action+$G.Actions.valueSep;
var _5d3=_5d2.values;
if(_5cb.multiRowSelection===true&&_5cb.dynamic===false&&_5d2.action!="I"){
_5d3=_5d3.slice(1,_5d3.length);
}
for(var j=0;j<_5d3.length;j++){
if(j>0){
_5d0+=$G.Actions.valueSep;
}
var _5d5=($G.Actions.isNull(_5d3[j][0]))?$G.Actions.nullValue:_5d3[j][0];
var _5d6=($G.Actions.isNull(_5d3[j][1]))?$G.Actions.nullValue:_5d3[j][1];
var _5d7=j;
if(_5cb.multiRowSelection===true){
_5d7++;
}
if(_5d2.action!="I"||(_5d2.action=="I"&&_5ce[_5d7].editor)){
if(_5ce[_5d7].type=="date"){
if(_5d6!=null&&_5d6!=$G.Actions.nullValue){
if(typeof _5d6=="string"){
_5d6=new Date(_5d6);
}
_5d6=_5d6.format("F, j Y H:i:s");
}
if(_5d5!=null&&_5d5!=$G.Actions.nullValue){
if(typeof _5d5=="string"){
_5d5=new Date(_5d5);
}
_5d5=_5d5.format("F, j Y H:i:s");
}
}
_5d0+=_5d6;
if(_5d2.action=="U"&&_5ce[_5d7].editor){
_5d0+=$G.Actions.valueSep+_5d5;
}
}
}
}
}
_5cc+=_5cf+_5d0;
_5cb.editField.setAttribute("value",_5cc);
};
$G.Actions.isNull=function(val){
var ret=(val==null||typeof (val)=="undefined"||val.length==0);
return ret;
};
$G.loadData=function(data,_5db){
_5db._cf_gridDataProxy.loadResponse(data,_5db);
var _5dc=ColdFusion.objectCache[_5db._cf_gridname];
$G.applyStyles(_5dc);
$L.info("grid.loaddata.loaded","widget",[_5db._cf_gridname]);
if($G.Actions.isNull(data.TOTALROWCOUNT)==false&&data.TOTALROWCOUNT==0){
_5dc.fireSelectionChangeEvent();
}
};
$G.printObject=function(obj){
var str="";
for(key in obj){
str=str+"  "+key+"=";
value=obj[key];
str+=value;
}
return str;
};
$G.formatBoolean=function(v,p,_5e1){
return "<div class=\"x-grid3-check-col"+(v?"-on":"")+" x-grid3-cc-"+this.id+"\">&#160;</div>";
};
$G.formatDate=function(_5e2,p,_5e4){
if(_5e2&&!_5e2.dateFormat){
_5e2=new Date(_5e2);
}
var _5e5=this.dateFormat?this.dateFormat:"m/d/y";
return _5e2?_5e2.dateFormat(_5e5):"";
};
$G.convertDate=function(_5e6,p,_5e8){
if(_5e6&&!_5e6.dateFormat){
_5e6=new Date(_5e6);
}
var _5e9=this.dateFormat?this.dateFormat:"m/d/y";
return _5e6;
};
$G.ExtProxy=function(_5ea,_5eb){
this.api={load:true,create:undefined,save:undefined,destroy:undefined};
$G.ExtProxy.superclass.constructor.call(this);
this.bindHandler=_5ea;
this.errorHandler=_5eb;
};
Ext.extend($G.ExtProxy,Ext.data.DataProxy,{_cf_firstLoad:true,load:function(_5ec,_5ed,_5ee,_5ef,arg){
if(!this._cf_actions.bindOnLoad){
var _5f1={"_cf_reader":_5ed,"_cf_grid_errorhandler":this.errorHandler,"_cf_scope":_5ef,"_cf_gridDataProxy":this,"_cf_gridname":this._cf_gridName,"_cf_arg":arg,"_cf_callback":_5ee,"ignoreData":true};
var data=[];
for(i=0;i<_5ec.limit;i++){
data.push(new Ext.data.Record({}));
}
this.loadResponse(data,_5f1);
this._cf_actions.bindOnLoad=true;
}else{
var _5f3=(_5ec.start/_5ec.limit)+1;
if(!_5ec.sort){
_5ec.sort="";
}
if(!_5ec.dir){
_5ec.dir="";
}
this.bindHandler(this,_5f3,_5ec.limit,_5ec.sort,_5ec.dir,this.errorHandler,_5ee,_5ef,arg,_5ed);
}
},loadResponse:function(data,_5f5){
var _5f6=null;
if(_5f5.ignoreData){
_5f6={success:true,records:data,totalRecords:data.length};
}else{
var _5f7;
if(!data){
_5f7="grid.extproxy.loadresponse.emptyresponse";
}else{
if(!data.TOTALROWCOUNT&&data.TOTALROWCOUNT!=0){
_5f7="grid.extproxy.loadresponse.totalrowcountmissing";
}else{
if(!ColdFusion.Util.isInteger(data.TOTALROWCOUNT)){
_5f7="grid.extproxy.loadresponse.totalrowcountinvalid";
}else{
if(!data.QUERY){
_5f7="grid.extproxy.loadresponse.querymissing";
}else{
if(!data.QUERY.COLUMNS||!ColdFusion.Util.isArray(data.QUERY.COLUMNS)||!data.QUERY.DATA||!ColdFusion.Util.isArray(data.QUERY.DATA)||(data.QUERY.DATA.length>0&&!ColdFusion.Util.isArray(data.QUERY.DATA[0]))){
_5f7="grid.extproxy.loadresponse.queryinvalid";
}
}
}
}
}
if(_5f7){
ColdFusion.handleError(_5f5._cf_grid_errorHandler,_5f7,"widget");
this.fireEvent("loadexception",this,_5f5,data,e);
return;
}
_5f6=_5f5._cf_reader.readRecords(data);
}
this.fireEvent("load",this,_5f5,_5f5._cf_arg);
_5f5._cf_callback.call(_5f5._cf_scope,_5f6,_5f5._cf_arg,true);
},update:function(_5f8){
},updateResponse:function(_5f9){
}});
$G.ExtReader=function(_5fa){
this.recordType=Ext.data.Record.create(_5fa);
};
Ext.extend($G.ExtReader,Ext.data.DataReader,{readRecords:function(_5fb){
var _5fc=[];
var cols=_5fb.QUERY.COLUMNS;
var data=_5fb.QUERY.DATA;
for(var i=0;i<data.length;i++){
var _600={};
for(var j=0;j<cols.length;j++){
_600[cols[j]]=data[i][j];
}
_5fc.push(new Ext.data.Record(_600));
}
return {success:true,records:_5fc,totalRecords:_5fb.TOTALROWCOUNT};
}});
$G.CheckColumn=function(_602){
Ext.apply(this,_602);
if(!this.id){
this.id=Ext.id();
}
this.renderer=this.renderer.createDelegate(this);
};
$G.CheckColumn.prototype={init:function(grid){
this.grid=grid;
this.count=0;
this.columnIndex=this.grid.getColumnModel().findColumnIndex(this.dataIndex);
this.grid.on("render",function(){
var view=this.grid.getView();
if(this.editable==true){
view.mainBody.on("mousedown",this.onMouseDown,this);
}
},this);
},onMouseDown:function(e,t){
if(t.className&&t.className.indexOf("x-grid3-cc-"+this.id)!=-1){
e.stopEvent();
var _607=this.grid.getView().findRowIndex(t);
var _608=this.grid.store.getAt(_607);
var _609=ColdFusion.clone(_608);
_609.data=ColdFusion.clone(_608.data);
this.grid.getSelectionModel().selectRow(_607);
this.grid.getSelectionModel().fireEvent("rowselect",this.grid.getSelectionModel(),_607);
this.grid.fireEvent("beforeedit",{grid:this.grid,row:_607,record:_608,column:this.columnIndex,field:this.dataIndex,value:_608.data[this.dataIndex]});
_608.set(this.dataIndex,this.toggleBooleanValue(_608.data[this.dataIndex]));
this.grid.fireEvent("afteredit",{grid:this.grid,row:_607,record:_609,column:this.columnIndex,field:this.dataIndex,value:_608.data[this.dataIndex],originalValue:_609.data[this.dataIndex]});
}
},toggleBooleanValue:function(v){
v=typeof v=="undefined"?"N":(typeof v=="string"?v.toUpperCase():v);
if(v==="Y"){
return "N";
}
if(v==="N"){
return "Y";
}
if(v===true){
return false;
}
if(v===false){
return true;
}
if(v===0){
return 1;
}
if(v===1){
return 0;
}
if(v==="YES"){
return "NO";
}
if(v==="NO"){
return "YES";
}
if(v==="T"){
return "F";
}
if(v==="F"){
return "T";
}
return "Y";
},renderer:function(v,p,_60d){
p.css+=" x-grid3-check-col-td";
var _60e=false;
v=(typeof v=="string")?v.toUpperCase():v;
if(typeof v!="undefined"&&(v==1||v=="1"||v=="Y"||v=="YES"||v===true||v==="T")){
_60e=true;
}
return "<div class=\"x-grid3-check-col"+(_60e==true?"-on":"")+" x-grid3-cc-"+this.id+"\">&#160;</div>";
}};
};
cfinitgrid();
