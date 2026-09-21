---
layout: post
title: "When having good relationships with package maintainers can also be a curse"
date: 2013-02-24 12:23:24 +0100
tags: munin life
permalink: /post/2013/02/good-relationships-maintainers-curse
author: Steve SCHNEPP
excerpt_separator: </p>
---

I advise every user to **only** use the **packaged version** of [munin](http://munin-monitoring.org). Here's a short article to explain the background of my reluctance to ask for users to directly use the official tarball.

I have become upstream of [munin](http://munin-monitoring.org) a while ago now. As such, I'm in contact with package maintainers. They take the official releases and cram it into their own distribution of choice[^1].

I have to admit that the various epic war stories read throughout the web about *upstream vs packagers* are very far from the truth here. They are a charm to work with. Often challenging and demanding, but always because there's a real need. And that's quite a good thing, as I'm still a rookie in term of open source software management. Therefore I'm quite grateful when they gently pinpoint my mistakes[^2].

Yet, this nice team comes with a *price*. Since we mostly hang out on IRC together, there is way much inter-distro communication than on other software. But I'm the *sole* owner of the *tarball distro*.

Yet, as I don't like to build everything from source, I obviously use a distro. There, since the packaging is very nicely done, I don't feel to take the hassle of using my own "tarball" to test them. I just build a package for my distro out of the release code.

That's also a curse, as I admit that I although I test the *code*, I only seldom test the *packaging*. This means that I cannot really advise someone on using the tarball, nor directly git code as even I don't do it.

But, that said, **I still think I'm the luckiest upstream around**. Thanks guys !

[^1]: Be it linux-based like Gentoo, Redhat..., BSD-based as FreeBSD, OpenBSD..., or even multi-kernel based as Debian
[^2]: Defaulting to CGI graphics was a move that was way too premature, end-user wise. So thanks to them, it defaults to cron again
