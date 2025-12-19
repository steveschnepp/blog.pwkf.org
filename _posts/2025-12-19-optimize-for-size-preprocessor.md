---
layout: post
title: Optimize for Size with Preprocessor Directives
tags: programming c electronics
author: Steve SCHNEPP
---

When working on embedded systems, optimizing for size can be crucial.
Let's even go beyond the compiler optimization flags by actually generating different code paths based on whether we are optimizing for size or speed.

## Explore Standard Preprocessor Directives

As the GCC manual tells us, you can know the default preprocessor definitions for your target by running:

```bash
gcc -dM -E - < /dev/null
```

This will output a list of all predefined macros for your target architecture.

Note that it also work with optimisation flags, therefore to know the difference for each optimization level, you can run:

```bash
gcc -dM -E -O0 - < /dev/null > defs_O0.txt
gcc -dM -E -Os - < /dev/null > defs_Os.txt

$ diff  defs_O0.txt defs_Os.txt
60a61
> #define __OPTIMIZE__ 1
182d182
< #define __NO_INLINE__ 1
```

The flags are documented in the GCC manual [Common Predefined Macros](https://gcc.gnu.org/onlinedocs/cpp/Common-Predefined-Macros.html) page.

An excerpt of interest is:

> `__OPTIMIZE__`
> `__OPTIMIZE_SIZE__`
> `__NO_INLINE__`
>
> These macros describe the compilation mode. `__OPTIMIZE__` is defined in all optimizing compilations.
> `__OPTIMIZE_SIZE__` is defined if the compiler is optimizing for size, not speed.
> `__NO_INLINE__` is defined if no functions will be inlined into their callers (when not optimizing, or when inlining has been specifically disabled by -fno-inline).
>
> These macros cause certain GNU header files to provide optimized definitions, using macros
> or inline functions, of system library functions. You should not use these macros in any way
> unless you make sure that programs will execute with the same effect whether or not they are
> defined. If they are defined, their value is 1.

A very important information is that as soon as you have 2 code paths, you need to make sure that **both** paths are correct.
Otherwise very subtle bugs may appear, as testing might leverage one of the paths and productive code uses the other one.
{: .panel .note }

## Leveraging These Directives in Our Code

That means, we can do exactly the same in our code to optimize for size.

For example in order to compute a CRC checksum, we can use a precomputed table for speed, or compute it on the fly for size.

```c
#ifdef __OPTIMIZE_SIZE__
// Size optimized version: compute CRC on the fly
uint8_t crc8_t(uint8_t crc, uint8_t data) {
    crc ^= data;
    for (uint8_t i = 0; i < 8; i++) {
        if (crc & 0x80) {
            crc = (crc << 1) ^ 0x07;
        } else {
            crc <<= 1;
        }
    }
    return crc;
}

#else // __OPTIMIZE_SIZE__

// Speed optimized version: use a precomputed table
static const uint8_t crc8_table[256] = {
    // Precomputed CRC-8 table values
    0x00, 0x07, 0x0E, 0x09, 0x1C, 0x1B, 0x12, 0x15,
    0x48, 0x4F, 0x46, 0x41, 0x54, 0x53, 0x5A, 0x5D,
    ...
};

uint8_t crc8_t(const uint8_t crc, const uint8_t data) {
    return crc8_table[crc ^ data];
}

#endif // __OPTIMIZE_SIZE__

uint8_t crc8(const uint8_t *data, size_t len) {
    uint8_t crc = 0;
    for (size_t i = 0; i < len; i++) {
        crc = crc8_t(crc, data[i]);
    }
    return crc;
}
```

The code is only an illustration, the CRC-8 code is not correct.
{: .panel .warning }