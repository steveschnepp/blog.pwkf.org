---
layout: post
title: "Waiting for Munin 2.0 - Keep more data with custom data retention plans"
date: 2010-08-22 14:44:39 +0100
tags: munin munin20 sysadmin rrd
permalink: /post/2010/08/Waiting-for-Munin-2%2e0-Keep-more-data-with-custom-data-retention-plans
author: Steve SCHNEPP
excerpt_separator: </p>
---

Munin keeps its data in an [RRD database](http://oss.oetiker.ch/rrdtool/). It's a wonderful piece of software, designed for this very purpose : keep an history of numeric data.

## RRD is Munin's backbone.

All you need is to tell RRD for how long and the precision you want to keep your data. RRD manages then all the underlying work : pruning old data, averaging to decrease precision if needed, ...

Munin automatically creates the RRD databases it needs.

## 1.2 - Only one set

In 1.2, every database creation was done with the same temporal & precision parameters. Since the output parameters were constant (day, week, month, year graphs), there were little need to have a different set of parameters.

## 1.4 - 2 sets : normal & huge

In 1.4, various users showed their need to have different graphing outputs, and began to hack around Munin's fixed graphing. It became rapidly obvious that the 1.2 preset wasn't a fit for everyone.

Therefore a `huge` dataset was available to be able to extend the finest precision (5min) to the whole Munin timeframe. This comes at a price though : more space is required, and the graph generation is slower, specially when generating the yearly one, since more data has to be read and analysed.

The switch is done for the whole munin installation by changing the system-wide `graph_data_size`, although already created rrd databases aren't changed. It is then even possible for a user to pre-customize the rrd file. Munin will then happily uses them transparently thanks to the RRD layer.

### Manual overriding

Altering the RRD files after it is created is possible, but not as simple. Standard export & import from RRD take the structure with it. So data has to be moved around with special tools. [rrdmove](http://code.google.com/p/pmptools/source/browse/trunk/rrd/rrdmove) is my attempt to create such a tool. It copies data between 2 already existing RRD files, even asking RRD to interpolate the data when needed.

## 2.0 - Full control

Starting with 2.0, the parameter `graph_data_size` is per service. It also has a special mode : `custom`. [Its format](http://munin-monitoring.org/wiki/format-graph_data_size) is very simple:

```text
graph_data_size custom FULL_NB, MULTIPLIER_1 MULTIPLIER_1_NB, ... MULTIPLIER_NMULTIPLIER_N_NB
graph_data_size custom 300, 15 1600, 30 3000
```

The first number is the number of data at full resolution. Then usually it comes gradually decreasing resolution.

A decreasing resolution has 2 usages:

- Limit the space consumption : keeping full resolution for the whole period (default : 5min for 2 years) is sometime too precise.
- Increase performance : RRD will choose the best fitting resolution to generate its graphs. Already aggregated data is faster to compute.
