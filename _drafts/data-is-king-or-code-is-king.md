---
layout: post
title: "\"Data Is King\" or \"Code Is King\" ?"
tags: [sql, database]
author: Steve SCHNEPP
---

An often overlooked secret of **computing** is that it
**is** all and mostly about 2 things : **data** and
**algorithms**.

The resulting 2 kinds of programmers differ in their relationship with the
code they produce, especially in how it handles data.

## Code is King

Several key points :

* The most important asset is the code. Special care is taken to put layer
upon layer in order to be able for the code to survive any change outside
itself.
* Databases are mostly taken as a glorified data dump.
* Data constraints (unicity &amp; nullness) are enforced at the application
level.
* Coding speed is paramount.

The PHP/MySQL tandem is a typical example of this philosophy, I think this
has precisely led to the common understanding that MySQL is a database that is
very fast but not so careful or feature-full as others.

The various J2EE stacks is also a good example with the ubiquitous ORM
solutions, such a Hibernate that tries very hard to reproduce the joining and
data checks in the Java.

The current NoSQL meme turns also around this. Data is quite cheap, and can
be

## Data is King

* Developper-centric / DBA centric
* fast ROI, long investment
* "Data is King" makes you vendor independent, since code can always be
rewritten. Data on the other hand, isn't that easily converted.

## AJAX is a modern version of the same divide

More and more we put more and more code inside the browser with the help of
JavaScript. In the end, the application server tend to be not much more than a
way to relay Ajax/JSON requests to the database, the extreme rationalization of
this is [CouchDB](http://en.wikipedia.org/wiki/CouchDB).
