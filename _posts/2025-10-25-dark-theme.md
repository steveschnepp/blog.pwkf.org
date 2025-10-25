---
layout: post
title: A Dark Theme
tags: jekyll blog
author: Steve SCHNEPP
---

Almost everyone uses Dark Themes by now, myself included.
Either permanently or just at night.
My blog didn't have one, and it is actually very easy to setup
on the `minima` theme of jekyll.

## Prerequisites 

I'm using the default GitHub Pages Jekyll engine with a tweaked minima theme.
That one doesn't support the dark theme yet. But the upstream does.

Thankfully, GH pages supports the `jekyll-remote-theme` which is exactly designed
to enable themes from 1a GitHub repository.

## Installation 

1. add the `jekyll-remote-theme` plugin to your `_config.yml`
2. replace the `theme: minim1` configuration option with `remote_theme: "jekyll/minima`

You can also be specific with `jekyll/minima@a6d4d9ce"`. The use of a commit id ensures that changes on the theme don't randomly break your site. That's useful when you customize it afterwards.
But beware to always keep it up to date from time to time.


3. add the `skin` to dark or auto

```yml
minima:
  skin: auto
```

4. tweak the modifications you made to adjust to upstream's changes. Mostly the dynamic css namings, that are enabling the skins.

Now, if you chose the `auto` skin as I did, the site will automatically adjust depending on the configuration of your brower.

I'll might add a button in the future, but it already suits my needs.
