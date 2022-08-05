---
layout: post
title: Emulating Logic Gates with an ATmega328P MCU - Part 1
tags:
- electronics
- ATmega328P
author: Steve SCHNEPP
---
## Why ?

I'm discovering the world of electronics with my son. We encountered to some
nice videos that are about recreating a whole CPU with only logic gates. The
most well known one being the [one from Ben
Eater](https://youtube.com/playlist?list=PLowKtXNTBypGqImE405J2565dvjafglHU)
and the one from the [NAND2Tetris](https://www.nand2tetris.org/) project.

That said, as anyone soon notices, all the combinations of the logic gates become
enormous very soon. Therefore, Ben showed a very nice trick : [replacing
combined logic gates with a simple EEPROM](https://youtu.be/BA12Z7gQ4P0).

The idea itself is brilliant, and is the famous space versus time optimisation.
Effectively precalculation of all the poasible iutputs, and sorting them. Note
that using an EEPROM has several drawbacks. Regular 74HCxx logic gates operate
in the 5ns range, which is very fast. Beware that if you have multiple stages
of logic, which is the case here, you have to multiply by at least the number
of stagss. The EEPROM reads in about 150ns, so we can afford 30 stages. Not so
bad.

But that assumes a parallel EEPROM, and the one that Ben uses is the
[AT28C64B](https://www.microchip.com/en-us/product/AT28C64B) that is easy to
source, but not really cheap.

I just happen to have a whole bunch of unused
[ATmega328P](https://www.microchip.com/en-us/product/ATmega328P) in a DIP
packaging. This MCU is very well known, as it is the basis of the Arduino Uno.
So it is ubiquitous and rather cheap. The fact that it is more versatile than
an EEPROM is a nice side-effect.

So, lets see if can emulate that EEPROM[^1] with the MCU. I know it is a little
cheating, but we are also emulating old game consoles for convenience. So I
guess it is similar here.

[^1]: Actually not an EEPROM, but a ROM, as we won't emulate the writing part. The writing part is done by uploading a new firmware on the MCU. So it is definitely not at *runtime*.

## Problems

The first problem is very simple : the EEPROM is a DIP-28 and the MCU is a DIP-28 also. Which means that no matter how you will look at it, there won't be enough pins.

### Reduce Pin Count

We therefore have to see how much pins we have in the MCU that we can actually use.
There's 3 GND, 4 VCC, 1 RESET & 2 for the external quartz. We could leverage those 2 if needed, but let's try not to at first.

The EEPROM can be reduced to 4 buses at runtime, since we don't write to it. We actually use it as a ROM.

  * Power, is ignored as every IC is powered anyway ;)
  * Chip Enable, otherwise the outputs are all high impedance.
  * Address
  * Data

The Chip Enable & the address are IN, and Data is OUT.
Also, the Data needs to be 8-bit wide, otherwise it will be too complext.

We want to keep the control pins, such as the RESET & TOSC1/TOSC2.

#### Control

Pin | Function
----|---
PC6 | RESET (original)
PB6 | TOSC1 (original)
PB7 | TOSC2 (original)
PD0 | TX (original)
PD1 | RX (original)
PD2 | INT0 (original)

#### Chip Enable

Pin | Function
----|---
PD5 | Chip Enable

#### Data

Pin | Function
----|---
PB0 | D0
PB1 | D1
PB2 | D2
PB3 | D3
PB4 | D4
PB5 | D5
PD6 | D6
PD7 | D7

#### Address

Pin | Function
----|---
PC0 | A0
PC1 | A1
PC2 | A2
PC3 | A3
PC4 | A4
PC5 | A5
PD3 | A6
PD4 | A7

Which fits perfectly, as we have 8 bits in (A) and 8 bits out (D).

In case we'd need a pin for carry, we could reuse either the TX/RX or the TOSCx
ones. I'd prefer to leverage the TX/RX ones as having an external oscillator is
easier to program, since the UART is much more precise, and the bootloader can
still leverage TX/RX while programming.

#### Carry (Optional)

Pin | Function | Carry
----|----------|------
PD0 |    TX    | OUT
PD1 |    RX    | IN

### Programming the MCU

this will be in part 2.
