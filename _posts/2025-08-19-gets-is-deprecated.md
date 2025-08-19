---
layout: post
title: Workaround for deprecated gets()
tags: development c
author: Steve SCHNEPP
---

`gets()` is used a lot in ancien learning material for C. That said, it is unsafe and therefore removed in recent C versions.
A simple `#define` can bring it back rather securely.

This is the line you need to add to your C files.

```c
#define gets(x) fgets(x, sizeof(x), stdin)
```

Don't add it in a header file, only in each C file.
{: .panel .warning }

The `sizeof` will only be correct in the case of statically defined buffers.

If it is a dynamic buffer, it is still secure, but incorrect. With a simple pointer, the `sizeof` will only be the of the size of a single element.
