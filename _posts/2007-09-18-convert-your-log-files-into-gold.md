---
layout: post
title: "Convert your Log Files into Gold"
date: 2007-09-18 06:36:16 +0100
tags: sql best-practices
permalink: /post/2007/09/19/Convert-your-Log-Files-into-Gold
author: Steve SCHNEPP
excerpt_separator: </p>
---

Log files are a necessary evil on a live system. A few rules can transform your log files from a useless heap of textfiles to a gold mine.

I'll focus mostly on [Log4J](http://logging.apache.org/log4j/) since it's available on Java, but is ported on many languages also as it sets some kind of logging standard.

The logger is configured per class with a :

```java
private static Logger logger =
Logger.getLogger(MyClass.class);
```

The logger is private since each class should have its logger, especially the derived ones (that way you can very nicely debug the virtual function calls), and static since it's either thread-safe and that way you have it even in the `<init>` and `<cinit>` of your class (you did put it in the first line of the class, didn't you ?).

This is very useful since you can configure a per-package or a even per-class level of logging. It is very useful since all your classes do only one thing, don't they ?

I usually use only 5 levels of logging : ERROR, WARN, INFO, DEBUG, TRACE

- **TRACE** is used to help with a dump of many internal variables (it's a last resort debug, since usually it's very verbose)
- **DEBUG** is used to debug this class, with keypoints inside the class, in order to see the inside flow of execution.
- **INFO** is used to debug other classes with the help of this one. Usually it emits only one line per public call, with the incoming parameters and the result displayed in a synthetised form.
- **WARN** is used when an exceptional situation happens (usually a catched Exception that is triggered by the caller data) and there is a known path to recover.
- **ERROR** is used when an exceptional situation happens, but there is no known path to recover. Usually this line is send by email to the administrator. If there is a problem, and an ERROR is logged, there should be no other ERROR logged for this problem : it will help you to keep a high signal/noise ratio.

In a live production system, I just log INFO for *terminal* business classes (the ones that represent actions), and WARN on technical ones (the one that actions class uses). I configure it to send an email on every ERROR.

It's also very important to have a reminder of a synthetised form of the arguments in the INFO, WARN & ERROR log messages (such as an ORDER_ID if it's an ordering action or the PRODUCT_ID if it's a deleting product action). It's also a good thing to put the exception that triggered the WARN/ERROR log. That way you can just grep through your logs to see if, when and what happened to that famous product that everyone is so excited about

Always use a RollingFileAppender. **Always**. If you're scared about loosing some logs, just put an insane number of backup files since **nothing** is worse than not enough space on the log filesystem : you won't have the logs anyway. Note that if you have a different kind of rolling mecanismed you can use it, the point is that you should **never** leave a growing log file without control.

So, here is a exemple of 2 classes (one business, one technical) that present the logging system I talked about :

```java
public class PublishProductAction extends Action {

private static Logger logger = Logger.getLogger(AddProductAction.class);
private int product_id;
public PublishProductAction(int product_id) { this.product_id = product_id; }
public void execute() {
	logger.info("publishing product[product_id:"
			+ product_id + "]");
	try {
		// Do things...
	} catch (Exception e) {
		logger.error("Cannot publish product["
				+ product_id + "] : ", e);
	}
	logger.debug("done publishing product[product_id:"
			+ product_id + "]");
}

}

public class MyPreparedStatement {

private static Logger logger = Logger.getLogger(MyPreparedStatement.class);
private String sql;
public MyPreparedStatement(String sql) { this.sql_id = sql; }
public void execute(Collection params) {
	startTimer();
	try {
	if (sql == null) {
		// Log in warning, since it should not happen,
		// but we can handle it gracefully
		logger.warn("The SQL statement is null, we do nothing");
		return;
	}
		try {
		// Do things...
	} catch (Exception e) {
		// log only in info since we don't catch
		// the Exception.
		logger.info("Cannot execute SQL[" + sql + "] : ", e);
		thow e;
	}
	} finally {
		stopTimer();
		// help the outside class to see what happened
		if (logger.isInfoEnabled()) {
			logger.info("executed sql ["
					+ parseSQL(sql, params) + "] in "
					+ getTime() + " ms");
		}
	}
}

}
```
