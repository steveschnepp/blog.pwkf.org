---
layout: post
title: "CGI on steroids with FastCGI, but on a CGI-only server - The FastCGI wrapper"
date: 2010-06-17 16:23:03 +0100
tags: fastcgi cgi performance perl
permalink: /post/2010/06/CGI-on-steroids-with-FastCGI%2C-but-on-a-CGI-only-server-The-FastCGI-wrapper
author: Steve SCHNEPP
excerpt_separator: </p>
---

FastCGI is very common way to increase performance of a CGI installation. It is based on the fact that usually the startup of CGI scripts is slow, whereas the response is quite fast.

## FastCGI is really CGI on steroids

So if you have a persistent process, you only have to take care of the startup once, and you then experience a real speedup.

### FastCGI vs mod_perl (or mod_python, ...)

Once a big fan of `mod_perl`, I'm converted to FastCGI since. `mod_perl` was for a long time **the** answer for speeding up Perl CGI scripts. It has a very good track record of stability and has real hooks deep in the Apache processing requests.

FastCGI focuses on a different feature set that is more actual than `mod_perl`[^1]:

- It is much simpler to install and configure, especially when having multiple applications.
- Able to connect to a distant server (running as a different UID, chrooted or even on a remote host)
- Able to mix scripting languages without any need to compile some other apache modules.
- Able to be used with several webservers, even closed-source ones : FastCGI is a protocol, not an API.

## But steroids do have some side effects

### CGI issues

One downside is that your CGI script should be adapted to FastCGI and the fact that the script doesn't end with the end of the request.

In the real world that's quite easy. Every language that is commonly used for CGI offers [CGI-wrapper libraries](http://www.fastcgi.com/drupal/node/5) that works in a FastCGI context as well as a plain CGI one.

### Webserver issues

Another issue can also come from the webserver. Since CGI is dead simple to implement even the micro-webserver [thttpd](http://www.acme.com/software/thttpd/) implements it.

FastCGI on the other hand is a little more difficult to implement, since the webserver needs to create a container that monitors and calls the FastCGI-enabled script.

### A standalone FastCGI container

Fortunately, the FastCGI team provided us with a ready-to-use container and a very simple client that acts a plain CGI script, but proxies it to a full-blown container.

Since the plain CGI part is a very small native executable its overhead is negligible compared to the reply time, even without comparison with the startup time of the whole script.

Its installation is also quite straightforward. I just installed the `libfcgi` package on Debian : it provides `/usr/bin/cgi-fcgi`.

I created a simple CGI wrapper for my previous [munin benchmarking](/post/2010/06/Waiting-for-Munin-2.0-Performance-FastCGI) needs:

```
#! /bin/sh

exec /usr/bin/cgi-fcgi -connect /tmp/munin-cgi.sock \
     /usr/lib/cgi-bin/munin-cgi-graph
```

[^1]: who really need deep apache hooks?
