---
layout: post
title: "Clock 4 digit - Part 1"
date: 2021-11-01
---

## Intro

I got my hands on a 4 digit clock DYI kit. Soldering it is rather easy, and it
works very nicely.

The precision is correct, but not awesome. About 5s drift per day, which
means around 2m30s per month. If it has some adjusting configuration options, I didn't
find how, as there's only the chinese option for its manual.

The biggest downside is its power appetite. It slurps almost 100mA constanly,
which means that operating it from a battery is going to be an tedious
proposition.

Upon close look, there is a 5V DC connector and a 3V battery. I didn't
understood it at first, but the 5V is for a charger, and the 3V is only to
retain the time, but cannot power the LED.

