---
layout: post
title: Cool Stuff versus Useful Stuff
tags: development best-practices architecture
author: Steve SCHNEPP
---

The main mindset driving development nowadays is *web scale* and *modern stack*.
Most of the literature is therefore focusing on it, reinforcing the
trend, as described in [a previous post]({{ site.baseurl }}{% post_url
2022-12-22-microservices-are-harmful %}).  Which makes them therefore very
desirable, hence attractive to even more literature. And this usually leads to
the creation of a hype-laden echo chamber.

Everyone wants to do cool stuff instead of the plain old boring one.
{: .panel .info }

## Focus on Boring Stuff

**Synchronous, single-threaded & transactional is still the future.**
{: .panel .tip }

The cool stuff is usually composed of those 3 traits:

* asynchronous
* multi-threaded
* stateless

I will not deny the importance of those 3 traits : those are the very basic
amenities of modern, scalable & efficient software.

That said, a house is not build with basic amenities only.
Water nor electricity won't suffice, as they **do not actually provide any value
just by themselves**.
{: .panel .note }

Yet, they are the things that everyone would take for granted. To push the concept even
further, no-one should actually have to think about them in a daily workload.

Very similarly, we can say that asynchronous, multi-thread & stateless are
traits that **no-one should actually have to think about in a daily workload**.

## Fully leverage the IoC concept

Another famous design anti-pattern is "strong coupling".
{: .panel .warning }

In that perspective we should not commit ourselves to focus too much on how we
handle those amenities.  They should be delegated to a *foundation layer* only
focused on that technical aspect. This foundation layer in return, should also be
*completely agnostic to the business logic* that is currently being implemented.

Therefore the business logic can (therefore should) be done in a synchronous,
single threaded & transactional way. Doing it that way enables us to make many
assumptions that totally ease the implementation by several orders of magnitude.
It therefore lowers the entry barrier to cooperation in that ecosystem, which
is [very important for the long term]({{ site.baseurl }}{% post_url
2022-09-18-always-optimize-for-dummies %}).

Synchronous & single threaded are the way to do software since **decades**.
It is so well documented & known that it often becomes a second nature to any
decent programmer.
{: .panel .info }

For the transactional part, one should not really bother with all the details of
ACID. Just understanding that **either the call fully works, or not at all**, is
the common thinking, and actually what the ACID properties are about.

### Adding the Asynchronous trait to any existing API

An Asynchronous API can be layered on top of every already existing API. This
will provide a *unified & scalable* standard way of interacting with our things.

That *asynchronous layer is fully agnostic to the underlying payloads*. It will
only define the strict minimum that is needed to work in an async manner, and
delegate all the business payload to the underlying API, which is still synchronous.

The real bonus is that the ASYNC API is in addition to the SYNC one, and it is
up to the caller to use the correct one based on his use case.
{: .panel .tip }

#### Example with a sample API

Suppose we have an API to add something to an anonymous cart which
synchronously returns a JSON with the cart state.

```
$ curl -sk -0 -X POST -d ean=9780201633610 https://eshop.com/rest/v1/carts/current/entries
< HTTP/1.1 200 OK
{
  "id": "f4cdae8a-3a76-4175-b221-015ee8f21706",
  "entries": 4,
  "total": 156.56,
  "currency": "USD"
}
```

Now, imagine we could stack an asynchronous API right on top of it.
Its URL would have exactly the same semantic, just the __webroot__ would be
`/async/rest/` instead of simply `/rest/`.
Also its return would be completely different. Not business oriented,
but generic & technical.


```
$ curl -sk -0 -X POST -d ean=9780201633610 https://eshop.com/async/rest/v1/carts/current/entries
< HTTP/1.1 202 Accepted
< Cache-Control: no-cache, no-store, max-age=0, must-revalidate
{
    "asyncId" : "XOIKXBQC",
    "statusCode" : "acknowledged"
}
```

Then the caller can poll on the async API to have its status.


```
$ curl -sk -0 -X GET https://eshop.com/async?id=XOIKXBQC
< HTTP/1.1 202 Accepted
< Cache-Control: no-cache, no-store, max-age=0, must-revalidate
{
    "asyncId" : "XOIKXBQC",
    "statusCode" : "processing"
}
```

When the processing is finished, it does gives the return value.


```
$ curl -sk -0 -X GET https://eshop.com/async?id=XOIKXBQC
< HTTP/1.1 200 OK
{
  "id": "f4cdae8a-3a76-4175-b221-015ee8f21706",
  "entries": 4,
  "total": 156.56,
  "currency": "USD"
}
```

They key part is that once the processing is finished, the output of the job will *always* be available
to fetch. Until it is purged after a while. At that time you'll get a `404 Not Found` HTTP status reply.

Once the processing is finished, the output of the job will always be available
to fetch, until it is purged, where you'll get a `404 Not Found` HTTP status
reply.

The **immutable** part is very important. We are only on a technical layer,
there is no business logic involved. Therefore if the cart does change later,
the reply for that particular `asyncId` will still be the same.
{: .panel .note }

#### Adding a Callback to avoid polling

Since the async layer is very generic, you can think of reusing it
transparently for all the API. Evermore, you can even add a "callback" feature
to remove the polling need, for improved efficiency. Simply add a CallBack url
in the HTTP request headers:

```
$ curl -sk -0 -X POST -d ean=9780201633610 https://eshop.com/async/rest/v1/carts/current/entries -H 'Callback: https://my.com/cart/f4cdae8a'
< HTTP/1.1 202 Accepted
< Cache-Control: no-cache, no-store, max-age=0, must-revalidate
{
    "asyncId" : "XOIKXBQC",
    "callbackUrl" : "https://my.com/cart/f4cdae8a"
    "statusCode" : "acknowledged"
}
```

Then the polling will still work, but the server will also directly POST the
result JSON to the callback url upon processing completion.

```
POST https://my.com/cart/f4cdae8a
{
  "id": "f4cdae8a-3a76-4175-b221-015ee8f21706",
  "entries": 4,
  "total": 156.56,
  "currency": "USD"
}
```

This callback pattern shall **NOT** be used in a internet-facing API, as there's a
serious risk of participating in a DDoS attack.  If really needed, It should be
extra careful to limit the allowed callback urls.
{: .panel .warning }

### Adding the stateless trait to any existing API

**Context will be build for you.**
{: .panel .tip }


Statelessness has become the holy grail of many architecture patterns. It is
often even perceived as the next best thing since sliced bread since it enables
almost magic scaling.

Statelessness comes with a price, there's no free meal.
{: .panel .note }

Now, to achieve a stateless service, one has basically 2 options :

* send the whole context during the call
* callback something to retrieve the state

While both options have their strong and weak points, I'd propose to use the
same idiom as for the asynchronous one : **delegate statelessness to a
dedicated layer, and forget about it**.

Then, when coding a business feature, there's no need to worry about the
current state, as it **will** be here. We just provide a **StateService** that
hides all the complexity to gather the state.

```java
public interface StateService {
    Object get(Object key);
    set(Object key, Object value);
    clear(Object key);
}
```
An example in Java
{: .legend }

This service is really simple on purpose, and can feed its state from parsing
URL query params into `ThreadLocalStorage`, various call-backs or a full-blown
`HttpSession`.

| Strategy            | Type  | Initial Latency | Runtime latency | Transport overhead |
|---------------------|-------|-----------------|-----------------|--------------------|
| Callback            | Lazy  | LOW             | HIGH            | MEDIUM             |
| Central Session     | Eager | HIGH            | LOW             | LOW                |
| Inbound (URL, POST) | Eager | LOW             | LOW             | HIGH               |

#### Inbound (URL, POST)

The State is constructed at request time, from the URL parameters.

* This feels like true statelessness.
* URL parameters can also be POST Data
* Every call is quite heavy-weight.

#### Central Session

The State is eagerly constructed at request time.
Note that the DB can be anything, from SQL to Redis.

* This is very standard version of the session.
* It is still stateless since the `StateService` uses an external tool

#### Callback

No State is constructed, everything is lazy-loaded on demand from a distant system via callbacks.

### Adding Transations to any existing API

In the very exact same vein, the whole transaction stuff should be delegated.
It should be assumed that in the current unit of work (UoW), one is always in a
transaction.  The only way to abort a transaction is to throw an exception. If
returning, it is assumed that everything went OK, and the eventual changes are
to be committed.

This enables a very nice behavior: transparent batching.

A well known fact is that batching is much more efficient than unit processing.
But then with batching, we loose nice transaction capabilities. Moreover,
mixing transactions & batching is usually very painful, as the error handling
is usually very business specific.

There are various types of mixing. They are specific on what to commit, and
what to rollback inside the batch of things to process:

| What should be commit | Comment                                                 | Typical use case                         |
|-----------------------|---------------------------------------------------------|------------------------------------------|
| As much as possible   | This is when batching a list of similar simple objects  | Massive PriceRows Updates                |
| Nothing               | This is when batching a complex object                  | Order+OrderEntries+Consignments          |
| Some things           | This is when batching a list of similar complex objects | Multiple Order+OrderEntries+Consignments |

By delegating the handling of the transaction to the caller, one can assume
nothing about it. And therefore leave the error handling to the caller or to a
middle layer that only handles transactions.

The middle layer can then have a very business-centric approach:

* execute the whole batch in one big transaction, and eventually if there is a
  failure, execute it in individual transactions. This should not be a issue
for performance, as the "normal" case would be to have it working 99.5% of the
time and therefore only slicing 0.5% of the batches.
* execute directly the whole batch in several bite-sized transactions (think
  100 transactions of 1000 PriceRows Updates). Retry can be done if needed.
* execute the whole batch in a multithread manner, but still having several
  bite-sized transactions This would be done via having the business case
selecting the right middle layer and leveraging that.

An example of HTTP call would be in the same cart API:

```
POST -d ean=9780201633610 https://eshop.com/rest/v1/carts/current/entries
[
    {
        "ean" : "9780131101630"
    },
    {
        "ean" : "9780131103627"
    },
    {
        "ean" : "9780131103627"
    },
    {
        "ean" : "9780131103627"
    }
]
< HTTP/1.1 200 OK
{
  "id": "f4cdae8a-3a76-4175-b221-015ee8f21706",
  "entries": 5,
  "total": 356.56,
  "currency": "USD"
}
```
