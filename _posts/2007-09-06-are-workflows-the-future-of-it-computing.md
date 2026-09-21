---
layout: post
title: "Are Workflows the Future of IT Computing ?"
date: 2007-09-06 06:26:24 +0100
tags: best-practices
permalink: /post/2007/09/10/Are-Workflows-the-Future-of-IT-Computing
author: Steve SCHNEPP
excerpt_separator: </p>
---

We are about to change from a "CPU power is cheap"-paradigm to a "CPU are cheap"-one. Everyone knows now that the 10Ghz barrier will not be that easily broken like said Herb Sutter in his famous [The Free Lunch Is Over](http://www.gotw.ca/publications/concurrency-ddj.htm) DDJ article.

I also think it will be much cheaper to produce a 3Ghz 128-core CPU than a 10Ghz 1-core one, and that's a huge problem in our current way to code. Current common code just isn't adapted to a many-cpu world as said Jeff Atwood in his [comparison of 4- and 2-way systems](http://www.codinghorror.com/blog/archives/000942.html). It's because real parallel programming is not easy. Even our current practices of locking are quite difficult to get right.

A good way do it efficiently, is to delegate the plumbing of parallelizing the tasks to an automated system. It seems at first less efficient to do, but noone really want to go back to ASM programming. We really have to define a new level of language that auto-parallelize the treatements, like the way we code in a high-level language that is either interpreted or even compiled.

This move in the programming area is of same order than the move from ASM to scripting or compiled language. And here you have 2 differents approaches :

- the static (compiled) way
- the dynamic (interpreted) way

In the static way, you have also mostly 2 choices :

- a language (usually compiled) that handle the dividing & regrouping of tasks, like the model followed by [OpenMP](http://en.wikipedia.org/wiki/OpenMP) using mainly threads, shared memory and locking.
- a language (usually fonctionnal) that handle the differents tasklets with a message-passing like interface ([Erlang](http://www.pragmaticprogrammer.com/articles/erlang.html) is a good example of this)

The dynamic road is less defined. But usually it involves a state-flow machine, that can coordinate all the tasks to do on all the processing units. That is usually done via a Workflow (also called BPM-engine in this particular area), like the Master-Worker pattern [Alex Miller](http://tech.puredanger.com/2007/08/30/workflow-terracotta/) speaks about.

This last item is, in my opinion the future. If you put everything in a database, and the BPM-engine interprets each item independantly, wich a high focus on a runtine resolution of the next thing to do. It gives you a highly flexible design that you can change at runtime without much of trouble. Its flexibility is quite the same the one you would have with scripting languages (think Ruby) versus compiled one (think Java).
