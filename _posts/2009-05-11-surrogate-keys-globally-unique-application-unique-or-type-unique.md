---
layout: post
title: "Surrogate Keys : Globally Unique, Application Unique or Type Unique ?"
date: 2009-05-11 05:47:09 +0100
tags: sql database best-practices
permalink: /post/2009/05/Surrogate-Keys-%3A-Globally-Unique-Application-Unique-or-Type-Unique
author: Steve SCHNEPP
excerpt_separator: </p>
---

## Type unique : One sequence per table

The most common idiom out there. Just define a surrogate key per table, usually done via an `auto_increment` field, `serial` field or a `sequence` per table.

It is the most natural way of thinking, since the ID is usually seen as a monotically incrementing counter. Therefore many applications use even the evil[^1] `SELECT MAX(ID)+1` construct, because they specifically require that there should be no missed rows and that the ID have to be strictly in order.

The usual implementation of this is to have a kind of thread-local function that hands unique ID allocated in group and never trying to reuse an already issued/allocated ID. If you reserve 50 ID at once you directly level the cost of locking the ressource to only 1 in 50 requests, and not trying to reuse them enables you to just have to lock the end of the spectrum and not the whole spectrum. That's what the `CACHE` keyword is about in [Oracle](http://www.techonthenet.com/oracle/sequences.php) and [PostgreSQL](http://www.postgresql.org/docs/8.3/static/sql-createsequence.html). Others RDBMS usually also have a similar option

But this optimisation leaves us with a big side-effect : the ID that are generated are not strictly in order anymore, and furthermore there can be huge gaps in them. Since one of the main purpose of one ID per table is now gone, why not directly bite the bullet and use the same ID generation on the the whole application ?

## Application unique : One sequence to rule them all

This is something I first experienced with [Subversion](http://subversion.tigris.org/), coming from a CVS background : the revision number is repository-wide and not file-wide anymore. This has some mental drawbacks at first, since you still know that a file of version 5324 is more recent than version 3200, but not *how much* more since the commits could have been done in another place. The difference is more visible with 1.4 versus 1.5.

But as I was more used to it, that thinking was obviously a red herring. It did divert us that a file could have been completely rewritten in just one revision, and that one signle line could have be flipped back and forth in several revisions,

So the number, and the gap between them, as the basis of the amount of modifications has its value decreased. What could be quite interesting though is that the revision number is globally incrementing[^2]. That enables us to know that a file in revision 1000 was commited before another one with revision 2000.

Back in our database, if we just define **one** sequence for all the ID in the database we have 2 advantages :

1. One ID represents only one row. Debugging is easier and when you see an ID *in the wild*, you can think of which row it represents.
2. You can establish an almost exact history of sequencing the creations of the rows.

The inevitable locking performance issue that arises often is made painless through bigger block allocations.

One of the lesser known issue is that, usually when using an ID per table, after a while you begin to *know* which ID belongs to wich table since all the tables are filled at different rates : 50083 is an order ID, whereas 13650239 looks more like a message ID.

## Globally unique :

If you push this logic a little bit further, you can even imagine that all the ID produced could be unique. Then you will have the benefits of unicity, but even on the whole IT level. It makes interapplication debugging easier, since the leaked keys can be nicely tracked down to their origin. How to generate such an unique ID is tricky question, since the applications usually are coded in heterogeneous environemments and technologies.

### A central ID service

The most obvious way is to have a central ID service, the same as the unique sequence in the application. It has to be accessed in a distributed way, and the implementation can be quite cumbersome thoughout all the different technologies that exists.

This service has also to have the highest [SLA](http://en.wikipedia.org/wiki/Service_level_agreement) as the applications that depends on it. It becomes then quickly a [SPOF](http://en.wikipedia.org/wiki/Single_point_of_failure) if not designed carefully.

### GUID

Since *online* ID generation has some serious drawbacks, the easiest *offline* way is to generate [GUIDs](http://en.wikipedia.org/wiki/Globally_Unique_Identifier), there are many hooks in each technology/application to be a quite educated move.

It also has drawbacks, but more in the semantic fields. A GUID is quite semantically opaque since looking at it does not tell you anything about where/when the ID was generated. You have to do a full key scan of all the applications to find its origin.

### Almost globally unique : Application ID + Application Unique

Earlier, we just found out the application-unique ID. If you pair it with an unique application ID, you just managed to have a globally unique ID. In the generation of this ID, you just prefix it with the ID of the application, and tada.... you have your globally unique ID.

The net effect is that if you see this ID in the wild, you know where it was created. If you have an increasing one, you can even guess almost *when*.

## Parallels between applications and networks

The more I think about it, the more I can draw parallels between rows in applications and adresses in networks, but I'll write more on that later in another article.

[^1]: Evil because it's usually not thread safe and quite horridly inefficient
[^2]: Actually in subversion it has a **strict** incrementing policy
