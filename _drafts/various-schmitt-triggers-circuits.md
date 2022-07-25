---
layout: post
title: "Various Schmitt Triggers"
tags: electronics schmitt transistors
---

## Intro

As Wikipedia stated it, [Schmitt
trigger](https://en.wikipedia.org/wiki/Schmitt_trigger) are typically used in
to remove noise from signals used in digital circuits.

This makes it one of the most important digital circuit, as induced noise in
the biggest issue for increasting frequency, therefore performance.

A good passive noise isolation is mitigating most of it, but it usually isn't enough.

## Classic with AmpOp

Many different circuits do exists, but the first one that is encoutered
is the one that comes with ampop.

[
![Schmitt with AmpOP](../../../assets/images/circuit-20220605-1810.svg)
](
https://www.falstad.com/circuit/circuitjs.html?ctz=CQAgjCAMB0l3BWcMBMcUHYMGZIA4UA2ATmIxAUgoqoQFMBaMMAKACcQAWPKlPPLjxDZCAqmHjwWAd0G9OVbr35R2ckHwEJiKDSqq5JMijr1bTKFJ1Wztuy9cJWNzyCwDm6kQKXC81qjdZXzQfbHt8VQA3LnCNSOwReLFwLjhUwKhoBBYAJWEk0LNkqFSFDWyKpEDslm9YiLDdME4A1Q4QlWx-YvFJODy-a01hBHt9UvLq0pgcgEN1BxN7Zy1SiX6QBhhE7E4UHRRmbgROYi5YJyxODEJmf1Pm-rrRZZdrO3BbmbUna1xHM56n0Bp4-sJXuDum03GAnCBwUsoZBhiAACZ0ABmcwArgAbAAuDDxdDRGRmsFYAHsQOdCG0FMQBBIEdAGbThOBsOtudgWEA
)

The basic working principle is that

* The ampop is configured in comparator mode. This means that there is no
  feeback loop, and the ampop has its full gain[^1].
* The comparison is done with a different reference depending on waiting
  for rising or lowering edge.

[^1]: Usually around 1e5, which means that a full 5V swing will occur when there's as little as 0.5mV (5e-5) difference between the inputs.

In detail, the inverting input is compared to a tension divisor that is
mid-voltage.

But as we have a 300kΩ resistor that biases that divisor with some of the
output, the comparison is not done anymore with always the same reference
value : it depends if the output is low or high.

This in turn triggers the Schmitt effect, as the flip is happening at
different voltage on rising edge (which is when output is high) or
lowering edge (that is when output is low)

# Using an Open Collector Comparator

It is very similar than the AmpOp.

Usually a comparator has a open collector output, therefore it needs an
additional pull-up resistor. Note that the hyrestesis of the schmitt
trigger is depending on the load, and therefore might a buffered output.

[
![Schmitt with Open Collector Comparator](../../../assets/images/circuit-20220605-1810.svg)
](https://www.falstad.com/circuit/circuitjs.html?ctz=CQAgjCAMB0l3BWcMBMcUHYMGZIA4UA2ATmIxAUgoqoQFMBaMMAKACcQAWPKlPPLjxDZCAqmHjwWAd0G9OVbr35R2ckHwEJiKDSqq5JMijr1bTKFJ1Wztuy9cJWNzyCwDm6kQKXC81qjdZXzQfbHt8VQA3LnCNSOwReLFwLjhUwKhoBBYAJWEk0LNkqFSFDWyKpEDslm9YiLDdME4A1Q4QlWx-YvFJODy-a01hBHt9UvLq0pgc+qdh51EBBxm1BeFIR2d6voHPDfmdnsCWMCcQDdXDrY0QABM6ADMAQwBXABsAFwYPunuMjNYKwFBAQs47C5rBA8AAdADOYAQCKYyMR-UgCOwsEgIk4xG6GEskDInEIKJgYEshAQCBwkDGCEIGAUKAREkkUARaHZGM5YARbg4kNWkJabQ5bnyYtaFEI4llmSmMyyOQA9iBiJc2gpiAIJJdoDrNcJwLpxLpsCwgA)


## Using a NOT gate






---

