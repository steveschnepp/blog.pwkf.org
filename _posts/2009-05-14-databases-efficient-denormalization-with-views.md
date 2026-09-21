---
layout: post
title: "Databases: Efficient Denormalization with Views"
date: 2009-05-14 15:35:15 +0100
tags: sql database best-practices
permalink: /post/2009/05/Efficient-Denormalization-with-Views
author: Steve SCHNEPP
excerpt_separator: </p>
---

On the other side, to **denormalize** is sometimes seen as a way to :

- **optimize development** : you do not need to write (and debug) complex queries since all the data is nicely located in the same table
- **optimize performance** : the data has a better locality (no need to fetch or compute data from elsewhere). You can even pre-compute [order totals](http://database-programmer.blogspot.com/2008/11/keeping-denormalized-values-correct.html)[^1].

Denormalize correctly is quite difficult since **one change** snowballs in **multiple updates** to keep the redundant data coherent. It is therefore usually done on the **application side** with ready-to-use ORM frameworks. But managing it at the application level comes with an ugly cost : it has to be **reimplemented over and over** each time the application switches technology, version or when a new application is connecting to the database.

In almost every programming language, code reuse is encouraged. Here, at the database level, we can also apply the same principles, and use views to transparently present a denormalized API (read *tables*) on a more normalized schema.

The main points are :

- Views are the main code reuse vector at the database level. Current database usually correctly optimize (by rewrite and recombination) the simple queries so that performance is on par with a hand crafted query that doesn't use the views
- Sometime even faster since the data is nicely organized, so there is much less data to transfer, and I/O bandwidth is a usual suspect.
- The application part doesn't even need to know that normalization happens under-hood since [updates to views](http://www.ibm.com/developerworks/db2/library/techarticle/0210rielau/0210rielau.html) are possible in many modern RDMs with the [@@INSTEAD OF@@ trigger](http://publib.boulder.ibm.com/infocenter/ids9help/topic/com.ibm.sqlt.doc/sqltmst333.htm) (or something [equivalent](http://www.postgresql.org/docs/current/static/rules-update.html)).
- Theses updates can be created with [Materialized views](http://en.wikipedia.org/wiki/Materialized_view) are a step even further on the denormalizing road, since it provides the common benefits of denormalize without the implementation caveats. We can even hand-craft these *Materialized views* directly in an aggregation table in order to have the space benefits of normalisation and the performance benefits of denormalization.

So, nothing stops you from normalizing at will, and denormalizing when needed. Where to put the cursor is yours to decide, but moving it afterwards is finally easier that what is commonly admited.

[^1]: That article also explains why **denormalization maintenance must stay at the database level** with a very interesting metaphor
