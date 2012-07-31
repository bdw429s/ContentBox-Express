/*ADOBE SYSTEMS INCORPORATED
Copyright 2007 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.RichText){
ColdFusion.RichText={};
}
ColdFusion.RichText.editorState={};
ColdFusion.RichText.buffer=null;
ColdFusion.RichText.initialize=function(id,name,_116,_117,_118,_119,_11a,_11b,_11c,skin,_11e,_11f,_120,_121,_122){
var _123=new FCKeditor(id);
ColdFusion.RichText.editorState[id]=false;
_123.Value=_116;
_123.richtextid=id;
if(_117!=null){
_123.BasePath=_117;
}
if(_118!=null){
_123.Width=_118;
}
if(_119!=null){
_123.Height=_119;
}
if(_11a!=null){
_123.Config.FontNames=_11a;
}
if(_11b!=null){
_123.Config.FontSizes=_11b;
}
if(_11c!=null){
_123.Config.FontFormats=_11c;
}
_123.Config.LinkBrowserURL=_123.BasePath+"editor/filemanager/browser/default/browser.html?Connector=../../connectors/cfm/connector.cfm";
_123.Config.LinkUploadURL=_123.BasePath+"editor/filemanager/connectors/cfm/upload.cfm";
_123.Config.ImageBrowserURL=_123.BasePath+"editor/filemanager/browser/default/browser.html?Type=Image&Connector=../../connectors/cfm/connector.cfm";
_123.Config.ImageUploadURL=_123.BasePath+"editor/filemanager/connectors/cfm/upload.cfm?Type=Image";
_123.Config.FlashBrowserURL=_123.BasePath+"editor/filemanager/browser/default/browser.html?Type=Flash&Connector=../../connectors/cfm/connector.cfm";
_123.Config.FlashUploadURL=_123.BasePath+"editor/filemanager/connectors/cfm/upload.cfm?Type=Flash";
if(window._cf_clientid){
_123.Config.LinkBrowserURL=_123.Config.LinkBrowserURL+"&_cf_clientid="+_cf_clientid;
_123.Config.LinkUploadURL=_123.Config.LinkUploadURL+"?_cf_clientid="+_cf_clientid;
_123.Config.ImageBrowserURL=_123.Config.ImageBrowserURL+"&_cf_clientid="+_cf_clientid;
_123.Config.ImageUploadURL=_123.Config.ImageUploadURL+"&_cf_clientid="+_cf_clientid;
_123.Config.FlashBrowserURL=_123.Config.FlashBrowserURL+"&_cf_clientid="+_cf_clientid;
_123.Config.FlashUploadURL=_123.Config.FlashUploadURL+"&_cf_clientid="+_cf_clientid;
}
if(skin!=null){
var _124=_123.BasePath+"editor/skins/"+skin+"/";
_123.Config.SkinPath=_124;
}
if(_11e==true){
_123.Config.ToolbarStartExpanded=false;
_123.Config.Toolbaronfocus=true;
}
if(_11f!=null){
_123.ToolbarSet=_11f;
}
if(_120!=null){
_123.Config.StylesXmlPath=_120;
}
if(_121!=null){
_123.Config.TemplatesXmlPath=_121;
}
_123.Config.AutoDetectLanguage=false;
if(_122!=null){
_123.Config.DefaultLanguage=_122;
}
_123.ReplaceTextarea();
var _125=function(_126){
ColdFusion.RichText.setValue(id,_126);
};
_123._cf_setValue=_125;
var _127=function(){
if(ColdFusion.RichText.editorState[id]){
var _128=FCKeditorAPI.GetInstance(id);
return _128.GetXHTML();
}else{
ColdFusion.Log.error("richtext.initialize.getvalue.notready","widget",[id]);
return null;
}
};
_123._cf_getAttribute=_127;
var _129=function(_12a,_12b,_12c){
var _12d=document.getElementById(id);
if(_12d){
ColdFusion.Event.addListener(_12d,_12a,_12b,_12c);
}
};
_123._cf_register=_129;
_123._cf_name=name;
ColdFusion.objectCache[name]=_123;
ColdFusion.objectCache[id]=_123;
ColdFusion.RichText.registerAfterSet(id);
ColdFusion.Log.info("richtext.initialize.success","widget",[name]);
};
ColdFusion.RichText.editor_onfocus=function(_12e){
_12e.ToolbarSet.Expand();
};
ColdFusion.RichText.editor_onblur=function(_12f){
_12f.ToolbarSet.Collapse();
};
ColdFusion.RichText.setChangeBuffer=function(_130){
ColdFusion.RichText.buffer=FCKeditorAPI.GetInstance(_130.Name).GetXHTML();
};
ColdFusion.RichText.resetChangeBuffer=function(_131){
if(ColdFusion.RichText.buffer!=FCKeditorAPI.GetInstance(_131.Name).GetXHTML()){
ColdFusion.RichText.fireChangeEvent(_131.Name);
}
ColdFusion.RichText.buffer=null;
};
ColdFusion.RichText.registerAfterSet=function(_132){
if(ColdFusion.RichText.editorState[_132]){
var _133=function(){
ColdFusion.RichText.fireChangeEvent(_132);
};
var _134=FCKeditorAPI.GetInstance(_132);
_134.Events.AttachEvent("OnAfterSetHTML",_133);
}else{
setTimeout("ColdFusion.RichText.registerAfterSet('"+_132+"')",1000);
}
};
ColdFusion.RichText.getEditorObject=function(_135){
if(!_135){
ColdFusion.handleError(null,"richtext.geteditorobject.missingtextareaname","widget",null,null,null,true);
return;
}
var _136=ColdFusion.objectCache[_135];
if(_136==null||FCKeditor.prototype.isPrototypeOf(_136)==false){
ColdFusion.handleError(null,"richtext.geteditorobject.notfound","widget",[_135],null,null,true);
return;
}
return FCKeditorAPI.GetInstance(_136.richtextid);
};
ColdFusion.RichText.setValue=function(_137,_138){
if(ColdFusion.RichText.editorState[_137]){
var _139=FCKeditorAPI.GetInstance(_137);
_139.SetHTML(_138);
}else{
setTimeout("ColdFusion.RichText.setValue(\""+_137+"\",\""+_138+"\")",1000);
}
};
ColdFusion.RichText.fireChangeEvent=function(_13a){
var _13b=ColdFusion.objectCache[_13a];
ColdFusion.Log.info("richtext.firechangeevent.firechange","widget",[_13b._cf_name]);
var _13c=document.getElementById(_13a);
if(_13c){
if(_13c.fireEvent){
_13c.fireEvent("onchange");
}
if(document.createEvent){
var evt=document.createEvent("HTMLEvents");
if(evt.initEvent){
evt.initEvent("change",true,true);
}
if(_13c.dispatchEvent){
_13c.dispatchEvent(evt);
}
}
}
ColdFusion.Event.callBindHandlers(_13a,null,"change");
};
function FCKeditor_OnComplete(_13e){
if(_13e.Config.Toolbaronfocus){
_13e.Events.AttachEvent("OnBlur",ColdFusion.RichText.editor_onblur);
_13e.Events.AttachEvent("OnFocus",ColdFusion.RichText.editor_onfocus);
}
_13e.Events.AttachEvent("OnFocus",ColdFusion.RichText.setChangeBuffer);
_13e.Events.AttachEvent("OnBlur",ColdFusion.RichText.resetChangeBuffer);
ColdFusion.RichText.editorState[_13e.Name]=true;
if(ColdFusion.RichText.OnComplete){
ColdFusion.RichText.OnComplete(_13e);
}
}
