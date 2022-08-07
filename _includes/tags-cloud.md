<div class="tags-cloud">
  {% for tag in ctags %}
    {% capture tag_name %}{{ tag }}{% endcapture %}
	<a href="{{ tag_urlprefix }}tags.html#{{ tag_name | url_encode }}"><code>{{ tag_name }}</code></a>
  {% endfor %}
</div>
