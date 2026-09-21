---
layout: post
title: "Inheritance of a public method considered harmful"
date: 2007-03-18 19:20:45 +0100
tags: java best-practices
permalink: /post/2007/03/19/Inheritance-of-a-public-method-considered-harmful
author: Steve SCHNEPP
excerpt_separator: </p>
---

I'm always wondering why all textbooks and reference material on the web always describe inheritance with the same kind of example :

```java
class A {
	public execute() {
		// do something...
	}
}
```

```java
class B extends A {
	public execute() {
		// initialize for B
		super.execute();
	}
}
```

```java
class C extends A {
	public execute() {
		// initialize for B
		super.execute();
	}
}
```

One thing struck me : if I want to have some code executed **before** `execute()` in every class, such as preparing the graphic context for example, I have to write a protected method `initializeContext()` on the base class and call it from every derived `execute()` method. This is a good candidate for errors since it's manual and therefore not automatic.

I prefer to go for an [IoC](http://en.wikipedia.org/wiki/Inversion_of_control)-like inheritance scheme, we could call it "Inversion of Inheritance". The code would be something like :

class A {

```java
   protected executePre() {
		// Default implementation
		// does nothing
	}
```

```java
   protected executePost() {
		// Default implementation
		// does nothing
	}
```

```java
   protected executeInternal()     {
		// do something
	}

	public final execute() {
		executePre();
		executeInternal();
		executePost();
	}
}
```

```java
class B extends A {
	protected executeInternal() {
		// initialize for B
	}
}
```

```java
class C extends A {
	protected executeInternal() {
		// initialize for C
	}
}
```

There are 2 problems with this approach :

1. There is a little performance penalty since every calls issues 3 virtual calls.
2. If you want to add another interception function, you have to edit the base class.

But the main purpose is that **you** are in control of the derived classes of your class since the creativity of the reuser is severly hampered. I think of it as the most easy way to enforce the [Liskov substitution principle](http://en.wikipedia.org/wiki/Liskov_substitution_principle).
