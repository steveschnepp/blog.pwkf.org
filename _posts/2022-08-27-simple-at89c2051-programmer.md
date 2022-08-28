---
layout: post
title: Simple AT89C2051 programmer with Arduino
tags:
- electronics
author: Steve SCHNEPP
---

Several AT89C2051 programmers exists. The most advanced one being [the one from
Paul Gallagher](https://leap.tardate.com/8051/at89c2051/programmer/), as it is fully
constrainted. Even generating the 12V onboard with a charge pump.

As I did want to remain on a small breadboard from the perfboard header, I
didn't have space to add the charge pump.

So, I just leveraged the fact that the Arduino Uno R3 can dynamically switch
from USB powering to DC jack powering. I used a USB-12V DC/DC converter powered
by an USB powerbank to generate the 12V, while still having the Arduino
connected to the laptop via USB.

The 12V is then available on the VREF pin, along with GND and the 5V.

To select the RST voltage from 0, 5V & 12V I used 2 NPN transistors to pull
down 12V to the required voltage. I went the cheap road to reduce 12V to 5V as
I didn't have any Zener diode handy. But 3x red LED mostly achieves the same
purpose[^2].

The result is a very simple 0/5/12V selector circuit.

[
![simple 0/5/12V selector circuit](../../../assets/images/circuit-20220828-1725.svg)
](http://www.falstad.com/circuit/circuitjs.html?ctz=CQAgjCAMB0l3BWcMBMcUHYMGZIA4UA2ATmIxAUgoqoQFMBaMMAKACURD8RjCKU8PPlSoAWKmBRRpMBCwDmnPIOxolKhFJEsAMiFG8QaQaNGDjMkADMAhgBsAznWqQWAJ32GLCDHwsT4Vw8DPlxRTgRQyHCA+F1PKPDTFWjLW0dnJCDObjBiKS5BQ1i4FgAXCMT1EDDpCCYwaGJsbB9mjARsXgQ8JEa0Fp64DDIMPEJTRnIwOBAAEzpbAFc7MoUc8xRwwqNxGXKKXyNuHf9wEAam0muukjBRGb5+yGvSLpmUYk1CKeQqBeWqxYAHcNuB8tU8loQZCITgnhCUCwwIQCspwWjNuEpACbCsygw7HQ5ucRFBYKwUZijFtqihIkZ5os8atCcTSTIKcjUXSGYR0QJzEzAQSiSSIGSYJBWEA)


I obviously changed the RST code[^1]. Note I also shutdown all power to every pin
connected to the AT89C2051 between 2 operations.

As I also reused PIN13 (LED_BUILTIN) to power the AT89C2051 instead of
connecting it to a solid 5V. As it is the first & last one to be switched on &
off, it nicely shows when there is some voltage applied to the socket.

I finally rewired cables for a cleaner look, as we don't need to rely on hardware
PWM specific pins.

![Neat arduino AT89C2051 programmer](../../../assets/images/IMG_20220828_173336535.jpg)

[^2]: Those 3 LED do lit themselves up nicely when RST is 5V. So upon every
      read, but not on 12V. Which is unfortunate. 🤷

[^1]: Code available upon request. It is very hacky at the moment and I don't
      have much incentive to clean it up, unless asked. 😉
