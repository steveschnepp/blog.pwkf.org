---
layout: post
title: "Keep your caches coherent : Scope them !"
date: 2007-10-09 04:42:24 +0100
tags: []
permalink: /post/2007/10/11/Keep-your-caches-coherent-%3A-Scope-them
author: Steve SCHNEPP
excerpt_separator: </p>
---

You can mostly have these kind of scoping

* Sub-routine (typically a function or a statement bloc)
* Request (typically in a `HttpServletRequest`)
* Session (typically in a `HttpSession`)
* Node (typically in a JVM)
* Application (typically on a specific node)
* Time (typically a filenumber per day / most cached values)

Here we encounter at last the _Time_ scope. This one is the hardest
to cope with when it come to cached values. Usually a quick and dirty caching
is done with a combinaison of a Map that contains Keys linked to a TimedValue.
The last part is composed of the value itself and a sort of _expiration date_
(can also be implemented with a _manufactured date_).

The biggest problem with these time-scoped values are that they are not
easily updated to maintain coherency with the value they should be a copy of.
It involves that for each update, we manage to find the cached value and either
delete it (so that it can be recomputed later) or update it. It's not really
acceptable since :

1. it is really coding-wise intrusive (you have to seek every place that you
update an element of the calculation of the cached value) to put triggers
everywhere, and therefore not really practical, not to say sometime not even
possible (you don't own the whole code)
2. it is really performance-wise disastrous : for every write you do, you have
to fire the trigger to update all your caches that impacted from this
update.

So, usually this triggering is just avoided, and the cache is left in a
non-coherent state. And in reality it ends up in a fighting of
__speedup__ vs __accuracy__.

But this fight sometimes can be avoided if you scope correctly your caches
by storing it in an appropriatly scoped variable and not as usually done in a
static variable. It will have the same effect as a transaction in a database
since it's basically a copy-on-read scheme. Putting it in an appropriatly
scoped variable has the net effect of relieving of pruning the cache with data
that are not valid anymore without any extra effort.

This lays the premice of [STM](http://en.wikipedia.org/wiki/Software_transactional_memory) that will be something that will really count in the era of
massive-multi-core-computing (MMCC) that we are beginning to enter with
processors like [Sun's Niagara T2](https://en.wikipedia.org/wiki/UltraSPARC_T2) and its 64 thread per CPU.
