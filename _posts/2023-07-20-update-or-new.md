---
layout: post
title: Immutability of a Post
tags: blog best-practices
author: Steve SCHNEPP
---

URLs shall be immutable. But what about the post content itself?

## If Posts are Immutable

The most common trend is to treat posts as immutable records.
{: .panel .tip}

Updating a post is simply done via adding a new one. Only minimally editing the old one by merely adding a pointer to the new content.

The biggest merit is that everyone is notified when updates are available. It also preserve the history of the content. And it does preserve the trust in the content, as there's nothing worse than remembering something, checking again and seeing something else.

Changing content transparently is taxing everyone's memory sanity, and therefore erodes trust the fastest.
{: .panel .warning}

## If Posts are Updated

On the other hand, the internet is filled with obsolete information or, at worst, plain wrong information. Therefore **some** cleanup is very beneficial.

Having to jump through several updates isn't great either. Updating all the previous posts to always point to the latest one will not work, as I'm lazy and I might even miss some.

## A blog is like a GIT history

If you think about it, one can map a set of blog posts as git commits. Those are also immutable, but can be updated via `git rebase`.

And incidentally, `git rebase` has the same pros and cons.

Therefore I will apply the following rationale :

* Transparently update a post is fine if it didn't reach many users yet. So a few days is okay, as no-one reads my blog anyway ;-)
* It is better to update it, unless there is historical value, or significant changes
* Hinting that the post was updated, and when, is a very good practice that avoids eroding trust
* Having only 1 URL for the whole, updated, content is best.
* If some significant changes happen later, simply add a small post referencing the old URL with some teaser on what to expect now.

I'll be in the *pragmatic updates* group that actually seems to be the norm for online newspapers. So I may not be totally crazy.
{: .panel .tip}
