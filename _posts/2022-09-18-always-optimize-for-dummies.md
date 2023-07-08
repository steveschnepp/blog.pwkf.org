---
layout: post
title: Always Optimize for Junior Devs
tags: development best-practices
author: Steve SCHNEPP
---

There is a single advice I would give to anyone writing software, and specially
to great devs : **Always optimize your code for your most junior developers**.
I agree that it is not a very popular advice, but it is the one that, in my
experience, give the *biggest bang for the buck*.

**Code is usually optimized for readability**.

Yet it always takes the seniors devs perspective. Syntaxic sugar is used &
abused, since it does enable very terse code. Since less code is usually lauded
for its lower bug ratio, it looks like a good idea. A percieved side-effect
is that it will even educate juniors devs by emulation & example.

And, a very good idea it is. *At first*.

## Rationale

A summary of the rationale is **not really technical**.

More **human** & management **related**.

In the end, **you cannot fight turn over**, as skilled devs *will* leave, no
matter your strategy to retain them. Reasons for it are multiple and well
known, so I won't discuss them here.

Yet, it is this particular reason that usually kills your product : **brain
drain**.

Added to that harsh reality, there's another reality : finding senior devs to
replace them is hard, it's much easier to find juniors ones. Bigger pool, and
smaller costs. Happier Management.

Also, let's face it, seniors devs can be very performant, but most of them are
not that flexible anymore. The vast majory do come with their habits, which enables
them to leverage their performance, but unfortunatly quickly ends up as a tech
patchwork. Only very few, super awesome ones, are *blending in*. They tend to follow
the existing code patterns, changing it only when it makes absolute no sense. And
even then, in a global & coherent manner.

It is not really a popular opinion, but that's exactly one of the reasons why
the whole industry is moving towards "locode/nocode" solutions : To be able to
quickly onboard junior devs.

A nice side effect is that, as junior devs don't have much technical baggage,
the code itself needs to be very self-explanatory. And it cannot contain much
idioms, as those would impeded understanding.

Which means that, when you need to increase velocity, you will be able to
quickly add some cheap workforce. Which is a much better sell to management
than spending at least 3 months sourcing a senior that will take 3 months
to product meaningful code since the various used idioms are plentiful and not
compatible with each others.

## Implementation

### Code reviews are key

Doing is is actually very simple :

1. Always have the **most juniors devs** in your team **do code reviews**. It
   shall not stop the seniors to do code reviews, but ensure that junior review
are mandatory. The 2 groups won't find the same issues and therefore are
complementary more than antagonists.

2. **Never explain anything outside code**. If some reviewer asks a "why?"
   question, change *the code itself* as a reply.

3. The explanations *cannot* be in PR comments, in a wiki, or worst : [in a
   *meeting*]({% post_url 2020-09-27-we-should-only-have-fun-meetings %}).

This will means that the code will naturally evolve towards self-explanation
for *anyone*. There will be not much context needed, and that will be a very
good thing.

> Imagine a critical incident happening in the middle of a week-end night[^1].
> Your SRE team will have an on-call person, which will know where the the code
> is, but has not really good knowledge of that said codebase.
>
> That person will be able to understand it much quicker, specially considering
> that he will be under great stress as everyone is counting on him to find a
> quick & adequate solution. Yet he is not in full spirit, being the middle of
> the night.
>
> That will enable a timely & correct response, that lowers the priority and
> makes it possible to defer until a normal timing for additional
> investigations/fixes when the whole team is back.

[^1]: It *always* happens at inconvenient moments. Mostly because when it
      happens at convenient ones, noone is remembering those, as they are
      quickly dealt with and become non-events.

Besides, even your future self is another person given enough time.
{: .panel .tip}

[
![XKCD: Future Self](../../../assets/images/future_self_2x.png)
](https://xkcd.com/1421/)

A side-effect of that implementation is that some patterns will emerge that one
can solidify in rules in order to speedup & streamline the process upfront.

### Pair programming isn't dead

It sounds like the death of pair-programming, but the latter serves a different
need. Its execution is similiar but needs to be adjusted with knowledge from
the previous section.

* *Pair programming enables more creativity*. This means that one can pair 2
   developers that have the same level of seniority & expertise.

* *Pair programming enables faster code-review*. This means that one can pair
   with a junior developer, but similarly than for regular code-reviews, if
there is a question, it has to be answered **in the code**. Not live orally. As
the important meaning from the question is "there is currently some information
missing" would be lost.

## Relevant coding-style examples

I obviously gathered some coding-style idiosyncraties that fit very well in
that context. It also has the nice side effect of making wrong code *obviously*
wrong.

### 1SLOC - One Statement per Line of Code

This enables a very good understanding of what is currently done.

The rule very simple :

1. Always do only 1 operation *type* per line, be it addition, boolean logic or
   bitwise operations. We can have multiple of the same.

2. Every operation is assigned to a temporary variable that has a meaningful
   name. This enables to follow what is done very nicely as it reduce the
reader's needed context.

3. Assigments to temporary variables don't count towards the 1SLOC, but
   assigments towards ones with a different scope do.

The most important item is the *meaningful* name of variables.
It is the item that improves understanding the most.
And usually a compiler does optimize them away,
as it would with an unamed, temporary, variable.
{: .panel .tip}


Instead of

```java
int s = a + b + c + (y > 6 || y < 1) ? y : 0;
```

do

```java
boolean isYTooBig = y > 6;
boolean isYTooSmall = y < 1;
boolean isYInBounds = isYTooBig || isYTooSmall;
boolean yIfInBounds = isYInBounds ? y : 0;
int s = a + b + c + yIfInBounds;
```

And there the accurate reader noticed that the result isn't correct, as there's a bug in `isYInBounds`. It is reversed.
The correct code is of course:

```java
boolean isYTooBig = y > 6;
boolean isYTooSmall = y < 1;
boolean isYOutsideBounds = isYTooBig || isYTooSmall;
boolean yIfInBounds = isYOutsideBounds ? 0 : y;
int s = a + b + c + yIfInBounds;
```

### Unit suffix

For every quantity that has a unit, always suffix with that unit.

The following code looks now obviously wrong

```java
double delay_ms = 1000;
double frequency_hz = 1/delay_ms;
```

It should be fixed as


```java
double delay_ms = 1000;
double frequency_hz = 1000/delay_ms;
```

It also works with encoding.

```perl
my $value = 1000;
my $value_hex = sprintf "%x", $value;
```

### Do not prefix any variable according to its scope.

A very common practice is to prefix variables with their scope. A typical
example would be to prefix with `g` the global scope, `a` the argument scope,
and not prefix the local scope.

But then it fells short since we can have many local scopes.

Also, the same variable will have 2 different names in a sub function, as the
caller has it as a local one, whereas the callee has it as arguments.

For example, look at this code

```c
int gPlayerX;
int gPlayerY;

int gMinX;
int gMinY;
int gMaxX;
int gMaxY;

/* Return the middle number */
int middle(int aMin, int aValue, int aMax) {
    if (aMin <= aValue && aValue <= aMax) return aValue;
    if (aValue <= aMin && aMin <= aMax) return aMin;
    return aMax;
}

void update(int aDx, int aDy) {
	gPlayerX = middle(gMinX, gPlayerX + aDx, gMaxX);
	gPlayerY = middle(gMinY, gPlayerY + aDy, gMaxY);
}
```

And compare it to


```c
int player_x;
int player_y

int MIN_X;
int MIN_Y;
int MAX_X;
int MAX_Y;

/* Return the middle number */
int middle(int min, int value, int max) {
    if (min <= value && value <= max) return value;
    if (value <= min && min <= max) return min;
    return max;
}

void update(int dx, int dy) {
	int new_player_x = player_x + dx;
	int new_player_y = player_y + dy;

	int clamped_player_x = middle(MIN_X, new_player_x, MAX_X);
	int clamped_player_y = middle(MIN_Y, new_player_y, MAX_Y);

	player_x = clamped_player_x;
	player_y = clamped_player_y;
}
```

The last `player_x = clamped_player_x` is particularly interesting, as it
clearly shows that this assigment is one to a different scope. Therefore it has its
own line with the 1SLOC rule number 3.
