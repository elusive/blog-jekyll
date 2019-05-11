---
id: 18
title: 'Argument Validation using C# 3.0 extension methods'
date: 2009-01-07T13:11:38-04:00
author: John
layout: post
guid: http://johngilliland.wordpress.com/?p=18
permalink: /2009/01/07/argument-validation-using-c-30-extension-methods/
image_url:
  - http://fastline.springnote.com/pages/2319612/attachments/1035080
image_md5:
  - d41d8cd98f00b204e9800998ecf8427e
image_tag:
  - '<img src="http://fastline.springnote.com/pages/2319612/attachments/1035080?w=840" class="attachment" title="Extensions.Classes(1).png"   alt="Extensions.Classes(1).png"  />'
image_colors_bg:
  - 'a:11:{i:0;s:6:"000000";s:2:"+1";s:6:"262626";s:2:"+2";s:6:"404040";s:2:"+3";s:6:"808080";s:2:"+4";s:6:"bfbfbf";s:2:"+5";s:6:"e6e6e6";i:-1;s:6:"000000";i:-2;s:6:"000000";i:-3;s:6:"000000";i:-4;s:6:"000000";i:-5;s:6:"000000";}'
  - 'a:11:{i:0;s:6:"000000";s:2:"+1";s:6:"262626";s:2:"+2";s:6:"404040";s:2:"+3";s:6:"808080";s:2:"+4";s:6:"bfbfbf";s:2:"+5";s:6:"e6e6e6";i:-1;s:6:"000000";i:-2;s:6:"000000";i:-3;s:6:"000000";i:-4;s:6:"000000";i:-5;s:6:"000000";}'
image_colors_fg:
  - 'a:11:{i:0;s:6:"808080";s:2:"+1";s:6:"bfbfbf";s:2:"+2";s:6:"ffffff";s:2:"+3";s:6:"000000";s:2:"+4";s:6:"000000";s:2:"+5";s:6:"000000";i:-1;s:6:"808080";i:-2;s:6:"808080";i:-3;s:6:"808080";i:-4;s:6:"808080";i:-5;s:6:"808080";}'
  - 'a:11:{i:0;s:6:"808080";s:2:"+1";s:6:"bfbfbf";s:2:"+2";s:6:"ffffff";s:2:"+3";s:6:"000000";s:2:"+4";s:6:"000000";s:2:"+5";s:6:"000000";i:-1;s:6:"808080";i:-2;s:6:"808080";i:-3;s:6:"808080";i:-4;s:6:"808080";i:-5;s:6:"808080";}'
categories:
  - 'C#'
  - Programming
  - Work
tags:
  - 'C# 3.0'
  - Extension Methods
---
 After some research into reusable arg validation ideas on GOG (good ole google) I have found something that, after some simplification of course, will serve the projects meager argument validation needs. Actually this is a super cool trick that we can reuse any number of places from here on, if we so desire.  Here are the original posts that I read and have taken ideas from, particularly Roger Alsings articles, much thanks to him.  This technique is, IMHO, a nice way to showcase how to combine some of C#'s new features, specifically Generics from C# 2.0 and Extension methods from C# 3.0, into a nice solution to a frequent problem.  
<blockquote>- <a href="http://rogeralsing.com/2008/05/10/followup-how-to-validate-a-methods-arguments/">http://rogeralsing.com/2008/05/10/followup-how-to-validate-a-methods-arguments/</a>
- <a href="http://weblogs.asp.net/fredriknormen/archive/2008/05/08/how-to-validate-a-method-s-arguments.aspx">http://weblogs.asp.net/fredriknormen/archive/2008/05/08/how-to-validate-a-method-s-arguments.aspx
</a>- <a href="http://www.puzzleframework.com/wikiengine/WikiPageViewer.aspx?ID=78">http://www.puzzleframework.com/wikiengine/WikiPageViewer.aspx?ID=78</a></blockquote>
Using these posts and the code from a much larger api at the puzzle framework address in the quote above, i have assembled a smaller set of argument validation methods.  Roger Alsing's puzzle framework has a full compliment of these validation methods if you are interested.  I, on the other hand swiped just a couple of his and added a couple of my own, but am using the same technique to acheive a fluent interface and also the very ingenius idea he had of using a wrapper class for the extension methods rather than extending each .NET type on its own.  Very nice work by him.  This article is simply an effort to explain how I used these articles to put together a much smaller set of validation methods for my own use in a project.  Hopefully it explains things clearly and pays sufficient homage to the ideas originator.

 

The basic premise is that now with generics and extension methods features of C# we are able to add functionality to types/classes. In this case all types, for the purpose of validating method arguments. The articles above explore this in a progressive fashion: First presenting the idea of an ArgumentHelper class that would have lots of overloads for validating various C# types, i.e. int, string, double, etc. Under this scheme you would need a separate method for each type of validation for each type. Such as:

[sourcecode language='csharp']
public void RequireNotNull(int arg, string argName);
public void RequireNotNull(string arg, string argName);
public void RequireNotNull(DateTime arg, string argName);
...
[/sourcecode]

This is not a bad idea, and certainly is better than writing a multiline if statement for each argument in each method in your project. Second Idea: was to use extension methods to facilitate usage syntax like:

[sourcecode language='csharp']
public void MyMethod(int argument1, string argument2)
{
    // validate args
    argument1.RequireInRange(argument1, 0, 10, "argument1");
    argument2.RequireNotNull(argument2, "argument2");
}
[/sourcecode]

Now this is starting to look pretty smooth, however we go one step further, combining the new features of Generics(C# 2.0) and Extension methods (C# 3.0) to get something that is SUPER smooth. The idea, which was of course new to me, is to a) create a generic type for argmuments. I used one similar to theirs, basically just a container for name and value of an argument the value being the arg itself of the type "T" as defined by the generic. Then b) use extension methods to add validation methods to this generic class, thus making them available to any type. Here is my generic argument container class that is the one extended:

[sourcecode language='csharp']
public class ArgumentEx
{
    public T Value { get; set; }
    public string Name { get; set; }
    public ArgumentEx(T value, string name)
    {
        this.Value = value;
        this.Name = name;
    }   
    public static implicit operator T(ArgumentEx arg)
    {
        return arg.Value;
    }
}
[/sourcecode]

This class simply wraps an argument with a generic container in essence. We set the default operator to return the arg itself (the "Value" member) and create a simple ctor. Now instead of having to write an extension method for each type we want to be able to validate (int, string, etc.) we just write one extension method for this class. First we write an extension method for the generic T type of our generic class and that will give us coverage of all types and this will always return us an instance of our new ArgumentEx type:

[sourcecode language='csharp']
public static class ValidatorExtensions
{
    public static ArgumentEx RequireThat(
        this T arg, string name)</pre>
<pre style="padding-left:30px;">    {
        return new ArgumentEx(arg, name);
    }
}
[/sourcecode]

Now we can call this RequireThat method from any argument we pass in to any method and we will get back our ArgumentEx class which we have extended with validation methods such as this:

[sourcecode language='csharp']
[DebuggerHidden]
public static ArgumentEx NotNull(
    this ArgumentEx arg) where T : class
{           
    if (arg.Value == null)
        throw new ArgumentNullException(arg.Name);
    return arg;     // for fluency
}
[/sourcecode]

This method extends the ArgumentEx type rather than the generic T type so we have all of our extension methods hanging off of the wrapper class. This setup is a touch abstract but it allows us to do super pretty things like this:

[sourcecode language='csharp']
public ReportInfo(string pathToXmlFile)
    : base(null, null)         
{
    // validate args
    pathToXmlFile.RequireThat("pathToXmlFile").IsNotNull();           
}
[/sourcecode]

not bad in the way of readability and extensibility too. Because the extension methods return the arg instance every time you can chain calls as well.

 

Below is the class diagram for the validation/argument extensions.  There are a few string extensions too added for convenience...

 

[caption id="attachment_36" align="aligncenter" width="410" caption="Class diagram for the validation extension classes."]<a href="/assets/images/extensionsclasses.png"><img class="size-full wp-image-36 " title="Validation Extension Classes" src="/assets/images/extensionsclasses.png" alt="Class diagram for the validation extension classes." width="410" height="350" /></a>[/caption]

 

 

 

And here is a screenshot of the unit tests all green and pretty!

 

[caption id="attachment_37" align="aligncenter" width="545" caption="A screenshot of the pretty green unit test results!"]<a href="/assets/images/extenstionsunittests.png"><img class="size-full wp-image-37 " title="Validation Extension UnitTests" src="/assets/images/extenstionsunittests.png" alt="A screenshot of the pretty green unit test results!" width="545" height="242" /></a>[/caption]

 

 

 

So now I have an easy to use and further extensible system for validating method arguments with out having to write if/throw constructs over and over inside of each method.  This promotes better code because the easier it is to validate my arguments the more likely it is that I will do a thorough job of it.