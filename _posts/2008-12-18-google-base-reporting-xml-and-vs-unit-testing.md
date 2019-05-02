---
id: 7
title: Google Base, Reporting Xml, and VS Unit Testing
date: 2008-12-18T09:40:54-04:00
author: John Gilliland
layout: post
permalink: /2008/12/18/google-base-reporting-xml-and-vs-unit-testing/
categories:
  - 'C#'
  - Work
tags:
  - 'C#'
---
I have been working on an interesting project here at work.  I had previously been working on some fixes for a windows service (written in C#) that uploaded our catalog items to Google Base, based on some logging and comparison diffs, every fifteen minutes if there were new items or updates to items.  But, with that seemingly on its way now, I was assigned this new project.  Basically I am working on a system that will allow the definition of sql queries, or data "views" via an <abbr title="eXtensible Markup Language">XML</abbr> schema.  Yes, I know there is already <a title="Report Definition Language Spec [2008]" href="http://www.microsoft.com/downloads/details.aspx?FamilyID=2a20c7af-52e8-4882-bd24-9479b3c7517d&amp;displaylang=en" target="_blank">RDL</a> for <a title="Microsoft SQL Server Reporting Services" href="http://www.microsoft.com/sqlserver/2008/en/us/reporting.aspx" target="_blank">SQL Reporting Services</a>, but that is not what they want.  They want a much, much simpler setup that will make it easier for a developer on the team to make changes to, or add a new report, by editing the <abbr title="eXtensible Markup Language">XML</abbr>  definition file.

So, off I go.  I started with the whiteboard notes that were put up during my initial meeting about this, and the sample <abbr title="eXtensible Markup Language">XML</abbr> there-in, and have tried to keep it as simple as possible.  I am using classes for each logical report entity, such as:  Report, Query, Column, Parameter, etc.  I am also using the <a title="Visual Studio Test System" href="http://msdn.microsoft.com/en-us/library/ms379625.aspx" target="_blank">VS unit testing framework</a> for this project, which is something I hadn't done previously, but wanted to.  Let me qualify that by saying up front that I am not using <abbr title="Test-Driven Development">TDD</abbr> strictly speaking.  But I am writing tests for code, classes and methods, as I go.  I must say I am quickly becoming hooked on the idea of unit testing everything, whether you are designing with <abbr title="Test-Driven Development">TDD</abbr> or not, it just makes sense, and it does honestly help with design decisions.  By testing your code as you go or before hand you get a quick look at how it will be called, which in my case where I am developing what hopes to be an api of sorts that will be extended and re-used often is a great benefit.  <!--more-->

I am going to try and post my progress with work and specifically this project as I go because I am learning a lot and because this one is already a fun one.  Here is a quick taste.  This is the <abbr title="eXtensible Markup Language">XML</abbr> markup for a report as far as I have designed yet.  No, it is not complete, and yes, I will probably change it many times before it is done, but it is a start.  I have coded interfaces, base classes and implementations for all of this markup so far...
<pre style="padding-left:30px;"><span style="color:#808080;">&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;report name="test report"
  author="programmer"
  title="A Test Report"
  description="A test report description."
  created-on="2007-12-31"
  modified-on="2008/01/01"&gt;
  &lt;column name="ID" display="ID" type="Bound" /&gt;
  &lt;column name="NAME" display="Advertiser Name" type="Bound" /&gt;
  &lt;column name="MODIFY_DATE" display="Last Modified" type="Bound" /&gt;
  &lt;column name="TOTAL_ITEMS" display="Total Items" type="ReportLink"&gt;
    &lt;displayinfo type="reportlink"&gt;
      &lt;href&gt;itemsbyadvertiser.xml?id=[ID]&lt;/href&gt;
      &lt;placeholder name="ID" value="[ID]" /&gt;
    &lt;/displayinfo&gt;
  &lt;/column&gt;
  &lt;query name="AdvertiserItemCounts"&gt;
    &lt;sql&gt;
      SELECT ID, NAME, MODIFY_DATE, (
      SELECT COUNT(ID) FROM ITEM
      WHERE ADVERTISER_ID = a.ID
      ) AS TOTAL_ITEMS FROM ADVERTISER a
      ORDER BY TOTAL_ITEMS DESC
    &lt;/sql&gt;
    &lt;connection database="Internet" /&gt;
  &lt;/query&gt;
&lt;/report&gt;</span></pre>
