---
layout: post
title: "Adding Comments to a Github Pages Blog"
author: Steve SCHNEPP
tags: blog jekyll
excerpt_separator: <!-- -->
---

Jekyll makes it super easy to host a static blog on github pages. It feels like
a match made in heaven, as it becomes _really_ serverless. Just write some
Markdown and do a git push for publication. Everything else is nicely handled
for you by Github.

The biggest downside is, being static, it obviously lacks comments. Disqus fits
that gap nicely, but I don't like to rely on another service. Besides Github
issues are already implementing a comment system, so let's reuse that.

<!-- -->

# A Simple Comment Ribbon

My first approach is to simply leverage a ribbon in the top right of every
page.

| pro | cons |
|-----|------|
| Simple to setup | No visibility for comments on the blog post |
| No posting overhead | No guidance on how to write comments  |

## Implementation of the Ribbon

It is very simple. It mainly consists of an include file that is injected in the `default.html` layout.


```html
<div class="give-comments">
	<a class="give-comment-links" href="https://github.com/steveschnepp/blog.pwkf.org/issues">
		Comment On GitHub
	</a>
</div>
```

And its corresponding style. Which is included as in-line style in the same include file.

```css
.give-comments {
	transform: rotate(90deg);

	box-shadow: 4px 3px 8px 1px #969696;
	background: #eef;
	border-radius: 5px;

	position: fixed;
	top: 6em;
	right: -4em;

	padding: 2px;
	padding-left: 10px;
	padding-right: 10px;
	text-align: right;
}
```

Everything is injected in `_layouts/default.html` layout.

```html
(...)
<body>
	{{ "{%-" }}  include give-comment.html -%}
	{{ "{%-" }}  include header.html -%}

	<main class="page-content" aria-label="Content">
(...)
```
