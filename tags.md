---
layout: default
title: Tags
permalink: /tags/
---

<div class="tags-page">
  {% assign tags = site.tags | sort %}
  {% for tag in tags %}
    <div class="tag-section">
      <h2 id="{{ tag[0] | slugify }}">{{ tag[0] }}</h2>
      <ul class="post-list">
        {% for post in tag[1] %}
          <li>
            <span class="post-meta">{{ post.date | date: site.plainwhite.date_format }}</span>
            <h3>
              <a class="post-link" href="{{ post.url | relative_url }}">
                {{ post.title | escape }}
              </a>
            </h3>
            {% if post.description %}
              <p class="post-description">{{ post.description }}</p>
            {% endif %}
          </li>
        {% endfor %}
      </ul>
    </div>
  {% endfor %}
</div>

<style>
.tags-page {
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem 0;
}

.tag-section {
  margin-bottom: 2rem;
}

.post-list {
  list-style: none;
  padding: 0;
}

.post-meta {
  color: #666;
  font-size: 0.9em;
}

.post-link {
  text-decoration: none;
  color: inherit;
}

.post-description {
  margin-top: 0.5rem;
  color: #666;
}

[data-theme="dark"] {
  .post-meta,
  .post-description {
    color: #999;
  }
}
</style>
