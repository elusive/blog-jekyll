---
id: 187
title: 'Project Euler... again'
date: 2013-08-31T08:44:05-04:00
author: John
layout: post
guid: https://johngilliland.wordpress.com/?p=187
permalink: /2013/08/31/project-euler-again/
tagazine-media:
  - 'a:7:{s:7:"primary";s:69:"/assets/images/vim_split_screen.png";s:6:"images";a:12:{s:69:"/assets/images/vim_split_screen.png";a:6:{s:8:"file_url";s:69:"/assets/images/vim_split_screen.png";s:5:"width";i:1024;s:6:"height";i:559;s:4:"type";s:5:"image";s:4:"area";i:572416;s:9:"file_path";b:0;}s:75:"/assets/images/vim_split_screen_thumb.png";a:6:{s:8:"file_url";s:75:"/assets/images/vim_split_screen_thumb.png";s:5:"width";i:653;s:6:"height";i:384;s:4:"type";s:5:"image";s:4:"area";i:250752;s:9:"file_path";b:0;}s:65:"/assets/images/vim_settings.png";a:6:{s:8:"file_url";s:65:"/assets/images/vim_settings.png";s:5:"width";i:1024;s:6:"height";i:282;s:4:"type";s:5:"image";s:4:"area";i:288768;s:9:"file_path";b:0;}s:71:"/assets/images/vim_settings_thumb.png";a:6:{s:8:"file_url";s:71:"/assets/images/vim_settings_thumb.png";s:5:"width";i:519;s:6:"height";i:155;s:4:"type";s:5:"image";s:4:"area";i:80445;s:9:"file_path";b:0;}s:73:"/assets/images/problem4_firstmethod.png";a:6:{s:8:"file_url";s:73:"/assets/images/problem4_firstmethod.png";s:5:"width";i:736;s:6:"height";i:329;s:4:"type";s:5:"image";s:4:"area";i:242144;s:9:"file_path";b:0;}s:79:"/assets/images/problem4_firstmethod_thumb.png";a:6:{s:8:"file_url";s:79:"/assets/images/problem4_firstmethod_thumb.png";s:5:"width";i:599;s:6:"height";i:286;s:4:"type";s:5:"image";s:4:"area";i:171314;s:9:"file_path";b:0;}s:74:"/assets/images/problem4_secondmethod.png";a:6:{s:8:"file_url";s:74:"/assets/images/problem4_secondmethod.png";s:5:"width";i:602;s:6:"height";i:166;s:4:"type";s:5:"image";s:4:"area";i:99932;s:9:"file_path";b:0;}s:80:"/assets/images/problem4_secondmethod_thumb.png";a:6:{s:8:"file_url";s:80:"/assets/images/problem4_secondmethod_thumb.png";s:5:"width";i:554;s:6:"height";i:165;s:4:"type";s:5:"image";s:4:"area";i:91410;s:9:"file_path";b:0;}s:73:"/assets/images/problem4_solvemethod.png";a:6:{s:8:"file_url";s:73:"/assets/images/problem4_solvemethod.png";s:5:"width";i:629;s:6:"height";i:335;s:4:"type";s:5:"image";s:4:"area";i:210715;s:9:"file_path";b:0;}s:79:"/assets/images/problem4_solvemethod_thumb.png";a:6:{s:8:"file_url";s:79:"/assets/images/problem4_solvemethod_thumb.png";s:5:"width";i:567;s:6:"height";i:327;s:4:"type";s:5:"image";s:4:"area";i:185409;s:9:"file_path";b:0;}s:73:"/assets/images/problem4_finaloutput.png";a:6:{s:8:"file_url";s:73:"/assets/images/problem4_finaloutput.png";s:5:"width";i:677;s:6:"height";i:359;s:4:"type";s:5:"image";s:4:"area";i:243043;s:9:"file_path";b:0;}s:79:"/assets/images/problem4_finaloutput_thumb.png";a:6:{s:8:"file_url";s:79:"/assets/images/problem4_finaloutput_thumb.png";s:5:"width";i:642;s:6:"height";i:368;s:4:"type";s:5:"image";s:4:"area";i:236256;s:9:"file_path";b:0;}}s:6:"videos";a:0:{}s:11:"image_count";i:12;s:6:"author";s:7:"1621794";s:7:"blog_id";s:7:"1553479";s:9:"mod_stamp";s:19:"2013-08-31 13:47:41";}'
categories:
  - Programming
  - Project Euler
tags:
  - Python
  - TDD
  - unit testing
---
<p>I am back working on Project Euler again.&#160; It has been a great long while, maybe 4 or 5 years, not sure, since I started on it originally, using ruby.&#160; Now I am using a mixture, starting for Python for a bit, and possibly switching back to ruby.&#160; I say that after solving this last problem (#4) and then going thru some of the other folks solutions, the most elegant usually are the ruby ones, in my humble opinion.&#160; </p>  <p>There are of course smaller, or rather more concise, ones but they are too cryptic.&#160; Solutions is in statistical languages such as J or K are frightfully illegible.&#160; I have to share, just for kicks.&#160; First, the problem was to find the largest numeric palindrome that is the product of two 3-digit numbers.&#160; Similar to 9009 being the largest that is the product of two 2-digit numbers, 99 and 91.&#160; So just for giggles, here are a couple of super concise (and un-readable INHO) solutions:</p>  <p>1. This is in J (<a href="http://www.jsoftware.com">http://www.jsoftware.com</a>)</p>  <div id="codeSnippetWrapper" style="overflow:auto;cursor:text;font-size:8pt;border-top:silver 1px solid;font-family:&#039;border-right:silver 1px solid;border-bottom:silver 1px solid;direction:ltr;text-align:left;margin:20px 0 10px;border-left:silver 1px solid;line-height:12pt;max-height:200px;width:97.5%;background-color:#f4f4f4;padding:4px;">   <div id="codeSnippet" style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;line-height:12pt;width:100%;background-color:#f4f4f4;border-style:none;padding:0;">     <pre style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;margin:0;line-height:12pt;width:100%;background-color:white;border-style:none;padding:0;"><span id="lnum1" style="color:#606060;">   1:</span> &gt;([:{: ]#~ (=|.&amp;.&gt;)) &lt;<span style="color:#006080;">@&quot;:&quot;</span>0 /:~(0:-.~[:,&gt;:<span style="color:#008000;">/**/</span>)~(i.100)-.~i.1000</pre>
<!--CRLF--></div>
</div>



<p>and </p>

<p>2. This one is in K (<a href="http://www.kx.com/developers/documentationkdb.php">http://www.kx.com/developers/documentationkdb.php</a>)</p>

<div id="codeSnippetWrapper" style="overflow:auto;cursor:text;font-size:8pt;border-top:silver 1px solid;font-family:&#039;border-right:silver 1px solid;border-bottom:silver 1px solid;direction:ltr;text-align:left;margin:20px 0 10px;border-left:silver 1px solid;line-height:12pt;max-height:200px;width:97.5%;background-color:#f4f4f4;padding:4px;">
  <div id="codeSnippet" style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;line-height:12pt;width:100%;background-color:#f4f4f4;border-style:none;padding:0;">
    <pre style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;margin:0;line-height:12pt;width:100%;background-color:white;border-style:none;padding:0;"><span id="lnum1" style="color:#606060;">   1:</span> |/m@&amp;{x~|x}<span style="color:#006080;">'10_vs'</span>m:*/',/n,/::n:100+!900</pre>
<!--CRLF--></div>
</div>

<p>Please realize that I am in awe of the guys that posted these solutions and maybe someday I will be able to learn a language such as one of these, but for now…</p>

<p>I am going to stick to C# and Javascript, and Ruby and Python.&#160; They are sufficient to accomplish the tasks I perform on a daily basis at work.&#160; I am just learning Python again and also planning to brush up on Ruby.&#160; I spent a year or so messing with ruby and ruby on rails, but only at home in my spare time so naturally I didn’t get super far.</p>

<p>So, to the issue at hand.&#160; How to find the largest numeric palindrome that is a product of two 3-digit numbers.&#160; And, for me, more importantly how do I do this in Python using Test-Driven-Development, only using VIM as my development environment.&#160; Pow!&#160; Throw that one in there at the last minute.&#160; Ha, Ha!&#160; Vim super rocks and I am learning more and more about how to mack it out and make it easier to use.&#160; Death to my mouse!</p>

<h3>Vim setup</h3>

<p>I decide to use VIM because I have been really wanting an excuse to get better with it.&#160; I use it at work sometimes but when I am in a hurry I end up going back to Notepad++ or SublimeText (which is super nice in its own right, closest thing you can find to Textmate for windows).&#160; Anyways I figured this would be a good chance to spend some time with VIM.&#160; I am using gVIM by the way on Windows 7 and I have python 2.7 installed as well and in my PATH variable.&#160; </p>

<p>I did some research on VIM and found out that I needed to add a ~_vimrc file with some settings in it.&#160; Over the next day or two I slowly acquired a pretty good selection of customizations for VIM that make it much nicer to use.&#160; Things like syntax highlighting and default font and color scheme presets.&#160; One of the coolest things I figured out from this wonderful article, <a href="http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide" target="_blank">Turning VIM into a modern Python IDE</a>, which gave me numerous tips, was to use the vertical screen split to show two buffers (files being edited) at once.&#160; This allowed me to work on my class in on one side and my unit tests on the other.&#160; Like so:</p>

<p><a href="/assets/images/vim_split_screen.png"><img title="vim_split_screen" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="vim_split_screen" src="/assets/images/vim_split_screen_thumb.png" width="653" height="384" /></a></p>

<p>Once I had this setup I was rolling pretty good, really helped with the TDD workflow of:</p>

<ol>
  <li>Write a test</li>

  <li>See the test fail</li>

  <li>Refactor code to pass test</li>
</ol>

<p>This was also aided by the VIM settings for executing my scripts using the python command and seeing the output in a new command window.&#160; The following additions to my _vimrc file allow me to simply hit ‘F5’ to execute the code in the current buffer.&#160; And, conveniently, the *.py filter ensures that it is only set up to do so for Python files.&#160; These autocmd lines take advantage of the fact that you can execute any shell command from the VIM command line by prepending it with the ‘!’ character.&#160; The last setting maps the ‘F5’ key to the command output of “python “ + the current filename (represented by the ‘%’ output placeholder).&#160; Super convenient.</p>

<p><a href="/assets/images/vim_settings.png"><img title="vim_settings" style="border-top:0;border-right:0;background-image:none;border-bottom:0;float:none;padding-top:0;padding-left:0;margin-left:auto;border-left:0;display:block;padding-right:0;margin-right:auto;" border="0" alt="vim_settings" src="/assets/images/vim_settings_thumb.png" width="519" height="155" /></a></p>



<p>The settings file allowed me to correct the weird backspace key behavior that VIM was displaying.&#160; I couldn’t be more pleased, VIM is seemingly endlessly configurable.</p>

<h3>The Problem</h3>

<p>The goal was to find the correct answer to the 4th problem on <a href="http://projecteuler.com" target="_blank">Project Euler</a> which is to find the largest numeric palindrome that is a product of two 3-digit numbers.&#160; After a bit of thought I decided to start at 999 and work down with any loop I would use, that way I would get to the solution faster than if I started at 100 and went up.&#160; But the very first thing I needed to do was to write a test.&#160; So I went for an isPalindrome method test, as I knew I would need a test for my products as I iterated through the numbers.&#160;&#160; </p>

<p>I turns out that there are numerous ways to solve the problem, of course, including using pen and paper and some algebra.&#160; I must admit that it never occurred to me to use algebra to solve the problem.&#160; Brute force was immediately where my thoughts went and where they stayed.&#160; I guess years of coding have taught me that using the simplest and most direct approach is usually the best.&#160; There were many interesting solutions posted in the forum for the problem though, and I encourage everyone to check out the many different bits of code there, but only after you solve the problem yourself.</p>

<h3>TDD</h3>

<p>Before I could write a test I had to figure out exactly how unit testing worked with python, so I did some research and came up with what I would guess is the most direct solution.&#160; There is an included unit test module called, <a href="http://docs.python.org/2/library/unittest.html" target="_blank">unittest</a> and so it was there I began.&#160; No configuration necessary, only the use of the very sweet vertical split screen in VIM, so I could look at my tests and my code as I wrote them both.</p>

<p>My first code that I wrote was a class that derived from the base unittest.TestCase class and I named it TestProblem4Solution.&#160; I then did a little setup, a valid palindrome value and an invalid palindrome value that I figured I would need in my tests of an isPalindrome method.&#160; Then straight to my first test, which was:</p>

<div id="codeSnippetWrapper" style="overflow:auto;cursor:text;font-size:8pt;border-top:silver 1px solid;font-family:&#039;border-right:silver 1px solid;border-bottom:silver 1px solid;direction:ltr;text-align:left;margin:20px 0 10px;border-left:silver 1px solid;line-height:12pt;max-height:200px;width:97.5%;background-color:#f4f4f4;padding:4px;">
  <div id="codeSnippet" style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;line-height:12pt;width:100%;background-color:#f4f4f4;border-style:none;padding:0;">
    <pre style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;margin:0;line-height:12pt;width:100%;background-color:white;border-style:none;padding:0;"><span id="lnum1" style="color:#606060;">   1:</span> def test_isPalindrome_ReturnsFalse(self):</pre>
<!--CRLF-->

    <pre style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;margin:0;line-height:12pt;width:100%;background-color:#f4f4f4;border-style:none;padding:0;"><span id="lnum2" style="color:#606060;">   2:</span>        result = self.cut.isNumericPalindrome(self.invalid_palindrome)</pre>
<!--CRLF-->

    <pre style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;margin:0;line-height:12pt;width:100%;background-color:white;border-style:none;padding:0;"><span id="lnum3" style="color:#606060;">   3:</span>        self.assertFalse(result)</pre>
<!--CRLF--></div>
</div>

<p>Naturally this test failed when I ran it, so I had some code to write in my Problem4Solution class, which I needed to create as well.&#160; Here is a shot of what I ended up with for making the first test pass:</p>

<p><a href="/assets/images/problem4_firstmethod.png"><img title="problem4_firstmethod" style="border-top:0;border-right:0;background-image:none;border-bottom:0;float:none;padding-top:0;padding-left:0;margin-left:auto;border-left:0;display:block;padding-right:0;margin-right:auto;" border="0" alt="problem4_firstmethod" src="/assets/images/problem4_firstmethod_thumb.png" width="599" height="286" /></a></p>



<p>This was enough to make my second test pass as well, test_isPalindrome_ReturnsTrue which is just a positive result test to go with the first one which tested the negative result.</p>

<p>Moving on to some product work, I knew I would want to test products that were produced from a loop, so I wrote a test called test_highestPalindromeProduct_ReturnsCorrect that would test a method that would take a starting number and multiply it by a set of numbers beginning with itself and stepping down by –1 until a palindrome product was found.&#160; Of course there was no such method so the test failed and I was back to my solution class to fix the problem.&#160; The resulting method, after a few tweaks and quick trips to the <a href="http://docs.python.org/2/index.html" target="_blank">python online docs</a> came out looking like this:</p>

<p><a href="/assets/images/problem4_secondmethod.png"><img title="problem4_secondmethod" style="border-top:0;border-right:0;background-image:none;border-bottom:0;float:none;padding-top:0;padding-left:0;margin-left:auto;border-left:0;display:block;padding-right:0;margin-right:auto;" border="0" alt="problem4_secondmethod" src="/assets/images/problem4_secondmethod_thumb.png" width="554" height="165" /></a></p>

<p>I then added a test for a solve method that I figured would use the two helper methods and find my solution.&#160; But, before I finished that I realized that I might want to solve this problem for multiple length numbers.&#160; The sample given in the problem was for tow 2-digit numbers and the challenge was for two 3-digit numbers so right off I needed to handle multiple length start numbers (I was using the two 2-digit as test values because I already had the correct answer).&#160; Therefore I stepped back and wrote a test for a buildStartNumber method that would take a length up to 5 and return the highest number of that length.&#160; I wanted to get back 999 for an input of 3.&#160; Here is that test:</p>

<div id="codeSnippetWrapper" style="overflow:auto;cursor:text;font-size:8pt;border-top:silver 1px solid;font-family:&#039;border-right:silver 1px solid;border-bottom:silver 1px solid;direction:ltr;text-align:left;margin:20px 0 10px;border-left:silver 1px solid;line-height:12pt;max-height:200px;width:97.5%;background-color:#f4f4f4;padding:4px;">
  <div id="codeSnippet" style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;line-height:12pt;width:100%;background-color:#f4f4f4;border-style:none;padding:0;">
    <pre style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;margin:0;line-height:12pt;width:100%;background-color:white;border-style:none;padding:0;"><span id="lnum1" style="color:#606060;">   1:</span> def test_buildStartNumber_ReturnsCorrectNumber(self):</pre>
<!--CRLF-->

    <pre style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;margin:0;line-height:12pt;width:100%;background-color:#f4f4f4;border-style:none;padding:0;"><span id="lnum2" style="color:#606060;">   2:</span>         result = self.cut.buildStartNumber(3)</pre>
<!--CRLF-->

    <pre style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;margin:0;line-height:12pt;width:100%;background-color:white;border-style:none;padding:0;"><span id="lnum3" style="color:#606060;">   3:</span>         self.assertEqual(self.expectedStartNumber, result)</pre>
<!--CRLF--></div>
</div>



<p>Again, fairly straight forward, I am just testing a result produced by calling the method.&#160; The expected value is hanging off of the class instance (self.expectedStartNumber) and is 999 which is what I wanted back.&#160; The assertEqual test statement just checks that value against the actual result.</p>

<p>The method to make this test pass was the simplest one in the solution, but only because I did some Googling first to learn some more about what python is capable of…</p>

<div id="codeSnippetWrapper" style="overflow:auto;cursor:text;font-size:8pt;border-top:silver 1px solid;font-family:&#039;border-right:silver 1px solid;border-bottom:silver 1px solid;direction:ltr;text-align:left;margin:20px 0 10px;border-left:silver 1px solid;line-height:12pt;max-height:200px;width:97.5%;background-color:#f4f4f4;padding:4px;">
  <div id="codeSnippet" style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;line-height:12pt;width:100%;background-color:#f4f4f4;border-style:none;padding:0;">
    <pre style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;margin:0;line-height:12pt;width:100%;background-color:white;border-style:none;padding:0;"><span id="lnum1" style="color:#606060;">   1:</span> def buildStartNumber(self, length):</pre>
<!--CRLF-->

    <pre style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;margin:0;line-height:12pt;width:100%;background-color:#f4f4f4;border-style:none;padding:0;"><span id="lnum2" style="color:#606060;">   2:</span>        start = <span style="color:#006080;">''</span>.join(<span style="color:#006080;">&quot;9&quot;</span> <span style="color:#0000ff;">for</span> x <span style="color:#0000ff;">in</span> range(length))</pre>
<!--CRLF-->

    <pre style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;margin:0;line-height:12pt;width:100%;background-color:white;border-style:none;padding:0;"><span id="lnum3" style="color:#606060;">   3:</span>        <span style="color:#0000ff;">return</span> <span style="color:#0000ff;">int</span>(start)</pre>
<!--CRLF--></div>
</div>



<p>You can see that I am using the join function to join the “9” string together for x times in a range of the provided length. The <a href="http://docs.python.org/2/library/functions.html?highlight=range#range" target="_blank">range function</a> is very handy.</p>

<p>That brought me to the solve method which would get me my answer.&#160; I first wrote a test that used the known example solution for two 2-digit numbers which is 99 * 91 = 9009.&#160; These values ensured that my solve method produced correct results.&#160; Sort of!&#160; I did get an incorrect answer the first time because I had assumed that if I counted down instead of up the first solution I came to would be the correct one but it wasn’t.&#160; I had to store the results and continue on down until I found them all and then keep only the highest one.&#160; Counting down from 999 and looking for palindrome products you come first to 995 * 583 which is 580085, a palindrome but not the highest palindrome.&#160; You have to keep going to get to 993 * 913 which is 906609 and the correct answer.&#160; Now, if I had limited my attempts with a bottom end of say 900 then I would have come to the correct answer first, but I didn’t.&#160; I let it go all the way down to 100 until it found a result.&#160; Oh well, live and learn.</p>

<p>Back to the TDD, the next test looked like this:</p>

<div id="codeSnippetWrapper" style="overflow:auto;cursor:text;font-size:8pt;border-top:silver 1px solid;font-family:&#039;border-right:silver 1px solid;border-bottom:silver 1px solid;direction:ltr;text-align:left;margin:20px 0 10px;border-left:silver 1px solid;line-height:12pt;max-height:200px;width:97.5%;background-color:#f4f4f4;padding:4px;">
  <div id="codeSnippet" style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;line-height:12pt;width:100%;background-color:#f4f4f4;border-style:none;padding:0;">
    <pre style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;margin:0;line-height:12pt;width:100%;background-color:white;border-style:none;padding:0;"><span id="lnum1" style="color:#606060;">   1:</span> def test_solve_ReturnsCorrectValue(self):</pre>
<!--CRLF-->

    <pre style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;margin:0;line-height:12pt;width:100%;background-color:#f4f4f4;border-style:none;padding:0;"><span id="lnum2" style="color:#606060;">   2:</span>         result = self.cut.solve(2)</pre>
<!--CRLF-->

    <pre style="overflow:visible;font-size:8pt;font-family:&#039;color:black;direction:ltr;text-align:left;margin:0;line-height:12pt;width:100%;background-color:white;border-style:none;padding:0;"><span id="lnum3" style="color:#606060;">   3:</span>         self.assertEqual(self.solution, result)</pre>
<!--CRLF--></div>
</div>



<p>Another simple test, where the expected value of self.solution (defined in the test setup method) is an array of [99,91,9009] which is the correct answer for two 2-digit numbers, including the product itself.&#160; I knew I would want my solve method to provide me all three values for a complete answer, even though technically all I needed was the palindrome itself to submit to the answer page at <a href="http://projecteuler.com" target="_blank">project euler</a>.</p>

<p>And the code that I added to make the test pass:</p>

<p><a href="/assets/images/problem4_solvemethod.png"><img title="problem4_solvemethod" style="border-top:0;border-right:0;background-image:none;border-bottom:0;float:none;padding-top:0;padding-left:0;margin-left:auto;border-left:0;display:block;padding-right:0;margin-right:auto;" border="0" alt="problem4_solvemethod" src="/assets/images/problem4_solvemethod_thumb.png" width="567" height="327" /></a></p>

<p>This completed the problem.&#160; I submitted the solution, which thanks to my handy ‘F5’ key mapping was just a click away after adding a small main() method to the class that would print out the result of the solve method to the screen.&#160; The final output looked like this:</p>

<p><a href="/assets/images/problem4_finaloutput.png"><img title="problem4_finaloutput" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="problem4_finaloutput" src="/assets/images/problem4_finaloutput_thumb.png" width="642" height="368" /></a></p>

<p>And the answer you can see printed out as [993, 913, 906609], nice and neat.&#160; The final code is actually shown at the beginning of the post in the screen shot of VIM with the vertical split.&#160; You can see both the Problem4Solution class on the left and the TestProblem4Solution class on the right.&#160; If you have any questions just post a comment!</p>