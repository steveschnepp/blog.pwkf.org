---
layout: post
title: "Sed is much slower than Perl, or not..."
date: 2009-11-12 10:11:18 +0100
tags: perl performance shell-scripting
permalink: /post/2009/11/Sed-is-much-slower-than-Perl-or-not%2e%2e%2e
author: Steve SCHNEPP
excerpt_separator: </p>
---

I wanted to do some text replacement with a **huge** file (think ~18GiB), filled with **huge** lines (think ~2MiB per ligne)[^1].

I naïvely piped it through `sed` and I was quite shocked that it was CPU bound, and not I/O bound. The average rate was about 5 MiB/s (measured with [pv](http://www.ivarch.com/programs/pv.shtml), and the CPU was at almost 100%.The text file was gzipped on the filesystem, but with a 1/100 ratio, so the gzip process just took less than 2% CPU. I replaced then the `sed -e` with the Perl one-liner `perl -lnpe`, and .... *tadaa*, it was flying at a rate of 50MiB/s !

While I'm a big fan of Perl, and know its effectiveness to handle text streams, I'm was still astonished : being 10x faster than sed was something.

But in the good old saying "Too good to be true means suspect", I remembered something about the character encoding of the regular expression. Since the system is entirely configured in UTF8, I suspected the *infamous* UTF8 overhead over plain ASCII.

I was right : a little `LANG=C` in front of the sed command line restored the rate to 50MiB/s.

So, **beware** of the **performance impact** of **UTF8** strings, and try to avoid it if you can.

[^1]: For the record, it was a MySQL dump
