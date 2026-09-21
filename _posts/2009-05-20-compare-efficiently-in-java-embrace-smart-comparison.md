---
layout: post
title: "Compare Efficiently in Java : Embrace Smart Comparison"
date: 2009-05-20 05:40:58 +0100
tags: java best-practices performance
permalink: /post/2009/05/Compare-Efficiently-in-Java-%3A-Embrace-Smart-Comparison
author: Steve SCHNEPP
excerpt_separator: </p>
---

Bill the Lizard shows us [a nice trick to avoid this NPE](http://www.billthelizard.com/2008/08/avoid-npe-when-comparing-strings.html) when used with string literals : call the method on the string literal. It's possible because it's also an object, and cannot be `null`.

But, as much as this trick code seems sweet, but it just feels like a red herring on the long run, First it only works for comparing strings and even only when comparing a string with a string literal.

## To Equality ...

It is what he said at the end that is much more interesting :

> The lesson to be learned here is that if you have to resort to "clever" tricks to get something done, with just a little bit of lateral thinking you can probably find a cleaner, simpler way.

Let's take this lesson even further.

I had a Perl & C++ background before coming to the Java world, and I am sometimes puzzled that Java makes things quite unnecessary complicated for the programmer from time to time.

My little suggestion : create a quite simple helper static function :

```java
static boolean isEqual(String a, String b) {
   if (a == b) return true;

   // a & b cannot be null at the same time
   if (a == null || b == null) return false;

   // Now none can be null
   return a.equals(b);
}
```

Now, the NPE is avoided for any kind of string, with any order. We could also have a *smarter* equality comparison function by first converting to a string, and comparing the resulting string instead of comparing the original numbers.

```java
static boolean isEqualSmart(Object a, Object b) {
   if (a == b) return true;

   // a & b cannot be null at the same time
   if (a == null || b == null) return false;

   // Now none can be null
   return a.toString().equals(b.toString());
}
```

With the wonders of Java's function overloading, you can even write specialized functions that convert even more *smartly* their arguments. And then be able to compare a string with a number (even a primitive type).

## ... and Beyond

We began about testing equality, but for comparison such as `<=` or `>`, you have to decode the output of the quite ugly `compareTo()` method. The helper static function trick comes also handy here.

First, we design a complete API that enable alphanumeric, and numeric comparison : the so-called **smart comparison**. The API should take any Object, or even primitive types, and convert it at will to enable hybrid comparison. This will greatly enhance the comparisons abilities of Java.

```java
class OpAlpha {

   // Alphanumeric comparison
   public static boolean lt(Object a, Object b) {
      /* convert to string and compare */
   }
   public static boolean gt(Object a, Object b) {
      /* convert to string and compare */
   }

   // ... rest of the implementation ...
}


class OpNum {

   // numeric comparison
   public static boolean lt(Object a, Object b) {
      /* convert to numeric and compare */
   }

   // ... rest of the implementation ...
}

class Op {
   // smart comparison, depends on the 2nd argument type
   public static boolean lt(Object a, int b) {
      /* convert to int and compare */
   }
   public static boolean lt(Object a, String b) {
      /* convert to string and compare */
   }
   public static boolean lt(Object a, Number b) {
      /* convert to Number and compare */
   }

   // ... rest of the implementation ...
}
```

The usage is like this :

```java
String a = "124";
assertTrue( Op.eq(a, 124) );
assertFalse( Op.lt(a, 1) );
assertTrue( OpAlpha.lt(a, 1) );
```

We can see that all the tedious part of handling the conversions is done under the hood. Choosing the comparison to is just a matter of choosing the right class. A little more work could even be done to take the `Op` classes to implement `Comparator` in a complete OO way in addition of the static helpers.

## Update (01/06/2009)

It seems that [equality in Java is quite hazardous](/post/2009/06/Equality-in-Java-is-a-Hot-Topic-but-a-Hazardous-one), and that you have to be extra careful not to set a comparison-land-mine off by accident.
