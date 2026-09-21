---
layout: post
title: "Bringing C++ Const to Java"
date: 2009-04-27 16:10:09 +0100
tags: java best-practices
permalink: /post/2009/05/Bringing-C-Const-to-Java
author: Steve SCHNEPP
excerpt_separator: </p>
---

In Java, the commonly accepted way is to use the `final` keyword. But it has a major drawback : the object cannot be *redefined*, but can be *modified* by calling mutable members. You have to convert it to an immutable type. This is a simple task, but radically different ways exists.

## Achieve Immutable in Java

We'll see some differents methods with a common example. Let's start with a very simple `Point` class :

```java
public class Point {
	private int x;
	private int y;
	void setX(int i) { this.x = i; }
	void setY(int i) { this.y = i; }
	int getX() { return this.x; }
	int getY() { return this.y; }
}
```

### The *Java Collection way*

It is the easiest way. It is designed to be a drop-in, like in the Java Collection API. You just create a read-only class that derives your read-write class just like the `PointReadOnly` that mimics the r/o List. It overrides all the methods either to delegate or to forbid calling by throwing a run-time exception.

```java
public class PointReadOnly extends Point {
	private final Point inner;
	public PointReadOnly(Point p) { this.inner = p };

	void setX(int i) {
		throw new UnsupportedOperationException("PointReadOnly is read-only");
	}
	void setY(int i) {
		throw new UnsupportedOperationException("PointReadOnly is read-only");
	}

	int getX() { return inner.getX(); }
	int getY() { return inner.getY(); }
}
```

#### Advantages

You can use it **right-now** : Your code can slowly evolve to progressively generate and integrate this new object without really knowing it's here. The misuses, that are changing the object, will be catched in the testing phase when exceptions are being thrown. The use of a good logging system in the setters is a nice addition.

#### Disadvantages

Any pedantic compiler should warn you that the setter parameter isn't read. I tried to be quite clever and find ways to ignore it. Just rewrite it as :

```java
	void setX(int i) {
		if (i == 0) { /* Do nothing but keep the compiler happy */ }
		throw new UnsupportedOperationException("PointReadOnly is read-only");
	}
```

The performance penalty is minimal since any compiler should optimize the if-case away and even if not, **this function should not be called anyway**.

But [as a user on StackOverflow pointed](http://stackoverflow.com/questions/786740/how-to-avoid-the-unused-param-warning-when-overriding-a-method-in-java-1-4/786794#786794), that warning *definitively* indicates a code smell : **this hierarchy blatantly violates Liskov's principle of substitution** since a class receiving an instance of a `Point` expects `setX()` to work, and may not handle this exception correctly. Obviously a read-writeable class is readable, but a readable class is not necessarly a read-writeable class. This may introduce subtle bugs that would only be catched at runtime, and therefore testing, as simple as it may be, has to be quite thorough in order not to be bitten at a inconvenient time.

A good solution that respects Liskov's principle is to redesign the hierarchy, we'll talk about it just later. But right now, don't despair, you can have almost the best of the both world : simple, yet *almost* respecting Liskov's principle.

#### Circus time : ride two horses at once

Actually what violates Liskov's principle is that the setters don't do the job they are entitled to do. Throwing an exception is a sure way to **ensure** that the object won't be modified, but that is usually overkill[^1]. If you just log the erroneous call, but still do what it should do, you have the warnings, but not the nasty consequences. Just take care to log the callstack also, in order to be able to fix it much more easily.

The new method becomes then :

```java
void setX(int i) {
	Log.warn(new UnsupportedOperationException("PointReadOnly is read-only"));
	return inner.setX(i);
}
```

A notable side effect is that your class isn't really read-only anymore though, just complain-only.

### The *Object-Oriented way*

A much better solution is to create a read-only super class that the read-write one would inherit. The read-only class only implements getters (or any non-changing method). The read-write complement them with the setters.

It would lead to code like :

```java
public class PointReadOnly {
	private final Point inner;
	public PointReadOnly(Point p) { this.inner = p };

	int getX() { return inner.getX(); }
	int getY() { return inner.getY(); }
}

public class Point extends PointReadOnly {
	private int x;
	private int y;
	void setX(int i) { this.x = i; }
	void setY(int i) { this.y = i; }
	int getX() { return this.x; }
	int getY() { return this.y; }
}
```

#### Advantages

Now **Liskov's principle is not violated anymore** and code that expects a read-only class can seamlessly have a r/o or a r/w class.

The changing will also spread naturally all throughout the codebase, just like the C++ `const` modifier and failures to comply would be caught at **compile time** and not at runtime.

The r/o is a nice wrapper for the read-only class, and a r/w can even be used in place of the r/o place.

#### Disadvantages

It doesn't *feel* right :The r/o class is just a placeholder for a r/w class.

#### Comments

An interface-base inheritance scheme can even be better. `Point` as the r/o interface, `PointMutable` as the r/w and `PointBase` as the base implentation class. This way you can avoid the wrapper class. You also get the C++ `const_cast<>()` for free (by just downcasting as `PointMutable`).

```java
interface Point {
	int getX();
	int getY();
}
interface PointMutable extends Point {
	void setX(int i);
	void setY(int i);
}
class PointBase implements Point {
	private int x;
	private int y;
	void setX(int i) { this.x = i; }
	void setY(int i) { this.y = i; }
	int getX() { return this.x; }
	int getY() { return this.y; }
}
```

I realize this does not answer your question about getting rid of the warnings. But warnings can either be suppressed, ignored, or addressed. An unused parameter is often a bad smell that indicates your method might not be doing what it's expected to do. Methods should only get essential parameters. If the parameter is not used, the parameter is not essential, and therefore something needs to be changed.

### The *`String` way*

Another way is just to avoid the read-only and mutable API all together and go the functional way. Since it's a completely different paradigm, it doesn't exactly fits the bill here but it's a quite important way of [cutting the gordian knot](http://en.wikipedia.org/wiki/Gordian_Knot). Its concepts are rooted in both functional programming and RAII. It is quite practical only if you have an efficient garbage collection system, since it has the tendency to create lots of temporary objets that are mostly created, used and forgot.

Do do thing, you have to redesign the whole class, in order to be able to defined it only once, and when you call a modifying method, you end up with an other object, also immutable. The `String`, `Integer` and `Class` class make extensive usage of this.

So, our class will become :

```java
class final Point {
	private final int x;
	private final int y;
	Point(int x, int y) { this.x = x; this.y = y; }
	int getX() { return this.x; }
	int getY() { return this.y; }

	void setX(int i) { return new Point(i, this.y); }
	void setY(int i) { return new Point(this.x, i); }
}
```

As you can see, every object is not modifiable, if a method recieves the object as an argument, it cannot modify it, since it would have a new object. The properties are final, and the class has usually to be made final in order not to be able to mutate the class by inheritance.

This enables programming without side-effect and therefore is quite interesting for multi-thread programming.

## Conclusion & thoughts

The `UnsupportedOperationException` is a very practical idiom, that even the Java Collection API is based on it. It may not be very nice in theory, but in practice it has its usages. It should not be abused thought, and the *OO*-way should be prefered when possible, usually when you are in control of all the code base.

The logging approch doesn't really solve the problem since it's only advisory, but can fit the bill when the code base is huge and you want to be able to understand what is going wrong.

The *OO*-way is a nice compromise between the abstract beauty of the String-way and the quite hugly kludge of the *Collection*-way, especially when used with the interfaces scheme : it spreads out as the `const` param, and force the coder to think if a modifying is really needed.

The *String*-way is very tempting, as a true create-and-forget way. If you could even enforce to only have one instance of each representation you'll have a free `==` (almost) overloaded operator[^2].

So we have at least 3 ways to learn and adapt idioms from C++ in Java. The major issue is that it's not as itegrated as `const` : every object needs custom code except maybe the *String*-way.

[^1]: It all depends on the indent, specific policies on specific usages.
[^2]: Just be aware of classloader issue with `static`. Hmmm that will be covered in another article.
