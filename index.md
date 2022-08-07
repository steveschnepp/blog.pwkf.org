---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---

Originally a blog about
[PWKF, an easy-to-use workflow](post/2008/01/05/A-Little-History-of-PWKF)
solution, but as my interest in PWKF faded, it evolved into a generic blog.

Therefore now it is more about random thoughts,
[Munin](https://munin-monitoring.org/) or even low-level techy stuff I'm doing
with my sons.

---
<!-- Tags Collection -->
{% assign ctags = "" %}
{% for post in site.posts %}
{% for tag in post.tags %}
    {% assign ctags = ctags | join:' ' | append:' ' | append: tag  %}
    {% assign ctags = ctags | split:' ' | uniq | sort  %}
{% endfor %}
{% endfor %}

{%- include tags-cloud.md -%}
---
