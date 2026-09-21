---
layout: post
title: "Enhance RRD I/O performance in Munin 1.4 and Scale"
date: 2011-06-20 07:42:41 +0100
tags: rrd munin performance sysadmin
permalink: /post/2011/06/Enhance-RRD-I/O-performance-in-Munin-1%2e4-and-Scale
author: Steve SCHNEPP
excerpt_separator: </p>
---

As with most of the RRD-based monitoring software (Cacti, Ganglia, ...), it is quite difficult to scale.

The bad part is that **updating** **lots** of small RRD files seems like **pure random I/O to** the OS as stated in there documentation.

The **good part** is that we are not alone, and therefore the **RRD developers did tackle the issue** with [rrdcached](http://oss.oetiker.ch/rrdtool/doc/rrdcached.en.html). It spools the updates, and flushs them to disk in a batched manner, or when needed by a rrd read command such as graphing. That's why it is **scales** well when using **CGI graphing**. Otherwise, munin-graph will read every rrd, and therefore force a flush on all the cache.

And the icing on the cake is that, although it is only fully integrated to munin 2.0, **you can use it right away in the 1.4.x series**.

You only need to define the environment variable `RRDCACHED_ADDRESS` while running the scripts accessing the RRDs.

Then, you have to remove the `munin-graph` part of the `munin-cron` and run it on its own line. Usually only every hour or so, to be able to accumulate data in `rrdcached` before flushing it all to disk when graphing.

Updating to 2.0 is also an option to have a real CGI support. (CGI on 1.4 is existing but has nowhere decent performance).
