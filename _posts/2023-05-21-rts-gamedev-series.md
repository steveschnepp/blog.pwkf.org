---
layout: post
title: Starting a GameDev Series
tags: gamedev learning opengl c development
author: Steve SCHNEPP
---

I tried [Ground Control](
https://en.wikipedia.org/wiki/Ground_Control_(video_game)) some time
ago with my sons, it was working very nicely on Windows but was horribly slow on
Linux with Wine. Visuals were flawless, just **very** slow.  I started to
investigate the Wine codebase to fix it. Little did I know what I embarked on.

## Mission log in practice

I'm leading by example and therefore [writing a mission log]({{ site.baseurl
}}{% post_url 2023-02-15-mission-logs %}) on my recent trip in graphics
programming.

## Wine as the starting point

### The Bug

Long story short, Ground Control (GC) uses a suboptimal way to draw its 3D
objects.  It uses one `DrawPrimitive()` call per polygon. It also leverages the
`D3DPT_TRIANGLEFAN` option, which makes it easy to draw any polygon.

The usual way is to use `D3DPT_TRIANGLESTRIP` or at least `D3DPT_TRIANGLELIST`.
{: .panel .tip}

Unsurprisingly, it is written in the documentation of of Direct3D, hinting
that batches of 100 triangles is optimal. More surprisingly, performance in
Windows is actually pretty decent even without batching.

Using
[`D3DPT_TRIANGLEFAN`](https://learn.microsoft.com/en-us/windows/win32/direct3d9/triangle-fans)
makes it impossible to batch per design. Which is why it was even *removed* in
more recent version of Direct3D[^1].

[^1]: It is deprecated in d3d9 and removed in d3d10.

Yet in Wine, as each Direct3D call has some overhead, the [slowdown is pretty
horrible](https://bugs.winehq.org/show_bug.cgi?id=33814), specially for
rendering the map, which is actually an endless loops of calls of triangles.

### Patching

I simply patched [a simple
buffering](https://gitlab.winehq.org/wine/wine/-/merge_requests/2105/) of those
calls. The result was that performance was even better than in Windows.

Problem solved some would say. Nonetheless I wasn't satisfied as I wanted to
understanding *why* there is so much overhead in Wine.

So I started to write a simple Direct3D application to have the simplest code that
exhibits that performance issue, in order to profile it. I was very curious as
what exactly the overhead was, and if solving it would be beneficial for other
scenarios.

I suspected a synchronous wait somewhere in the call chain, finding
which could lead to even more performance increase, and not only for that
particular use case.
{: .panel .info}

I didn't know at first that writing that simple application would prove itfself
much more complicated than anticipated. Yet it was a incredible learning experience.

## Learning 3D

I didn't know anything about 3D programming before, so I spend some time
reading online tutorials.  I discovered that GFX programming evolved from
"function calls" to "shaders".

In a nutshell, it is the same as using plain SQL with pre-written helpers to
write its own stored procedures.

As i am learning, and I usually go with history as it is much easier for me to
understand gradually, I limited myself to the "fixed pipeline". Which is also
what GC used at the time.

### Direct3D or OpenGL ?

At first I tried to write some D3D. It became soon apparent that the lack of a
working environment to develop makes everything harder to learn.

Indeed, Microsoft evolved from d3d7 to d3d11 and d3d12 that dont have fixed
pipelines anymore.  Very much like OpenGL 3.1+ hasn't support of it either.

Yet, while old D3D stuff mostly disappeared from the internet, old OpenGL one
is still very easy to find. 

Therefore after some initial struggle with d3d, I settled with OpenGL as my
learning journey.

## Departing from my initial goal

Now, with the journey destination revisited, I decided that rewriting a simple
RTS game could be much more interesting than a synthetic testing application.

Simple, because I don't have much skills in art, and I don't want to spend all
my time on eye candy. And it should still eventually serve as a benchmark for
Wine if I port it to Direct3D.

### Choosing the tech stack & the overall design {#tech-stack}

The language is C. No particular version, but it should be very easy to
understand for beginners. Therefore avoiding new syntax, but still using
obvious ones, such as C99 style comments. About "why not C++ ?", it has lots of
niceties, but is somehow overwhelming to enter a new C++ codebase. And I'm much
more fluent in C than C++, so let's not mix all the learning curves at once.

The codebase from Wine is very well written, which will serve as my reference
for codestyle.

Also, modern compilers have gone a long way in optimizations, so that pointer
juggling is not always needed. Even using a functional style and passing
structs around by parameters & return value results in many cases in the same
code than passing a pointer to a mutable structure.

So, the code will be always naive at first, and then optimized once it makes
sense.
{: .panel .info}

Also, some modding should be possible, but not via the usual lua extensibilty,
but via the quake2 native DLL model. Some SDK should be provided so that
building a mod without rebuilding the whole source code is possible. Very much
like how one can build Linux Modules out of the source tree.

And finally, only OpenGL 1.2 features will be leveraged, as it is much simpler
to understand, and port to other platforms later.

Using those limits narrow the scope nicely in order for the journey to have a
chance to be successful.
{: .panel .tip}
