---
layout: post
title: Amalgamate C Sources for Online IDE Compilers
tags: development c tooling
author: Steve SCHNEPP
---

I use [Compiler Explorer](https://godbolt.org/) and [PGE Tinker](https://pgetinker.com/) regularly. Yet both take only a single C or C++ file as input. Most of the projects do not. This tool closes that gap.

## What it does

It walks a C source tree and inlines all `#include "local.h"` directives recursively. System includes (`<stdio.h>`) pass through untouched. The result is one `.c` file you can paste anywhere.

```sh
./amalgamate main.c utils.c > squashed.c
```

Pass every `.c` file that contributes symbols. Order matters: the compiler sees the amalgamated file top to bottom, so definitions must precede use — same as linking, but stricter.

## What works

The typical multi-file C project amalgamates cleanly. Given:

```
main.c        — includes utils.h, math.h
utils.c       — defines add(), and sub() not declared in utils.h
math.c        — defines mul(), and square() not declared in math.h
utils.h       — declares add()
math.h        — declares mul()
types.h       — shared typedefs
```

Running:

```sh
./amalgamate main.c utils.c math.c > squashed.c
```

produces a single file that compiles and runs. Header guards (`#ifndef`) survive intact — `types.h` included by both `utils.h` and `math.h` is inlined twice, but the preprocessor deduplicates it correctly.

Symbols not declared in any header — `sub()`, `square()` above — are present in the output because their `.c` files are passed explicitly. The caller must `extern`-declare them. That is the same constraint as with a normal linker.

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
static i32 utils__helper(void) { return 1; }

/* math.c */
static double math__helper(void) { return 3.14; }
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

## The code

```c
/* amalgamate.c -- inline local #includes into a single translation unit
 * usage: amalgamate file.c [file2.c ...] > squashed.c
 *
 * resolves "..." includes relative to the including file, then cwd.
 * system includes (<...>) are passed through unchanged.
 * include cycles are detected and fatal.
 */

#define _POSIX_C_SOURCE 200809L

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <limits.h>
#include <libgen.h>

#define STACK_MAX 64

static int stack_depth = 0;
static char stack[STACK_MAX][PATH_MAX];

static int in_stack(const char *path)
{
	int i;
	for (i = 0; i < stack_depth; i++) {
		if (strcmp(stack[i], path) == 0)
			return 1;
	}
	return 0;
}

static int file_exists(const char *path)
{
	struct stat st;
	return stat(path, &st) == 0 && S_ISREG(st.st_mode);
}

/* returns pointer into line at the start of the filename, sets *len_out.
 * returns NULL if line is not a local #include. */
static const char *parse_local_include(const char *line, size_t *len_out)
{
	const char *p = line;

	while (*p == ' ' || *p == '\t') p++;
	if (*p != '#') return NULL;
	p++;
	while (*p == ' ' || *p == '\t') p++;
	if (strncmp(p, "include", 7) != 0) return NULL;
	p += 7;
	while (*p == ' ' || *p == '\t') p++;
	if (*p != '"') return NULL;
	p++;

	const char *start = p;
	while (*p && *p != '"') p++;
	if (*p != '"') return NULL;

	*len_out = (size_t)(p - start);
	return start;
}

static void emit_file(const char *path);

static void resolve_and_emit(const char *name, const char *current_dir)
{
	char candidate[PATH_MAX];
	char resolved[PATH_MAX];

	/* prefer include-relative path over cwd */
	snprintf(candidate, sizeof(candidate), "%s/%s", current_dir, name);
	if (file_exists(candidate) && realpath(candidate, resolved)) {
		fprintf(stdout, "/* begin include: %s */\n", name);
		emit_file(resolved);
		fprintf(stdout, "/* end include: %s */\n", name);
		return;
	}

	if (realpath(name, resolved) && file_exists(resolved)) {
		fprintf(stdout, "/* begin include: %s */\n", name);
		emit_file(resolved);
		fprintf(stdout, "/* end include: %s */\n", name);
		return;
	}

	/* not found locally — emit as-is, let the compiler handle it */
	fprintf(stdout, "#include \"%s\"\n", name);
}

static void emit_file(const char *path)
{
	if (stack_depth >= STACK_MAX) {
		fprintf(stderr, "include depth exceeded %d\n", STACK_MAX);
		exit(1);
	}

	if (in_stack(path)) {
		fprintf(stderr, "include cycle detected: %s\n", path);
		int i;
		for (i = 0; i < stack_depth; i++)
			fprintf(stderr, "  %s\n", stack[i]);
		exit(1);
	}

	strncpy(stack[stack_depth], path, PATH_MAX - 1);
	stack[stack_depth][PATH_MAX - 1] = '\0';
	stack_depth++;

	FILE *f = fopen(path, "r");
	if (!f) {
		fprintf(stderr, "cannot open: %s\n", path);
		exit(1);
	}

	/* dirname() may modify its argument on some implementations */
	char path_copy[PATH_MAX];
	strncpy(path_copy, path, PATH_MAX - 1);
	path_copy[PATH_MAX - 1] = '\0';
	char *dir = dirname(path_copy);

	char *line = NULL;
	size_t buf_len = 0;
	ssize_t n;

	while ((n = getline(&line, &buf_len, f)) != -1) {
		size_t inc_len = 0;
		const char *inc = parse_local_include(line, &inc_len);

		if (inc) {
			char name[PATH_MAX];
			size_t copy_len = inc_len < PATH_MAX - 1 ? inc_len : PATH_MAX - 1;
			memcpy(name, inc, copy_len);
			name[copy_len] = '\0';
			resolve_and_emit(name, dir);
		} else {
			fputs(line, stdout);
		}
	}

	free(line);
	fclose(f);
	stack_depth--;
}

int main(int argc, char *argv[])
{
	if (argc < 2) {
		fprintf(stderr, "usage: %s file.c [file2.c ...] > squashed.c\n", argv[0]);
		return 1;
	}

	int i;
	for (i = 1; i < argc; i++) {
		char resolved[PATH_MAX];
		if (!realpath(argv[i], resolved)) {
			fprintf(stderr, "cannot resolve: %s\n", argv[i]);
			return 1;
		}
		if (i > 1)
			fputc('\n', stdout);
		fprintf(stdout, "/* ===== %s ===== */\n", argv[i]);
		emit_file(resolved);
	}

	return 0;
}
```

Build on Linux or MSYS2 UCRT64:

```sh
gcc -std=c99 -Wall -Wextra -o amalgamate amalgamate.c
```

[^1]: This article was written with Claude.
