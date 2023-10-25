---
layout: post
title: Post Modern Cloud Native Development
tags:
- architecture
- design
- best-practices
---

Moving everything to the cloud is now mainstream, and _Cloud Native Development_ mindset took over.
- It has been successfully marketed as the _only_ solution to _every_ problem.
- No-one wants to [work on boring tech anymore]({% post_url 2023-06-28-cool-stuff-versus-useful-stuff %}).
- It has become a [Self-fulfilling prophecy](https://en.wikipedia.org/wiki/Self-fulfilling_prophecy).

## What exactly is _Cloud Native Development_? 

Here is the [cloud native official definition](https://github.com/cncf/toc/blob/main/DEFINITION.md):

> Cloud native technologies empowers organizations 
> to build and run scalable applications in modern,
> dynamic environments such as public, private, 
> and hybrid clouds.

The key traits are therefore:

- scalable applications
- dynamic environments
- running in "the cloud"

Note that "Running in the Cloud" is not new : only the public cloud is.
Having its own cloud-like infrastructure inside its own premises is perfectly valid.
The concept is more about moving away from _desktop applications_[^1]. 

[^1]: Those that need to be installed on every workstation.

What is really changing is __dynamic environments__, which is mostly about the 
[cattle not pet](https://web.archive.org/web/20231021113438/https://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/)
analogy.
{: .panel .tip }

## Patterns

From there, it moves into examples, and common patterns.

1. Breakaway from a 3-tier architecture to a collection of micro-services
1. Everything is __stateless__, in order to be __scalable at runtime__
1. Everything is __decoupled__, in order for be __scalable at dev time__

Note that __yet nothing mandates those patterns__.
Only the previous traits are strictly part of the definition.

Also in order to implement the required scalability, there is a strong push
to move beyond moving away from traditional SQL RDBMS.

### Traditional RDBMS are seemingly obsolete...

A standard [RDBMS](https://en.wikipedia.org/wiki/Relational_database) is all about consistency. Which limits its ability to scale since consistency requires synchronisation.

The [CAP theorem](https://en.wikipedia.org/wiki/CAP_theorem) says that if 
a system is becoming distributed, it will face consistency issues.
This has a profound implication :

__If a systems has full consistency, it is not fully distributed__.
{: .panel .warning}

Note that modern RDBMS can offer scalability at the expense of some reduction of the consistency they offer.
Which makes those modern ones very similar to their NoSQL counterparts... With the added benefit of also
leveraging a well known API (SQL).

### ... but hardware improvement happened everywhere.

Performance of modern hardware is now many order of magnitude higher of what it 
was even several years ago. This led many new architectures to emerge.

Yet, even fully-consistent traditional RDBMS do now scale much bettter than before. 

Such vertical scalability is good enough for most of the applications today.
{: .panel .info }

The bar that mandates the need to relax requirements in order to scale is now higher
than before. Which __enables using old technology for much longuer__, on more use cases. 
And that is a good thing, as old technology is usually much simpler to understand & leverage correctly.

## We are going in circles

Thanks to those advances in hardware & software, the initial way to doing
Cloud Native is still going very strong. 

Even the venerable "3-tier architecture" is much simpler to execute upon, as it doesn't move
the burden of complexity to each and every developer.
{: .panel .tip }

And fighting the mental load of every developer is key to successful software.

Similar things can be said about multitenancy. That will be the subject of a future article.
