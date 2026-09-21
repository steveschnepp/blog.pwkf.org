---
layout: post
title: "Waiting for Munin 2.0 - Performance - FastCGI"
date: 2010-06-09 21:00:54 +0100
tags: munin munin20 fastcgi performance
permalink: /post/2010/06/Waiting-for-Munin-2%2e0-Performance-FastCGI
author: Steve SCHNEPP
excerpt_separator: </p>
---

1.2 has CGI, it is slow, unsupported, but [it does exist](http://munin-monitoring.org/wiki/CgiHowto).

1.4 has even an [experimental FastCGI](http://munin-monitoring.org/wiki/CgiHowto#FastCGI) install mode.

Quoting from this page :

> This is more a proof of concept than a recommended - it's slow. Also we do not test it before every release

In 2.0 lots of work has been done to take this experimental CGI mode into a supported one. It might even be the primary way of using munin since, when an install has a certain size, CGI becomes mandatory.

That's because `munin-graph` doesn't have time to finish its job when the next one is launched, and the new one doesn't run. It is not as dramatic as a missed `munin-update` execution, since the graphs will still be generated on the later round, but there will be random graph lags and it will put quite some stress on the CPU & I/O subsystem. This will slow `munin-update` down since it also uses the I/O subsystem much, and that's to be avoided at all costs.

Mainstream CGI has some consequences :

1. Only the FastCGI wrapper remained : the plain CGI one is dropped.
   - The CPAN module `CGI::Fast` is compatible when launched as a normal CGI.
   - Almost all HTTP servers support plain CGI, and with the [cgi-fcgi](http://www.fastcgi.com/devkit/doc/cgi-fcgi.1) wrapper from the FastCGI devkit (Debian package `libfcgi`), you can have the best of both worlds (a custom HTTP server & FastCGI). I even posted on how to have a working [thttpd with FastCGI](/post/2010/06/CGI-on-steroids-with-FastCGI%2C-but-on-a-CGI-only-server-The-FastCGI-wrapper).

2. The old process limit mechanism is dropped also. The FastCGI server configuration is a much better way to control it. The old code was based on System V semaphores and was not 100% reliable.

3. A caching system has to be implemented, in order for each graph to be generated only once for its lifetime.

4. The CGI process is launched with the HTTP server user. Since it doesn't only read now, but also writes log files and images files, there is an extra step when installing it. But it's already described in the [Munin CGI](http://munin-monitoring.org/wiki/CgiHowto) page given previously.

5. Since the process is launched only once, for now it read only once the config. So if some part of the config change, the FastCGI container MUST be restarted.

## Some benchmarks

Now, the sweet part : I'm putting up some micro-benchmarks.

They should be taken with caution as every benchmark should be, but I think the general idea is conveyed. For the sake of simplicity I'm only doing 1 request in parallel and disabled IMS caching.

### Basic 1.2 CGI

```text
$ httperf --num-conns 10  --add-header='Cache-Control: no-cache
' \
    --uri  /cgi-bin/munin-cgi-graph/localdomain/localhost.localdomain/cpu-day.png

Total: connections 10 requests 10 replies 10 test-duration 27.939 s

Connection rate: 0.4 conn/s (2793.9 ms/conn, <=1 concurrent connections)
Connection time [ms]: min 1653.9 avg 2793.9 max 5217.0 median 1912.5 stddev 1487.8
Connection time [ms]: connect 0.0
Connection length [replies/conn]: 1.000

Request rate: 0.4 req/s (2793.9 ms/req)
Request size [B]: 131.0
```

### 1.4 FastCGI

The munin-fastcgi-graph is only loaded once, but the munin-graph is reloaded each time.

```text
$ httperf --num-conns 10  --add-header='Cache-Control: no-cache
' \
    --uri  /cgi-bin/munin-fastcgi-graph/localdomain/localhost.localdomain/cpu-day.png

Total: connections 10 requests 10 replies 10 test-duration 13.807 s

Connection rate: 0.7 conn/s (1380.7 ms/conn, <=1 concurrent connections)
Connection time [ms]: min 1141.3 avg 1380.7 max 1636.1 median 1381.5 stddev 173.7
Connection time [ms]: connect 0.0
Connection length [replies/conn]: 1.000

Request rate: 0.7 req/s (1380.7 ms/req)
```

The response time is cut almost in half. That's expected, since only the top half of the processing isn't reloaded.

### 2.0 FastCGI

Here everything is loaded once.

```text
$ httperf --num-conns 10  --add-header='Cache-Control: no-cache
' \
    --uri  /cgi-bin/munin-cgi-graph-2.0/localdomain/localhost.localdomain/cpu-day.png

Total: connections 10 requests 10 replies 10 test-duration 1.668 s

Connection rate: 6.0 conn/s (166.8 ms/conn, <=1 concurrent connections)
Connection time [ms]: min 123.0 avg 166.8 max 513.4 median 127.5 stddev 121.9
Connection time [ms]: connect 0.0
Connection length [replies/conn]: 1.000

Request rate: 6.0 req/s (166.8 ms/req)
```

Now response time is cut almost by a ten factor ! That's quite good news, since it goes 20 times faster that the original CGI.
