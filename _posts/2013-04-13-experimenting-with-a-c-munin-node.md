---
layout: post
title: "Experimenting with a C munin node"
date: 2013-04-13 16:59:16 +0100
tags: c munin design performance sysadmin
permalink: /post/2013/12/Experimenting-with-a-C-munin-node
author: Steve SCHNEPP
excerpt_separator: </p>
---

As I wrote about it earlier, Helmut rewrote some core plugins in C. It was maintly done with efficiency in mind.

## Core plugins are designed for simplicity...

As those plugins are only parsing one `/proc` file, there seemed no need to endure the many forks inherent with even trivial shell programming. It also acknowledges the fact that the measuring system shall be as light as possible

Munin plugin are highly driven towards simplicity. Therefore having shell plugins is quite logical. It conveys the educational sample purpose for users to write their own, while being quite easy to code/debug for the developpers. Since their impact on current systems is very small, there are not much incentive to change.

## ... but efficiency is coming !

Nonetheless, now monitored systems are becoming quite small.

It is mostly thanks to embedded systems like the [RaspberryPi](http://www.raspberrypi.org/). This means that processing power available is much lower than on *normal* nodes[^1].

**Now** the embedded C approach for plugins has a new rationale.

[^1]: Usually datacenter nodes are more in the high end of the spectrum than the low-end.
