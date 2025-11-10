---
layout: post
title: Installation of the very small LuckFox Micro SBC
tags: luckfox rv1103
author: Steve SCHNEPP
---

This is a reference post — not a tutorial, just the links and gotchas I keep coming back to.

## Gotchas

The SDK archives contain Linux kernel headers with case-sensitive filenames. Unpacking on Windows mangles them silently. Unpack on Linux, or use WSL.

## References

* [SDK setup](https://wiki.luckfox.com/Luckfox-Pico/Luckfox-Pico-SDK)
* [Downloads](https://wiki.luckfox.com/Luckfox-Pico/Download)
* [LuckFox forums](https://forums.luckfox.com/viewtopic.php?t=1765)
* [Case sensitivity bug](https://github.com/LuckfoxTECH/luckfox-pico/issues/66)
* [Build issues](https://github.com/LuckfoxTECH/luckfox-pico/issues/129)
* [Build walkthrough](https://gist.github.com/Spiritdude/da36d2cf064e49094c870e0a8b9f972f)
* [CNX Software review](https://www.cnx-software.com/2024/08/16/luckfox-pico-mini-tiny-arm-linux-camera-board-rockchip-rv1103-64mb-ram/)
* [RTL8723bs WiFi setup](https://wiki.luckfox.com/Luckfox-Pico/Luckfox-Pico-RV1103/Luckfox-Pico-RTL8723bs)
* [Pinout](https://wiki.luckfox.com/Luckfox-Pico/Luckfox-Pico-RV1103/Luckfox-Pico-Plus-Mini/Luckfox-Pico-pinout/Luckfox-Pico-GPIO)
* [RV1103 datasheet](https://mediawiki.hyhsystem.cn/index.php/RV1103)
