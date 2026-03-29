---
layout: post
title: Amalgamate C Sources for Online IDE Compilers
tags: development c tooling
author: Steve SCHNEPP
---

I use [Compiler Explorer](https://godbolt.org/) and [PGE Tinker](https://pgetinker.com/) regularly. Yet both take only a single C or C++ file as input. Most of the projects do not. This tool closes that gap.

The [full source](https://github.com/steveschnepp/amalgamate/) is one C file.

## What it does

It walks a C source tree and inlines all `#include "local.h"` directives recursively. System includes (`<stdio.h>`) pass through untouched. The result is one `.c` file you can paste anywhere.

```sh
./amalgamate main.c utils.c > squashed.c
```

Pass every `.c` that contributes symbols. Order matters: the compiler sees the file top to bottom, definitions before use.

Build on Linux or MSYS2 UCRT64:

```sh
gcc -std=c99 -Wall -Wextra -o amalgamate amalgamate.c
```

## Resolution order

For each `#include "name.h"` the tool tries, in order: the directory of the including file, each `-I` path, then `cwd`. System includes (`<name.h>`) are never touched.

```sh
./amalgamate -I include/ -I vendor/include/ main.c utils.c > squashed.c
```

Both `-I dir` and `-Idir` forms work, matching gcc convention.

## What works

The typical multi-file C project amalgamates cleanly. Given a layout like:

```
main.c     -- includes utils.h, math.h
utils.c    -- defines add(), and sub() not declared in utils.h
math.c     -- defines mul(), and square() not declared in math.h
types.h    -- shared typedefs, included by both utils.h and math.h
```

Header guards (`#ifndef`) survive intact. `types.h` is inlined every time it appears, but the preprocessor deduplicates it. That is the right behavior — the tool doesn't second-guess the preprocessor.

Symbols not declared in any header (`sub`, `square` above) are present in the output because their `.c` files were passed explicitly. The caller must `extern`-declare them. Same constraint as with a normal linker.

## What breaks

**Colliding `static` names across translation units.**

`static` limits linkage, not scope. In separate TUs the compiler never sees both definitions. In a single TU it does. C99 forbids two definitions of the same name in the same scope, even if both are `static`.

This compiles fine as separate TUs:

```c
/* utils.c */
static i32 helper(void) { return 1; }

/* math.c */
static double helper(void) { return 3.14; }  /* same name, different type */
```

Amalgamated, it fails:

```
error: conflicting types for 'helper'; have 'double(void)'
note: previous definition of 'helper' with type 'i32(void)'
```

The fix is manual: adopt a prefix convention before amalgamating.

```c
/* utils.c */
static i32 utils_helper(void) { return 1; }

/* math.c */
static double math_helper(void) { return 3.14; }
```

The tool cannot rename symbols. That requires a parser. This tool is not a parser.
{: .panel .warning }

**Include cycles** are detected and fatal:

```
include cycle detected: /src/cycle_a.h
  /src/main.c
  /src/cycle_a.h
  /src/cycle_b.h
```

That is always a bug in the source. Fix the source.

## Flags

`--with-line` emits `#line` directives around each inlined file. Without them, a compiler error in the amalgamated output gives a line number that maps to nothing in your editor. With them, errors point back to the original file.

```sh
./amalgamate --with-line main.c utils.c > squashed.c
```

`--once` skips a file if already emitted. Useful for projects that use `#pragma once` instead of header guards, or to avoid redundant inlining across many TUs.

`--list` prints the resolved path of every file that would be inlined, without producing output. Useful for auditing the dependency tree.

```sh
./amalgamate --list main.c utils.c
```

`-x file` excludes a specific file from inlining. The `#include` is replaced with a tombstone comment; the compiler sees nothing. Useful when one header must remain external.

`-o outfile` writes to a file instead of stdout.

`-v` prints the include tree to stderr, indented by depth.

Keep it small.
{: .panel .tip }

[^1]: This article was written with Claude.
