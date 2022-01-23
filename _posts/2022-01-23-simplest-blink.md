---
layout: post
title: "Minimal NE555 Blink"
tags: ne555 blink
---

## Intro

My son recreated the "blink" with a NE555 and tried to remove the wire from
RESET pin to VCC.  It actually worked well, and we wondered "what's the minimal
BOM for a NE555 blink ?".

This made sense as "Blink" is the "Hello World" equivalent of
electronics, and the latter is used to compare programming languages.

# Rules of engagement

The rules are :

* Everything counts as a BOM item, except power. Even a wire.
* Power is coming from 2 Dupont wires : VCC & GND.
* It has to work on a breadboard.
* Only very simple to source components are allowed[^1].

# Findings

I remembered that I saw a [circuit out there](https://www.electronics-tutorials.ws/waveforms/555_oscillator.html)
that reused the OUTPUT pin (pin 3) to charge and discharge the RC timing. The
duty cycle is therefore always 50%, but that's actually perfect for Blink.

It has several shortcomings, as the number of components is not lower than the
regular astable.

# Improvements

The [TI LMC555 datasheet](http://www.ti.com/lit/ds/symlink/lmc555.pdf) has a
better version of it as mentioned in an [electronics.stackexchange.com
answer](https://electronics.stackexchange.com/a/485461), since it lacks the R1
that is connects TRIG to VCC.

![LMC555 schematics](https://i.stack.imgur.com/byzFr.png)

It works since the LMC555 is much more closer to have a rail-to-rail OUTPUT
than the regular bipolar NE555, but as we aren't interested in accuracy, we can
also omit it with out regular NE555.

# Leveraging the open-collector output

As we are not using the DISCHARGE pin anymore for timings, we can use it for
output. That has an interesting properties : the timings aren't affected by the
load.

So the schema is very simple.

![simplest blink schematics](/assets/images/Minimal NE555 Blink_schem.png)

And indeed, the breadboard version is minimal.


![simplest blink breadboard](/assets/images/Minimal NE555 Blink_bb.png)

And for real.

![simplest blink photo](/assets/images/IMG_20220122_195549986.jpg)

Mission accomplished!

# Future Ideas

The open collector output makes me think that it can be multiplexed with other blinks. I might toy with that idea.

[^1]: Breadboards, Wires, Resistors, capacitors, LED.
