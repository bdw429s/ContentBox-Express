﻿<cfoutput>
<div class="box clear">
	<!--- Body Header --->
	<div class="header">
		<img src="#prc.cbroot#/includes/images/mediamanager.png" alt="media manager" />
		Media Manager :
		#html.select(options=prc.libraryOptions, class="textbox", onchange="switchLibrary(this.value)")#
	</div>
	<!--- Body --->
	<div class="body">

		<!--- messageBox --->
		#getPlugin("MessageBox").renderit()#

		<!--- FileBrowser Viewlet --->
		#runEvent(event=prc.xehFileBrowser,eventArguments=prc.fbArgs)#

	</div>
</div>
</cfoutput>