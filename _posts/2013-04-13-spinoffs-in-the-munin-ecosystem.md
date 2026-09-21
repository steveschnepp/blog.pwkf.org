---
layout: post
title: "Spinoffs in the munin ecosystem"
date: 2013-04-13 10:53:37 +0100
tags: munin sysadmin
permalink: /post/2013/04/Spinoffs-in-the-munin-ecosystem
author: Steve SCHNEPP
excerpt_separator: </p>
---

Munin's greatest strength is its very KISS architecture. It therefore gets many things right, such as a huge modularity.

**KISS is the core design of Munin**

Each component (master/node/plugin) has a simple API to communicate with the others.

## Spin-offs ...

I admit that the master, even the node, have convoluted code. In fact some rewrites already do exist.

### ... are welcomed ...

And they are a really good thing, as it enables rapid prototyping on things that the stock munin has (currently) trouble to do.

The stock munin is a piece of software that many depend upon, so it has to move at a much slower pace than one does want, even me. As much as I really want to add many many features to it, I still have to take extra care that it doesn't break stuff, even the least known features.

So I take munin off-springs very seriously and even offer as much help as I can in order for them to succeed.

### ... because they are very valuable in the long term

In my opinion competition is only short bad in the short term, and in the long term they usually add significant value to the whole ecosystem. That said, there's always a risk to become slowly irrelevant, but I think that's the real power of open-source's evolutionary paradigm : embrace them or become obsolete and get replaced.

Since, if someone takes the time to author a competitor that has a real threat potential, it mostly means that there's a real itch to scratch and that many things are to be learnt.

## Different layers of spin-offs

The munin ecosystem is divided in 3 main categories, obviously related to the 3 main components of munin : master, node & plugin.

### Plugins

That's the most obvious part as custom plugins are the real *bread and butter* of munin.

Stock plugins are mostly written in Perl or POSIX shell, as Perl is munin's own language and POSIX shell is ubiquitous. That fact is acknowledged by the fact that core munin provides 2 libraries (Perl & Shell) to help plugin authoring.

So, it's quite natural that each mainstream language has grown its own plugin library. Some language even have [two](https://github.com/aouyar/PyMunin) of [them](https://github.com/samuel/python-munin).

#### C

Some plugins got even rewritten in plain C, as it was shown that shell plugins do have a significant impact on very under-powered nodes, such as embedded routers.

### Node

This component is very simple. Yet, it has to be run on all the nodes that one wants to monitor. It is currently written in Perl, and while that's not an issue on UNIX-like systems, it can be quite problematic on embedded ones

#### Simple munin

The official package comes with a POSIX shell rewrite that has to be run from inetd. It is quite useful for embedded routers like OpenWRT, but still suffers from an hard dep on POSIX shell and inetd.

#### SNMP

SNMP is another way to monitor nodes. While it works really well, it mostly suffers the fact that its configuration is quite different of the usual way, so I guess some things will change on that side.

#### Win32 ports

Win32 has long been a very difficult OS to monitor, as it doesn't offer much of the UNIX-esque features. Yet the number of win32 nodes that one wants to monitor is quite high, as it makes munin one the few systems that can easily monitor heterogeneous systems.

Therefore, while you can install the stock munin-node, several projects emerged. We decided to adopt [munin-node-win32](http://munin-monitoring.org/browser/munin-node-win32).

#### Android

There's also a dedicated [node for Android](https://github.com/silverchris/Android-Munin-Node). It makes sense, given that the Android is yet Linux-derived, but lacks Perl, and is a Java mostly platform. This node also has some basic capabilities of pushing data to the master instead of the usual polling.

This is specially interesting given the fact that Android nodes are usually loosely connected, so the node spools values itself and pushes them when it recovers connectivity.

Note that this is specifically an aspect that is currently lacking in munin, and I'm planning to address it in the 2.1 series. So thanks to its author for showing a relevant use-case.

#### C

That's my last experiment. It started with a simple question : *how difficult would it be to code a fairly portable version of the node ?*

It turned out that it wasn't that difficult. I'm even asking myself about eventually replacing the win32 specific port with this one, as the code is much simpler. The win32 node has several plugin built-in mostly due to platform specifics. I still have to find a way to work my way around it, but it's in quite good shape.

This post was originally done to promote it, but while writing it I noticed that the ecosystem deserved a post on its own. So I'll write another one, specific to the C port of munin-node and plugins.

### Master

The master is the most complex component. So rewrites of it won't happen as-is. They usually take the form of a bridge between the munin protocol and another graphing system, such as Graphite.

#### Clients

There are also client libraries that are able to directly query munin nodes, to be able to reuse the vast ecosystem. Languages are various, from the obvious [Python](http://julien.danjou.info/projects/pymunincli/) to [Ruby](https://github.com/sosedoff/munin-ruby), along with a quite modern [node.js](https://github.com/Redpill-Linpro/node-munin-client) one.
