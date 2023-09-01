---
layout: post
title: "Compile-Time Polymorphism for Cross-platform Development"
date: 2009-12-11 11:52:33 +0100
tags: c development
permalink: /post/2009/12/Avoid-the-Preprocessor-Use-Compile-Time-Polymorphism-for-Cross-platform-Development
author: Steve SCHNEPP
---

When doing cross-platform development, the common usage is preprocessor
`#ifdef` macros to compile specific parts. This quickly makes the code
unreadable.

## The usual abstraction : the preprocessor

We'll take a very simple file I/O subsystem here as an example (`open`,
`close`). We'll also only take Linux and Windows, since that's usually the 2
most common platforms people want to develop for[^1].

[^1]: Actually when targeting Linux, you usually target all Unix-like systems
      since they already have POSIX as a common abstraction.

As an examples, we have the following files[^2]:

[^2]: The code is not real, it has been sweetened.

```c
fileiosys_filedesc open(char* filename) {
#ifdefine __WIN32__
    return OpenFile(
        filename,
        GENERIC_READ | GENERIC_WRITE,
        FILE_SHARE_READ | FILE_SHARE_WRITE,
        NULL,
    );
#else // UNIX
    return open(filename, O_READ | O_WRITE, 0666);
#endif
}

int close (fileiosys_filedesc fd) {
#ifdefine __WIN32__
    return CloseHandle(fd) ? 0 : -1;
#else // UNIX
    return close(fd);
#endif
}
```

fileiosys.cpp
{: .legend }

```c
// Define a custom file descriptor
#ifdefine __WIN32__
    #define fileiosys_filedesc HANDLE
#else // UNIX
    #define fileiosys_filedesc int
#endif

fileiosys_filedesc open(char* filename);
int close(fileiosys_filedesc fd);
```

fileiosys.h
{: .legend }

In the previous little example, the code isn't really easy to read.  You have
to always think which environnement you are in. All the specifics are
multiplexed in the same file. Therefore the programmer has to demultiplex those
in real time each time and every time he reads the code.

The last part of the interface file is quite simple to read since it's already
abstracted away. Now let's completely demultiplex the implementation in several
implementation files.

## Compile-time polymorphism

### The header file __is__ the common interface

The interface is the most important part of the design. Being that interface is
the original purpose of the header file.
{: .panel .tip }

Its design is hard :
* high-level enough to mask the differences between the plateforms
you want to support
* low-level enough to avoid duplicating to much code.

So, for our example I/O subsystem, we'll just abstract the usual syscalls `open`,
`close` in the same way as before.

The parameters that are passed through the interface are also very important.
{: .panel .note }

You cannot leak a platform-specific structure. So here all the file
descriptors are just an opaque handle, represented by a pointer to a structure
defined only as a forward declaration in the header. This pattern, sometimes
called the [pimpl idiom](http://en.wikipedia.org/wiki/Opaque_pointer), enables
use to really share the representation while implementing it differently.

The header file is unchanged : `fileiosys.h`. Whereas the implementations are in
the files `linux/fileiosys.cpp` and `win32/fileiosys.cpp`.

```c
// Define the forward declaration
struct fis_filedesc;
fis_filedesc* open(char* filename);
int close(struct fis_filedesc* fd);
```
fileiosys.h
{: .legend }

```c
struct fis_filedesc {
    HANDLE handle;
};

fis_filedesc* open(char* filename) {
    fis_filedesc* fd = new fis_filedesc();
    fd-&gt;handle = OpenFile(
        filename,
        GENERIC_READ | GENERIC_WRITE,
        FILE_SHARE_READ | FILE_SHARE_WRITE,
        NULL,
    );

    return fd;
}

int close (struct fis_filedesc* fd) {
    int retval = CloseHandle(fd-&gt;handle) ? 0 : -1;
    delete(fd);
    return retval;
}
```
win32/fileiosys.cpp
{: .legend }

```c
struct fis_filedesc {
    int file_descriptor;
};

static fis_filedesc[32];

fis_filedesc* open(char* filename) {
    fis_filedesc* fd = new fis_filedesc();
    fd-&gt;file_descriptor = open(filename, O_READ | O_WRITE, 0666);
    return fd;
}

int close (struct fis_filedesc* fd) {
    int retval = close(fd);
    delete(fd);
    return retval;
}
```
linux/fileiosys.cpp
{: .legend }


#### The build system : `Makefile`

The makefile should take into account the different platforms, and only
compile the needed implementation file. All the gluing magic will then be done
at linking time instead of preprocessor time.

## Conclusion

The interest of have multiple implementation files is obvious. It is
__much__ more straightforward to read and only marginally harder
to write. But since most of the time code is read and not written, the choose
is quite a no-brainer.

The nicest part is that all this is possible even without the expensive
run-time polymorphism and RTTI, since the choose is done at compile-time.
