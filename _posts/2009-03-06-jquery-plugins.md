---
id: 63
title: jQuery Plugins
date: 2009-03-06T02:18:14-04:00
author: John
layout: post
guid: http://johngilliland.wordpress.com/?p=63
permalink: /2009/03/06/jquery-plugins/
categories:
  - Programming
tags:
  - jquery
---
I thought that due to the fact that I have been working on pretty much nothing but jQuery at work for the last month or so, that I could come up with a post about some of what I have been doing.  First I should mention that I have really enjoyed it, challenging and at times frustrating though it was, it was equally if not more gratifying.  I had yet to have worked with any one particular library much, if any one prior to now it would have to have been just a little bit of jQuery here and there, playing really.  And certainly not trying to write my own plugin, of course as I said, until now.
<h2>The Task at Hand</h2>
My task began as a matching of functionality at minimum and ideally a surpassing of functionality in the area of product thumbnail/image viewing, as compared to one of our direct competitors on the web (our primary product is a print catalog).  One of our competitor's sites had a zooming feature and the ability to drag around the zoomed image to further examine it.  So off I went.  In the end I have matched the functionality but, I feel at least, surpassed them more in terms of usability and appearance.  Basically ours offers the same features as theirs, for now, but looks a lot slicker I think.  Rather I hope.  Anyways, I decided early on, if not immediately to implement the entire thing in jQuery as a plugin.  I wanted to challenge myself and I did.  And while it took me a bit longer I am much more satisfied and my skills with jQuery are much more improved.  

I should mention that just prior to this project I had been working on an ASP.NET site and model/api for describing reports with an xml schema and matching .NET model and delivering them via a web page.  I used an http handler to turn the xml file that described the report and its query and columns into rendered html with data embedded.  During that process I wrote a pagination plugin in jQuery that was actually my first official production quality plugin in jQuery.  Of course all it did was take in the details of the report and generate the links for next/prev and each page in a desired visible range.  So the image gallery was my  sophomore effort at writing a plugin.
<h2>The Process (sort of)</h2>
Well, let us just say that I have over twenty-five pages of notes that I wrote while I worked on this plugin.  I worked on it at home probably at least a fourth of the time if not a third, and I learned a whole lot about jQuery and about writing a larger scale plugin.  I basically went out on the web and looked for the different pieces of functionality that I needed, like zooming an image in and out by resizing it, and then dragging, and then the carousel for the thumbnails came at the very end.  There was quite a bit of math to figure out, but I was able to piece it together from scripts I found and really by just writing it out in my notes when I got stuck. 

Some things I was able to pull from existing plugins, like the zooming works with a couple of images (one for in and one for out) but it also works with the mousewheel movements (but only when the mouse is over the image view pane.  I was able to utilize the jquery.mousewheel.js plugin in order to get a delta value to use to determine whether to zoom in or out.  I already mentioned that I used a very minimalistic version of jcarousel lite to make the thumbnail slider (that requirement came later of course).  

One of the coolest things, I think, is that instead of placing a toolbar or a list of links below or above or even adjacent to the image being worked on, I went an extra mile (or two) to make a slide out/down toolbar that appears at the top of the view pane when you mouseover the image.  It wasn't easy, well of course jquery made the slide in/out very easy, but I had a really tough time getting 100% opacity button images and link text over top of a 70% opacity background for the see through toolbar effect.  But I eventually got it to work and I think the end result is a really nice effect.