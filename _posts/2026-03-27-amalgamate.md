---
layout: post
title: Amalgamate C Sources for Online IDE
tags: development c tooling
author: Steve SCHNEPP
---

I use [Compiler Explorer](https://godbolt.org/) and
[PGE Tinker](https://pgetinker.com/) regularly.
Yet both take only a single C or C++ file as input.
Most of the projects do not. This tool closes that gap.

## What it does

It walks a C source tree and inlines all 
`#include "local.h"` directives recursively.
System includes (`<stdio.h>`) pass through untouched.
The result is one `.c` file you can paste anywhere.

```sh
./amalgamate main.c utils.c > squashed.c
```

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

## What it deliberately doesn't do

It doesn't deduplicate headers. If two translation units both include `types.h`, you get two copies in the output. The compiler will complain about redefinition. Good — that surfaces a structural problem instead of hiding it.

Keep it small.
{: .panel .tip 9}

[^1]: The C code was written with Claude.
