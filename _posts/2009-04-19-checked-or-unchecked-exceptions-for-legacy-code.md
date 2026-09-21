---
layout: post
title: "Checked or Unchecked Exceptions for Legacy Code ?"
date: 2009-04-19 12:32:30 +0100
tags: java best-practices
permalink: /post/2009/07/Checked-or-Unchecked-Exceptions-for-Legacy-Code
author: Steve SCHNEPP
excerpt_separator: </p>
---

In theory checked exceptions are quite nice since the called code can communicate with it's caller when something unexpected happened.

## Checked Exceptions are breaking encapsulation

The key word here is *unexpected*. If you have to explicitly know the exceptions that could occur, it's not really unexpected. And if it's not unexpected, using exception handling just add an *out-of-band* data path. It's on par with transporting data in a private class field when calling a member instead of using its arguments. This leads to breaking encapsulation as Alan Griffiths wrote in [Exceptional Java](http://www.octopull.demon.co.uk/java/ExceptionalJava.html). This vision is also shared by Bruce Eckel in his article entitled [Does Java need Checked Exceptions](http://www.mindview.net/Etc/Discussions/CheckedExceptions)?

## Checked Exceptions are quite painful to use

### Local Exception Handling is hard to manage

I personally find checked exceptions quite painful to use. By definition, you have to catch every exception that is thrown by the underlaying code.

And if the underlaying code doesn't know what to do with the exception, chances are, that you don't know either, so you just pass the exception to the caller. And so on...

### Too much code to change

Therefore exceptions are usually caught at the top level with a generic catch-all structure that logs the error, since no layer could sensibly do something clever with the exception.

Then you just have to change all the signature of the whole stack, just to be able to catch them at the top. Using unchecked exception lets you have this for free, and conveys the meaning that nothing is caught until the top.

## Unchecked Exceptions might be dangerous...

Obviously, unchecked means not checked. So you might fail to catch them at the top level and then the whole application crashes. Checked exceptions are a safeguard against that. Just like strong static typing is.

**You trade compile-time safety** (checked) **for development-time speed and ease** (unchecked).

## ... but are not really.

On the other hand, if you have a good design, you don't have much different top levels, and then the risk is somewhat limited.

**Moreover, since you *always* have to take unchecked one into account, why don't use them ?**

By the way, in C++, the exceptions are unchecked by default.
