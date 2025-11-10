---
layout: post
title: Create SDL2 Debian Packages for mingw-w64
tags: development c
author: Steve SCHNEPP
---

SDL2 is an awesome library for a portable game. Yet
cross-compiling with it for Windows on Linux is tricky.

Debian ships with the `mingw-w64` packages that provide a nice
cross compiler toolchain.

Yet SDL2 and its extensions don't ship ready-made Debian
packages for MinGW-w64.

I therefore created a [script that generates debian packages](https://github.com/steveschnepp/sdl2-mingw-w64-debian/blob/master/build-sdl2-mingw.sh). It downloads the windows version and installs them in the correct directory so that the mingw-w64 toolkit picks it up.

Usage:
```sh
./build-sdl2-mingw.sh "" 2.30.2           # core SDL2
./build-sdl2-mingw.sh image 2.8.2         # SDL_image
./build-sdl2-mingw.sh mixer 2.8.0         # SDL_mixer
./build-sdl2-mingw.sh ttf 2.22.0          # SDL_ttf
./build-sdl2-mingw.sh net 2.2.0           # SDL_net
```

Note that for distribution, the `SDL2.dll` and friends still
need to be manually copied in the application directory.
