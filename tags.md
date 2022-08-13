---

layout: page
title: Tags Index
list_title: Tags

---

<style>
h3.tag > a {
	color: inherit; /* no specific color */
	text-decoration: none; /* no underline */
}
</style>
{% assign stags = site.tags | sort %}
{% for tag in stags %}
  <h3 class="tag" id="{{ tag[0] | url_encode }}">
     {{ tag[0] }}
  </h3>
  <ul>
    {% assign plist = tag[1] | sort: url | reverse %}
    {% for post in plist %}
      <li><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>
{% endfor %}
