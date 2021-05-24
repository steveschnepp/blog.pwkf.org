---
layout: post
title: Recent customization of a DNS-320L
tags:
- dns-320l
---
## Context

I bought 2 NAS box a while ago (2014, 2016). The features I needed from those were:

1. **cheap**
2. **hackable** as I don't want to be limited by the stock firmware
3. **open data storage** as I want to be able to retrieve my data if the device dies.
4. **very low power consumption** as I don't like heat
5. **Low-level NAS services**

    1. NFS, FTP & HTTP (GET) as a must-have
    2. SAMBA as a nice-to-have

So, after a (small) market research, I settled on the [Dlink DNS-320L](https://eu.dlink.com/uk/en/products/dns-320l-sharecenter-2-bay-cloud-storage-enclosure).

Which:

* was around 60€, new.
* is a 2-bay NAS powered by a 1GHz ARM, with 256 MiB RAM.
* only draws a max of 15W, much lower when idle.
* the RAID is a linux softraid via a stock LVM with also an ext4 filesystem on top of it.
* It also supports the usual low-level NAS services that I needed.

It also has rather bad parts :

* The UI on the other hand is a little horrible.
* So is the speed of anything fancy, such as DLNA servings.

I don't really need those, but I guess that it can be frustrating to many.

Now, the _major_ kicker was that it supported something call [Fun_plug](http://www.bernaerts-nicolas.fr/nas/71-dns325-ffp07/224-dns325-ffp7-install-funplug7). It basically is a ``rc.local`` user exit that is embedded in the firmware.

As it turns out, it was a security risk, as the first thing the ``Fun_plug`` was doing was to install & run ``telnetd``. Which isn't secure by any definition, but got you ``root`` shell access.

So, D-Link rightfully patched that hole, but it also offered ``ssh`` conectivity natively in the firmware. There's also a plugin system that can be leveraged to create _add-ons_, but the system is frankly a little awkward to use, as it is rather poorly documented.

## Installation of ``Fun_plug`` on recent firmwares

So, here is a way to install ``Fun_plug`` again, but without the security issues.

Note that those steps **will** be tweaking the configuration of your NAS box, so it might brick it. That said, as we will only modify the `configuration` partition, a hard reset (with the pin) should unbrick it pretty easily.

They were the cheapest things that I could have a shell on. The usual way to root them is to install fun_plug on it.
