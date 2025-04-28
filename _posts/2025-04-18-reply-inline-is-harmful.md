---
layout: post
title: Replying Inline Emails Considered Harmful
tags:
author: Steve SCHNEPP
permalink: /:categories/:year/:title:output_ext
redirect_from:
    - /2025/04/18/reply-inline-is-harmful.html
    - /2025/04/reply-inline-is-harmful.html
---

Do you feel drowning in useless emails that are difficult to follow ? Search no
more, simply blame the "*my replies are below*". Let's see how you can improve
the situation.

# Why inline is harmful

In the old days, it was very impolite to top-post when replying. The better way
was to reply inline the conversation, quoting what you replied to. With the
advent of formatted emails, quoting became much harder, and people starting to
top post a "*my replies are below*" followed by a edition of the original email
with red additions. That's horrible, let's see how can do better.

Such inline reply is bad because it is **cheap for the writer, but expensive
for the reader**. This perfectly aligns with the modern times where everyone
tries to produce as much content as possible for the minimal effort. All in
name of so-called "efficiency", usually coupled with adding as much recipients
to the email reply as possible.

Yet, it is a very short-sighted, and **very damaging**, behavior. For each
email, it puts some **extra workload** on each and **every recipient** of that
email. That, either slows down the whole organisation or leads to the
organisation to simply ignore email. The latter leading to even **more
recipients added** to the chain.

Starting to **ignore emails** begins the **death spiral** of organisational
communications.
{: .panel .warning}

# Why hard to read ?

It looks innocuous at first, but those inline replies are typically done on
lenghty emails with focused replies. Therefore in order to know the answer, one
has to fully read the whole email again and spot the replies.

This obviously takes more times than just reading the replies if they were
carefully extracted like the old times.

Here is the inline reply style:

<style>
    .ident { margin-left: 3em; font-size: 75%;}
    .red { color: red; }
    .blue { color: blue; }
</style>

My replies are below in red.
{: .ident }

Bob
{: .ident }

-----Original Message-----<br/>
From: Alice <alice@example.com><br/>
Sent: jeudi 17 avril 2025 16:14<br/>
To: Bob <bob@example.com><br/>
Subject: A Very Lengthy Email<br/>
{: .ident }

Hello,
{: .ident }

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque
purus id odio egestas rutrum. Vestibulum ante ipsum primis in faucibus orci
luctus et ultrices posuere cubilia curae; Suspendisse egestas lacus mauris, vel
cursus nunc efficitur non. Proin ut metus varius, congue nunc ac, tristique
dui. Nam placerat, enim eget congue placerat, nibh velit aliquet ex, eget
iaculis mauris nunc vel neque. Pellentesque
{: .ident }

Sed sollicitudin urna vitae dictum.
{: .ident .red }

urna dui, commodo vitae bibendum quis, bibendum efficitur libero. Aenean
aliquet justo vel tempus gravida. Integer ornare egestas sem nec vestibulum.
Aenean est est, vestibulum sit amet quam semper, feugiat venenatis mi.
Suspendisse ut risus lorem. Nam urna ex, euismod non lorem id, elementum
tristique sem.
{: .ident }

Nunc porttitor et orci et pulvinar. Nunc quis pretium tortor. Maecenas
ullamcorper enim turpis, sodales accumsan nisi posuere sit amet. Aliquam erat
volutpat. Vivamus ultrices ac diam vel rutrum. Vivamus bibendum, eros eget
volutpat lobortis, mauris nibh sollicitudin augue, vel accumsan ipsum ante et
mauris. Mauris vel orci mi. Suspendisse nec ex ut odio lacinia imperdiet nec in
arcu. Nulla dignissim nibh vel faucibus posuere. Phasellus congue, nibh non
tempus placerat, tortor turpis finibus neque, a tempus nisl enim eget eros.
Integer tincidunt orci vitae elit feugiat, non vehicula eros lobortis. Nulla
sagittis gravida turpis, pharetra efficitur sapien feugiat sed. Mauris egestas
rutrum turpis id posuere. Maecenas porta suscipit ornare.
{: .ident }

Integer porttitor quam sit amet.
{: .ident .red }

Praesent consequat, ex nec aliquet cursus, purus purus dignissim diam, eget
consectetur ligula sem eu sem. Donec semper mi eget ligula porttitor laoreet.
Vestibulum laoreet dapibus consequat. Etiam eget nisi congue, consequat ante
dictum, lacinia nibh. Maecenas mattis massa mauris, vel egestas nisi tempor at.
Morbi bibendum et lacus nec suscipit. Quisque ac dignissim mauris. Orci varius
natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In
bibendum ligula eget ipsum dictum ultrices.
{: .ident }

This does not look so bad, but what happens when several actors have
contributed several times ?

My replies are marked (CH).
{: .ident }

Charles
{: .ident }

-----Original Message-----<br/>
From: Alice <alice@example.com><br/>
To: Bob <bob@example.com><br/>
Cc: Charles <charles@example.com><br/>
Subject: Re: Re: A Very Lengthy Email<br/>
{: .ident }

My replies are below in blue.
Added Charles for review.
{: .ident }

Alice
{: .ident }

-----Original Message-----<br/>
From: Bob <bob@example.com><br/>
To: Alice <alice@example.com><br/>
Subject: Re: A Very Lengthy Email<br/>
{: .ident }

My replies are below in red.
{: .ident }

Bob
{: .ident }

-----Original Message-----<br/>
From: Alice <alice@example.com><br/>
To: Bob <bob@example.com><br/>
Subject: A Very Lengthy Email<br/>
{: .ident }

Hello,
{: .ident }

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque
purus id odio egestas rutrum. Vestibulum ante ipsum primis in faucibus orci
luctus et ultrices posuere cubilia curae; Suspendisse egestas lacus mauris, vel
cursus nunc efficitur non. Proin ut metus varius, congue nunc ac, tristique
dui. Nam placerat, enim eget congue placerat, nibh velit aliquet ex, eget
iaculis mauris nunc vel neque. Pellentesque
{: .ident }

Sed sollicitudin urna vitae dictum.
{: .ident .red }

Urna dui, commodo vitae bibendum quis, bibendum efficitur libero. Aenean
aliquet justo vel tempus gravida. Integer ornare egestas sem nec vestibulum.
Aenean est est, vestibulum sit amet quam semper, feugiat venenatis mi.
Suspendisse ut risus lorem. Nam urna ex, euismod non lorem id, elementum
tristique sem.
{: .ident }

Nunc porttitor et orci et pulvinar. Nunc quis pretium tortor. Maecenas
ullamcorper enim turpis, sodales accumsan nisi posuere sit amet. Aliquam erat
volutpat. Vivamus ultrices ac diam vel rutrum. Vivamus bibendum, eros eget
volutpat lobortis, mauris nibh sollicitudin augue, vel accumsan ipsum ante et
mauris. Mauris vel orci mi. Suspendisse nec ex ut odio lacinia imperdiet nec in
arcu. Nulla dignissim nibh vel faucibus posuere. Phasellus congue, nibh non
tempus placerat, tortor turpis finibus neque, a tempus nisl enim eget eros.
Integer tincidunt orci vitae elit feugiat, non vehicula eros lobortis. Nulla
sagittis gravida turpis, pharetra efficitur sapien feugiat sed. Mauris egestas
rutrum turpis id posuere. Maecenas porta suscipit ornare.
{: .ident }

Integer porttitor quam sit amet.
{: .ident .red }

Ut ultrices, orci sagittis tempor ornare, diam.
{: .ident .blue }

(CH) Sed eu ante.
{: .ident }

Praesent consequat, ex nec aliquet cursus, purus purus dignissim diam, eget
consectetur ligula sem eu sem. Donec semper mi eget ligula porttitor laoreet.
Vestibulum laoreet dapibus consequat. Etiam eget nisi congue, consequat ante
dictum, lacinia nibh. Maecenas mattis massa mauris, vel egestas nisi tempor at.
Morbi bibendum et lacus nec suscipit. Quisque ac dignissim mauris. Orci varius
natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In
bibendum ligula eget ipsum dictum ultrices.
{: .ident }

You immediatly see the issue, it becomes an untangled mess for the average
person to understand.

Now, add colorblind personel as Charles is, you need to avoid color coding and
start prefixing with the initials. But that doesn't solve the issue of multiple
replies of the same person.

And if you add blind personel to the mix, which need to resort to screen
readers, you'll just made their life totally impossible.

# Top quoting to the rescue

I agree that one advantage when inline replying is that the whole email is
preserved. This enables late participants to understand the context much more
than having only excerpts.

But you can do both if you take a little more time. Specificially quote what
you want to reply to in the top of the reply, and leave the whole original
email fully untouched underneath. That way you help the reader to focus on
what's important. Yet leaving the full converstation context intact.

Let's see how that last email would look like

> > Sed sollicitudin urna vitae dictum.
>
> Ut ultrices, orci sagittis tempor ornare, diam.
{: .ident }

Sed eu ante.
{: .ident }


Charles
{: .ident }

-----Original Message-----<br/>
From: Alice <alice@example.com><br/>
To: Bob <bob@example.com><br/>
Cc: Charles <charles@example.com><br/>
Subject: Re: Re: A Very Lengthy Email<br/>
{: .ident }

> Sed sollicitudin urna vitae dictum.
{: .ident }

Ut ultrices, orci sagittis tempor ornare, diam.
{: .ident }

Added Charles for review.
{: .ident }

Alice
{: .ident }

-----Original Message-----<br/>
From: Bob <bob@example.com><br/>
To: Alice <alice@example.com><br/>
Subject: Re: A Very Lengthy Email<br/>
{: .ident }

> Proin ut metus varius, congue nunc ac, tristique dui. Nam placerat, enim eget
> congue placerat, nibh velit aliquet ex, eget iaculis mauris nunc vel neque.
> Pellentesque
{: .ident }

Sed sollicitudin urna vitae dictum.
{: .ident }

> Vivamus ultrices ac diam vel rutrum. Vivamus bibendum, eros eget volutpat
> lobortis, mauris nibh sollicitudin augue, vel accumsan ipsum ante et mauris
{: .ident }

Integer porttitor quam sit amet.
{: .ident }


Bob
{: .ident }

-----Original Message-----<br/>
From: Alice <alice@example.com><br/>
To: Bob <bob@example.com><br/>
Subject: A Very Lengthy Email<br/>
{: .ident }

Hello,
{: .ident }

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque
purus id odio egestas rutrum. Vestibulum ante ipsum primis in faucibus orci
luctus et ultrices posuere cubilia curae; Suspendisse egestas lacus mauris, vel
cursus nunc efficitur non. Proin ut metus varius, congue nunc ac, tristique
dui. Nam placerat, enim eget congue placerat, nibh velit aliquet ex, eget
iaculis mauris nunc vel neque. Pellentesque
{: .ident }

Urna dui, commodo vitae bibendum quis, bibendum efficitur libero. Aenean
aliquet justo vel tempus gravida. Integer ornare egestas sem nec vestibulum.
Aenean est est, vestibulum sit amet quam semper, feugiat venenatis mi.
Suspendisse ut risus lorem. Nam urna ex, euismod non lorem id, elementum
tristique sem.
{: .ident }

Nunc porttitor et orci et pulvinar. Nunc quis pretium tortor. Maecenas
ullamcorper enim turpis, sodales accumsan nisi posuere sit amet. Aliquam erat
volutpat. Vivamus ultrices ac diam vel rutrum. Vivamus bibendum, eros eget
volutpat lobortis, mauris nibh sollicitudin augue, vel accumsan ipsum ante et
mauris. Mauris vel orci mi. Suspendisse nec ex ut odio lacinia imperdiet nec in
arcu. Nulla dignissim nibh vel faucibus posuere. Phasellus congue, nibh non
tempus placerat, tortor turpis finibus neque, a tempus nisl enim eget eros.
Integer tincidunt orci vitae elit feugiat, non vehicula eros lobortis. Nulla
sagittis gravida turpis, pharetra efficitur sapien feugiat sed. Mauris egestas
rutrum turpis id posuere. Maecenas porta suscipit ornare.
{: .ident }

Praesent consequat, ex nec aliquet cursus, purus purus dignissim diam, eget
consectetur ligula sem eu sem. Donec semper mi eget ligula porttitor laoreet.
Vestibulum laoreet dapibus consequat. Etiam eget nisi congue, consequat ante
dictum, lacinia nibh. Maecenas mattis massa mauris, vel egestas nisi tempor at.
Morbi bibendum et lacus nec suscipit. Quisque ac dignissim mauris. Orci varius
natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In
bibendum ligula eget ipsum dictum ultrices.
{: .ident }

Any reader can now stop at the first `—–Original Message—–` knowing that they
already have read it, and continue if they didn't.

This is much better, as the reader now immediatly see what's going on. And
still has quick access to the full context.
{: .panel .tip }

Another side-effect of top-quoting is that taking that extra time to fine
select the quote is very useful in avoiding misunderstandings. As you'll need
to read carefully the message that was sent to you. **Which is very valuable to
the writers.**

# Call to Action

To improve your emails, **start to top-quote**. It will take a little more of
your time, but it is totally worth it. You'll make your readers happier and
**your replies** will be much **more accurate**.

And, of course, when asked why, just redirect everyone to that page 😉

