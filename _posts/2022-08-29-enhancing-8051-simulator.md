---
layout: post
title: Enhance an 8051 Simulator
tags: electronics 8051
author: Steve SCHNEPP
---

As a followup of my clock kit, I'm growing a genuine interest into the 8051.
While more modern MCU are vastly more powerful, the 8051 is just barely as complex as needed to be useful.
That's a sweet spot that makes it invaluable for learning purposes.

It is more on the verge of *retroputing*[^3], but I'm more on the side tha
one should learn simple things first, even if long past due date.

It always helped me to have the full process of invention. Every step 
is obvious in retrospect, and I can remember much more easily.

Programming should be done in logic gates first, then assembly than higher.
Starting with Stratch is a nonsense. That said, if it makes younger people interested 
in programming, I can see its usefulness. Just not for the *learning* 
part.

[^3]: Contraction of "Retro Computing"

## Simplicity is everything

That said, there is a very interesting trait in looking into very simple
things. And the 8051, simple, it is. 

Nowadays, in that 8051 family, there's a lot of diversity. As said
[elsewhere](https://leap.tardate.com/8051/at89c2051/programmer/), the [8051
will not be
extinct](https://www.microcontrollertips.com/intels-mcs-51-microcontroller-family-stay/)
soon.

I also think that the AT89C2051 hits the very sweet spot for hobbists.  Its
rather small DIP-20 form factor makes it super easy to insert to almost any
design. And while its more recent editions versions (AT89S2051 & AT89LP2052)
are much faster (1T instead of 12T) and have more features, they are much more
expensive.

Having less features makes it also easier to learn. As one has to revert to
more creative ways. It is even possible to use multiple MCU to achieve what we
want, leaning into the world of multichip computing.

In addition, the fact that the AT89C2051 is used is almost every cheap DIY
clock kit is a guarantee of very cheap availability, because it give incentives
to provide clones that are binary compatible, if not recycling original
chips from obsolete hardware.

Funnily, each clock model I encountered has a different chip signature[^1],
whereas the markings are looking like the orignal AT89C2051. I didn't detect
any other issue with them. But are obviously fakes.

The only **real** pain point for the AT89C2051 is the 12V high-voltage
requirement for its programming, as it needs a HVPP[^2]. Which I have solved
in my [previous post]({{ site.baseurl }}{% post_url 2022-08-27-simple-at89c2051-programmer %}).

## Simulation

Now, as I'm learning about the architecture, relying on
programming/test/reprog/retest cycles only goes for a while.

As there is no debugging tool on the hardware part, I searched for an emulator.
Here also, the fact that the 8051 is a standard part (such as NE555) makes those
plentiful.

I selected [emu8051](https://github.com/jarikomppa/emu8051) from [Jari
Komppa](http://iki.fi/sol/8051.html ) which did not require any libraries
outside ncurses. The others being too cumbersome. I love the terminal, but a
visual UI is still a must.

The fact that the code wasn't very optimized for speed, but more for
readability and accuracy was the decisive factor.

I implemented a rustic [TX
serial](https://github.com/jarikomppa/emu8051/pull/14) to be able to easily
see what was sent.

[^1]: for example `1C 20` instead of the official `1E 21`

[^2]: High Voltage Parallel Programmer
