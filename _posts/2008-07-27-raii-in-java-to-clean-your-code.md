---
layout: post
title: "RAII in Java to clean your code"
date: 2008-07-27 09:26:24 +0100
tags: java best-practices
permalink: /post/2008/07/27/RAII-in-Java-to-clean-your-code
author: Steve SCHNEPP
excerpt_separator: </p>
---

[RAII](http://en.wikipedia.org/wiki/Resource_Acquisition_Is_Initialization) is a very common idiom in C++ and some other languages that don't have an integrated garbage collection management.

Java has GC, therefore this idiom is not as popular. But the main problem of Java is that although the GC system has become quite efficient, it only handles the memory management. For other resources (database connections, sockets or file descriptors for exemple), this system is not really adequate. The release of these resources has always to be explicit, and handling this via the [`finalize()`](http://java.sun.com/javase/6/docs/api/java/lang/Object.html#finalize()) method is [not satisfactory](http://www.javaworld.com/javaworld/jw-06-1998/jw-06-techniques.html).

In short the finalize execute itself when the object is about to be *garbaged*. The main problem is that this garbaging does only take into account the memory limits, not the resources limits (max number of open file descriptors for example). So you can run out of open file descriptors way before running out of free memory.

So, the usual construction is like this :

```java
MyResource res = null;
try {
  res = new MyResource();
  res.setSomething(someValue);
  /* Use the resource */
  res.close();
} catch (Exception e) {
  // release the resource if needed
  if (res != null) { res.close(); }
}
```

But hey, that's many code lines, and in case of a Throwable, you don't release the resource. The concept of releasing the resources with a [`try { } finally { }`](http://java.sun.com/developer/TechTips/2000/tt0124.html#tip1) construct is much better (actually, it's one of the most common usage of `finally`).

The construction becomes :

```java
MyResource res = null;
try {
  res = new MyResource();
  res.setSomething(someValue);
  /* Use the resource */
} finally {
  if (res != null) { res.close(); }
}
```

But here we can see that Java is not quite different from C++ for that matter, so we can just adapt the C++-ism that is [RAII](http://en.wikipedia.org/wiki/Resource_Acquisition_Is_Initialization), and write a much cleaner version that aquire the ressource in the constructor, so most failure conditions can be checked immediatly.

The construction becomes finally :

```java
MyResource res = new MyResource(someValue);
try {
  /* Use the resource */
} finally {
  res.close();
}
```

Since a constructor never returns a null value, there is no need to test. And if the constructor throws an exceptions, the general contract is that [the object does not exists](http://herbsutter.wordpress.com/2008/07/25/constructor-exceptions-in-c-c-and-java/). Therefore no resource has been allocated since it would be impossible for the caller to release it (remember, no object was created). So there is no need to release it.

The setter is also integrated in the constructor, since the whole RAII concept is that the constructor returns a completely initialized object. It also enables to write cleaner code since when calling the close() there is no need to do some `if()` to know the object initialisation-state.
