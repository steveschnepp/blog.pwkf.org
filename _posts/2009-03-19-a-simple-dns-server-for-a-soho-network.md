---
layout: post
title: "A Simple Dns Server for a SOHO Network"
date: 2009-03-19 10:18:29 +0100
tags: dns networking
permalink: /post/2009/08/A-Simple-Dns-Server-for-a-SOHO-Network
author: Steve SCHNEPP
excerpt_separator: </p>
---

I'm in search of a very simple DNS Server for a small network. It should be :

- recursive & caching (can be used as a proxy)
- very simple administration (parsing /etc/hosts would be perfect, raw DNS zones like BIND would be a little bit overkill)
- quite lightweight (aka no dependency on an SQL engine like MySQL, such as MyDNS)
- Seamless integration to Windows lookups (nmblookup) via proxying functions (DNS to/from NMB)
