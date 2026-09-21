---
layout: post
title: "Autovivification in Perl : Great Idea but also Huge Trap - Another Leaking Abstraction..."
date: 2011-06-16 18:20:22 +0100
tags: perl
permalink: /post/2011/06/Autovivification-in-Perl-Great-Idea-Huge-Trap-Leaking-Abstraction
author: Steve SCHNEPP
excerpt_separator: </p>
---

[Autovivification](http://en.wikipedia.org/wiki/Autovivification) is one of Perl's really great design success.

It all comes to *you don't need to worry about existence before dereferencing something*.

That means, for setting a nested hash, you only need to write:

```perl
$h->{foo}{bar} = "value";
```

And that will work out of the box. Perl will happily create all the data-structure for you.

So, now a little coding test, what does the following code output?

```perl
my $a;

if ($a->{foo}{bar}) {
   print "Found foo/bar\n";
}

if ($a->{foo}) {
   print "Found foo\n";
}
```

Naively, it shouldn't output anything, right?

Not so fast. Upon a careful read of "Perl will happily create all the data-structure for you", we can put some emphasis on one word : "Perl will happily **create** all the data-structure for you".

That might be just perfect, except that Perl creates it whenever it needs it, even if it is only for **reading**.

And now you understand the catch : a **read** operation can result in a **write** one.

As Uncle Ben (from SpiderMan) said[^1] : "With Great Power Comes Great Responsibility".

[Dagfinn Ilmari Mannsåker](http://search.cpan.org/~ilmari/) showed me a nice [autovivification](http://search.cpan.org/perldoc?autovivification) module on CPAN that fixes this behavior, and enables a fine tuning of this process.

I really think the fact that creation also happen when querying the value is a real bug in Perl itself, or at least a bug in the design of the feature.

[^1]: Voltaire, Franklin D. Roosevelt and other said something very similar, but they are not as geeky.
