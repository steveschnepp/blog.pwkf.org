---
layout: post
title: USB-C Connectors Explained
tags: electronics usb
author: Steve SCHNEPP
---

Having a USB-C device that only works when the cable is *inserted on one side* ?
Having a USB-C device that only works *with USB-A to USB-C cables* ?
While USB-C is a wonderful standard, it has its little quirks.

## USB-C is an evolution, not a revolution

One of the biggest advantage of USB-C is the fact that it is reversible. And in
the pure tradition of USB, it is perfectly backwards compatible.

Another underrated advantage of USB that is still true with USB-C : the device
is very simple. Almost all the complexity is in the host.

### USB has a growing numbers of wires

#### USB 2.0 and prior

USB 1.0, 1.1 & 2.0 are the most well-known standards. They are *fully*
electrically compatible, and are around since ages. They are also dead simple,
as they only require 4 wires : VBUS, GND, D+ & D-.

Therefore **USB 2.0 is the primary target for any USB enabled device**. As its
speed is usually "fast enough".

#### USB 3.0

USB 3.x on the other hand has additional wires, which can best be seen on the micro-B connector.
![MicroB superspeed Connector](../../../assets/images/micro-b-superspeed-connector.jpg)

While the USB-A connector has a series of additional pins on inside, the micro-B has a whole connector extension on the side.

Downgrading an USB3.0 to USB2.0 is very easy, and only requires to simply ignore those extra connections.

#### USB-C

Despite the usual confusion, USB-C isn't always associated with USB 3.x. It is
first and foremost a **connector format**.  It even acknowledges one of the
main usage of USB nowadays : power delivery, without even the need of a data
transfer.

This was possible in the USB2.0 era since the vast majority of the USB-A
connecters where not 100% to the specifications, and happily delivered much
more current than what they should have. Therefore they became a de-facto
source of 5V.

The USB-C connector has a tremendous number of wires, mostly in order to enable
a somewhat future-proof usage.

![USB-C Connector](../../../assets/images/1920px-USB_Type-C_Receptacle_Pinout.svg.png)

The layout of the wiring is also mostly symmetrical, in order to ensure that
the connector can be inserted in any side.

## USB-C in detail

### USB 2.0 is fully symmetrical

We can see that the USB2.0 wires (VBUS, GND, D+ & D-) are **strictly**
symmetrical.  Which means that it indeed can be inserted in any side and still
have exactly the same connectivity. And most of the devices that upgraded from
the B connector to the C one fully leverage that.

### USB-C connectivity quirk : orientation sensing

Yet, a close examination shows that the other connectivity is not exactly
symmetrical. And that makes sense, as otherwise we would have needed twice the
amount of pins. 

Which means that the USB-C host needs a way to know which side the device is
connected as. In order to simply multiplex in reverse the non symmetrical pins.

This is done by the CC1 & CC2 pins. As in a native USB-C cable, there is only 1
wire from CC1 to CC1, and none from CC2 to CC2.  A dumb USB 2.0 compatible
device can simoly pull both CC1 and CC2 to GND via a 5.1k resistor in a fully
symmetric fashion. This will ensure detection of a device regardless of the
orientation.

Yet, in those dumb USB devices both D+ and D- connectors are respectively
shorted together. This again enables working regardless of orientation. But it
creates a long extra wire which distorts the signal. Therefore, the device can
opt in to orientation sensing in order to only connect one pair of d-/D+ via
comparing the CC1 and CC2 voltages.

More details are explained in note
[AN1914](https://ww1.microchip.com/downloads/en/AppNotes/00001914B.pdf) from
Microchip. This "orientation sensing" is one of the most overlooked fact in
USB-C,

![USB-C Adapter to USB 2.0](../../../assets/images/USB-3-1-Type-C-Connector-Male-Socket-USB-2-0.jpg)

Notice the 2 resistors ? Those are the CC1 & CC2 pulldown.

### USB-C flaw for USB2 upgraded devices : missing orientation pulldown

Therefore, some USB-C *upgraded from a USB2.0 micro-B* devices missed that. And
they don't have those pulldown resistors.

![CH340G-Module-TYPE-C.jpg](../../../assets/images/CH340G-Module-TYPE-C.jpg)

And then it does not work, as the USB-C host isn't using voltage sensing on
the D+/D- anymore to detect something is connected, but those CC lines. 
Even more, as the strength of those pulldown signals the voltage needed on
VBUS, without something on those CC lines, you will not even have any power in
VBUS.

So, if one tests with a USB-A to USB-C cable, it works perfectly fine.
This is because as the USB-A host cannot leverage the CC1 and CC2 lines,
therefore relies on D+/D- detection. And I fear that most
of the (cheap) devices manufacturer won't even think about testing otherwise.

Using a native USB-C cable does not even power the device, as expected.

Now I'm wondering if I could make an USB-C to USB-C adapter that emulates the
CCx lines.
