---
layout: default
title: Categories
permalink: /categories/
---

<div class="categories-page">
  {% assign categories = site.categories | sort %}
  {% for category in categories %}
    <div class="category-section">
      <h2 id="{{ category[0] | slugify }}">{{ category[0] }}</h2>
      <ul class="post-list">
        {% for post in category[1] %}
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
.categories-page {
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem 0;
}

.category-section {
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