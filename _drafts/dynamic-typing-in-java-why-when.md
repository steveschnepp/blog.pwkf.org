---
layout: post
title: "Dynamic Typing in Java : why & when"
date: 2007-12-28 16:20:20 +0100
tags: []
---

<h2>Basics of dynamic typing</h2>
<p>When I began programming in Java, I had deep Perl &amp; C
backgrounds. I naturally was quite fond of dynamic typing since C was
usually considered as quite painful to write. It feeled like magic : you didn't
need to write many different classes to represent different data objects.</p>
<p>The idea is quite basic : wrap every property in a <code>Map</code> and
instead of using a named getter, you use a generic getter that has the property
name as an argument. You might even have multiple generic getters to be able to
directly return the needed type.</p>
<p>You can combine theses objects in Maps of Maps of Lists of Maps to be able
to store quite complex structures. When the model becomes quite complicated,
you might upgrade your home-grown solution in the much more fancy DOM.</p>
<p>DOM makes filtering, retrieving and iterating a breeze.</p>
<p>This has a very nice property of make code quite easy to adapt. No
constraints.</p>
<h2>The Problem</h2>
<p>This extreme flexibility comes at an extreme price : <strong>every type
checking has to be done at runtime</strong>. Now you can't easily divide user
data that inherently dynamic from application meta-data that is constant over a
run.</p>
<h2>A bit of context</h2>
<p>The main point to go on the road of dynamic typing was the la</p>
