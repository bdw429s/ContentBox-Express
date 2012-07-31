﻿/*
Copyright (c) 2012 Ortus Solutions, Corp. All rights reserved.
openRemoteModal() is part of ContentBox js
*/
(function(){
	//Section 1 : Code to execute when the toolbar button is pressed
	var a= {
		exec:function(editor){
			// Open the selector widget dialog.
			openRemoteModal( getModuleURL('google-prettify', 'Home.entry'), {editorName: editor.name} );
		}
	},
	//Section 2 : Create the button and add the functionality to it
	b='cbGooglePrettify';
	CKEDITOR.plugins.add(b,{
		init:function(editor){
			editor.addCommand(b,a);
			editor.ui.addButton('cbGooglePrettify',{
				label:'Embed Pretty Code',
				icon: this.path + 'code.png',
				command:b
			});
			// context menu
			if (editor.addMenuItem) {
				// A group menu is required
				editor.addMenuGroup('contentbox');
				// Create a menu item
				editor.addMenuItem('cbGooglePrettify', {
					label: 'Embed Pretty Code',
					command: b,
					icon: this.path + 'code.png',
					group: 'contentbox',
					order: 4
				});
			}
			if (editor.contextMenu) {
				editor.contextMenu.addListener(function(element, selection) {
					return { cbGooglePrettify: CKEDITOR.TRISTATE_ON };
				});
			}
		}
	});
})();
