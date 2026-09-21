---
layout: post
title: "Waiting for Munin 2.0 - Performance - Asynchronous updates"
date: 2010-06-13 07:07:55 +0100
tags: munin munin20 performance scaling
permalink: /post/2010/06/Waiting-for-Munin-2%2e0-Performance-Asynchronous-updates
author: Steve SCHNEPP
excerpt_separator: </p>
---

`munin-update` is **the** fragile link in the munin architecture. A **missed execution** means that some **data is lost**.

## The problem : updates are synchronous

In Munin 1.x, updates are synchronous : the value of each service[^1] is the one that `munin-update` retrieves each scheduled run.

The issue is that `munin-update` has to ask every service on every node for their values. Since the values are only computed when asked, `munin-update` has to wait quite some time for every value.

This **very simple design** enables munin to have the **simplest plugins** : they are completely **stateless**. While being one great strength of munin, it puts a severe blow on scalability : more plugins/node means obviously a slower retrieval.

## Evolving Solutions

### 1.4 : Parallel Fetching

1.4 addresses some of these scalability issues by implementing parallel fetching. It takes into account that the **most of the execution time** of `munin-update` is spent **waiting for replies**. In 1.4 `munin-update` can ask `max_processes` nodes in parallel.

Now, the I/O part is becoming the next limiting factor, since updating many RRDs in **parallel** is the same as **random I/O** access for the underlying munin-master OS. Serializing & grouping the updates will be possible with the new RRDp interface from rrdtool version 1.4 and on-demand graphing. Tomas Zvala even offered [a patch for 1.4 RRDp](http://sourceforge.net/mailarchive/message.php?msg_name=4BEDB877.9050004%40zvala.cz) on the ML. It is very promising, but doesn't address the root defect in this design : a hard dependence of regular `munin-update` runs.

### 2.0 : Stateful plugins

2.0 provides a way for plugins to be stateful. They might schedule their polling themselves, and then when `munin-update` runs, only emit collect already computed values. This way, a **missed run** isn't as dramatic as it is in the 1.x series, since **data isn't lost**. The data collection is also **much faster** because the real computing is done **ahead of time**.

### 2.0 : Asynchronous proxy node

But **changing plugins** to be **stateful** and self-polled is **difficult** and tedious. **It even works against of one of the real strength of munin** : having simple & stateless plugins.

To address this concern, an experimental proxy node is created. For 2.0 it takes the form of a couple of processes : `munin-async-server` and `munin-sync-client`.

## The proxy node in detail (`munin-async`)

### Overview

These 2 processes form an asynchronous proxy between `munin-update` and `munin-node`. This avoids the need to change the plugins or upgrade `munin-node` on all nodes.

`munin-async-server` should be installed on the same host than the proxied `munin-node` in order to avoid any network issue. It is the process that will poll regularly `munin-node`. The I/O issue of `munin-update` is here non-existent, since `munin-async` stores all the values by simply appending them in a text file without any further processing. This file is later read by the client's `munin-update`, and it will be processed there.

### Specific update rates

Having one proxy per node enables a polling of all the services there with a specific update rate.

To achieve this, `munin-async-server` forks into multiple processes, one for each proxied service. This way each service is completely isolated from the other, and therefore is able to have its own update rate, is safe from other plugins slowdowns, and it does even completely parallelize the information gathering.

### SSH transport

`munin-async-client` uses the new SSH native transport of 2.0. It permits a very simple install of the async proxy.

[^1]: in 1.2 it's the same as plugin, but since 1.4 and the introduction of **multigraph**, one plugin can provide multiple **services**.
