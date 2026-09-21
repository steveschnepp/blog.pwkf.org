---
layout: post
title: "Free Exception lunch : Use unchecked exceptions, but still announce which ones you might throw."
date: 2009-09-03 08:23:23 +0100
tags: java best-practices
permalink: /post/2010/02/You-Shall-Declare-The-Unchecked-Exceptions-You-Might-Throw
author: Steve SCHNEPP
excerpt_separator: </p>
---

In a previous article I choosed my side : [Unchecked Exceptions are much simpler to use](/post/2009/07/Checked-or-Unchecked-Exceptions-for-Legacy-Code).

But, on the other side of this great division, there is a very valid point : **You usually declare checked exceptions**. Sure it's possible to only declare to throw `Exception`, but that would defeat the whole purpose of using checked exceptions.

The nicest thing is that you can also have a custom exception hierarchy, but based on `RuntimeException` instead of a plain `Exception`. This way it's like in C++. Everything might be thrown, and you don't **need** to handle them.

**Declaring them**, on the other side, is very interesting because you are **documenting your interface** for almost **free**.

So, use unchecked exceptions to free yourself of the checked catch-slavery, but still declare the custom ones you might throw.
