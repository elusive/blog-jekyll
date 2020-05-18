---
id: 93
title: "Whist Card Game in C# and WPF"
date: 2012-11-26T10:23:47-04:00
author: John
layout: post
guid: http://johngilliland.wordpress.com/?p=93
permalink: /2012/11/26/whist-card-game-in-c-and-wpf/
categories:
    - Personal
    - Programming
---

Greetings all, I am hopefully going to have some time over the next few weeks as my current project at work ramps down and I await the next one. I have begun a new side project to use some of this time toward and plan to make a few posts about it. I am writing a card game, which might seem cliché, but it is something I have always wanted to do and it is going to be a game that you don't see very often.

I like cards and I play both bridge and whist whenever I get a chance, which is not very often. It is hard to find people to play and consequently I want a computer game to play. I am going to start with a base <a href="https://github.com/Eric-Guo/silverlight-cards-game">solitaire game for Silverlight</a> [thanks to Eric Guo] that has a decent card and deck class that make it easy to quickly show the cards on the screen. I have put together a quick starter application that has a nice felt background and that will deal the cards out and I just added sorting, as one would for bridge, but with uptown and downtown (hi/lo) options for sorting both ways for <a href="http://en.wikipedia.org/wiki/Bid_whist" title="Bid Whist" target="_blank">Bid Whist</a> hands.

The key feature will be the Artificial Intelligence component that will play the other three hands. This is not a simple task and is certainly where the challenge lies. My first attempt will likely use more heuristics than anything, a rule based player. It will certainly be a work in progress for a long time to come. I will publish to my <a href="https://github.com/elusive" title="GitHub account" target="_blank"></a> as soon as I set it up. For now here is a screenshot of what I have:

<figure><img src="/assets/images/whistle_one.png" alt="" title="Dealt and sorted" width="300" height="250" /><figcaption> Deal and sort for Whist hand...</figcaption></figure>
One thing I want to note is how I solved the problem of converting the Silverlight xaml I got from the sample project into WPF xaml that would run.  The problem that occurred in multiple places and in almost all animations, such as just moving a card was the same.  The Silverlight application had code for nice move animations and a nice flip animation that I am planning to reuse.  But, in WPF you must have a valid, preset Top and Left value on the item you wish to manipulate.  This is not so in Silverlight and causes a common NaN error.  The answer I found at <a href="http://stackoverflow.com/questions/669071/canvas-gettop-returning-nan" title="Stackoverflow"></a> and showed me how to get a rendered top and left value.  Instead of using:
<code>var dx = Canvas.GetLeft(deck);
var dy = CanvasGetTop(deck);</code>
which will result in a NaN error if you try to use the value returned.  You have to use:
<code>var offset = VisualTreeHelper.GetOffset(deck);
var dx = offset.X;
var dy = offset.Y;
</code>
This GetOffset method will give you the rendered positional values for your element.

#### Update: 2020-05-01

Though I never had time to finish this project, there is a decent beginning still on my github (it is called _Whistle_), and I refuse to say I will never finish it!
[Link to the repo](https://github.com/elusive/Whistle)
Feel free to fork and run.
