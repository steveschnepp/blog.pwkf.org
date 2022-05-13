---
layout: post
title: "Almost 50 ways of Blinking a LED"
tags: electronics blink 
---

## Intro

[Blinking a LED](https://docs.arduino.cc/built-in-examples/basics/Blink) is the
electronics equivalnent of "Hello World!". Therefore is has a very special meaning. 

Let's therefore find many creative ways to achieve that. Like using multiple
languages, but here by using multiple electronics components and circuits.

## Basics of operations

There's only 2 basic electronics components that allow for a response that varies in times : 

* Condensators
* Inductors

So, every blink almost always comes down to using the 1rst or the 2nd
component. That said, as condensators have a voltage response whereas inductors
have a current response, only condensators are really used in reality. Some
[inductors based oscillator](https://en.wikipedia.org/wiki/Royer_oscillator) do
exist, but are seldom.

So, it almost always comes down to charging and discharging a condensator.

## Circuits 

So, now we can look at many ways to blink a LED. 

### Classic NE555 Astable

A very common way of doing it would be to leverage the venerable NE555 in its
"datasheet" astable configuration.

### Classic Astable with 2 NPN

The oscillator circuit that usually everyone encounter at first is the famous
"astable NPN" with 2 condensators.

### Classic Astable with IC NOT gates

This is also a classic, as it is the most often used in CMOS technology. 

### Classic Astable with Discrete RTL NOT gates

Once we craft the NOT gates version with [RTL technology](https://en.wikipedia.org/wiki/Resistor%E2%80%93transistor_logic), we can have a 2 NPN
version that has only 1 condensator.

### Classic Astable with a Schmitt Inverter

The simplest way to do an astable is to go for the Schmitt trigger version.

#### Schmitt Buffer with NOT gates

We can 
