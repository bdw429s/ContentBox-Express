var slidenumber = 0;
var slides;

window.onload = startup;

function startup()
{

		slides = collectSlides();
		document.onkeydown  = keyPressed;
		document.onclick = mouseButtonClicked;
		showfirst();
   
}

//function collectSlides()
//{
//	var slides = new Array();
//	slides[0] = "ticer_slide0.html";
//
//	return slides;
//}

// Start coldfusion collectSlides

// end collectSlides

function GetWidth()
{
	return window.document.body.clientWidth -10;
}

function GetHeight()
{
	return window.document.body.clientHeight - 100;
}

function display(slideno)
{
	var totalslide;
	var currentslide;
	var height = GetHeight();
	var width = GetWidth();

	document.getElementById("iframe").src = slides[slideno];
	document.getElementById("iframe").width = width;
	document.getElementById("iframe").height = height;		
    totalslide = slides.length ;
	currentslide = slideno + 1;
	document.getElementById("div1").innerHTML = "slide "+currentslide+" / "+totalslide   ;
	document.getElementById("div2").innerHTML = "slide "+currentslide+" / "+totalslide   ;

}

function setTitle() {
	document.getElementById("iframe").title = "test";
}

function mouseButtonClicked(e)
{
	// shownext();
}

function shownext()
{
    if (slidenumber < slides.length-1)
	{
	     slidenumber = slidenumber + 1;
	} else
	{
		slidenumber = 0;
	}
	display(slidenumber);
}

function showprevious()
{
    if (slidenumber == 0)
	{
		slidenumber = slides.length - 1;
	}else
	{
    	slidenumber = slidenumber - 1;
	}
	display(slidenumber);
}
function showfirst()
{
	slidenumber = 0;
	display(slidenumber);
}

function showlast()
{
	slidenumber = slides.length  - 1;
	display(slidenumber);
}

function keyPressed(event)
{
    var key;

    if (!event)
      var event = window.event;

    if (window.event)
       key = window.event.keyCode;
    else if (event.which)
       key = event.which;
    else
       return true; 

	if (!key)
       return true;

    switch(key)
	{
		case 32: //space bar
		   shownext();
		   break;
		case 37: // left key
		   showprevious();
		   break;
		case 39: // right key
		   shownext();
		   break;
		case 36: // home
		   showfirst();
		   break;
		case 35:
		   showlast();
		   break;
		default:
		   //shownext();
	}
		
    return true;
}
