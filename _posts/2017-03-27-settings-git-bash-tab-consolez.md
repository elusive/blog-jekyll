---
title: Settings for a Git-Bash Tab in ConsoleZ
author: jogi
date: 2017-03-27T12:49:37-04:00
excerpt_separator: <p>I tried
layout: post
---

<p>This article describes how to setup Git-Bash as its own tab inside of <a href="https://chocolatey.org/packages/ConsoleZ">ConsoleZ</a>, the command prompt replacement application.  So here I go again. In using <a href="https://www.chocolatey.org">Chocolatey</a>, the package manager for Windows, to install <a href="https://chocolatey.org/packages/Console2">Console2</a> on my work machine I somehow ended up with what I guess is the latest iteration.
I make this assumption because the menus are very similar, particularly the settings dialogs, etc. I really like the look and feel changes in <a href="https://chocolatey.org/packages/ConsoleZ">ConsoleZ</a>, and there are some new tab related features as well. It looks like <a href="https://chocolatey.org/packages/Console2">Console2</a> is no longer maintained and so this fork is now the go to console replacement. No problem except this means I needed to get <a href="https://chocolatey.org/packages?q=git+bash">Git Bash</a> working again in its own tab,
within <a href="https://chocolatey.org/packages/ConsoleZ">ConsoleZ</a>.</p>


<p>I tried my existing settings but they did not work, which means that my previous article on the subject, which is by far the most viewed item on my quiet little blog, is no longer good. Well, at least it doesn't work for <a href="https://chocolatey.org/packages/ConsoleZ">ConsoleZ</a>, only the older <a href="https://chocolatey.org/packages/Console2">Console2</a> (which by the way, is still available if you want it, though no longer maintained). So, I needed to perform some trial and error to get it working again.</p>
<p style="text-align: center;"><img class="alignnone" src="/assets/images/032717_1636_GitBashinCo1.png" alt="Properties dialog for Git-Bash shortcut." width="381" height="569" /></p>
<p style="text-align: center;"><span style="color: #44546a; font-size: 9pt;"><em>Figure 1: Properties for Git-Bash shortcut in Start Menu</em></span></p>
I began with the Properties dialog for the Git-Bash Start Menu shortcut, which led me to its program folder. For the record I did try simply copying and pasting the Target value into the new Tab's "Shell" setting, but that didn't work. It opened Git-Bash in its normal window after an error dialog informed me that it was not a console application.

Once the easy guess failed, I tried a few more guesses until I got it right. I ended up looking in the /bin directory inside the Git program folder, which seemed a likely spot for what I wanted. In there were only three choices, so finding the right one wasn't that hard. It was much easier than figuring this out the first time for Console2.

<strong>The Solution...</strong>
<p style="text-align: center;"><img class="alignnone" src="/assets/images/032717_1636_GitBashinCo2.png" alt="Settings dialog for Git-bash in ConsoleZ tab." width="681" height="734" /></p>
<p style="text-align: center;"><span style="color: #44546a; font-size: 9pt;"><em>Figure 2: Tab Settings for Git-Bash
</em></span></p>
So, without further malarkey, here is the correct settings for a Git-Bash tab in <a href="https://chocolatey.org/packages/ConsoleZ">ConsoleZ</a>. Essentially just the Shell value this time. The extras required in previous version are not needed here, this works fine. You can see me at work in the background in a repository. The first tab is a regular PS prompt but the foreground one is our Git-Bash prompt, alive and well in the latest <a href="https://chocolatey.org/packages/ConsoleZ">ConsoleZ</a>!

Much thanks to the maintainers of <a href="https://chocolatey.org/packages/ConsoleZ">ConsoleZ</a>:
<ol>
 	<li><a href="https://chocolatey.org/profiles/cbucher">cbucher</a></li>
 	<li><a href="https://chocolatey.org/profiles/chrisz">chrisz</a></li>
</ol>
Look at their profiles and click on the <a href="https://github.com/cbucher/console/wiki">ConsoleZ wiki</a> for the project's home!
