---
layout: post
title: "Native SSH transport for Munin"
date: 2009-11-27 00:19:04 +0100
tags: ssh munin sysadmin
permalink: /post/2009/11/Native-SSH-transport-for-Munin
author: Steve SCHNEPP
excerpt_separator: </p>
---

Actually the tunnel won't disappear, but they will be launched only when needed and, most importantly configured in `munin.conf`.

The [native ssh for munin patch](../../../assets/binaries/direct_ssh_transport.diff) should applies quite cleanly on revision 3101 of the svn trunk.

Its use is quite straightforward : in `/etc/munin/munin.conf`, you just migrate address to the new configuration directive `remote_connection_cmd` that take the whole `ssh` command to launch a stdio munin-node such as pmmn.

If we take the examples from the previous post, it becomes clear it's **much** easier to configure.

### munin.conf snippet - Inetd version

```ini
[server1]
    address localhost
    port 7001
[server2]
    address localhost
    port 7002
```

### munin.conf snippet - Native SSH transport version

Right now, the `address` directive is still mandatory, but ignored when connecting.

```ini
[server1]
    address dummy
    remote_connection_cmd /usr/bin/ssh -- supusr@server1 /home/suprusr/pmmn/pmmn.pl
[server2]
    address dummy
    remote_connection_cmd /usr/bin/ssh -- supusr@server2 /home/suprusr/pmmn/pmmn.pl
```

### Warning

Beware that the `ssh` process will now be launched by the `munin` user, so you have to update the key-based SSH authentication accordingly.
