---
layout: post
title: "Immutability of an URL"
date: 2009-04-27 16:13:30 +0100
tags: blog best-practices
permalink: /post/2010/02/Immutability-of-an-URL
author: Steve SCHNEPP
excerpt_separator: </p>
---

In the pure spirit of [Data is King](http://www.javapractices.com/topic/TopicAction.do?Id=211) I think that URL should **never** change. Even the W3C agrees with their [Cool URIs don't change](http://www.w3.org/Provider/Style/URI.html) article.

But we all know that in IT *never* is only *not in the foreseen future*. So URL **do** change, at least after a while, and usually for technical reasons[^1].

Since you can update your website to update the URLs, but the inbound link cannot be easily updated. To handle this need, the HTTP protocol has specified the 301 response code.

The solution is that the site should remember all the urls that it generated and redirects accordingly. This way you'll never loose a potential reader to the infamous 404 (this page does not exist).

Some sites even try to approximate the page on a custom 404 page. That's another reason to have user-friendly urls : to be able to hint your reader to appropriate pages in case you don't find his initial destination.

Sadly, this redirect behavior isn't supported by my blog engine (dotclear)... That's for the [eat your own dog's food](http://en.wikipedia.org/wiki/Eating_one%27s_own_dog_food), but I'm looking forward to do it on my current blogging platform.

[^1]: upgrade to another blog engine...
