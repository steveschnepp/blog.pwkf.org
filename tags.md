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

{% for tag in site.tags %}
  <h3 class="tag" id="{{ tag[0] | url_encode }}">
     {{ tag[0] }}
  </h3>
  <ul>
    {% for post in tag[1] %}
      <li><a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>
{% endfor %}
