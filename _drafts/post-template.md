---
layout: post
title: "Your Post Title Here"
date: YYYY-MM-DD HH:MM:SS +1000
categories: [category1, category2]
tags: [tag1, tag2, tag3]
author: Himanshu Awasthi
description: "A brief description of your post that will appear in previews and meta tags"
image: /assets/images/posts/YYYY-MM-DD-post-title/featured-image.jpg
---

<!-- Introduction - What are you going to talk about? -->

## Introduction

Your introduction text here. Hook the reader and provide context about what they're going to learn.

<!-- Main Content - Your actual content divided into sections -->

## Section 1

Your content here...

### Subsection

More detailed content...

## Section 2

More content...

<!-- Code examples if applicable -->

```python
def example_code():
    return "Hello, World!"
```

<!-- Conclusion - What did we learn? -->

## Conclusion

Summarize the key points and provide any final thoughts or call to action.

<!-- References if applicable -->

## References

- [Reference 1][1]
- [Reference 2][2]

[1]: https://example.com/reference1
[2]: https://example.com/reference2

<!-- Tags for better SEO and categorization -->
{% if page.tags.size > 0 %}
<div class="post-tags">
  Tags:
  {% for tag in page.tags %}
    <span class="tag">{{ tag }}</span>
  {% endfor %}
</div>
{% endif %}

<!-- Sharing section -->
<div class="share-post">
  <h3>Share this post</h3>
  <a href="https://twitter.com/intent/tweet?text={{ page.title }}&url={{ site.url }}{{ page.url }}" target="_blank">Share on Twitter</a>
  <a href="https://www.linkedin.com/shareArticle?mini=true&url={{ site.url }}{{ page.url }}&title={{ page.title }}" target="_blank">Share on LinkedIn</a>
</div>

<!-- Related posts section -->
{% if site.related_posts.size >= 1 %}
<div class="related-posts">
  <h3>Related Posts</h3>
  <ul>
  {% for related_post in site.related_posts limit:3 %}
    <li>
      <a href="{{ related_post.url }}">{{ related_post.title }}</a>
      <small>{{ related_post.date | date: "%B %d, %Y" }}</small>
    </li>
  {% endfor %}
  </ul>
</div>
{% endif %} 