---
id: 189
title: Test Driven Development in Python
date: 2013-09-15T13:30:36-04:00
author: John
layout: post
guid: http://johngilliland.wordpress.com/?p=189
permalink: /2013/09/15/test-driven-development-in-python/
gplus_authorship_disabled:
  - "1"
tagazine-media:
  - 'a:7:{s:7:"primary";s:62:"http://johngilliland.files.wordpress.com/2013/09/testclass.png";s:6:"images";a:16:{s:74:"http://johngilliland.files.wordpress.com/2013/09/sumofintegersformula1.png";a:6:{s:8:"file_url";s:74:"http://johngilliland.files.wordpress.com/2013/09/sumofintegersformula1.png";s:5:"width";i:109;s:6:"height";i:42;s:4:"type";s:5:"image";s:4:"area";i:4578;s:9:"file_path";b:0;}s:73:"http://johngilliland.files.wordpress.com/2013/09/sumofsquaresformula1.png";a:6:{s:8:"file_url";s:73:"http://johngilliland.files.wordpress.com/2013/09/sumofsquaresformula1.png";s:5:"width";i:180;s:6:"height";i:45;s:4:"type";s:5:"image";s:4:"area";i:8100;s:9:"file_path";b:0;}s:59:"http://johngilliland.files.wordpress.com/2013/09/test12.png";a:6:{s:8:"file_url";s:59:"http://johngilliland.files.wordpress.com/2013/09/test12.png";s:5:"width";i:482;s:6:"height";i:298;s:4:"type";s:5:"image";s:4:"area";i:143636;s:9:"file_path";b:0;}s:66:"http://johngilliland.files.wordpress.com/2013/09/test1-output2.png";a:6:{s:8:"file_url";s:66:"http://johngilliland.files.wordpress.com/2013/09/test1-output2.png";s:5:"width";i:435;s:6:"height";i:172;s:4:"type";s:5:"image";s:4:"area";i:74820;s:9:"file_path";b:0;}s:67:"http://johngilliland.files.wordpress.com/2013/09/test1-output21.png";a:6:{s:8:"file_url";s:67:"http://johngilliland.files.wordpress.com/2013/09/test1-output21.png";s:5:"width";i:599;s:6:"height";i:257;s:4:"type";s:5:"image";s:4:"area";i:153943;s:9:"file_path";b:0;}s:59:"http://johngilliland.files.wordpress.com/2013/09/class1.png";a:6:{s:8:"file_url";s:59:"http://johngilliland.files.wordpress.com/2013/09/class1.png";s:5:"width";i:313;s:6:"height";i:96;s:4:"type";s:5:"image";s:4:"area";i:30048;s:9:"file_path";b:0;}s:66:"http://johngilliland.files.wordpress.com/2013/09/test1-output3.png";a:6:{s:8:"file_url";s:66:"http://johngilliland.files.wordpress.com/2013/09/test1-output3.png";s:5:"width";i:599;s:6:"height";i:251;s:4:"type";s:5:"image";s:4:"area";i:150349;s:9:"file_path";b:0;}s:66:"http://johngilliland.files.wordpress.com/2013/09/test1-output4.png";a:6:{s:8:"file_url";s:66:"http://johngilliland.files.wordpress.com/2013/09/test1-output4.png";s:5:"width";i:248;s:6:"height";i:126;s:4:"type";s:5:"image";s:4:"area";i:31248;s:9:"file_path";b:0;}s:58:"http://johngilliland.files.wordpress.com/2013/09/test2.png";a:6:{s:8:"file_url";s:58:"http://johngilliland.files.wordpress.com/2013/09/test2.png";s:5:"width";i:407;s:6:"height";i:80;s:4:"type";s:5:"image";s:4:"area";i:32560;s:9:"file_path";b:0;}s:65:"http://johngilliland.files.wordpress.com/2013/09/test2-output.png";a:6:{s:8:"file_url";s:65:"http://johngilliland.files.wordpress.com/2013/09/test2-output.png";s:5:"width";i:596;s:6:"height";i:193;s:4:"type";s:5:"image";s:4:"area";i:115028;s:9:"file_path";b:0;}s:59:"http://johngilliland.files.wordpress.com/2013/09/class2.png";a:6:{s:8:"file_url";s:59:"http://johngilliland.files.wordpress.com/2013/09/class2.png";s:5:"width";i:374;s:6:"height";i:76;s:4:"type";s:5:"image";s:4:"area";i:28424;s:9:"file_path";b:0;}s:66:"http://johngilliland.files.wordpress.com/2013/09/test2-output2.png";a:6:{s:8:"file_url";s:66:"http://johngilliland.files.wordpress.com/2013/09/test2-output2.png";s:5:"width";i:234;s:6:"height";i:120;s:4:"type";s:5:"image";s:4:"area";i:28080;s:9:"file_path";b:0;}s:62:"http://johngilliland.files.wordpress.com/2013/09/testclass.png";a:6:{s:8:"file_url";s:62:"http://johngilliland.files.wordpress.com/2013/09/testclass.png";s:5:"width";i:615;s:6:"height";i:458;s:4:"type";s:5:"image";s:4:"area";i:281670;s:9:"file_path";b:0;}s:66:"http://johngilliland.files.wordpress.com/2013/09/solutionclass.png";a:6:{s:8:"file_url";s:66:"http://johngilliland.files.wordpress.com/2013/09/solutionclass.png";s:5:"width";i:562;s:6:"height";i:541;s:4:"type";s:5:"image";s:4:"area";i:304042;s:9:"file_path";b:0;}s:69:"http://johngilliland.files.wordpress.com/2013/09/testclass-output.png";a:6:{s:8:"file_url";s:69:"http://johngilliland.files.wordpress.com/2013/09/testclass-output.png";s:5:"width";i:588;s:6:"height";i:134;s:4:"type";s:5:"image";s:4:"area";i:78792;s:9:"file_path";b:0;}s:68:"http://johngilliland.files.wordpress.com/2013/09/solution-output.png";a:6:{s:8:"file_url";s:68:"http://johngilliland.files.wordpress.com/2013/09/solution-output.png";s:5:"width";i:217;s:6:"height";i:76;s:4:"type";s:5:"image";s:4:"area";i:16492;s:9:"file_path";b:0;}}s:6:"videos";a:0:{}s:11:"image_count";i:17;s:6:"author";s:7:"1621794";s:7:"blog_id";s:7:"1553479";s:9:"mod_stamp";s:19:"2013-09-15 18:35:15";}'
twitter_cards_summary_img_size:
  - 'a:7:{i:0;i:11;i:1;i:3;i:2;i:1;i:3;s:21:"width="11" height="3"";s:4:"bits";i:1;s:8:"channels";i:3;s:4:"mime";s:9:"image/gif";}'
categories:
  - Programming
  - Project Euler
tags:
  - Python
  - TDD
  - unit testing
---
<h2>TDD is a mindset</h2>
Test driven development is a way of designing as much as it is a way of developing.  I have been trying to use it on and off for a several years now without much success.  I think I understand the process, but not necessarily the mindset.  So, I am taking on a challenge in hopes of learning the mindset as well as the process.  The transition to TDD is going to take practice and I intend to get that practice using the <a title="Project Euler Homepage" href="http://www.projecteuler.net" target="_blank">Project Euler</a> problems that I started on <a title="Project euler – again" href="http://johngilliland.wordpress.com/2013/08/31/project-euler-again/" target="_blank">a couple of years ago</a>.  One of the added benefits of using the Euler problems is that they are simple enough usually (or I should say, "So far") that they can be solved using a single class or even a single method.  This makes writing tests for the design a little more direct and therefore simpler.

I have decided to use Python, for now.  Python is a simple language to use because it is interpreted rather than compiled.  I am also taking this opportunity to learn to use VIM a little better.  I have setup VIM as my <a href="http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide" target="_blank">python ide</a>, and am pretty happy with it so far.  And when I am away from my main machine I can use my <a href="https://koding.com/?r=elusive" target="_blank">Koding virtual machine</a> to work on a problem, but that is another post.  Plus I have always wanted to know more python, and so far I am really enjoying using it, it was super easy to get up and running with TDD.  Writing a unit test in python is very easy, as you will see.  So, despite the fact that I write C# all day everyday at work, I am trying to use an easier setup to get some practice in with Test Driven Development.
<h2>The Problem</h2>
I am currently on problem number 6 at Project Euler, which is title: <span style="text-decoration:underline;">Sum Square Difference</span>.  The statement of the problem is this:
<div>
<blockquote>The sum of the squares of the first ten natural numbers is,
<div>1<sup>2</sup> + 2<sup>2</sup> + ... + 10<sup>2</sup> = 385</div>
The square of the sum of the first ten natural numbers is,
<div>(1 + 2 + ... + 10)<sup>2</sup> = 55<sup>2</sup> = 3025</div>
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 <img alt="−" src="http://projecteuler.net/images/symbol_minus.gif" width="9" height="3" border="0" /> 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.</blockquote>
</div>
This led me to do some research.  The past couple of problems I have tackled with more of a brute-force tack and so I decided that this time I would do some research first.  I knew there were some formulas that could help me with this one.  I basically needed a formula for the following:
<ol>
	<li>The sum of the squares for 1..n</li>
	<li>The square of the sums of 1..n</li>
</ol>
With formulas for these two tasks I could then simply diff the result for my answer.  I have sample values from the problem statement to use in my unit tests of the formulas.  Here are the formulas I will use in solving the problem, both were readily available through Google or Wikipedia searches.

[caption id="attachment_190" align="aligncenter" width="109"]<a href="/assets/images/sumofintegersformula1.png"><img class="size-full wp-image-190 " title="Sum of Integers 1..n" alt="Sum of Integers" src="/assets/images/sumofintegersformula1.png" width="109" height="42" /></a> Sum of Integers[/caption]

[caption id="attachment_191" align="aligncenter" width="180"]<a href="/assets/images/sumofsquaresformula1.png"><img class="size-full wp-image-191 " alt="Sum of Squares" src="/assets/images/sumofsquaresformula1.png" width="180" height="45" /></a> Sum of Squares Identity[/caption]
<h2>The Test Class (and the first test)</h2>
With test driven development, rather than writing some code for the problem first, of course I need to write a test.  So what test?  Well I look at the problem and see that I need to find the difference between the sum of the squares of a list of numbers and the square of the sum of those numbers.  Therefore I will need to be able to get those values.  My first test will be for a correct sum of squares value (the second formula above).

I know that I am supposed to dive right in and write a test for a method that does what I need.  This is where you actually do some designing as well.  I wrote the following test as the first code for this problem:

[caption id="attachment_196" align="aligncenter" width="300"]<a href="/assets/images/test12.png"><img class="size-medium wp-image-196" alt="Test for a sum of squares method" src="/assets/images/test12.png?w=300" width="300" height="185" /></a> Test for a sum of squares method[/caption]

And here is the output for that test:

[caption id="attachment_197" align="aligncenter" width="300"]<a href="/assets/images/test1-output2.png"><img class="size-medium wp-image-197" alt="Output from run of first test." src="/assets/images/test1-output2.png?w=300" width="300" height="118" /></a> Output from run of first test.[/caption]

As you can see the test failed with an 'ImportError:  No module named Problem6'.  That is because I need to add a module for Problem6, which is a new file named Problem6.py.  In order to maintain the strict tenets of test driven development I need to only to the minimum required to get past this error.  So I will add a new file/module named Problem6.py, and then re-run the test.  Here is the output from the next run:

[caption id="attachment_198" align="aligncenter" width="300"]<a href="/assets/images/test1-output21.png"><img class="size-medium wp-image-198" alt="Output from 2nd test run" src="/assets/images/test1-output21.png?w=300" width="300" height="128" /></a> Output from 2nd test run[/caption]

Now we failed with an AttributeError: 'module' object has no attribute 'Problem6Solution' and this is because the new module we just added is empty and has no class.  So, I will add a class to the module and name it 'Problem6Solution' and a method named sumOfSquares that accepts an input number.  This should be enough to get through this error.  Here is the first look at the solution class:

[caption id="attachment_199" align="aligncenter" width="300"]<a href="/assets/images/class1.png"><img class="size-medium wp-image-199" alt="Solution Class" src="/assets/images/class1.png?w=300" width="300" height="92" /></a> Solution Class[/caption]

Now we can run the test again and see what we get this time.  It should be an assertion error because we are not yet performing the formula calculation.  Here is the result:

[caption id="attachment_200" align="aligncenter" width="300"]<a href="/assets/images/test1-output3.png"><img class="size-medium wp-image-200" alt="Result from pass 3 of test 1" src="/assets/images/test1-output3.png?w=300" width="300" height="125" /></a> Result from pass 3 of test 1[/caption]

Ah, there is my assertion error.  Now I am finally ready to add some code to execute the formula and hopefully pass the test.  The formula is simple but as I am a bit of a noobie with python I looked up the math.pow method to help me execute the power calls.  Here is the code for the sumOfSquares method complete:

[caption id="attachment_201" align="aligncenter" width="248"]<a href="/assets/images/test1-output4.png"><img class="size-full wp-image-201" alt="Test1 - Passing!" src="/assets/images/test1-output4.png" width="248" height="126" /></a> Test1 - Passing![/caption]
<h2>Repeat for Remaining Tests</h2>
The rest of the process is a little smoother in that now we have our classes and files and beginnings completed.  We have a passing test and are under way!  The next test will be for another piece of our solution's puzzle, the square of sums formula, where we sum 1..n and then square the result.  We have the formula for summing 1..n so it should be fairly simple.  Let us see what the test looks like:

[caption id="attachment_202" align="aligncenter" width="300"]<a href="/assets/images/test2.png"><img class="size-medium wp-image-202" alt="Test 2 for a square of sums method" src="/assets/images/test2.png?w=300" width="300" height="58" /></a> Test 2 for a square of sums method[/caption]

Of course we will run the test without writing any new code to see it fail.  Then we will refactor until it passes.  I am seeing though, at this point that in writing a test first I am letting the desired output dictate the design of the class.  I am starting with what I need and only writing the minimum code in order to get it.  Resulting in a fairly concise bit of coding.  I am still only utilizing this at a very simple level, but I can see the benefits none the less.  What follows if the test result and the code written to make it pass:

[caption id="attachment_203" align="aligncenter" width="300"]<a href="/assets/images/test2-output.png"><img class="size-medium wp-image-203" alt="Output from Test 2" src="/assets/images/test2-output.png?w=300" width="300" height="97" /></a> Output from Test 2[/caption]

[caption id="attachment_204" align="aligncenter" width="300"]<a href="/assets/images/class2.png"><img class="size-medium wp-image-204" alt="Square of Sums method" src="/assets/images/class2.png?w=300" width="300" height="60" /></a> Square of Sums method[/caption]

And now our test 2 passes.

[caption id="attachment_205" align="aligncenter" width="234"]<a href="/assets/images/test2-output2.png"><img class="size-full wp-image-205" alt="Test 2 - Passing!" src="/assets/images/test2-output2.png" width="234" height="120" /></a> Test 2 - Passing![/caption]

For the last test, where we test a solve method that takes the difference of our two sums, I will show the resulting classes in their entirety.  You will notice there will now be a third test and a third method in the solution class, called 'solve'.

[caption id="attachment_206" align="aligncenter" width="300"]<a href="/assets/images/testclass.png"><img class="size-medium wp-image-206" alt="The complete test class" src="/assets/images/testclass.png?w=300" width="300" height="223" /></a> The complete test class[/caption]

[caption id="attachment_207" align="aligncenter" width="300"]<a href="/assets/images/solutionclass.png"><img class="size-medium wp-image-207" alt="Complete solution class" src="/assets/images/solutionclass.png?w=300" width="300" height="288" /></a> Complete solution class[/caption]
<h2>Summary</h2>
I have added a main method at the end of the solution class that actually shows the answer and the elapsed time to calculate it.  That, in my mind, makes this a complete solution that does provide the output desired.  And, thanks to Test Driven Development, without anything extra.  Of course I could further refactor the formula methods to shorten them, specifically using the sum() method rather than the += operator.  However, I have left the code the way it is because I feel it is more readable this way.  And in my book, readability counts for something.

Lastly here is the output, both the passing tests and the printed answer!

[caption id="attachment_209" align="aligncenter" width="300"]<a href="/assets/images/testclass-output.png"><img class="size-medium wp-image-209" alt="All Tests Passing!" src="/assets/images/testclass-output.png?w=300" width="300" height="68" /></a> All Tests Passing![/caption]

[caption id="attachment_210" align="aligncenter" width="217"]<a href="/assets/images/solution-output.png"><img class="size-full wp-image-210" alt="Results!" src="/assets/images/solution-output.png" width="217" height="76" /></a> Results![/caption]