---
layout: post
title: "V-USB Based AT89C2051 Programmer"
tags: at89c2051 atmega328
---

I successfully used the [AT89C2051 UNO programmer HAT](_posts/2022-01-17-diy-4-digit-clock-hacking.md),
but I'd like a discrete one. And I'd even like to leverage
[avrdude](https://www.nongnu.org/avrdude/) in order not to require yet another
programming tool.

## Basic Idea

The idea is simple :

* Use an ATmega328p with the v-usb package in order to be able to drive it directly from USB
* Hack the USBasp firmware to support parallel programming, as it already provides a great starting point.
* Leverage on-board 12V generation, ideally reusing
[my 1-pin 0/5/12V circuit](https://github.com/tardate/LittleArduinoProjects/issues/25) to limit the number of pins used to just 1.

## 1-pin HV reset

That is the easiest part. As my circuit works nicely.
