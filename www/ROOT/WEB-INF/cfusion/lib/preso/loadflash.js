function showFlash(swf, w, h, loop)
{
	var isMSIE = navigator.appName.indexOf("Microsoft") != -1;
	var s = '';
	s += '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,65,0" width="'+w+'" height="'+h+'" id="SlideContent" align="" VIEWASTEXT>'
	s += '<param name="movie" value="'+swf+'" />'
	s += '<param name="menu" value="false" />'
	s += '<param name="quality" value="best" />'
	s += '<param name="loop" value="'+loop+'" />'
	s += '<param name="FlashVars" value="initialURL='+document.location+'&isMSIE='+isMSIE+'&useBSM=false" />'
	s += '<embed src="'+swf+'" FlashVars="initialURL='+document.location+'&isMSIE='+isMSIE+'&useBSM=false" menu="false" quality="best" width="'+w+'" height="'+h+'" loop="'+loop+'" name="SlideContent" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" swLiveConnect="true"></embed>'
	s += '</object>'
	// in theory, we should always embed in a table, but in practice, IE6 malfunctions
	// when width & height = 100%, but in that case, we don't really need the table anyway.
	if ((w.toString().indexOf('%') == -1) && (h.toString().indexOf('%') == -1))
	{
		s = '<table border=0 width="100%" height="100%"><tr valign="middle"><td align="center">' +
			s +
			'</td></tr></table>';
	}
	document.write(s);
}
