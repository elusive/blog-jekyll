---
id: 223
title: "Console2 Tabs for GitBash, Cygwin, Powershell &amp; More"
date: 2013-08-12T17:38:16-04:00
author: John
layout: post
guid: http://johngilliland.net/?p=223
permalink: /2013/08/12/console2-tabs-for-gitbash-cygwin-powershell-more/
categories:
    - Programming
    - Work
---

<blockquote>I recently rebuilt my work machine, with a new SSD.  But that meant I had to setup Console2 again…</blockquote>
I recently rebuilt my work machine.  I have had my Dell Precision M4600 for almost two years now and it has served me well.  I started with 8gb of RAM and have upgraded to 16gb.  Despite the increase in ram though I had started to notice a slow down in performance, partly due to my frequent use of Visual Studio 2012 and the new Office 365 suite.  These newer apps use a lot of memory, a whole lot.  VS 2012 can easily use a gb of ram per instance if left open too long.  So I decided to ask for a hard drive upgrade and lucky me I received approval.  I promptly ordered a 256 gb Sandisk Ultra Plus SSD and eagerly awaited its arrival.

The drive arrived and aside from a slight snafu that cost me a 20 dollar part from ebay (I broke off the HD cover plate when removing the factory HD) the installation was fairly simple.  I cloned an M4600 Windows 7 x64 image our IT Manager gave me and was up and running in a couple of hours.  I did have to wait until the next morning to re-join the domain, but then I was off and running.  And I mean running!  The new drive is wicked fast.

I installed VS 2012 in about an hour (instead of the three it took when I first started) as well as Office 365 and a host of smaller utilities.  A small note about that, I cannot recommend enough the <a href="http://chocolatey.org/" target="_blank">Chocolatey package manager</a> for windows.  It was the first utility I installed and then I used it to install almost everything else, including things like:

<ul>
	<li>7zip</li>
	<li>AutoHotKey</li>
	<li>BeyondCompare 3</li>
	<li>Calibre</li>
	<li>Console2</li>
	<li>DaemonToolsLite</li>
	<li>Dropbox</li>
	<li>Filezilla</li>
	<li>Git</li>
	<li>iTunes</li>
	<li>GVim</li>
	<li>Notepad++</li>
	<li>Paint.Net</li>
	<li>Python</li>
	<li>SharpKeys  (I use this to map keys for my Apple Keyboard)</li>
	<li>uTorrent</li>
	<li>vlc</li>
</ul>
To get a list of all of the packages you have installed use the command:
<div>
<pre id="codeSnippet" class="csharpcode">cver all -localonly</pre>
</div>
<div>I was continually amazed at how easy it was.  I would be working and realize, for instance, that I needed to add some annotations to a wireframe for some documentation for my latest feature task, but I hadn’t installed paint.net yet.  So, I hit Win-Key, then type in Console and hit enter.  Then at the command line, I tried:</div>
<div>
<div>
<pre id="codeSnippet" class="csharpcode">cinst paint.net</pre>
</div>
<div>And it just worked.  It would search the packages find it and install it.  Bam!  Then I could hit Win-Key again and type in paint and select Paint.Net and hit enter and be working.  Super cool and super easy.  I really can’t say how much time it saved me and also how much space it saved me because I didn’t have to go out and search for installers and download them and forget to delete them when I was done.  Thanks to Chocolatey my downloads directory is practically empty.</div>
<h2>Console2 Setup</h2>
</div>
<div>A new machine meant I had to do some reconfiguring of my utilities, especially the ones I use the most, like <a href="https://www.google.com/search?q=console2" target="_blank">Console2</a>, or just <a href="http://sourceforge.net/projects/console/" target="_blank">Console</a> now.  I have previously published an article that contained my Console2 Setup and it has been quite a popular article, my most popular one on the site in fact.  And when I had to figure out how to do it all again I  thought a new article would be a good idea.  Especially because I have added even more tabs to this setup.</div>
<div><figure><img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border-width: 0px;" title="Console2 Tabs" src="/assets/images/2012-12-22_console2_tabs.png" alt="Console2 Tabs screenshot" width="260" height="219" border="0" /></figure>As you can see I have the following tabs available:</div>
<ul>
	<li>Windows Cmd Prompt</li>
	<li>Visual Studio Cmd Prompt</li>
	<li>Git Bash</li>
	<li>Cygwin</li>
	<li>Powershell</li>
</ul>
I was able to salvage some of my settings from my old hard drive by locating and copying the settings file from Console2 which for me was located in \AppData\Roaming\Console\console.xml but on my new build I am using a portable install of Console so that my settings file is in the Console2 directory.
<h3>Details</h3>
Here are the specifics.  I am assuming that you know enough about Console to open the settings and add a new tab and get to this screen:

<figure><img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border-width: 0px;" title="Console2 Settings" src="/assets/images/2012-12-22_gitbashtabsettings.png" alt="Console2 Settings Screenshot" width="254" height="260" border="0" /></figure>
And here is the goodies!  A detailed list of the settings for each tab that work for me.  I add that caveat because due to the differences in versions of Windows and install locations I cannot swear that my settings will work for you, but you should be able to use my settings to figure out how to make yours work…

<h5>Visual Studio Cmd Prompt</h5>
<ol>
	<li><strong>Title:  </strong>VS Cmd</li>
	<li><strong>Icon:  </strong>C:\Users\jgilliland\bin\Console2\vscommand.ico    (from <a title="Awesome Icons for Powershell and VS Cmd Prompt from Scott Hanselman" href="http://www.hanselman.com/blog/AwesomeVisualStudioCommandPromptAndPowerShellIconsWithOverlays.aspx" target="_blank" rel="Awesome Icons for Powershell and VS Cmd Prompt">Scott H.</a>)</li>
	<li><strong>Shell: </strong>%comspec% /k ""C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"" x86</li>
	<li><strong>Startup dir:</strong></li>
</ol>

<h5>Git Bash Shell</h5>
<ol>
	<li><strong>Title:  </strong>Git Bash</li>
	<li><strong>Icon:</strong>  C:\Program Files (x86)\Git\etc\git.ico</li>
	<li><strong>Shell:  </strong>C:\Program Files (x86)\Git\bin\sh.exe --login –i</li>
	<li><strong>Startup dir:  </strong>%HOMEDRIVE%%HOMEPATH%</li>
</ol>

<h5>Cygwin Shell</h5>
<ol>
	<li><strong>Title:  </strong>Cygwin</li>
	<li><strong>Icon:  </strong>C:\users\jgilliland\bin\Cygwin\Cygwin.ico</li>
	<li><strong>Shell:  </strong>C:\users\jgilliland\bin\Cygwin\Cygwin.bat</li>
	<li><strong>Startup dir:  </strong></li>
</ol>

<h5>Powershell</h5>
<ol>
	<li><strong>Title:  </strong>Powershell</li>
	<li><strong>Icon:  </strong>C:\Users\jgilliland\bin\Console2\vspowershell.ico  (from <a title="Awesome Icons for Powershell and VS Cmd Prompt from Scott Hanselman" href="http://www.hanselman.com/blog/AwesomeVisualStudioCommandPromptAndPowerShellIconsWithOverlays.aspx" target="_blank" rel="Awesome Icons for Powershell and VS Cmd Prompt">Scott H.</a>)</li>
	<li><strong>Shell: </strong>%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe</li>
	<li><strong>Startup dir:</strong></li>
</ol>

<h2>Conclusion</h2>
So there you have it!  My new drive with all of my utilities, mostly portable installs this time, so that next time they can just be moved with me.  In conclusion I am super stoked about my new ssd and I cannot recommend using <a href="http://chocolatey.org/" target="_blank">Chocolatey</a> enough for your windows package management needs.  And of course you now have all of the details of my Console2 setup.  Enjoy!
