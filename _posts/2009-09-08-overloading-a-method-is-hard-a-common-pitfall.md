---
layout: post
title: "Overloading a method is hard : a common pitfall"
date: 2009-09-08 13:21:10 +0100
tags: java
permalink: /post/2009/09/Overloading-method-is-hard-%3A-a-common-pitfall
author: Steve SCHNEPP
excerpt_separator: </p>
---

As I said in my [equality article](/post/2009/06/Equality-in-Java-is-a-Hot-Topic-but-a-Hazardous-one), overloading in Java[^1] is resolved by the **static** type of the argument, not the **run-time** type.

It's a **generic** problem of most compiled OO languages since usually **overloading resolution happens at compile-time and not at runtime**.

Now, *that* militates for the well known idiom :

> Never overload a method with one that has the same number of parameters.

Actually, it should be enough to overload a method with one that accept parameters that are not inheritance-related : `String` and `Number` would be OK, but `MyClass` and `Object` would not.

[^1]: It's not really a *Java*-ism, it's the same in other languages, such as C++ .
