---
layout: post
title: "Many ways to Blink a LED"
tags: electronics blink 
---

## Intro

[Blinking a LED](https://docs.arduino.cc/built-in-examples/basics/Blink) is the
electronics equivalent of the famous "Hello World!". Therefore it has a very
special meaning, and it is also the basis of "clocks" which are very imprtant
in digital electronics.

Let's therefore find many creative ways to achieve that. Like using multiple
languages, but here by using multiple electronics components and circuits.

## Basics of operations

There's 2 basic electronics components that allow for a response that varies in time:

* Condensators
* Inductors

So, every Blink almost always comes down to using one of those 2 components.
Yet, condensators are much more using in reality[^1], as they have a voltage
response whereas inductors have a current response.

Storing current being much less practical than storing voltage, as current
produces heat & interferences. Like storing kinetic energy with a flywheel[^2]
is more cumbersome than storing static energy with a spring.

[^1]: Some [inductors based oscillator](https://en.wikipedia.org/wiki/Royer_oscillator) do exist, but are rather seldom.

[^2]: The comparison is rather accurate. In electronics, inductors have exactly the same usage as flywheels: avoiding current *variations*, not *storing* current. Springs on the other hand, are very good as energy restitution when needed.

This means that Blink usually always comes down to charging and discharging a
condensator.

## Circuits 

Note that there can be many variations of an original design. I'm leveraging
the awesome [interactive simulation from Falstad](https://falstad.com/circuit)
to illustrate my circuits.


### Classic Circuits

#### Astable with 2 NPN

The oscillator circuit that usually everyone encounter at first is the famous
"astable NPN" with its perfect symetry of 2 NPN & 2 condensators.

It actually starts to oscillate only because it is in instable equilibrium, and
each component is not identical, even if having the same value, due to the
manufacturing error margin.

![Classic Astable with 2 NPN Schematics](../../../assets/images/circuit-20220515-1716.svg)

#### Classic NE555

The most classic way of doing it would be to leverage the venerable NE555 in its
"datasheet" astable configuration.


![Classic NE555 Astable](../../../assets/images/circuit-20220515-1739.svg)


#### Classic with 3 NOT gates

This is also the classic that is the most often used in CMOS technology. It
uses 3 NOT gates, but is always oscillating, and the period and cycle duty
doesn't depend on the voltage.

![Classic Astable with 3 NOT gates](../../../assets/images/circuit-20220530-2107.svg)

#### Classic with 2 NOT gates

A variation of the previous one. Only using 2 NOT gates, but not always oscillating.

![Classic Astable with IC NOT gates](../../../assets/images/circuit-20220515-1810.svg)

#### Classic with a Schmitt Inverter

The simplest way to do an astable is to go for the Schmitt trigger version.

![Classic Astable with Schmitt Inverter](../../../assets/images/circuit-20220515-1815.svg)

### Variations

Now, as we can have variations of the individual components, we can also create
new circuits out of it. But that will be another post.

{::comment}
### Classic Astable with Discrete RTL NOT gates

Once we craft the NOT gates version with [RTL technology](https://en.wikipedia.org/wiki/Resistor%E2%80%93transistor_logic), we can have a 2 NPN
version that has only 1 condensator.


#### Schmitt Buffer with NOT gates
{:/comment}

