---
layout: post
title: "Equality in Java is a Hot Topic, but a Hazardous one."
date: 2009-06-01 15:38:29 +0100
tags: java
permalink: /post/2009/06/Equality-in-Java-is-a-Hot-Topic-but-a-Hazardous-one
author: Steve SCHNEPP
excerpt_separator: </p>
---

It seems that comparing two objects isn't as a simple task to do as it seems at first.

My concept for [smart comparison](/post/2009/05/Compare-Efficiently-in-Java-%3A-Embrace-Smart-Comparison) still holds, but is completed perfectly with the [How to Write an Equality Method in Java](http://www.artima.com/lejava/articles/equality.html) article posted on Artima soon after mine[^1].

2 main points that you have to be careful to (Others are also detailed in this article) :

- `hasCode()` has to be redefined usually since otherwise the [equality contract](http://www.geocities.com/technofundo/tech/java/equalhash.html) on `Object.hascode()` would be broken.
- the `equals()` has to take an Object as parameter since overloading in Java is resolved by the compile-time type of the argument, not the run-time type.

I just got bitten by the second one, but not much (yet) since I mostly rely on compile-time overloading. My purpose here was only to compare objects either to constants or to simple variables. But in the generalization I would certainly have overlooked this and be bitten much more deeply.

[^1]: But as much as I wished it to be, it is not related :-)
