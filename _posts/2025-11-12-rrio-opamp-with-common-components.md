---
title: "Building a RRIO Opamp with Common Components"
date: 2025-11-12
layout: post
author: Steve SCHNEPP
---

This project is an attempt to understand how RRIO opamps work internally, and to replicate one using very common components. 
It was originally created in 2023 for [Hackaday.io](https://hackaday.io/project/190900).

## Goals

The main goal is learning, but the end result should be a real, working opamp. The design aims to use components as common as possible: resistors, capacitors, and widely available ICs. The LM358 is the obvious choice for opamps, but the NE555 is also considered, especially for the now-defunct NE555 challenge.

Using another LM358 instead of a NE555 could keep the project within the opamp challenge, but might conflict with the secondary objective.

## Secondary Objective

A surface-mount (SMD) version should aim to be pin-compatible with the most common dual opamps in DIP-8 format. If DIP-8 is too complex, a pin-compatible quad-op in DIP-14 format is the fallback.

## Design

The design is simple. To put the LM358 in RRIO mode, the trick is to supply it with a single voltage source that has slightly more amplitude than the main voltage source. This overcomes the voltage drops inherent to the LM358's internal construction.

The easiest way to achieve this is with a capacitive charge pump. Many RRIO opamps use this method for input rail-to-rail. Output rail-to-rail is usually done with a CMOS buffer, which limits current draw and fits inside the IC die.

This project skips the CMOS output buffer, instead generating a charge pump powerful enough to drive the opamp load directly.

## Everything starts in a simulator

First, I start all my designs in a simulator. I'm using the one from [Paul Falstad](https://www.falstad.com/circuit/circuitjs.html), as it is dead simple to use, and working well enough for most of my needs.

I'm using a NE555 to generate a dual voltage power source from a single voltage one. The pattern is very common : a simple capacitor charge pump for each voltage.

I don't need to have a very high or low voltage, as I only need to supply a little more that the voltage drops in the opamp IC.

Note, I also leverage the fact that the NE555 has a rather strong output, and it will be able drive both charge pumps directly without needed to use buffers. 

The values I'm using are also rather common as it is only power-of-ten. Which are the most easy to source components.

The diodes will be the very common 1N4148, also ubiquitous to find. Using some Schottky ones like the 1N5711 might be more efficient, but they are more difficult to source.  


The circuit is available in the [Live Simulation](https://www.falstad.com/circuit/circuitjs.html?ctz=CQAgjCAMB0l3BOJyWoSATNAHJAzGAGwYAs2CJArBoWCSJZAw05QKYC0YYAUCZOkKRsIBIRAB2DEzHgo0cUxiQMBeOo0rMPAO4ghI3PuHhFPAErGR3DAyHgwtpnnDTM0Su89KPPPIREDB1sgoiUoPwDJNyJJbHpYpV0rU2imROSpGXEs1MgeAHMQbDxbOnoSsvskgCc00Rz4hqhwOB4iW0rmrvLMEAATNgAzAEMAVwAbABcOCbZ+uXDlXgWMKX16UqZCeltB0cmpwpB-a0cTppsW-NOTqJ2QElKN655V9di1kN2B4fHp5JbF63B75aQSfSUcQPQhQk62egANQAwsieOC7oFNlFnkjUe1YY8ROkMMT9OBoHgqfE8FISGAJBIEKQ8JwEMdemFwCQEhJFBE9AzobtSC98nUyPCiSAOJL0uoeBKRLiRLJ5Qq9JLZJLHMSeABjaW6o18lpgWCaS0qThgHwICQkaQIfAM50qATyOC8Io60065mvd5VJhfTCivZ-Q7HUMYcPrUhLN7w9L2UNciMHAG3W5cp7B14YnP2HMBpEAUTL6MgENh4mNtdMTHLladmOCba5PnUaB7yHcDNKCFt5AIEjw2GJFogvFbIOxZycnvgvd7klgA6phEIpVtY+8U-AgJixaineSsfoDwvjYiliusoXMqM4X4zCWvj0afEoYfAsw61-IUZTlZIgMA85f3yQUIMlSVINA01njAkDoNsDgkJgvU9AkJpZC6WQZw9UMr1FUEl3gCBKGgfhuDoWM+WofAnAPQj0GvdMPmqcivQpIch0ZZl7TwelqH3HjeAAexOR4Wn4BARCwTxCGoloXDU8k8B4KSKlkgRrG2FTKMwMlSWk84SROHggA).

## Breadboard Time for the Charge Pumps

Simulation works nicely, now let's try it out for real.

As [Ken Yap](https://hackaday.io/retiredfeline) nicely commented, there is a strong voltage drop in the bipolar NE555, typically 1.7V. The usual way is to leverage a CMOS version such as the LMC555, but as I'm aiming for very common components, I'll use only regular NE555.

### Building the charge pumps

The charge pumps are not hard to build. I'm using a simple breadboard, and a very simple DIY USB powering for 5V.

![breadboarding](../../../assets/images/rrio/5134171683468220661.jpg)

### Testing the outputs

Now, it is time to test the 2 voltage outputs.

![9V](../../../assets/images/rrio/5466341683468315524.jpg)

![-4V](../../../assets/images/rrio/1868621683468335059.jpg)

A very nice 9V and -4V.

Issue is that it doesn't hold the voltage as nicely with some load. I tested with a yellow LED in series with a 1k resistors and it falls to 4.5v with a current of 2.4 mA (2.4V across a 1k resistor).

![with some load](../../../assets/images/rrio/7920461683468473147.jpg)

Anyway, let's try with the LM358 now.

## Adding the LM358

Let's finally add the LM358 to the mix.

### Without Load

It works quite well without any load.

![5V w/o load](../../../assets/images/rrio/5628081683469685618.jpg)

![0V w/o load](../../../assets/images/rrio/2973311683469698455.jpg)

Positive & Negative outputs are within 50mV of the input with a simple voltage follower.

### With Load

As expected, with some load, the voltage isn't that great : 3.3V only at 2.4mA, which isn't surprising, given the output of the charge pump.

### Conclusion & Improvements

My initial idea didn't work as well as expected. Without load it is perfect, but as soon as some load is added, the voltage drops. 

But the good findings are that the charge pump is the weak link here. So, if it is improved it should be fine.

I'm planning to try 2 improvements:

- Using a LMC555, which is the CMOS version of the NE555 as suggested in the comments by Ken Yap.
- Using a CD4069 CMOS buffer to achieve the same effect than using the LMC555.

Once I'll manage a stable output even with the max expected load from the LM358, I'll aim to miniaturize on a PCB.
