---
layout: post
title: USB-C Connectors Explained
tags: electronics usb
author: Steve SCHNEPP
excerpt_separator: <!-- -->
---

Having a USB-C device that only works when the cable is *inserted on one side* ?
Having a USB-C device that only works *with USB-A to USB-C cables* ?
While USB-C is a wonderful standard, it has its little quirks.

<!-- -->

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
main usage of USB nowadays : power delivery, wihtout even the need of a data
transfert.

This was possible in the USB2.0 era since the vast majority of the USB-A
connecters where not 100% to the specifications, and happily delivered much
more current than what they should have. Therefore they became a de-facto
source of 5V.

The USB-C connector has a tremendous number of wires, mostly in order to enable
a somewhat future-proof usage.

![USB-C Connector](../../../assets/images/1920px-USB_Type-C_Receptacle_Pinout.svg.png)

The layout of the wiring is also mostly symetrical, in order to ensure that
the connector can be inserted in any side.

## USB-C in detail

### USB 2.0 is fully symetrical

We can see that the USB2.0 wires (VBUS, GND, D+ & D-) are **strictly**
symetrical.  Which means that it indeed can be inserted in any side and still
have exactly the same connectivity. And most of the devices that upgraded from
the B connector to the C one fully leverage that.

### USB-C connectivity quirk : orientation sensing

Yet, a close examination shows that the other connectivity is not exactly
symetrical. And that makes sense, as otherwise we would have needed twice the
amount of pins. 

Which means that the USB-C host needs a way to know which side the device is
connected as. In order to simply multiplex in reverse the non symetrical pins.

This is done by the CC1 & CC2 pins. As in a native USB-C cable, there is only 1
wire from CC1 to CC1, and none from CC2 to CC2.  Coupled with only a resistor
from CC1 to GND on the device side, it enables the host to know the orientation
of the insertion and act accordingly. The value of those are standardized, but
in the vast majority of the cases it is 56k.

This "orientation sensing" is one of the most overlooked fact in USB-C. And
more precisely the fact that it is *mandatory*. To signal a USB 2.0 compatible
device, it simply needs to have both CC1 and CC2 pulled to GND, in a fully
symetric fashion.

![USB-C Adapter to USB 2.0](../../../assets/images/USB-3-1-Type-C-Connector-Male-Socket-USB-2-0.jpg)

Notice the 2 resistors ? Those are the CC1 & CC2 pulldowns.

### USB-C flaw for USB2 upgraded devices : missing orientation pulldowns

Therefore, some USB-C *upgraded* devices missed that. And they don't have those
pulldown resistors.

![CH340G-Module-TYPE-C.jpg](../../../assets/images/CH340G-Module-TYPE-C.jpg)

And then it magically doesn't work, as USB-C aren't using voltage sensing on
the D+/D- anymore to detect something is connected, but those CC lines. 

Even more, as the strength of those pulldowns signals the voltage needed on
VBUS, without something on those CC lines, you will not even have any power in
VBUS.

If you use a USB-A to USB-C cable, it works perfectly fine, as the USB-A host
cannot leverage the CC1 and CC2 lines, therefore relies on D+/D- detection.

But using a native USB-C cable does't even power the device. 

Now I'm wondering if I could make an USB-C to USB-C adapter that emulates the
CCx lines.
