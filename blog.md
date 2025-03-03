---
layout: default
title: Blog
permalink: /blog/
---

<div class="posts">
  {% for post in site.posts %}
    <div class="post">
      <h2>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </h2>
      
      <div class="post-meta">
        <time datetime="{{ post.date | date_to_xmlschema }}">
          {{ post.date | date: site.plainwhite.date_format }}
        </time>
        
        {% if post.categories.size > 0 %}
        <span class="categories">
          {% for category in post.categories %}
            <a href="/categories#{{ category | slugify }}">{{ category }}</a>
            {%- unless forloop.last -%}, {% endunless %}
          {% endfor %}
        </span>
        {% endif %}
      </div>

      {% if post.description %}
        <p class="post-description">{{ post.description }}</p>
      {% else %}
        <p class="post-excerpt">{{ post.excerpt | strip_html | truncatewords: 50 }}</p>
      {% endif %}
    </div>
  {% endfor %}
</div>

<style>
.posts {
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem 0;
}

.post {
  margin-bottom: 3rem;
}

.post h2 {
  margin-bottom: 0.5rem;
}

.post h2 a {
  text-decoration: none;
  color: inherit;
}

.post-meta {
  color: #666;
  font-size: 0.9em;
  margin-bottom: 1rem;
}

.post-meta .categories {
  margin-left: 1rem;
}

.post-meta .categories a {
  color: inherit;
  text-decoration: none;
}

.post-description,
.post-excerpt {
  margin-top: 0.5rem;
  line-height: 1.6;
}

[data-theme="dark"] {
  .post-meta {
    color: #999;
  }
}
</style> 