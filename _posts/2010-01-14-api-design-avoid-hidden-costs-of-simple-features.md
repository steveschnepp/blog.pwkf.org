---
layout: post
title: "API Design: Avoid hidden costs of simple features"
date: 2010-01-14 13:52:23 +0100
tags: api design performance best-practices
permalink: /post/2010/03/API-Design%3A-Hidden-costs-of-simple-features
author: Steve SCHNEPP
excerpt_separator: </p>
---

**Programmers** are usually like water : they **always use** the **path of least resistance**.

Let's see how to use this fact to predict the usage of an API when you design it.

## Initial API

Consider the very simple DB API that consumes a connected ResultSet and presents a disconnected version of it.

```java
class DisconnectedResultSet{
	public DisconnectedResultSet (ResultSet rs);
	public boolean next();
	public Object getObject(int col_idx);
}
```

It's usage is quite easy :

```java
while (drs.next()) {
	int col_idx = 1;
	drs.getObject(col_idx++); // Do something w/ 1st col
	drs.getObject(col_idx++); // Do something w/ 2st col
	//...
}
```

## Just a *little* evolution...

Since the `DisconnectedResultSet` is *disconnected*, we can imagine that it should implement a `rewind()` method in order to use it several times without running the initial query again. We now have an updated class :

```java
class DisconnectedResultSet{
	public DisconnectedResultSet (ResultSet rs);
	public boolean next();
	public Object getObject(int col_idx);
	public void rewind(); // Be able to rewind it
}
```

And its classical usage :

```java
while (drs.next()) {
	// do stuff...
}
// ...
drs.rewind();
while (drs.next()) {
	// do something else with the same data...
}
// ...
drs.rewind();
while (drs.next()) {
	// do something else with the same data...
}
// ...
```

## A new need comes

A new need comes : see if the `DisconnectedResultSet` is empty or not in order to avoid sending header.

The usual way is to send them once when iterating like :

```java
boolean is_headers_sent = false;
while (drs.next()) {
	if (! is_headers_sent) {
		send_headers();
		is_headers_sent = true;
	}
	// do something else with the same data...
}
```

But since there is a nice `rewind()`method, just waiting to be used, the code might become :

```java
if (drs.next()) {
	send_headers();
}
drs.rewind();
while (drs.next()) {
	// do something else with the same data...
}
```

Now, this code isn't generic anymore to accommodate a connected ResultSet.

So, as John Carmack said :

> The cost of adding a feature isn't just the time it takes to code it. The cost also includes the addition of an obstacle to future expansion.

That's really true when you design **APIs** since their purpose is to **last long** and to **be extended**.

So, **think twice when you propose an extension "just in case"**.

## The *little* evolution, revisited...

To solve this case, don't propose a `rewind()` method, but offer a `duplicate()` one. It offers the same functionality, just in a new object.

The usage will be almost the same as shown below, but since it feels more performance-sensitive, it won't be used as lightly : the `boolean is_headers_sent` pattern has now more chances to be used.

```java
while (drs.next()) {
	// do stuff...
}
// ...
drs = drs.duplicate();
while (drs.next()) {
	// do something else with the same data...
}
// ...
drs = drs.duplicate();
while (drs.next()) {
	// do something else with the same data...
}
// ...
```

It's an other example that [immutable objects are the way to go](/post/2007/12/03/Use-immutable-objects-to-avoid-synchronisation), but for a different reason this time.

Note: Just finished my March 2010 article, even **on time**... I'm still trying to keep at least a one article per month blogging rate. So far so good for 2010, still 9 months to go !
