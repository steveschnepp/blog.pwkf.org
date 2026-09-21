---
layout: post
title: "Should SQL die, and can it ?"
date: 2007-05-30 19:47:49 +0100
tags: sql best-practices
permalink: /post/2007/05/30/Should-SQL-die-and-can-it
author: Steve SCHNEPP
excerpt_separator: </p>
---

I just draw a comparison of the data language and the general languages :

- Creating our data structures by hand feels like ASM and its multiple wheels reinvented everytime.
- Vanilla SQL feels like C and its bare instruction set.
- Advanced SQL (Stored Proc et al) feels just like C++ and all those *almost* compatible implementations.
- A statically compiled ORM (think [Hibernate](http://www.hibernate.org/)) feels like Java and it's strong typing system with its truckload of runtime casts.
- A dynamic ORM (think [ActiveRecord](http://en.wikipedia.org/wiki/Active_record_pattern)) feels like a dynamic scripting language and its "wow" factor at the beginning, rapidly followed by the "is-this-the-fastest-cpu-available" factor.

I have some grudges against the ORM i'm using now :

- It's not really easy to reverse-engineer a database. Everyone seems really happy to start with a fresh new one.
- Joins are optimised for only the simplest joins. (If it's not just a plain `foreach`-like application loop)
- If you have some complex things to do, the usual "you-always-can-write-a-custom-mapping" applies.

Not writing any SQL can be a nice goal, but i don't think that writing SQL is specially that hard. It's a quite good language for what it's designed for actually.

I think that today's ORM solutions are a little half-baked. It puts too much hassle on the user for the result it provides. He has to describe the whole database structure in order to manage to generate the differents objects that impersonate the undelaying tables.

Why can't this tedious process happen in runtime ? Ok, maybe not really in runtime, but either on compile time or on launch time. Two directions could be explored :

- The ORM could automatically adapt itself on the undelaying database schema by introspecting the schema (many DBA tools did that for years).
- The ORM could also adapt the database schema to runtime changes by doing some runtime `ALTER TABLE`.

In contrast, writing SQL yourselfs is often the easiest and fastest solution, since you directly and only ask what you want. It also allow you not to think too much about concurrency since that's usually what good RDBMS do the best. With an ORM, either you explain a lot your intentions, and then you often do the SQL optimiser job, or you hope that your ORM is clever enough to guess what you want to do. Usually it's not that good at it, and tries to hide it behind some agressive caching mecanism.

So I think SQL is here to stay a little while, just like C/C++ is. The ORM have no really catched up since. (We're like in the old days of non-JIT Java).

Btw, I even dreamed of an ORM in bijection with XML or [YAML](http://en.wikipedia.org/wiki/YAML) with a XPath query language, but I will write later on that.
