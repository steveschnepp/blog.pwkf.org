---
layout: post
title: "Avoid those milli-hits in Munin"
date: 2013-02-01 09:47:16 +0100
tags: munin sysadmin monitoring
permalink: /post/2013/02/Avoid-those-milli-hits-in-Munin
author: Steve SCHNEPP
excerpt_separator: </p>
---

A recurring question on IRC is : "why do I have 500 million hit/s in my graph ?".

Turns out that they are really seeing `500m hit/s`, and that lower-case `m` means *milli*, and not *Mega* as specified in the [Metric system](http://en.wikipedia.org/wiki/Metric_prefix). This is automatically done by RRD.

To avoid this you should just specify `graph_scale no` as [specified](http://munin-monitoring.org/wiki/graph_scale).
