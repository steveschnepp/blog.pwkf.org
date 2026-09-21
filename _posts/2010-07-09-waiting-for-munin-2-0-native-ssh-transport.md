---
layout: post
title: "Waiting for Munin 2.0 - Native SSH transport"
date: 2010-07-09 08:33:40 +0100
tags: munin munin20 ssh sysadmin
permalink: /post/2010/07/Waiting-for-Munin-2%2e0-Native-SSH-transport
author: Steve SCHNEPP
excerpt_separator: </p>
---

In the munin architecture, the munin-master has to connect to the munin-node via a very simple protocol and plain TCP.

This has several advantages:

1. **Very** simple to manage & install
2. Optional SSL since 1.4 enabling secure communications
3. Quite simple firewall rules.

It has also some disadvantages:

1. A new listening service means a wider exposure
2. The SSL option might add some administrative overhead (certificates management, ...)
3. A native protocol isn't always covered by all firewall solutions
4. Some organisations only authorize a few protocols to simplify audits (ex: only SSH & HTTPS)

## Native SSH

These down points may be solved by [encapsulation over SSH](http://munin-monitoring.org/wiki/MuninSSHTunneling), but it can be a tedious task to maintain if the number of hosts increases.

Therefore 2.0 introduces the concept of a **native SSH** transport. Its usage is dead simple : replace the address with an `ssh://` URL-like one.

The node still has to be modified to communicate with `stdin`/`stdout` instead of a network socket. For now, only [pmmn](/post/2008/11/04/A-Poor-Man-s-Munin-Node-to-Monitor-Hostile-UNIX-Servers) and [munin-async](/post/2010/06/Waiting-for-Munin-2.0-Performance-Asynchronous-updates) are able to provide such a node.

### Configuration

The URL is quite self-explanatory as shown in the example below:

```
[old-style-host]
    address host.example.com

[new-style-host]
    address ssh://munin-node-user@host.example.com/path/to/stdio-enabled-node --params
```

### Installation notes

Authentication should be done without password but via SSH keys. The connection is from `munin-user@host-munin` to `munin-node-user@remote-node`.

If you use `munin-async`, the user on the remote node might only be a readonly one, since it only needs to read spooled data. This implies that you use `--spoolfetch` and not `--vectorfetch` that updates the spool repository.

## Upcoming HTTP(S) transport in 3.0

And the sweetest part is that since all the work has been done for adding another transport, adding a CGI-based HTTP transport one is possible (and therefore done) for 3.0.
