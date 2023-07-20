---
layout: post
title: Immutability of a Post
tags: blog best-practices
author: Steve SCHNEPP
---

URLs shall be immutable. But what about the post content itself?

## Posts are Immutable

The most common trend is to treat posts as immutable records.
{: .panel .tip}

Updating a post is simply done via adding a new one. Only minimally editing the old one by merely adding a pointer to the new content.

The biggest merit is that everyone is notified when updates are available. It also preserve the history of the content. And it does preserve the trust in the content, as there's nothing worse than remembering something, checking again and seeing something else.

Changing content transparently is taxing everyone's memory sanity, and therefore erodes trust the fastest.
{: .panel .warning}

## Posts are Updated

On the other hand, the internet is filled with, at best, obsolete informations and, at worst, plain wrong information. Therefore some cleanup is usually very beneficial.

Having to jump through several updates isn't great either, and updating all the previous posts to point to the latest one won't be done.

## A blog is like a GIT history

If you think about it, one can map a set of blog posts as git commits. Those are also immutable, but can be updated via `git rebase`.

And incidently, `git rebase` has the same pros and cons.

Therefore I will apply the following rationale :

* transparently update a post is fine if it didn't reach many users yet. So a few days is okay, as noone reads my blog anyway ;-)
* it is better to update it, unless there is historical value, or significant changes
* Hinting that the post was updated, and when, is a very good practice that avoids eroding trust
* Having only 1 URL for the whole, updated, content is best.
* If some significant changes happen later, add a small post referencing the old URL.

So, I'll be in the *pragmatic updates camp* that seems to be the norm for online newspapers.
{: .panel .tip}
