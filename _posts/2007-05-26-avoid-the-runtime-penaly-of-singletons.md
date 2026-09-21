---
layout: post
title: "Avoid the runtime penaly of Singletons"
date: 2007-05-26 06:29:21 +0100
tags: java best-practices performance
permalink: /post/2007/05/26/Avoid-the-runtime-penaly-of-Singletons
author: Steve SCHNEPP
excerpt_separator: </p>
---

A common way to do the Singleton pattern involves a `getInstance()` method which does a runtime test like this :

```java
private static Singleton instance;
private static Object mutex;

public static Singleton getInstance() {
	if (null == instance) {
		// First call
		synchronized (mutex) {
			if (null == instance) {
				instance = new Singleton ();
			}
		}
	}
	return instance;
}

private Singleton() {
}
```

This method works well, since it uses the *double-null-check*. You always have to check it while beeing under a synchronized belt, and you check it just before in order to avoid the synchronized cost after its initialisation. So we have a method that still makes a runtime check, and cannot be nicely inlined by the compilator.

If you can afford to :

- not be able to deregister the instance afterwards with a `freeInstance()` method (We'll speak about this later)
- not defering the creation of the instance the first time you need it (also called lazy creation)

you can avoid that extra cost by creating the instance in class loading time with a static block.

The code then becomes :

```java
public static Singleton getInstance() {
	return instance;
}

private Singleton() {
}

private static Singleton instance = new Singleton();
```

The `getInstance()` method can now be inline quite easily and there is no more extra check cost. Note that here the default constructor is empty. If it's not, I suggest to put the static initialisation at the end of the class, in order for the rest of the class to be initialised and to be ready for use in the constructor.

If you want to be able to deregister you have to use the first version, and write a freeInstance() like :

```java
public static void freeInstance() {
	if (null != instance) {
		// First call
		synchronized (mutex) {
			if (null != instance) {
				// Do some closing work here if required like instance.close()
				instance = null;
			}
		}
	}
}
```

And now you just wrote a primitive form of pooling (with only one instance)..But that's another story...
