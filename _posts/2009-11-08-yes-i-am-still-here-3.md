---
id: 78
title: Yes I am Still Here
date: 2009-11-08T12:23:10-04:00
author: John
layout: post
guid: http://johngilliland.wordpress.com/2009/11/08/yes-i-am-still-here-3/
permalink: /2009/11/08/yes-i-am-still-here-3/
categories:
  - Personal
  - Programming
tags:
  - 'C#'
  - Programming
  - Work
---
I am working from home, thru my Elusive Development company, on a side project to develop a windows forms app with several components.

It is a very interesting project so far, but I am only a couple of weeks in to it.  In the end it will be a couple of windows forms apps.  One for the client and one for the end user, as well as a windows service that will handle timing and the win32 api calls.  The service will use the api to create a new desktop and then create a process w/in that desktop and switch to it, effectively taking over the users computer with  the new desktop.  The user is ultimately forced to deal with the, now in the foreground, application in order to get back to what they were originally doing.  Pretty sweet.  I am building it using C# for the 2.0 framework.  I opted for 2.0 versus 3.5 in order to prevent requiring the user to have 3.5 installed.  As folks get the 2.0 framework w/sp3 for xp, I am pretty much guaranteed my target platform for that os on up to windows 7.

For those interested I am using a plugin archictecture that utilizes the Abstract Factory and Template Method design patterns so far.  Dll assemblies with new types and usercontrols for those types are loaded at runtime and instantiated using factories.  Neato... 