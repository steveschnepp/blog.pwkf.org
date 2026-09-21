---
layout: post
title: Type Punning in C and C++
tags: c undefined-behavior c++
author: Steve SCHNEPP
---

I had a bug that took me a while to track down. The problem
was type punning. A pointer cast worked fine at `-O0` and
silently broke at `-O2`. The C vs C++ distinction here is genuinely
treacherous, and most blog posts on the topic get it wrong.

Type punning is interpreting memory as different types between reads
and writes. It's essential for serialisation, network protocols, and
low-level hardware access. 

The problem is that "works in practice" and
"has defined behaviour" are different things.
{: .panel .warning }

## The Spectrum from Safe to UB

In C, the safe ways to type pun are `union` and `memcpy`. Pointer casts are technically undefined behavior under strict aliasing rules, even though they work on every compiler you'll encounter.

### Unions

A union lets you write as one type and read as another.
This is defined behavior in C:

```c
union {
    float f;
    uint32_t bits;
} pun;

pun.f = 3.14f;
uint32_t exp = (pun.bits >> 23) & 0xff; // extract IEEE-754 exponent
```

This also works beautifully for pulling apart structs:

```c
union {
    struct color { float r, g, b, a; } c;
    float as_array[4];
} u;

u.c = (struct color){ .r = 1, .a = 1 };
float a = u.as_array[3];
```

### memcpy

If you don't want a union, `memcpy` is safe and the compiler will optimise it to a register move:

```c
float f = 3.14f;
int i;
memcpy(&i, &f, sizeof(f)); // defined behavior, compiles to a single instruction
```

### Pointer Casts — Convenient but UB

This compiles, runs, and gives you the "right" answer on every platform:

```c
float f = 3.14f;
int *p = (int *)&f;
int i = *p;
```

It's also undefined behavior. The strict aliasing rule says an object shall only be accessed through an lvalue of its effective type, a qualified version of it, or a character type. A pointer cast to an unrelated type violates this.

## Why C and C++ Differ

In C, types are a way to interpret memory. In C++, types are first-class citizens — the compiler is allowed to assume that different types never alias each other.

This has concrete consequences. Consider:

```c
struct c {
    uint32_t a;
    uint32_t b;
};

uint32_t bar(uint64_t *u64, struct c *c) {
    if (c->a == 2) {
        *u64 = 4;
    }

    if (c->a == 2) {
        return c->a;
    }

    return c->b;
}

int main() {
    struct c c = { 2, 3 };
    return bar((uint64_t *) &c, &c);
}
```

With GCC or Clang at `-O2`, this returns `2`. At `-O1` or below, it returns `0`. The compiler sees that `u64` is `uint64_t*` and `c` is `struct c*` — different types — so it assumes they don't alias. The second `c->a == 2` check gets optimised away based on the assumption that writing `*u64 = 4` can't change `c->a`. This is technically correct under the standard, even though the types *do* overlap in memory.

The deeper explanation is in [Taking a Byte Out of C++ - Avoiding Punning by Starting Lifetimes](https://www.youtube.com/watch?v=pbkQG09grFw), which covers why C++ went this direction.

## The Practical Rule

If you're writing C and need to type pun, use a `union` or `memcpy`.
{: .panel .tip }

Pointer casts "work" until they don't. And "don't" means the compiler
silently optimises away the code you thought was executing. If you're
writing C++, the same applies, plus the compiler has more latitude to
break things under the as-if rule.

The bug I started with? A pointer cast from `float*` to `uint32_t*` in a hot loop. At `-O2`, the loop was optimised under strict aliasing assumptions, and the values I was writing never appeared where I expected them. A union fixed it in ten minutes.

