---
layout: post
title: "Databases: Better Defer Constraints than Avoid Them"
date: 2009-07-03 09:28:26 +0100
tags: sql database best-practices
permalink: /post/2009/07/Databases%3A-Better-Defer-Constraints-than-Avoid-Them
author: Steve SCHNEPP
excerpt_separator: </p>
---

Constraints are a very important tool in a programmer's belt. But they come with a price, which can usually be mitigated simply.

## *ACID*ity of transactions as rescue...

Let's examine what all of the `A`, the `C`, the `I` and the `D` have for implications on our current subject.

### Transactions are **atomic** (A)

The database should not really care about validating the constraints all the time Only the beginning and end state is really important. **Inside a transaction, the data may be inconsistent** : "Dust hasn't yet settled".

Let's study an example. You have an unique index on an ordering.

```sql
TABLE ITEMS (
	ITEM_ID SERIAL,
	GROUP_ID INTEGER,
	ORDER INTEGER,
	LABEL VARCHAR
)

ADD UNIQUE INDEX ON ITEMS(GROUP_ID, ORDER)
```

Here, if you want to swap 2 items, you have to use an unused temporary value, otherwise the check won't be valid **at all times**.

### Transactions are **consistent** (C)

The check **needs** to be done at least when the transaction ends. No special need here except that you **need** to re-enable before ending the transaction.

### Transactions are **isolated** (I)

We can also easily imagine that the check only **needs** to be done when the transaction ends, just before the commit. Normally no one should be able to see the changing data meanwhile it's not completed.

One **very important** thing to know is that if you are using a **READ UNCOMMITTED isolation** for other transactions **you will see inconsistent data**.

Anyway, if you are doing that, you know what you are doing and are obviously taking special care about it, don't you ?

### Transactions are **durable** (D)

This final property has nothing to do with our current issue. Good.

## ... But sometimes early warning is quite nice

When interacting with external systems, that don't participate in our transaction, extra care should be taken in order to cope with the exceptional case of a constraint failure. Distributed transactions is a very complex subject, and usually it's not ~~supported~~ done[^1].

[^1]: Do you always implement a double-phase commit on every SOAP/REST/XML-HTTP/POST interface that you expose ?

## Conclusion

With the principle of *least surprise* in mind, we can easily understand why `deferred` is not the default behavior, but it makes a very nice addition to our toolbox.

So now there isn't any good reason anymore not to use (and abuse) constraints in your databases.

Remember, **your data is you most precious asset**, protect it at all cost from evil misbehaved bug-ridden software[^2] !

[^2]: Yeah, I have chosen my side in the coming war...

Wow... Just in time before the end of the month... I would have failed [my motto on URLs](/post/2009/04/Should-The-URL-Include-a-Date-or-Not) ;-)
