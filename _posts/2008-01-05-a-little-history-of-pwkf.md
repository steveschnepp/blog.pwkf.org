---
layout: post
title: "A Little History of PWKF"
date: 2008-01-05 13:15:06 +0100
tags: blog
permalink: /post/2008/01/05/A-Little-History-of-PWKF
author: Steve SCHNEPP
excerpt_separator: </p>
---

It all began with a scratching need as I just felt that workflows (mostly BPM engines to be more precise) were the [way to do many things in IT of the future](http://blog.pwkf.org/post/2007/09/10/Are-Workflows-the-Future-of-IT-Computing). There are even many workflows out here already. My main feeling was that they put too much emphasis on how much of the standard they support, mostly in order to be "Entreprise Grade".

That felt just plain wrong to me : WF where at first designed (at least that's was the usual original marketing scheme) to put back the design of the business rules in the hands of our beloved users, in order to mostly bypass the IT departement, and be able to change and adapt the process very rapidly as described on [ACM](http://acmqueue.com/modules.php?name=Content&pa=showpage&pid=369). With the current implementations of WF, i just have to feeling that it involves a lot more of XML and/or BPEL files to be written than a non-IT worker can manage.

I think that WFs are a very good concept, but the emphasis should be on the modeling, on the reporting, and on the operational part (in that order). The number of constructs that the implementation recognise isn't that important : it could support a much smaller *instruction set*, but doing it in a user-friendly way.

- The modeling is the most important part of the equation.

It's always über-fustrating that we have to attend to meetings, capturing the informations on how to model the business rules, tranlate it into something that the systems understand, and to try to explain it to the users. The most important part of the modeling is that the model is accurate enough. Modeling is usually the difficult part of the job. I don't advocate that the business users should be able to model it themselves : it's usually a recipe for a disaster since they mostly don't have the mind for this. But the opposite is also true : the user has to understand easily what is modeled. Modeling a workflow is like writing a book : it takes a different skillset to write it and to read it to be able to spot inaccuracies. Since users aren't very good at decyphering computer languages, having a good bijection between the modelling and a *random-human*-readable form is very important. That enables the fact that you users don't have to model their business *through* you, but *with* you.

- Reporting is the second most important part

The debugging part is also very important. Since everyone makes mistakes, it's very important to be able to spot them. So we have to see what happened to a particular order. Usually that's the most difficult part of the system, but with workflow, it's quite easy to log everything that happened, and be able to show it later, even to show a snapshot of the current state and history of a particular workcase. If you also manage to show it with a graphical form that is the same than the modeling one, you'll have bug reports that would be much more accurate. The users will be able to tell you : "This workcase has gone through here and there, but since it's the special case A, it should have gone here instead." and then bugfixing would be usually like a piece of cake.

- Operating the workflow is also important.

You don't **use** the workflow for a living. you **design** them. But that's not a reason to make the life of operators miserable :-). And then they should have a nice list of tasks to be done. Tasks forms should be standardized, and it should be possible to have a wizard-like approach so they don't need to fill submit, reopen the case on another task, fill and resubmit anbd so one. The current workcase could be left opened, with the forms "advancing" without need to reselect them again. And as Alan Kay said : "Simple things should be simple, complex things should be possible. ", once all those 3 priorities are done, it's very easy to divide task that's isn't defined in the core workflow to an external "plugin", such as "signaling an other application to do something, via a webservice for example".

So, that laid the initial approach to PWKF, which was at first named "Perl Workflow" since I was planning to do it in Perl & wxWidgets. I migrated to Java since i wasn't that fluent in Perl anymore since I mostly use Java now at work and therefore rename PWKF in "Personal Workflow", in the way [PHP is for 'Personal Home Page'](http://en.wikipedia.org/wiki/PHP).
