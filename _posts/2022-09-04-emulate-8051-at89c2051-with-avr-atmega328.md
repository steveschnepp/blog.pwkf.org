---
layout: post
title: Emulating 8051 with AVR
tags: electronics 8051 avr
author: Steve SCHNEPP
---

As stated before, 8051 is here to say. Very much like the 8086 is still alive
with the newest x86-64 architecture. Since the Arduino Uno is the de-facto form
factor for many things, let's try to emulate 8051 on AVR.

## Planning & Choices

Some choices needs to happen, in order to be able to scope the project.

### Chips

For simplicity, I'll focus on emulating the
[AT89C2051](https://www.microchip.com/en-us/product/AT89C2051) with an
[ATmega328P](https://www.microchip.com/en-us/product/ATMEGA328P).  Those 2 chips
are very good examples of each architecture, as they are now ubiquitous, thanks
to 4 digit clocks kits for the AT89C2051 and the Arduino UNO for the ATmega328P.

### Pin Mapping

We need to assign pins. I'm trying to keep the functionality the same, even if
it means to move bits around when programming.

A major difference is to assign a specific PIN to RST for the 8051, so we can
reset the emulated 8051 without resetting the AVR.

 8051 | AVR | 51 Function
------|-----|---------
 RST  | PB2 | RST51
XTAL1 | PB6 | OSC1
XTAL2 | PB7 | OSC2
 P3.0 | PD0 | RX
 P3.1 | PD1 | TX
 P3.2 | PD2 | INT0
 P3.3 | PD3 | INT1
 P3.4 | PD4 | T0
 P3.5 | PD5 | T1
 P3.7 | PD3 |
 P1.0 | PD6 | AIN0
 P1.1 | PD7 | AIN1
 P1.2 | PB0 |
 P1.3 | PB1 |
 P1.4 | PC0 |
 P1.5 | PC1 |
 P1.6 | PC2 |
 P1.7 | PC3 |

Some emulator-related PINS are also used.

I'm thinking about reusing a GPIO (PC4/SLOW) to signal that the
emulation is lagging from realtime. The idea being that emulator should be
running at a precise clock divider from the main clock.  Prescaling as much as
needed to cope with the emulation tax, and also adding as much delay as needed
on the fast instructions.

If there is an instruction that is expensive to emulate, I'm planning to
"borrow" delay cycles from the following fast instructions in order to be
accurate *on average*. And have the SLOW pin to signal that 'borrowing' state
while active.



 AVR | EMU       | Comment
-----|-----------|------
 PB3 | SLOW/MOSI |
 PB4 | MISO      |
 PB5 | SCK       |
 PC4 | SDA       |
 PC5 | SCL       |


### Emulation Software

The choosed software is [emu8051](https://github.com/jarikomppa/emu8051) that
we covered in [a previous post]({{ site.baseurl }}{% post_url
2022-08-29-enhancing-8051-simulator %}). It is hackable enough to be useful,
and not using any library outside standard C.

Some enhancements need to happen, as it needs to be optimized for running on
the limited AVR platform.

I'll also leverage every hardware accelerated feature, such as the AVR USART,
in order to decrease the emulation tax.

## Execution

Let's see that in another post. 😉
