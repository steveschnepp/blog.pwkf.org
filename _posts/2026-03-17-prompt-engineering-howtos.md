---
layout: post
title: "Prompt Engineering Frameworks - A Practical Overview"
tags: [ai, best-practices, development, learning]
---

There is a recurrent question when starting to use LLMs seriously :
*"How do I structure my prompts ?"*.

Several frameworks emerged to answer that question.
Let me go through the most common ones, with practical examples.

## Why bother with a framework ?

A prompt is just text. Yet, a poorly written prompt yields a poor result.
A well-structured one yields a precise, useful one.

The frameworks are just mnemonics. They are a checklist to avoid forgetting
important context. Nothing more, nothing less.

## CRAFT

**Context, Role, Action, Format, Target**

The most widely used one. Easy to remember, covers most cases.

```
Context: Building a 2D platformer in C99
Role:    Senior game engine developer
Action:  Write an AABB collision detection system
Format:  Annotated C99, Linux kernel style
Target:  Embedded / low-level developers
```

A good default. Start here.

## RISEN

**Role, Instructions, Steps, End goal, Narrowing**

Better suited for multi-step tasks where the order matters.

```
Role:         Physics programmer
Instructions: Implement sweep-and-prune broadphase
Steps:        1) Define axis-sorted list  2) Find overlapping pairs  3) Output pair buffer
End goal:     Reusable broadphase module
Narrowing:    C99, no dynamic allocation, < 300 lines
```

The *Narrowing* part is the most valuable addition over CRAFT.
It is where you exclude what you don't want, which is often
[as important as what you do want](https://blog.pwkf.org/2022/09/18/always-optimize-for-dummies.html).

## CREATE

**Character, Request, Extras, Adjustments, Type, Extras**[^1]

More creative / generative oriented. The double *Extras* is intentional :
first pass for constraints, second pass for polish.

```
Character:   Senior graphics programmer
Request:     Implement a sprite batch renderer
Extras:      Must sustain 10k sprites @ 60fps
Adjustments: Vulkan only, no OpenGL
Type:        C99 source file
Extras:      Inline performance notes
```

The distinction between *Extras* and *Adjustments* is subtle but useful :
*Extras* adds, *Adjustments* redirects.

## CARE

**Context, Ask, Rules, Examples**

Best when you have concrete I/O examples. Closest to a proper specification.

```
Context:  Tile-based binary map loader
Ask:      Parse format into a struct
Rules:    No malloc, fixed buffers, C99 only
Examples: [binary sample] → [expected struct output]
```

The *Examples* part is the killer feature here.
An LLM guided by examples makes far fewer wrong assumptions.

## CLEAR

**Concise, Logical, Explicit, Audience, Role**

A meta-framework of sorts. Less about structure, more about quality attributes
of each component.

```
Concise:   "Write a ring buffer"
Logical:   "for audio streaming, SPSC"
Explicit:  "thread-safe via atomics, no locks"
Audience:  Embedded C developers
Role:      DSP systems programmer
```

Useful as a review checklist once the prompt is written rather than as a
writing guide.

## Comparison

| Framework | Sweet spot                        |
|-----------|-----------------------------------|
| CRAFT     | General purpose, good default     |
| RISEN     | Multi-step, ordered tasks         |
| CREATE    | Creative / generative output      |
| CARE      | Data transformation, precise I/O  |
| CLEAR     | Quality review of existing prompt |

## In practice

No need to pick one and stick to it forever.
CRAFT covers ~80% of daily use.
Reach for RISEN when the task has sequencing constraints.
Use CARE when you can supply examples — it gives the most deterministic output.

The frameworks are not mutually exclusive either.
A CRAFT prompt can embed CARE's *Examples* without issue.

The real takeaway is : **always include what the output is for and who reads it**.
That single addition — *Target* in CRAFT, *Audience* in CLEAR — has the
biggest impact on output quality, and is the most commonly forgotten element.[^2]

[^2]: This article was written with [Claude](https://claude.ai). Asking an AI to explain how to talk to an AI is either the most efficient use of a prompt framework, or a remarkably short loop.

[^1]: The second *E* in CREATE varies by source. Some use *Evaluation*, some use *Extras*. The meaning differs slightly but the intent is the same : a second pass for refinements.
