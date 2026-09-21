---
layout: post
title: "Clean-Up Your Code and Boost Your Google Ranking at the Same Time : Post-process Your Links"
date: 2007-09-28 06:28:25 +0100
tags: blog best-practices
permalink: /post/2007/09/28/Clean-Up-Your-Code-and-Boost-Your-Google-Ranking-at-the-Same-Time-Post-process-Your-Links
author: Steve SCHNEPP
excerpt_separator: </p>
---

The search engine ranking of a web site is very important nowadays. As usually every optimisation means an complexification of the code, many developpers just pay that price. It's mostly paid with a *javascriptification* of the links that we don't want to be followed, and *javascriptification* of functional dialog popups.

There's an other approch to this. It still makes heavy use of Javascript, but :

- your site will still work as intended even with javascript disabled
- your site will be much more maintenable

The idea is to post-process the links with a Javascript function that is triggered just before the end of the loading of the page. Usually it can be done with a body-onLoad, or a `<script/>` element at the bottom of the page. This script parses all the `<a/>` elements, and decodes the classes added to it. If you encode the classenames like this code :

```html
<a
href="my_popup.html"
class="medium_popup pp/popup">
	explain these words
</a>
```

We can see that the classes of the link are `medium_popup`, that is handled normally by the browser, and `pp/popup` is used by the post-processing code to add a onClick() handler that could be expressed as `onClick="javascript:open_popup('my_popup.html');return false;"`.

The big advantage is that you can very simply add popup to your links, web-spiders knows how to go to your popup with all your shiny glossary, and so can users without javascript or just open in a new tab with a middle-click on some browsers.

If it's a dialog box to ask some more informations, you can encode the link like that :

```html
<a
href=""
class="medium_popup pp/link/my_dialog.html">
	choose the date
</a>
```

This way `pp/link/my_dialog.html` will be parsed and the `href` will be dynamically replaced with `my_dialog.html`.

You can even later add a `pp/popup` after the `pp/link/my_dialog.html`, and have the dialob box magically opened in a popup.

I'll post later some example code to parse it.
