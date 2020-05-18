---
id: 16
title: "C# Extension Method and Lambda Expressions"
date: 2009-01-07T15:40:22-04:00
author: John
layout: post
guid: http://johngilliland.wordpress.com/?p=16
permalink: /2009/01/07/c-extension-method-and-lambda-expressions/
image_size:
    - 'a:6:{i:0;s:3:"349";i:1;s:3:"281";i:2;s:1:"3";i:3;s:24:"width="349" height="281"";s:4:"bits";s:1:"8";s:4:"mime";s:9:"image/png";}'
image_md5:
    - d41d8cd98f00b204e9800998ecf8427e
image_url:
    - http://johngilliland.wordpress.com/files/2009/01/meetscriteria.png
image_tag:
    - '<img src="http://johngilliland.wordpress.com/files/2009/01/meetscriteria.png?w=560" class="size-full wp-image-25 " title="Code for MeetsCriteria extension method."   alt="Code for MeetsCriteria extension method."    />'
image_colors_bg:
    - 'a:11:{i:0;s:6:"000000";s:2:"+1";s:6:"262626";s:2:"+2";s:6:"404040";s:2:"+3";s:6:"808080";s:2:"+4";s:6:"bfbfbf";s:2:"+5";s:6:"e6e6e6";i:-1;s:6:"000000";i:-2;s:6:"000000";i:-3;s:6:"000000";i:-4;s:6:"000000";i:-5;s:6:"000000";}'
    - 'a:11:{i:0;s:6:"000000";s:2:"+1";s:6:"262626";s:2:"+2";s:6:"404040";s:2:"+3";s:6:"808080";s:2:"+4";s:6:"bfbfbf";s:2:"+5";s:6:"e6e6e6";i:-1;s:6:"000000";i:-2;s:6:"000000";i:-3;s:6:"000000";i:-4;s:6:"000000";i:-5;s:6:"000000";}'
image_colors_fg:
    - 'a:11:{i:0;s:6:"808080";s:2:"+1";s:6:"bfbfbf";s:2:"+2";s:6:"ffffff";s:2:"+3";s:6:"000000";s:2:"+4";s:6:"000000";s:2:"+5";s:6:"000000";i:-1;s:6:"808080";i:-2;s:6:"808080";i:-3;s:6:"808080";i:-4;s:6:"808080";i:-5;s:6:"808080";}'
    - 'a:11:{i:0;s:6:"808080";s:2:"+1";s:6:"bfbfbf";s:2:"+2";s:6:"ffffff";s:2:"+3";s:6:"000000";s:2:"+4";s:6:"000000";s:2:"+5";s:6:"000000";i:-1;s:6:"808080";i:-2;s:6:"808080";i:-3;s:6:"808080";i:-4;s:6:"808080";i:-5;s:6:"808080";}'
categories:
    - "C#"
    - Programming
    - Work
tags:
    - "C# 3.0"
---

Recently I have been trying to learn more about the new language features in C# 3.0, and I have enjoyed what I have found thus far.  Especially both the var keyword and extension methods, but I had yet to really implement anything using lambdas.  That is until today...

One of the things I have done with <a title="Argument Validation using C# Extension Methods" href="http://johngilliland.wordpress.com/2009/01/07/argument-validation-using-c-30-extension-methods/">extension methods</a> was to implement some really sweet method argument validation stuff.  I had read several related blog entries regarding this subject and had whipped up a variation [actually just a much smaller set of what they had already come up with as my needs were much less] of their ideas for use in a project I am working on [and likely in future projects].   And, as it turns out, this same bit of features afforded me the opportunity to check out lambda expressions as well, and to hopefully this time add something of value to build on their work instead of just reusing it.

Okay so the scene is set, with me at my desk at work, coding a unit test for what I hope will be a new feature on my current project [dynamically executed reports from xml definition files, like rdl but much much simpler]...

I was about to use the argument extension methods to validate an integer that I needed to be in a certain range and it occured to me how nice it would be if I could just pass in an expression that evaluated to a boolean result similar to what I would do if I was writing in javascript.  Yeah, that would be extra nice!  So, off I went back to GOG to do some research on passing an expression as an argument to a function in C#.  My research led me straight to <a title="Lambda Expressions, new C# 3.0 Feature" href="http://weblogs.asp.net/scottgu/archive/2007/04/08/new-orcas-language-feature-lambda-expressions.aspx">lambda expressions</a> and exactly what I needed to make my new extension method work.

<p style="padding-left:30px;">My goal was to be able to implement something like the following psuedo-code:</p>

```cs
public void MyFunction(int myInt)
{
    RequireThat(myInt).MeetsCriteria("myInt &gt; 0");
}
```

Thus being able to use some very smooth and descriptive code to validate my integer argument before using it in the function, or atleast something as close to that effect as I could get.

Well lambda expressions were exactly the ticket, specifically the <a title="MSDN Reference for Func&lt;T, TResult&gt; delegate type." href="http://msdn.microsoft.com/en-us/library/bb549151.aspx">Func&lt;T, TResult&gt;</a> delegate type.  Which basically allows me to pass a method that accepts one parameter of type T and returns a result of type TResult as a parameter to another method, without defining a custom delegate type of my own.  A kinda anonymous delegate type construct if you will.  Lambda expressions use this type as an arg for the <a title="Code Project Article on Expressions" href="http://www.codeproject.com/KB/linq/Expressions.aspx">Expression&lt;T&gt;(Func&lt;T, TResult)</a> type constructor.   I have done some of this preliminary reading on Expression Trees and such and it is heady stuff, but interesting none the less.  I look forward to someday being able to apply it to a real world problem.

But today I was able to apply lambdas to my real world problem like so:

I needed an extension method for my <a title="Argument validation with extension methods." href="http://johngilliland.wordpress.com/2009/01/07/argument-validation-using-c-30-extension-methods/">Generic argument wrapper</a> that would allow me to pass in a simple expression predicate with which to validate the argument.  And here is what I came up with:

<figure><img class="size-full wp-image-25 " title="Code for MeetsCriteria extension method." src="/assets/images/meetscriteria.png" alt="Code for MeetsCriteria extension method." width="349" height="281" /></figure>

Now this code allows me to pass in a lambda expression that I wish to use to validate an integer argument for my method [or any integer for that matter].  This method was added to my existing argument validation extension methods setup as described in a previous post, already linked to a couple of times above, so it follows similar usage syntax, as such:

```cs
myIntArg.RequireThat(<span style="color:#800000;">"myIntArg"</span>).MeetsCriteria(...);
```

I also added a unit test for this new method into my existing test project for the rest of my validation extension methods, and so I will use that test method to show you a contextual usage of MeetsCriteria...

<figure><img class="size-full wp-image-26" title="meetscriteria.test.png" src="/assets/images/meetscriteriatest.png" alt="My unit test for MeetsCriteria method.  Testing that 21 is between 20 and 22." width="381" height="163" /></figure>

So, now I have actually used lambdas in a project at work, I am so very happy with myself.  And my quest to conquer C# 3.0 features continues... J
