---
layout: post
title: Microservices are Mostly Harmful in Your Case
tags: best-practices architecture
author: Steve SCHNEPP
---

Microservices are very fashionable nowadays but the real questions are:
* What do they really bring to you?
* What is their hidden price?
* Can you avoid paying that price?

> Again, this article is a little bit on the satire side of things. <br/>
> Yet, I promise you'll have a different view on your situation at the end of it.

# Microservices Are Magic. They Do Solve Real Problems

Microservices are highly praised nowadays because **they are actually solving
very real problems**.

Those benefits are the following (by order of importance):

1. Implementation teams independence
1. Very quick restarts
1. Robustness
1. Performance Scaling

As all those are notoriously hard to solve, so there's little wonder that any
*magic bullet* did take off like wildfire. Since your typical "legacy monolith"
doesn't usually have all those qualities it is a quick sell.

Note that some monoliths are well designed. And therefore have those qualities.
But then the question isn't even asked in the first place.

# Magic Has a Price. Microservices Are Not Cheap

Microservices are inherently a distributed architecture.

Any distributed architectures have known costs :

* They are harder to get right than non distributed ones.
* They have a huge overhead compared to non distributed ones.

This is well known in the X11 world for example, where the wire protocol was
replaced by memory sharing. Without surprise, its successor, Wayland, also uses
memory sharing whenever possible.

Its costs aren't only about performance either, as it seems that there is a lot
of hype going around. Every conference is preaching their gospel. Every book
also.

This looks very compelling until you look at the sponsor of those conferences,
and understand that books author want to sell books.

The fact that microservices are the future has become a self-fullfilling
prophecy. As more people speak about it, more people are interested in it.
Perpetuating its hype. We'll still in a period where critics are shut down, but
it will soon change, when everyone wakes up from that mass hysteria.

To me microservices look like drugs. I mean, the more you are using them, the
more you tolerate them, the more you are efficient in their usage. And the more
you think you need them as, again, they *do* have some real benefits.

Finally, you have to realize that every actor that is sponsoring some
conference about it, is an actor that offer to manage their burden for you.

Some burden you wouldn't have otherwise. 😉


# Avoiding to Pay the Price

Let's now see each benefits that microservices have one by one, and see if we
can solve them without going full microservices.

## Implementation teams independence


That's the most well known benefit.

Everyone has ugly war stories of late synchronisations between teams that derailed
projects dates, and I'm sure you do either.

### A Typical Story down the rabbit hole

Yet, let's try with the following analogy :
- The release is a car.
- As more and more teams are onboarded, more and more passengers are car-pooling.
- This is very easy at first, since it the car is already here and you just need to make one more stop to go somewhere.
- But soon, as soon as more passengers are pooled, the car needs to make many stops to fetch every passengers, and wait for late ones.
- This leads to synchronisation delays, as everyone needs to get on board.
- So you start to plan upfront for everyone to be ready at their doorstep on time.
- Which means that everyone needs to prep oneself with enough buffer time to ensure to be on time.
- Which leads to a huge pipeline that really looks like the old waterfall.

Sounds familiar ?

Wait for the next steps! 😂

Now, a very natural tendency is to say *"everyone gets its own car"*. Which is
all nice & well, until you realise that it is much more expensive. Yet as you
are only remembering the "single car hell", you still think you are is way better now.

*Welcome to a world of microservices!*

If you let it go for a while, you'll end up with a gazillion cars, and
therefore huge operating costs, but also lots of traffic jams.

But fear not! There are many companies that do make nice money out of managing
those traffic jams for you. And if you remembered correctly, those are the same
ones that massively invest into the microservices ecosystem marketing, funding
all those article & confereneces. But, let's not feed too much into the
conspiracy theory, I just think that it is capitalism at work by simply offering
what customers want.

**That said, it is a local optimum only.**

### Mass transportation to the Rescue!

Overcrowded car transit is the exact problem that many european cities have.
Therefore they invested heavily into mass transportation.

And that's what I propose : **mass-transportation to the rescue!**

A train feels very much like a monolith indeed, but a *modular* monolith, as it
can do scheduled stops.

In that paradigm:
* Every team that contributes to that monolith can simply push its code to a
  "release branch".
* Which gets automatically deployed.
* Without any synchonisation from other teams.
* Inter-team communications still goes via well defined API, so it is as smooth
  as independant microservices deployement.

Therefore, instead of having to "car pool", which means having an extensive
sync among the passengers, one can just hop on and hop off the train that
passes at :
* regular schedule (rollout cadence)
* well defined stops (internal API).

Now you have the benefit of "asynchronous teams" without the operating costs of
the microservices architecture.

I won't lie. It does take some discipline, but if you organize yourself around
"modules" that are owned by teams, it is the same as microservices, just on a
much more integrated scale.

## Faster Restarts are acutally not needed

A microservice is smaller, as the "micro" moniker implies. Therefore the
restart time is much smaller also.  Typical figures are 10s versus 2 min.
So, indeed, a mighty 10x decrease which is significant.

Yet, in the era of blue-green, restarting time isn't a factor anymore. At best
it simply limits the deployment *rate*.  Which then is limited to only 30 per
hour instead of 300 per hour.

My question would then be :

> Do you **really** deploy 300 times per hour?

If you're really in the need of that much deployements due to your org size,
then I stand corrected, you need to indeed divide your monolith.

But the vast majority of the organisations don't need that, as they already
have actually several (but not more than a handful) monoliths.  And therefore,
they never cross that threshold. I mean, even deploying *once per hour* is
already a huge stretch for many.

Specially if it has to be done with a world-global scope that takes a while to
execute anyway.

## Robustness

It is true that microservices are usually more robust than monoliths. But
funnily it is not because a monolith isn't. It is more because that distributed
architectures are hard and less forgiving.

Therefore, you'll spend more time coping with distributed failures as it is
much more apparent immediatly.

If it isn't yet the case in your organisation, beware! It will come soon, and
it always comes in a *catastrophic* way.

The usual solution is to have redundancy all over the place. Which can also be
applied in monoliths. Just have more instances of the monoliths, and you'll be
as robust as microservices.


Do you remember the glory days of PHP ? Vast arrays of Apache servers with
`mod_php` were **very robust** at the time. And actually, those are still very
robust if not replaced yet. Their demise isn't a lack of robustness, it is more due to
the language itself.

## Performance Scaling

Microservices scale better than monoliths. Which is also true up to a certain point.

Scaling comes with sharding data & multiplying computing instances. Period.

As with Microservices you do shard, usually by business domain, you scale
better in the beginning. Well, unless you realize that monoliths have less
inherent overhead in the first place, but that's another story.

And here also, sharding has to be done on the data level. Not on the business
domain level. Otherwise you won't really scale.

Now that you scale on the data level, each microservice looks like a monolith.

> Every microservice is effectively a monoliths in isolation, so the same
> patterns apply.

Which means that nothing prevents you from scaling a monolith exactly the same
way you'd scale a microservice.

## Starting is more rewarding that finishing

Now, a more insidious reason for microservices is not well known. Yet I think it is the deciding reason for the whole industry move.

**It is not technical. It is human.**

Very much like my previous article [Always Optimize for Junior Devs]({% post_url 2022-09-18-always-optimize-for-dummies %}).

> Any leader needs to tell a nice success story to evolve. <br/>
> Therefore, since the dawn of time, there is a very common pattern of *let's
> scrap the existing and do it over*.

The rationale is very simple:

* In the beginning of a new project, everything is always smooth, gives great
  successes very quickly, and leverages a honeymoon period.
* Patching something existing is more complex and timeconsuming, while results
  are expected faster as, precisely, we don't start from scratch.

Now, the sad part is that :

* After a blitz, progress slows down significantly due to business peculiarities
* The leader that initiated the project is now promoted elsewhere, as he made
  sure to exploit the nice story start.

## No-one wants to be seen in a sinking ship

The biggest benefit of microservices is again, not technical.

It is that they **feel** like a future-proof carreer move. No-one wants to be
left on the bench while everyone has left.

Unless monoliths are made cool again... 🤔🤣

# What did we learn ?

* Microservices are solving your problems
* So do monoliths

Therefore it might be more efficient to spend the budget on evolving your
monoliths that are already battle proven into than to drink the microservice
Kool-Aid.

Yet, drinking that gives you an immediate nice cool attitude. Which might have
the nice benefit of keeping your team happy. Not as efficient in theory, but
happier. So maybe more efficient in practice.
