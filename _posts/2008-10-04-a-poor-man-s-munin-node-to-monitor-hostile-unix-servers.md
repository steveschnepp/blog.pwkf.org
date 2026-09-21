---
layout: post
title: "A Poor Man's Munin Node to Monitor \"Hostile\" UNIX Servers"
date: 2008-10-04 11:05:20 +0100
tags: ssh munin
permalink: /post/2008/11/04/A-Poor-Man-s-Munin-Node-to-Monitor-Hostile-UNIX-Servers
author: Steve SCHNEPP
excerpt_separator: </p>
---

[Munin](http://munin.projects.linpro.no/) is a nice monitoring system. Simple but quite effective. It's main selling point is the UNIX-esque simplicity of the architecture. You can just [create a new plugin](http://sysmonblog.co.uk/?p=17) in a matter of minutes to monitor whatever you can imagine.

There is even a [comprehensive collection](https://github.com/munin-monitoring/contrib/) of plugins ready to use (admittedly of various quality).

## Various platform are supported

Usually the main issue is the *MuninNode*, an agent (daemon) that runs on the server to be monitored, since it is responsible of translating the request of the munin server (the one with the graphs) to the various plugins, build-ins or external. The ease of installing this agent depends on the OS and the access you have on the server :

### Windows

For Windows you can install [munin-node-win32](http://www.jory.info/serendipity/index.php?/categories/4-Munin-Node-for-Windows).

### Unix (with root access)

For Unix when you are root, usually there is a package ready to install in your distribution, or from the source.

### Others (Hostile servers)

On *hostile* servers, you don't usually have a root access and no easy acces to a compiler.

I wrote [pmmn (Poor Man's Munin Node)](https://github.com/munin-monitoring/contrib/tree/master/tools/pmmn/), a little vanilla Perl script that emulates the core functionality of the real munin-node script, but without having to install many Perl CPAN modules.

It has also a nice functionality : it is possible to communicate via stdin/stdout instead of a TCP port. This way it is very easy to monitor hosts that are behind a firewall without opening (and monitoring) many tunnels.

## Installation of **pmmn**

Suppose you have access to the server via a supervision user (let's say *supusr*). Installation of **pmmn** is quite easy : just copy the files somewhere on the disk where you have access, for example (**/home/supusr**).

### TCP installation

Just launch the server with **-p 4949** and declare it in the **munin.conf** file on your munin-server. This solution is quite equivalent to a regular munin-node installation.

### Tunnel installation

Same as the TCP, but you have to [create a TCP tunnel via SSH](http://munin.projects.linpro.no/wiki/MuninSSHTunneling) to be able to reach the munin-node.

### Inetd+SSH installation

It is a mix between [port forwarding via inetd](http://munin.projects.linpro.no/wiki/MuninInetdBouncing) and the Tunnel-based previously discussed.

You first have to [established a key-based SSH authentication](http://www.laubenheimer.net/ssh-keys.shtml) without passphrase (you will not be there to type it) from *supusr* on the inet server (usually the munin-node one) to the user *supusr* on the server to be monitored.

For example, to monitor *server1* and *server2*, in the file /etc/inetd.conf, you have to add lines :

```bash
7001   stream  tcp     nowait  supusr /usr/bin/ssh -- supusr@server1 /home/suprusr/pmmn/pmmn.pl
7002   stream  tcp     nowait  supusr /usr/bin/ssh -- supusr@server2 /home/suprusr/pmmn/pmmn.pl
```

Then, in the *munin.conf* file of the MuninServer, you just have to declare the new nodes :

```ini
[server1]
    address localhost
    port 7001
[server2]
    address localhost
    port 7002
```

The MuninServer will now set up a stdin/stdout SSH tunnel transparently and launch the **pmmn** server when needed. You are now free to write plugins like if a real munin-node where installed. The only restriction is that y ou don't have a root access, so you are limited in the information you may collect.
