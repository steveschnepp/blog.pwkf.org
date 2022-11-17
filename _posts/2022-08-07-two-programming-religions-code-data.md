---
layout: post
title: A Tale of Two Programming Religions
tags: sql database
author: Steve SCHNEPP
---

The obvious but overlooked secret of **computing** is that it
is always about only 2 things:

* Datas
* Algorithms

This binary divide translates itself into a partition of 2 kinds of
programmers. They differ in the architecture style of the code they produce.
Which exhibits itself in how they treat data.

## What do you worship?

### Holy Code

Key points:

* Application Architecture Modeling is the biggest time investment.
* Coding speed is paramount, but needs more experience
* Onboarding of new devs is slower, as code is more complex and usually takes advantage of all syntax sugar.
* Databases are mostly taken as a glorified data dump.
* Data constraints (unicity &amp; nullness) are enforced at the application
level.

Everything is done to ensure that **every change is only changing a small area**.

One's most important asset is the code. As it is fully debugged & testest, it
therefore should not change much. Additions are welcome for added features.
Special care is taken to put layer upon layer in order to be able for the code
to survive any outside change, usually via anticorruption patterns.

The PHP/MySQL tandem is a typical example of this philosophy, I think this
has precisely led to the common understanding that MySQL is a database that is
very fast but not so careful or feature-full as others.

The various J2EE stacks is also a good example with the ubiquitous ORM
solutions, such a Hibernate that tries very hard to reproduce the joining and
data checks in the Java.

The NoSQL trend is strong in that mindset. Data is quite cheap, and can
be cleaned or transformed to cope with any code refactoring.

This religion is usually encountered when one can loose some data, typically
for statistical flows.

### Holy Data

Key points:

* Data Modeling is the biggest time investment
* Coding speed is not that important, and needs less experience
* Onboarding of new devs is easier, as code is simpler
* Data constraints (unicity & nullness) are enforced in the Storage layer.
* Transactional behaviors are a must

Everything is done to ensure that **Data always remains consistent**.

*Holy Data* usually makes you vendor independent, since code can always be
rewritten. Data on the other hand, isn't that easily converted.

This religion is usually encountered when one cannot loose data, typically
financials or auditable flows.

## What is better ?

That last sentence makes it very easy to choose. It simply **boils down to
the expected longevity of the code** you are writing. The longer you'll have 
to maintain it, the more you need to take care of the data. 

Which is the current plague of our current "go fast & break things" motto.

We do not plan fo the long term anymore. Which is fine, as it enables agility.
Just always remind yourself, that after a while, you might need to convert
yourself to another religion. And *that* doesn't come for free.
