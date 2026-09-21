---
layout: post
title: "Databases: Efficient Case-insensitive searches with Function-based Indexing"
date: 2009-08-12 15:28:49 +0100
tags: sql database performance
permalink: /post/2009/09/Databases%3A-Efficient-Case-insensitive-searches-with-Function-based-Indexing
author: Steve SCHNEPP
excerpt_separator: </p>
---

Case-insensitive search is sometimes very useful, but a naive approach can be very harmful to your performance.

## Special case of case-insensitive search

In Oracle10g, you might use the new case-insensitive search with a [`NLS_SORT=BINARY_CI`](http://www.dba-oracle.com/t_oracle10g_release_2_case_insensitive_searches.htm) command.

### Pro

- Designed for this purpose, so it's very straightforward to use

### Con

- Limited to case-insensitive searching by design

## Native functional indexes

Some databases provides native functional indexes.

On these databases optimization is done simply by creating an index on `UPPER(MY_COLUMN)` and letting the query optimizer transparently[^1] use the newly created index.

It usually work by applies a function to the data just before handing it to the index, so the function output doesn't exist in the database.

[^1]: You might have to update some kind of statistics for the new index

### Pro

- **Very** easy to use : it just feels right (you can naïvely create an index on the WHERE clause)
- Doesn't take any extra space in the database (only the index).
- Generic, can be used for something else than just case-insensitive searches.

### Con

- Since the data isn't stored in the database, a call to the function has to be made when
- Functions have to be from the immutable category in the [function volatility categories](http://www.postgresql.org/docs/8.3/static/xfunc-volatility.html)

## Generated columns

DB2 provides something called [generated columns](http://publib.boulder.ibm.com/infocenter/db2luw/v8/topic/com.ibm.db2.udb.doc/ad/c0007004.htm). It's almost the same than the native indexes, except that the functional column is explicit.

### Pro

- Quite easy to use, since the column is updated and used transparently.
- Generic, can be used for something else than just case-insensitive searches. Just make sure the optimizer uses the extra column. You might have to rewrite the request a little.

### Con

- Requires extra space in the table.
- Removing a column can be cumbersome (in DB2 you have to recreate the whole table for example), whereas removing a simple index is much easier.
- The extra column is returned when doing a `SELECT * FROM ...`[^2].

[^2]: But you don't do that anyway, do you ?

## Trigger-based *Generated columns* Emulation

If nothing else is provided, you always have the option to emulate. The solution will be trigger-based since it's one of the few perfect match for them.

So, the base idea is derived from the *Generated columns* : have a special extra column that represents the output of the function. An index will be created on this column and used via a *manual* update of the involved requests (Adding an extra `WHERE` clause should be more than enough, this way you might even benefit from a partial match).

### Pro

- Universal. Useful if portability is paramount.
- Very simple : there is no need to understand advanced database features.

### Con

- Only a poor man's solution : everything is manual
- The same than *Generated columns* since it's the same idea, just manually implemented.
