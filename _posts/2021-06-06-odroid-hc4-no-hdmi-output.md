---
layout: post
title: Fix the HDMI output in the ODROID-HC4
tags:
- odroid
- nas
date: 2021-06-06 08:41 -0500
author: Steve SCHNEPP
---
## Context

I'm the proud owner of 2 [Dlink
DNS-320L](https://eu.dlink.com/uk/en/products/dns-320l-sharecenter-2-bay-cloud-storage-enclosure).
As they are now unsupported, I searched some new NAS boxes.

My criterias didn't change :

1. **cheap**
2. **hackable** as I don't want to be limited by the stock firmware
3. **open data storage** as I want to be able to retrieve my data if the device dies.
4. **very low power consumption** as I don't like heat
5. **Low-level NAS services**

    1. NFS, FTP, SFTP, RSYNC & HTTP (webdav GET) as a must-have
    2. SAMBA as a nice-to-have

And at the time of my research (early 2021), the folks from Hardkernel just
rewamped their offering with the
[ODROID-HC4](https://www.hardkernel.com/shop/odroid-hc4-oled/). I settled with
the OLED version, as, for $10 more, why not?

## Blank HDMI on boot

When I ordered it in February 2021, I unboxed it quickly, and was rather
disappointed that it did seem to boot, but only figured a blank screen on the TV
I connected it to.

Well, not exactly. The "petitboot" loader was working perfectly fine, but the
stock ubuntu 20.04 from HK didn't. Thanks to the clever inclusion of the OLED
that displayed its IP, I could SSH to it. Therefore I didn't really look much
more into it. But I didn't put it in productive usage, as I was worried that it
might fail, and I didn't have a screen output at the time I'll need it.

And then real life kicked in, and I didn't have time to look further.

## Investigations

Lately, I tried to take another try at it.

1. Upgraded the SDCard to the latest Ubuntu 20.04 from HardKernel
1. Updated petitboot from that latest Ubuntu image
1. Removed all the HDD

The result was worse. As not, not only the screen still didn't show up, but
even the SSH connectivity didn't work anymore.

I spend some significant amount of troubleshooting. Mostly via trial & error,
along with some creative shots in the dark.

## Working Screen !

So, the single change that made the screen work is that we need to attach the
console to `tty1` in addition to the default `ttyS0`.

Small rant : I'd argue that the `ttyS0` is very useless, since the UART pins
are *inside* the HC4 box, and you have to unscrew it to access it. Also it is
using some strange connector that cannot be leveraged with regular Dupont
cables.

Therefore the file `boot.ini` on the first VFAT partition needs to be changed from

    setenv condev "console=ttyS0,115200n8"   # on both

to

    setenv condev "console=tty1"


It will disable the serial console, but offer a much more convenient one on the
HDMI screen. The autoconfiguration of the resolution worked very well. It
showed in my old TV, and even on my 2007 LCD monitor that was connected via a
HDMI-DVI cable.

Note that it needs to be `tty1` and not `tty0` as the `tty0` is a special one
that is the *current* one.

## Fixing the boot failure of Ubuntu

Now that we can see the error messages from Ubuntu, we can see that it seek to
mount the rootfs from `mmcblk1p2`. But there's only 1 SD card plugged and
Ubuntu does map it to `mmcblk0p2`.

If you have a look into that `boot.ini` file, you can see that it is specified
with a `rootfs=UUID=dead...beef`. This is the correct UUID of the filesystem.
It makes sense since we wrote it directly to the sdcard via `dd`. But somehow
petitboot translates that into `rootfs=/dev/mmcblk1p2` which is the correct
naming in petitboot, as it recognizes both the SPI flash, and the SD card.

Ubuntu doesn't recognise the SPI flash, therefore doesn't end up with the same
device name, triggering the bug.

A very simple fix is to leverage the new naming scheme : `/dev/disk/by-uuid/dead...beef`.

The line in `boot.ini` needs to be changed from

    setenv bootargs "root=UUID=dead...beed rootwait rw (...)

to

    setenv bootargs "root=/dev/disk/by-uuid/dead...beef rootwait rw (...)

This isn't translated by petitboot, and won't be remapped inside Ubuntu.

## More tweaks

There is also a setting that configured the default elevator to `noop`. While
this is usually a very good idea with an eMMC, it isn't in the case of SD
cards. Specially with a journaling filesystem such as EXT4 that inserts
barriers.

So, either we mount the root filesystem with the `nobarrier` option, or we
simply use the `deadline` elevator.

I don't recommend removing the barrier options, as otherwise you can end up
with a corrupted filesystem upon power loss. Having barriers won't prevent it
completely either, but the probability is lower in my experience (with numerous
raspberrypi).

Therefore replacing the `elevator=noop` with `elevator=deadline` in the same
line as before with the `rootfs` parameter does the trick nicely.

Note that if you don't want to loose the lines, you can simply copy paste the
line and modify it on the 2nd occurence, as it will override the previous
value.
