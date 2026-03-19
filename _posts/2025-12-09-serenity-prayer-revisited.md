---
layout: post
title: The Serenity Prayer, Revisited
tags: life philosophy best-practices
author: Steve SCHNEPP
permalink: /:categories/:year/:title:output_ext
---

I keep running into the same mistake on projects: spending energy on things
that won't move. The Serenity Prayer is older than software, but it maps
surprisingly well onto how to spend your time as a developer.

## The Prayer

```
God, grant me the serenity to accept the things I cannot change.
Courage to change the things I can.
And wisdom to know the difference.
```

You don't need the God part for this to be useful. What matters is the three-way split.

## A Secular Version

```
May I find calm for what I cannot change.
May I find courage for what I can.
And may I know the difference.
```

## Applied to a Codebase

Every codebase has things you can change and things you cannot.

**Cannot change** — legacy ABI contracts, the OS scheduler, a dependency you don't own,
the language your team already knows. Pushing against these burns time and goodwill.
The correct response is to accept the constraint and design around it.

**Can change** — naming, structure, test coverage, your own habits. These are the
things worth spending energy on. Yet they are often the first to be deprioritized
because they don't feel urgent.

**The difference** — this is the hard part. A surprising number of arguments in code
review, in architecture meetings, and in bug post-mortems are really about
misclassifying something. Someone fighting a constraint that is fixed. Someone
accepting a constraint that is actually movable.

The [Cool Stuff versus Useful Stuff](https://blog.pwkf.org/2023/06/28/cool-stuff-versus-useful-stuff.html)
problem is a variant of this. The cool stuff feels changeable because it is new.
The boring stuff feels fixed because it is old. Neither feeling is reliable.

## A Simple Test

Before spending more than an hour on a problem, ask:

1. Is this actually in my control?
2. If yes, is it worth the cost to change it?
3. If no, what is the cheapest design that works *given* this constraint?

That third question is the one most people skip. They either fight the constraint
or give up entirely. Designing *around* a fixed constraint is a skill, and it is
underrated.

The prayer is just a reminder to ask the question before you start.
