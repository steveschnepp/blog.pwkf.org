---
layout: post
title: "Adding Navigation Links"
tags: blog
author: Steve SCHNEPP
---

Navigation inside a blog site is essential to discover related content.

# Existing inspiration

It consists mostly of 3 things :

* tag navigation
* previous/next navigation
* related posts navigation

## Tag navigation

I found some nice [tag handling snippet for
jekyll](https://longqian.me/2017/02/09/github-jekyll-tag/) but it was a little
too complex for my small needs.  While it was nice since it had a tag page per
tag as I wanted, it needed manual steps that I didn't want.

Therefore, I hacked it away to make it much more simple. The resulting code is
very different, as I finally used it more as a learning tool than to copy/paste
from it.

It now produces a single page that has all the tags, and redirects to it from
the posts with `div id=""` anchors.

The code is comprised of
* the [tags.md](https://github.com/steveschnepp/blog.pwkf.org/blob/master/tags.md?plain=1) page
* the [tags-cloud.md](https://github.com/steveschnepp/blog.pwkf.org/blob/master/_includes/tags-cloud.md?plain=1) include file
* an `{{ "{%" }}  assign ctags = ... %}` [Liquid](https://jekyllrb.com/docs/liquid/) directive to setup the correct tag list

## Previous/Next navigation

Same as the tag navigation, I found a [prev/next handling snippet](https://blog.webjeda.com/related-post-jekyll/) and I adapted it, with some CSS tricks.

The code much simpler, as Jekyll does most of the work for us. It is
comprised of
* the [prev-next.html](https://github.com/steveschnepp/blog.pwkf.org/blob/master/_includes/prev-next.html) include file
* Adding the `{{ "{%" }} include prev-next.html -%}` into `_layout/post.html`

## Related Post navigation

For that, I got some inspiration from the same site as prev/next. They had
an article that [found the same deficiencies as the built-in mechanism in
jekyll](https://blog.webjeda.com/jekyll-related-posts/).

I edited the code to conform to my tag cloud navigation and i cleaned it a
bit. As i did not like the way it mixes rendering and tag fetching.

It is a rather simple but clever algorithm:
* iterate on all the site posts
* see if there is at least a certain number of common tags between the
  current post and the iterated one
* limit the number of related posts


I totally injected the code in the [`_layouts/post.html`](https://github.com/steveschnepp/blog.pwkf.org/blob/cf1f46bf38774b2214df10d9c4011aed05fd16b7/_layouts/post.html#L38) file. With some
`display: none;` CSS if there are no related pages.
