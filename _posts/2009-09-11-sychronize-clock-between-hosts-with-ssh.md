---
layout: post
title: "Synchronize clock between hosts with SSH"
date: 2009-09-11 12:58:20 +0100
tags: ssh sysadmin
permalink: /post/2009/09/Sychronize-clock-between-hosts-with-SSH
author: Steve SCHNEPP
excerpt_separator: </p>
---

[NTP](http://en.wikipedia.org/wiki/Network_Time_Protocol) is very handy for server clock synchronisation, but it can be cumbersome to deploy.

Sometimes you just need to do a one-shot clock synchronisation, so you use the standard `date` command. But there isn't a flag to easily copy a setting to another.

## From a remote host

Quite easy :

```bash
date `ssh remoteuser@remotehost date +%m%d%H%M%Y.%S`
```

## To a remote host

It's also very easy[^1] :

```bash
ssh root@remotehost date `date +%m%d%H%M%Y.%S`
```

[^1]: Yes, I **do** know that logging remotely as root is a security pitfall...
