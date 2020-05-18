---
id: 126
title: "Git Bash & Console2, Finally!"
date: 2012-12-22T01:09:55-04:00
author: John
layout: post
guid: http://johngilliland.wordpress.com/?p=126
permalink: /2012/12/22/git-bash-console2-finally/
tagazine-media:
    - 'a:7:{s:7:"primary";s:87:"http://johngilliland.files.wordpress.com/2012/12/2012-12-22_rescuetimeweeklysummary.png";s:6:"images";a:5:{s:87:"http://johngilliland.files.wordpress.com/2012/12/2012-12-22_rescuetimeweeklysummary.png";a:6:{s:8:"file_url";s:87:"http://johngilliland.files.wordpress.com/2012/12/2012-12-22_rescuetimeweeklysummary.png";s:5:"width";i:843;s:6:"height";i:1030;s:4:"type";s:5:"image";s:4:"area";i:868290;s:9:"file_path";b:0;}s:75:"http://johngilliland.files.wordpress.com/2012/12/2012-12-21_dell_speccy.png";a:6:{s:8:"file_url";s:75:"http://johngilliland.files.wordpress.com/2012/12/2012-12-21_dell_speccy.png";s:5:"width";i:425;s:6:"height";i:501;s:4:"type";s:5:"image";s:4:"area";i:212925;s:9:"file_path";b:0;}s:80:"http://johngilliland.files.wordpress.com/2012/12/2012-12-22_console2_opacity.png";a:6:{s:8:"file_url";s:80:"http://johngilliland.files.wordpress.com/2012/12/2012-12-22_console2_opacity.png";s:5:"width";i:633;s:6:"height";i:405;s:4:"type";s:5:"image";s:4:"area";i:256365;s:9:"file_path";b:0;}s:82:"http://johngilliland.files.wordpress.com/2012/12/2012-12-22_gitbashtabsettings.png";a:6:{s:8:"file_url";s:82:"http://johngilliland.files.wordpress.com/2012/12/2012-12-22_gitbashtabsettings.png";s:5:"width";i:537;s:6:"height";i:550;s:4:"type";s:5:"image";s:4:"area";i:295350;s:9:"file_path";b:0;}s:87:"http://johngilliland.files.wordpress.com/2012/12/2012-12-22_desktopshortcutsettings.png";a:6:{s:8:"file_url";s:87:"http://johngilliland.files.wordpress.com/2012/12/2012-12-22_desktopshortcutsettings.png";s:5:"width";i:377;s:6:"height";i:533;s:4:"type";s:5:"image";s:4:"area";i:200941;s:9:"file_path";b:0;}}s:6:"videos";a:0:{}s:11:"image_count";i:5;s:6:"author";s:7:"1621794";s:7:"blog_id";s:7:"1553479";s:9:"mod_stamp";s:19:"2012-12-22 07:36:02";}'
publicize_reach:
    - 'a:2:{s:2:"fb";a:1:{i:2335287;i:44;}s:2:"wp";a:1:{i:0;i:1;}}'
categories:
    - Programming
    - Work
---

I have seen this information in various places and in various pieces and finally have taken the time and effort to put it together and implement a working solution on my work machine. First a bit of context for the situation and my motivations.

My work machine is pretty much my only machine. I have an older personal laptop that I do not use much anymore. It is a ThinkPad R50 that was manufactured in Apr. 2002, with a Centrino 1.0 ghz processor and an upgraded 2gb of RAM. It dual boots Windows XP and Ubuntu 12, and doesn't do much more. I have Visual Studio 2010 on it and up until this time last year it was my only machine and I still worked on it about 30-35 hours per week. In all honesty I can say that it is the best laptop I have ever owned (not used) and by best I do not mean the most powerful, but just the best overall. It is a horse, I bought it used from my best friend for something like \$150, but I don't really remember. He had had it for a few years and put the extra memory in it. I have used it steadily as my only personal machine ever since and it has served me well. Okay, enough about my old laptop, as it is just that, my <strong>old</strong> laptop.

These days I am using my work machine as both my work machine and my personal machine. To qualify that however, I need to say that I do not spend an inordinate amount of time in front of it outside of work. I do use it to keep my iTunes library and sync my iPhone 4s, on which I listen to many audio books and watch many cartoon episodes. I also use it to download media and some light research. Otherwise it is work-related, to the tune of an average of 40-45 hours per week, with the 40 being billed to work. On that topic, I have been using <a title="Rescue Time" href="http://www.hanselman.com/blog/ProductivityAndContinuousImprovementMeasurementAndRescueTimeMakesItHappenBothPersonallyAndAtWork.aspx" target="_blank">RescueTime</a> at the behest of <a title="Excellent post about guilt and productivity at work, I couldn't relate more!" href="http://www.hanselman.com/blog/ProductivityVsGuiltAndSelfLoathing.aspx" target="_blank">Scott Hanselman</a>, whose writing on <a title="" href="http://www.hanselman.com/blog/ItsNotWhatYouReadItsWhatYouIgnoreVideoOfScottHanselmansPersonalProductivityTips.aspx" target="_blank">productivity</a> and what <a title="Great stuff.  I really relate, except I wish I had learned half of what Scott has..." href="http://www.hanselman.com/blog/ImAPhonyAreYou.aspx" target="_blank">being a developer feels like</a> I cannot recommend enough. So, due to RescueTime, I know a little more about how much I use my computer and what I do on it, it is really cool. Nice little summary at the end of each week, certainly helps me feel a little less guilty and a little more like I should about myself, I really do work hard.

<figure>
<img alt="RescueTime weekely summary email sample." src="/assets/images/2012-12-22_rescuetimeweeklysummary.png" width="245" height="300" /> 
<figcaption>This is an example of the weekly summary I get from the RescueTime utility. This is from a week or two ago.</figcaption></figure>

But, I digress. My new machine (well I have had it about 11 months and it was new when I got it) is a Dell Precision and much more of a beefcake than the thinkpad. Here are the specs, just cause I like <a title="Cool system information from Piriform." href="http://www.piriform.com/speccy" target="_blank">Speccy</a> and enjoy an excuse to use it.

<figure>
<a href="http://johngilliland.net/2012/12/22/git-bash-console2-finally/2012-12-21_dell_speccy/" rel="attachment wp-att-127"><img alt="2012-12-21_Dell_Speccy screenshot" src="/assets/images/2012-12-21_dell_speccy.png" width="254" height="300" /></a> 
<figcaption>Speccy summary for my current daily, a Dell Precision M4600.</figcaption></figure>

<strong>Git Bash and Console2, so what about 'em...</strong>

At work we use a product called <a title="Seapine's Surround SCM " href="http://www.seapine.com/surroundscm.html" target="_blank">Surround SCM</a> (and its companion defect suite, <a title="Seapine's Test Track Pro" href="http://www.seapine.com/testtrack.html" target="_blank">Test Track Pro</a>) by Seapine Software. These two products track all our work including feature requests, action items and defects, and the source itself. The products work in tandem with each other and are an integral part of our SDLC. I cannot check in any source code with out an attached item in TTP. Unfortunately, Surround uses the <a title="Centralized vs. Distributed VCS" href="http://blogs.atlassian.com/2012/02/version-control-centralized-dvcs/" target="_blank">centralized version control system</a> that uses the check out -&gt; edit -&gt; check in workflow just like visual source safe did. Where as Git, is a <a title="Distributed Version Control" href="http://betterexplained.com/articles/intro-to-distributed-version-control-illustrated/" target="_blank">distributed version control system</a> that uses a pull changes -&gt; work -&gt; push changes model that is much more conducive to multiple developers and branching/merging.

I use <a title="Why is Git So Cool?" href="http://betterexplained.com/articles/aha-moments-when-learning-git/" target="_blank">Git</a> locally on my laptop to track changes while I am working on various tasks.  Git allows me to keep track of larger features and tasks that might take me days to complete.  I can do smaller, incremental commits and use branching to go on tangents and to handle some smaller fix that has to take priority.  All the while I keep my master branch in sync with the centralized Surround repository.  I do not push to any remote repository with Git, I simply use it to track my Source directory on my local machine.  It could be called local revision control for my working copy of the code.  That might sound complicated and like too much work that is unnecessary but I find that it is working well for me so far (it hasn't been that long).

Enter another tool, one that I have used for a long time, several years at least, <a title="I think this is the first place I heard about Console2" href="http://www.hanselman.com/blog/ABetterPROMPTForCMDEXEOrCoolPromptEnvironmentVariablesAndANiceTransparentMultiprompt.aspx" target="_blank">not exactly sure</a>.  And that is a command prompt replacement for windows called <a title="Thanks again to Scott Hanselman for the recommendation!" href="http://www.hanselman.com/blog/Console2ABetterWindowsCommandPrompt.aspx" target="_blank">Console2</a> that provides a tabbed command console interface with improved usability over the clunky default Windows command prompt.  I use one other console application lately that is a MinGW32 instance that is a bash shell installed with the <a title="Git for Windows home page." href="http://msysgit.github.com/" target="_blank">Git for Windows</a> package.  Now we come to the issue, and I apologize for how long it took to get here.  Console2's tabbed interface is nice and open on my desktop most of the day but I have to use the Git Bash shortcut to open the shell for working with Git.  So I went out a few months ago and did some Googlin' and got some instructions for setting up a Git tab withing my <a title="Thanks again to Scott Hanselman for the recommendation!" href="http://www.hanselman.com/blog/Console2ABetterWindowsCommandPrompt.aspx" target="_blank">Console2</a>, but it never worked right.  it would open up but would not initialize and show the prompt.  So after spending a little bit of time fooling with it I gave up and just used two separate command windows, one for Git and one for everything else (I also have a VS Command Prompt tab that works great and saves me finding the shortcut when I need it).

<figure><img alt="Console2 with lowered opacity" src="/assets/images/2012-12-22_console2_opacity.png" width="300" height="191" />
<figcaption> I have the opacity set lower when Console does not have focus.</figcaption></figure>

That is, until today.  I had a very interesting day that led me down several research paths solving problems most of the day, I have actually been working, except for meal breaks, since 7am this morning (I  looked at the system clock and see that it is 12:04am, haven't done this in a while).  <strong>I now have a working Git Bash prompt in a Console2 tab</strong>.  Alongside my VS Command Prompt tab and my Cygwin shell tab.  And, oddly, I have sat here for the last 45 minutes copying unrelated links and including way too much detail in this post just so that I could share the solution with... well, probably no one.  But maybe someone, even a few people.  I am going to include screenshots and form field values for several things, as well as links to where I found the information and that should get anyone there.

<figure><img title="Console2 Tab Settings Dialog" alt="Git Bash settings in Console2" src="/assets/images/2012-12-22_gitbashtabsettings.png" width="292" height="300" />
<figcaption>Here is the actual settings dialog with the values that work for me.</figcaption></figure>

The <a title="Git for Windows home page." href="http://msysgit.github.com/" target="_blank">Git for Windows</a> package is installed in the C:Program Files (x86)Git directory.  Here are the settings for the Console2 tab for the Git Bash prompt:

<strong>  Title</strong>: Git Bash
<strong>Icon</strong>: C:Program Files (x86)Gitetcgit.ico
<strong>Shell</strong>: C:Program Files (x86)Gitbinsh.exe --login -i
<strong>Startup Dir</strong>: %HOMEDRIVE%%HOMEPATH%

To the left here is the settings dialog with the above values in place where they go in the form.  These values work for me with the install directory in the previous paragraph.  It doesn't matter where you have C<a title="Thanks again to Scott Hanselman for the recommendation!" href="http://www.hanselman.com/blog/Console2ABetterWindowsCommandPrompt.aspx" target="_blank">onsole2</a> installed (it is standalone anyways), at least not at this point.

Next I will show you how I have setup a shortcut on my desktop that will open an instance of the Console with the Git Bash tab initialized rather than the default tab, which is just  the regular command prompt.

The desktop shortcut does, of course depend on where you have installed the Console2 directory.  I have mine installed, surprisingly enough, in the C:Program Files (x86)Console2 directory.  Which results in the following values for the shortcut, created blank by right-clicking on the desktop and selecting New -&gt; Shortcut.

<figure><img alt="Git Bash Console2 Shortcut" src="/assets/images/2012-12-22_desktopshortcutsettings.png" width="212" height="300" />
<figcaption> Settings for the desktop shortcut that opens Console2 with the Git Bash tab loaded.</figcaption></figure>

You need the extra set of quotes around the target value as it has separate quoted values that must be grouped with the outer quotes.  Without these extra outer quotes I was getting an error message saying that the Target value was invalid when I tried to save the shortcut.

<strong>Target</strong>: ""C:Program Files (x86)Console2Console.exe" -t "Git Bash""

<strong>Start In:</strong> %HOMEDRIVE%%HOMEPATH%

Finally I will include the link where I finally found some accurate information.  My settings are different as I use some different values of course, as you well may depending on your system.  There is also another tidbit here that I have used to create a right-click shortcut, but only the one for right-clicking on a file and being offered a choice to open "Git Bash Here."  I am not entirely sure how much I will use this one, but I went ahead and added it anyways.  Just opened Regedit and followed the instructions.

So, there it is, after too much ado.  Cheers!
