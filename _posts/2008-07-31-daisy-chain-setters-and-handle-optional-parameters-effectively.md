---
layout: post
title: "Daisy Chain Setters and Handle Optional Parameters Effectively"
date: 2008-07-31 18:23:48 +0100
tags: java best-practices
permalink: /post/2008/08/03/Daisy-Chain-Setters-and-Handle-Optional-Parameters-Effectively
author: Steve SCHNEPP
excerpt_separator: </p>
---

#### The *Pure RAII* way

You use many different constructor signatures. It's quite suboptimal if you have many parameters that have nothing in common except their type : you have to use the infamous ***null***, or have a special value that conveys a *not specified* meaning.

Code usage is something like this :

```java
MyFile fileRead = new MyFile("in.txt", Flags.Read);
MyFile fileTemp = new MyFile("tmp.txt",
    Flags.Write, Boolean.TRUE, Boolean.FALSE);
MyFile fileWrite = new MyFile("out.txt",
    Flags.Write, null, Flags.Boolean.FALSE);
```

#### The *JavaBean* way

The JavaBean standard militates for a simple constructor : the default one. The client uses then setters to initialize the object. This isn't RAII anymore, but is a very common idiom in Java. But in my opinion the code produced (like the one below) is quite cluttered.

It produces code like this :

```java
MyFile file = new MyFile();
file.setFileName(fileName);
file.setOpenFlags(openFlags);
file.setShouldLock(shouldLock);
file.setIsSync(isSync);
file.setMaxFileSize(maxFileSize);
file.setReadAheadSize(readAheadSize);
```

#### The *StringBuffer* way

With the same trick as the `StringBuffer.append()`, it is possible to chain all the setters just like this :

```java
MyFile file = new MyFile()
    .setFileName(fileName)
    .setOpenFlags(openFlags)
    .setShouldLock(shouldLock)
    .setIsSync(isSync)
    .setMaxFileSize(maxFileSize)
    .setReadAheadSize(readAheadSize)
  ;
```

In my opinion this is more typo-proof, since you don't need to repeat the variable name each time. It may also been seen as easier to read since the whole initializing part is done in one block.

The main design point with this construct is that the setters must honor **exactly the same contract** than the constructor does :

- They **cannot** return null (otherwise chaining them will throw an uninformative [NPE](http://java.sun.com/javase/6/docs/api/java/lang/NullPointerException.html)). Only exceptions are allowed to signal a failure while setting the value.
- In case they throw an exception, they have to cleanup any non-memory resource, since the caller has no reference on the object anymore.

These rules are quite natural if you think of the setters as a extension to the constructor. The object is still responsible for the resources it manages, although the resources itself can change when calling setters (by setting a different filename for example).

#### The *Immutable* way

Since every setter returns a MyFile, you can use an [immutable](http://en.wikipedia.org/wiki/Immutable_object) design. It has many benefits, specifically [when multi threading](http://blog.pwkf.org/post/2007/12/03/Use-immutable-objects-to-avoid-synchronisation). The concept is quite easy, and inspired from the String object. Each constructor creates a brand new object that copies every properties from the parent except the one that is changing. The downside is it might create many unnecessary objects but it is a good concept for factories that are seldom created, but used many times.

Factories, can then create object that have already all their properties set with the factory default. It can then reuse pooled objets that have the same properties.

An example for a factory can be :

```java
private final static MyFileFactory fileFactory =
    new MyFileFactory().setIsSync(true);
...
    MyFile file =fileFactory.create("filename.txt");
```

The `MyFileFactory.create()` must honor the same contract than the MyFile constructor for the same reasons than the setters do.
