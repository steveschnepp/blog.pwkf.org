---
layout: post
title: "Databases: Meta-Data (ctime & mtime)"
date: 2008-12-16 06:35:30 +0100
tags: sql database
permalink: /post/2009/03/Databases%3A-Meta-Data-ctime-mtime
author: Steve SCHNEPP
excerpt_separator: </p>
---

Having this, knowing the last modification of an item is as easy as querying this extra information that is updated automatically by the system.

Adaptation to RDBMS is quite easy. Either the RDBMS comes already with the necessary tools to records this kind of extra information, or it is just a matter of *ghosting* the schema with tables that will only contain the meta-data. The information inside is updated automatically via triggers on the main table.

An example would be for the `ORDERS` and `ORDER_ITEMS` tables (I don't use a specific SQL dialect, it's just for illustrate purposes. Just feel free to adapt the code to your favorite database) :

```sql
TABLE ORDERS (
   SERIAL ORDERS_ID PRIMARY KEY,
   MONEY PRICE_ADJUSTEMENT
)

TABLE ORDER_ITEMS (
   SERIAL ORDER_ITEMS_ID PRIMARY KEY,
   INTEGER ORDERS_ID FOREIGN_KEY ON ORDERS(ORDERS_ID),
   INTEGER PRODUCT_ID,
   INTEGER QUANTITY,
   MONEY UNIT_PRICE
)
```

We have to create 2 *ghost* tables `MD_ORDERS` and `MD_ORDER_ITEMS` :

```sql
TABLE MD_ORDERS (
   INT ORDERS_ID FOREIGN_KEY ON ORDERS(ORDERS_ID),
   TIMESTAMP CTIME DEFAULT NOW(),
   TIMESTAMP MTIME DEFAULT NOW(),
   VARCHAR CLOGIN DEFAULT CURRENT_USER(),
   VARCHAR MLOGIN DEFAULT CURRENT_USER()
)

TABLE ORDER_ITEMS (
   INT ORDER_ITEMS_ID FOREIGN_KEY ON ORDER_ITEMS(ORDER_ITEMS_ID),
   TIMESTAMP CTIME DEFAULT NOW(),
   TIMESTAMP MTIME DEFAULT NOW(),
   VARCHAR CLOGIN DEFAULT CURRENT_USER(),
   VARCHAR MLOGIN DEFAULT CURRENT_USER()
)
```

The colums `CTIME` and `MTIME` are obviously like their corresponding part in file-systems. `CLOGIN` and `MLOGIN` are either the login used to connect to the database or for a web application that usually have only one DB login the current application user connected (To communicate this information to the database system, tt could be inserted in a special temporary table at the beginning of each request, scoped at the current connection/transaction/end-user-request/... in a way shared by all applications).

Updating theses 2 tables is as easy as adding several TRIGGERS. (The examples given below are only for ORDERS, for ORDER_ITEMS it's the same pattern)

```sql
CREATE INSERT TRIGGER ON ORDERS o
BEGIN
  INSERT INTO MD_ORDERS (ORDERS_ID) VALUES (o.ORDERS_ID)
END

CREATE UPDATE TRIGGER ON ORDERS o
BEGIN
  UPDATE MD_ORDERS SET MTIME=NOW(), MLOGIN=CURRENT_USER()
    WHERE ORDERS_ID = o.ORDERS_ID
END
```

The obvious avantage to this that you can use this technique **right now** on your application, since it doesn't require any applicative change. The new columns are completely transparent. Even the locking scheme is the same : if the shadow row has to be locked for updating, the underlaying base row is currently also locked anyway. The only side effect is that you will have effectively 2 times more updates in the database system, and therefore you have to be careful at where you put your new tables (in order not to be bitten by the I/O increase cost) if you have a clever table/tablespace layout.

Another advantage is that if you relax your foreign keys constraints you can even log the **deletion** date of a row in the underlying base table.

```sql
TABLE MD_ORDERS (
   INT ORDERS_ID ON ORDERS(ORDERS_ID) INDEXED,
   TIMESTAMP CTIME DEFAULT NOW(),
   TIMESTAMP MTIME DEFAULT NOW(),
   TIMESTAMP DTIME DEFAULT NULL,
   VARCHAR CLOGIN DEFAULT CURRENT_USER(),
   VARCHAR MLOGIN DEFAULT CURRENT_USER(),
   VARCHAR DLOGIN DEFAULT NULL
)
```

The `DELETE` trigger is obvious, but the `INSERT` one has to be careful to handle the insertion of a deleted entry.
