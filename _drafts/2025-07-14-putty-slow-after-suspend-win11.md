---
layout: post
title: Avoid a slow PuTTY after suspend in Windows 11
tags:
author: Steve SCHNEPP
permalink: /:categories/:year/:title:output_ext
---

When you have a PuTTY session open while suspending, but it will be super sluggish if not closed due to timeout. This can be fixed.

# Window Auto-Tuning feature

This behavior is due to the *Window Auto-Tuning feature*.

## Show Value

    netsh interface tcp show global

## Disable

As administrator, type

    netsh int tcp set global autotuninglevel=disabled

## Enable

As administrator, type

    netsh int tcp set global autotuninglevel=normal
