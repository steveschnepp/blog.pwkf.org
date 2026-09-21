---
layout: post
title: "Use Immutable Objects to Avoid Synchronisation"
date: 2007-12-03 20:46:00 +0100
tags: java best-practices
permalink: /post/2007/12/03/Use-immutable-objects-to-avoid-synchronisation
author: Steve SCHNEPP
excerpt_separator: </p>
---

With the future and its multiple core environnements as stated in a previous post about [workflows](/post/2007/09/10/Are-Workflows-the-Future-of-IT-Computing), efficient locking will be more and more an issue.

My previous way to cut this gordian knot was to :

1. multiply the objects that could be locked to reduce contention : have many multiple elementary objects . These can be workcases in the workflow theory.
2. *cheat* to minimize the time spend on locking : use something called [software transactional memory](http://en.wikipedia.org/wiki/Software_transactional_memory) that only locks at aquiring the ressource (actually, here it means taking a copy) and only updating it at the end of the processing (remember those infamous access EJB ?). This can be that at be beginning of computing a task, every data from the workcase is copied in a new, non-shared, worktask. All the task work will then be done on the privately copied data. It can surely be optimised in copying only the data that "might" be used (read and/or write). And at the end of the task, the workcase is just "commited" (updated) in the main data storage. The nice thing is that you only need to synchronise the beginning, the end and to prevent concurrent modifications (usually done with a incrementing version counter).

Now, if you cross this with another previous post about [caching cleverly and sparingly](/post/2007/10/11/Keep-your-caches-coherent-%3A-Scope-them), you can also have another way of having for exemple a configuration that is at the same time :

1. fast
2. can be updated at runtime
3. transactional (once you access it once, you will have all the properties that are coherent together)

The idea is to use [immutable objects](http://en.wikipedia.org/wiki/Immutable_object) (such as java.lang.String). They are usually despised as memory eaters since you have to create a whole bunch of objects since you cannot modifiy them, only recreate them with the updated values. But they have a very nice property : there are completly thread-safe, since no one can modify them, so they are lock-free.

So, just imaging that the first time you ask for a configuration, you just load the whole in an immutable config object into something like a singleton. You just hand a reference to it to the called after you stored the reference in the caller's context (could be a HttpServletRequest). The second time the caller asks for the configuration it's already in its HttpServletRequest, so you take it from there.

Meanwhile some other thread just asks to refresh the configuration, a new immutable config object is created, it's swapped with the old one (only the reference is updated, not the object). This swap and the handing are to be synchronized together (it's not even always mandatory, since usually if there are several handings that give the old value, it's often not that problematic : the whole ole value is coherent). When all the old contexts will go out of scope, so will the old config object.

The use of immutable objects has becomed much easier with GC, since we don't have to track the scoping anymore (usually it was done through a pseudo-immutable object, that was only mutable on the reference counting).

It's also one application of COR (Copy On Read) instead of the more usual COW (Copy On Write).
