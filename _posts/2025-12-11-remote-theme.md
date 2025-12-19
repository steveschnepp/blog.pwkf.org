---
layout: post
title:  Jekyll Remote Theme in Debian 12
tags: jekyll blog
author: Steve SCHNEPP
---

In [a previous post]({% post_url 2025-10-25-dark-theme %}), we moved from the default minima theme
version to a recent one that supports the dark theme, but I couldn't test it anymore in my local
Jekyll engine on my Debian 12.

To leverage the recent [minima theme](https://github.com/jekyll/minima) version, we had to
leverage the [jekyll-remote-theme](https://github.com/benbalter/jekyll-remote-theme) plugin.

The package for Debian is [ruby-jekyll-remote-theme](https://packages.debian.org/bullseye/ruby-jekyll-remote-theme) but it has been removed since Debian 12.

That said, the Debian 11 version is still installable on Debian 12, so you can do:

```bash
wget http://ftp.debian.org/debian/pool/main/r/ruby-jekyll-remote-theme/ruby-jekyll-remote-theme_0.4.2-1_all.deb
sudo apt install ./ruby-jekyll-remote-theme_0.4.2-1_all.deb
```

Then, you can run jekyll locally with the plugin as if it is on github pages.
