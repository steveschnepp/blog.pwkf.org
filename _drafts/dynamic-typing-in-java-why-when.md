---
layout: post
title: "Dynamic Typing in Java : why & when"
tags: []
---

## Basics of dynamic typing

When I began programming in Java, I had deep Perl & C backgrounds. I naturally
was quite fond of dynamic typing since C was usually considered as quite
painful to write. It feeled like magic : you didn't need to write many
different classes to represent different data objects.

The idea is quite basic : wrap every property in a `Map` and instead of using a
named getter, you use a generic getter that has the property name as an
argument. You might even have multiple generic getters to be able to directly
return the needed type.

You can combine theses objects in `Maps of Maps of Lists of Maps` to be able to
store quite complex structures. When the model becomes quite complicated, you
might upgrade your home-grown solution in the much more fancy [Document Object
Model (DOM)](
https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction),
that comes from the HTML (and XML) world.

DOM makes filtering, retrieving and iterating a breeze. And, now, this has a
very nice property of make code quite easy to adapt. No constraints.

## The Problem

Note that this extreme flexibility comes at an extreme price : **every type
checking has to be done at runtime**. Now you can't easily divide user data
that inherently dynamic from application meta-data that is constant over a run.

## A bit of context

The main point to go on the road of dynamic typing was the la
