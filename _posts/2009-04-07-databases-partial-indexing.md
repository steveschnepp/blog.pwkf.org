---
layout: post
title: "Databases: Partial Indexing"
date: 2009-04-07 07:09:38 +0100
tags: sql database
permalink: /post/2009/04/Databases%3A-Partial-Indexing
author: Steve SCHNEPP
excerpt_separator: </p>
---

Let's take the table that contains orders that we created in [my previous post](/post/2009/03/Databases%3A-Meta-Data-ctime-mtime) to show you some examples.

Orders have usually a state, Let's create it[^1] :

```sql
ALTER TABLE ORDERS ADD COLUMN STATE
```

Now usually a application makes use of the state of the order by querying it, even quite often. The main problem is that this query will do a full scannof the table unless the state field is indexed. Here comes the other issue : indexes take very much space since they have to be ordered and cannot be trimmed (except throw an expensive DROP/CREATE or REINDEX).

The space used is adequate if the index has many different values, but usually a state has only a finite set of values, and usually some are very transient and other quite long. Compare for example the state CANCELLED or SHIPPED that are mostly final to the very transient state INVOICE_TO_BE_PRINTED.

The number of orders that are in the state INVOICE_TO_BE_PRINTED are quite a few (especially compared to the final states). However these temporary states are the mostly queried (usually by batches, pollers or even web pages that present the workload to the users for *manual polling*).

Another overlooked usage is to have an *ALMOST*-UNIQUE index. I mean an unique index, but only on selected entries. In our ORDERS table, we can add a field that represent the PRINTING_PID of the process that is responsible for printing the invoice. It is only unique for the orders that are in the INVOICE_TO_BE_PRINTED state. A normal index isn't much of a help here since either you have to clear it afterwards, but you loose information, or you cannot enforce any uniqueness.

So there comes the PARTIAL INDEX. It is native in some databases[^2] but in most it isn't. Triggers comes then to the rescue. Some are not really fond of triggers since many things can happen undercover, but my moto is to use trigger in order to, and only to, maintain business-agnostic extra datas (usually to cope automatically with denormalization). Triggers shall not **change** the data, merely copy and/or move it around.

The new *almost-unique* column is also created :

```sql
ALTER TABLE ORDERS ADD COLUMN PRINTING_ID
```

## Implementations

### Reducing the index size and the overhead

So, a new table is created to contain the partial index :

```sql
TABLE PI_ORDERS_STATE (
   INT ORDERS_ID FOREIGN KEY ON ORDERS(ORDERS_ID),
   STATE,
   INDEX ON (STATE)
)
```

And the insertion/deletion for the table is done via triggers. I do it a little rapidly since the real creation is a little more tedious than the pseudo-code here :

```sql
CREATE TRIGGER ON ORDERS WHERE INSERT, UPDATE
  WHEN o.STATE not in (PENDING, CANCELLED, SHIPPED)
    INSERT INTO PI_ORDERS_STATE(o.ORDERS_ID, o.STATE) IF ORDERS_ID NOT PRESENT
  ELSE
    DELETE FROM PI_ORDERS_STATE
      WHERE ORDERS_ID = o.ORDERS_ID
```

One should rewrite queries to take advantage of this partial index since when it's integrated in the database the optimizer just does it himself. A query like this

Old :

```sql
SELECT * FROM ORDERS WHERE ORDERS.STATE = INVOICE_TO_BE_PRINTED
```

New :

```sql
SELECT o.* FROM ORDERS o
INNER JOIN PI_ORDERS_STATE p ON p.ORDERS_ID = o.ORDERS_ID p.STATE = INVOICE_TO_BE_PRINTED
```

The query optimizer should now be able to use the small index in PI_ORDERS_STATE, and retrieve only the relevant orders via their primary key in ORDERS.

### Almost-unique colums

To handle the almost-unique column, it's basically the same idea : a new table, new triggers :

```sql
TABLE PI_ORDERS_PRINTING_PID (
   INT ORDERS_ID FOREIGN KEY ON ORDERS(ORDERS_ID),
   PRINTING_PID,
   UNIQUE INDEX ON (PRINTING_PID)
)
```

```sql
CREATE TRIGGER ON ORDERS WHERE INSERT, UPDATE
  WHEN o.STATE = INVOICE_TO_BE_PRINTED
    INSERT INTO PI_ORDERS_PRINTING_PID(o.ORDERS_ID, o.PRINTING_PID) IF ORDERS_ID NOT PRESENT
  ELSE
    DELETE FROM PI_ORDERS_PRINTING_PID
      WHERE ORDERS_ID = o.ORDERS_ID
```

No need to rewrite any query here.

[^1]: Notice that here I don't create all the meta-data stuff. That is left as an exercise to the reader - Yeah, I **always** wanted to say that...
[^2]: MS-SQL has it but calls it Filtered Index. PostgreSQL calls it PARTIAL INDEX.
