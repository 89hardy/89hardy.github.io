---
layout: default
---

{%- if page.title -%}
  <h1 class="page-heading">{{ page.title }}</h1>
{%- endif -%}

{{ content }}

{%- if site.posts.size > 0 -%}
  <ul class="posts">
    <li>
      <h1 id="posts-label">posts</h1>
    </li>

{%- endif -%}
<!-- <h3>Python and iOS dev | Product Manager | SaaS, PaaS, Fintech | CS Player, Test Matches | Jung over Freud | Guitar, Tabla | Cessna trainee | Cats & Dogs | Mountains, always</h3> -->
