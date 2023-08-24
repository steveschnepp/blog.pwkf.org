---
layout: post
title: Adding some Color
tags: blog jekyll
author: Steve SCHNEPP
---

Small touches of color are always nice. It is actually very easy
to do with Jekyll.

When using Markdown, an extra line with `{: .class1 .class2 }`
will add `class1` and `class2` to the `<p>` element that
represents the paragraph.

I therefore added some predefined classes in the style.
Feel free to look into the page source to understand better.

## Box

A nice box to convey some important message.
{: .box .small-caps }

Is produced by the following

    A nice box to convey some important message.
    {: .box .small-caps }

## Panel

There are 4 colors for panels[^1] : info, tip, note & warning.

[^1]: This is only working if using my `main.scss`.

__Info__ Fusce hendrerit pulvinar est sit amet aliquet. Nunc at
justo risus. Nullam eget dui et quam tempor sollicitudin at
vitae neque. Sed pretium augue ut dolor egestas posuere.
Vestibulum bibendum felis justo, nec auctor mi finibus
vulputate.
{: .panel .info }

__Tip__ Aliquam et iaculis ex, vitae finibus lorem. Ut auctor et mi a
suscipit.  Phasellus ante nisi, tristique eget efficitur
dapibus, laoreet et tortor. Suspendisse egestas orci purus, et
varius eros aliquet ut.
{: .panel .tip }

This is an note panel.
{: .panel .note }

This is a warning panel with `{: .panel .warning }`.
{: .panel .warning }

## Legend

Legends are similar.

```
<< 1 SWAP / 1 + >>
```
Sample RPL code
{: .legend }

is produced by

    ```
    << 1 SWAP / 1 + >>
    ```
    Sample RPL code
    {: .legend }



## Internal hyperlinks {#internal}

By default every header has an anchor that is hashed from the title content. If you add `{#custom-id}` at the end of the line, it is overriden with `custom-id`.

See how we go back to [Panel](#panel).
