---
layout: post
title: Serverless MCU Lambdas - A Working Emulator - Part 1
tags: electronics risc-v
author: Steve SCHNEPP
---

A follow-up of my [Serverless MCU Lambdas]({% post_url
2023-07-16-lambda-mcu %}) idea. It is comprised of 3 phases :
* HTTP/CGI
* Generic RV32I emulation
* Specific RV32I emulation (curl, I/O, memory functions, ...)

## Generic RV32I emulation

There's actually many RV32I emulators out there, but they are quite complex
usually, and focused on *interactive* execution.

The 2 promising ones are :
* [mini-rv32ima](https://github.com/cnlohr/mini-rv32ima) from the awesome
  [Charles Lohr](http://youtube.com/cnlohr)
* [Rv32iEmulator](https://github.com/zyu-c/Rv32iEmulator) from
  [ずし](https://twitter.com/zc_ozz)

### mini-rv32ima

I started with **mini-rv32ima** at first, as it is a *tiny C header-only risc-v
emulator* therefore looked like a good fit.  It is actually rather well
written, but after a while, I discovered that it is really geared to running
Linux NOMMU.  Which means that it has some quirks, notably not emulating a MCU,
but a full featured CPU with periphericals.  The amount of work that went into
it is rather amazing as it delivers on its promised.*

### Rv32iEmulator

I found out **Rv32iEmulator** while struggling to implement a R/O ROM for
**mini-rv32ima**. The code is written in a very naive way. Almost taking the
reference ISA and coding straight from it. Without much optimization. It is
also coded in a simpler form as **mini-rv32ima**, since it uses functions much
more than preprocessor macros. This does fully leverage modern compilers, in
the same vein as [my RTS project]({% post_url 2023-05-21-rts-gamedev-series
%}#tech-stack)

The code itself had several critical bugs, such as not emulating correctly load
& stores from less than 32 bits integer sizes.  This prompted me to convert the
codebase to my famous [1SLOC]({% post_url
2022-09-18-always-optimize-for-dummies %}#sloc) paradigm, and it showed several
other bugs. Mostly in shifting & bitmasks that were not done in the correct
order.

The end result is available on [my github
fork](https://github.com/steveschnepp/Rv32iEmulator).

## Interactions with CGI

To interact with CGI, the caller creates 3 temporary files in the filesystem,
along with the binary file that represents the ROM.

### Files

Calling the emulator is very easy with a simple `rv32i rom.bin ram in out`.

| file name | max size | Offset       | ACL |
|-----------|:--------:|--------------|:---:|
| `rom.bin` | 1MiB     | `0x00000000` | R/O |
| `ram`     | 1MiB     | `0x01000000` | R/W |
| `in`      | 1MiB     | `0x08000000` | R/O |
| `out`     | 1MiB     | `0x08100000` | R/W |

The offset is set in the interpreter. Those are MMAP-ed directly into the process
address space with the corresponding access protection. This means that the ROM
area cannot be written to, nor the IN area.

### File format

The `rom.bin` is a very simple binary format[^1]. It has no headers. It is the
output of `objcopy -O binary`.

[^1]: [Intel HEX](https://en.wikipedia.org/wiki/Intel_HEX),
      [Motorola S-record](https://en.wikipedia.org/wiki/SREC_(file_format)) or
      even the [ELF](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format)
      format might be supported in the future, but for now __simplicity__ is key.

The `ram` file is intended to be an __opaque__ statefile. __It shall not be
parsed or generated outside of the emulator__, but can be examined for
debugging purposes.  No compatibility garanties are provided. It is always safe
to zero-fill it in doubt.  It does serve as a *state* between calls. Subsequent
calls have to be implemented as if the `RST` pin was lowered on a real MCU.
This will lead to some tricks later as we see, mostly about handling static
vars initial values.

The `in` file is simple. It can contain a little endian `uint32_t` as header to
indicate the size of the file.  The header is only useful if you want to
leverage the standard tooling on the area.  You can simply ignore it or use
another header. Any buffer overrun is safe, as there's an unmmaped zone just
behind it.  Therefore the <u>only</u> harmful effect is a `SIGSEGV` that will
brutally kill the emulator process.

The `out` file is also simple. It starts also with a little endian `uint32_t`
as header to indicate the size of the file.  Again buffer overrun is safe, but
setting this header to a lower value will risk data truncation.

A simple way to have a peek into memory mapping of the emulator is to leverage
`xxd -a -o` such as

    xxd -a -o 0x00000000 rom.bin
    xxd -a -o 0x01000000 ram
    xxd -a -o 0x08000000 in
    xxd -a -o 0x08100000 out

It will show the offset correct addresses, along with compressing any
zero-filled area.

## Builtool

A very simple toolchain is provided to create a ROM that will run on bare metal
It is based on `gcc-riscv64-unknown-elf` & `picolibc-riscv64-unknown-elf`.
