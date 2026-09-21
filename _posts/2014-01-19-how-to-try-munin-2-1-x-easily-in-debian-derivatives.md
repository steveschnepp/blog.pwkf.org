---
layout: post
title: "How to try Munin 2.1.x easily in Debian-derivatives"
date: 2014-01-19 13:01:47 +0100
tags: []
permalink: /post/2014/01/How-to-try-Munin-2.1.x-easily-in-Debian-derivatives
author: Steve SCHNEPP
---

In my previous post I explained how to [setup a simple development environment](/post/2014/01/Tutorial-Setup-a-dev-environment-for-Munin), but I feel that's a little too much if you only want to try that new, shiny, munin version.

So, let's assume that you're on a debian-derivative distribution (Ubuntu, Raspbian, ... , and of course Debian).

The nicest news is that 2.1.x already hit the [experimental part of Debian](https://wiki.debian.org/DebianExperimental). That makes it **very** easy to use as everything is described there.

I'll just copy/paste some instructions tailored for munin, please refer to the original page if you'd like to learn more.

### Add experimental to your sources.list

```bash
echo "deb http://ftp.debian.org/debian experimental main" >> /etc/apt/sources.list
```

### Update the apt database

```bash
apt-update
```

### Install the experimental version of munin

```bash
apt-get -t experimental install munin
```

### Pin the munin as the experimental version

That works quite well, but the munin package won't be updated, as the automatic upgrades only comes from the non-experimental part. And obviously the version there is lower than the experimental one.

So, that is called package **pinning**, that is to **pin** a certain package in a certain repository. It is still very simple to do:

```bash
cat >> /etc/apt/preferences <<EOF
Package: munin
Pin: release a=experimental
Pin-Priority: 800
EOF
```

### Conclusion

So, that's it. You have successfully upgraded to the unstable side of munin...
