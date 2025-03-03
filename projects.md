---
layout: default
title: Projects
permalink: /projects/
---

<div class="projects-page">
  <div class="projects-intro">
    <h1>Projects</h1>
    <p>Here are some of the projects I've worked on. Each project represents a unique challenge and learning experience.</p>
  </div>

  <div class="projects-grid">
    <!-- Project 1 -->
    <div class="project-card">
      <div class="project-header">
        <h2>Personal Blog</h2>
        <div class="project-links">
          <a href="https://github.com/89hardy/89hardy.github.io" target="_blank" rel="noopener noreferrer">
            <i class="fab fa-github"></i>
          </a>
          <a href="https://himanshuawasthi.com" target="_blank" rel="noopener noreferrer">
            <i class="fas fa-external-link-alt"></i>
          </a>
        </div>
      </div>
      <p class="project-description">
        A personal blog built with Jekyll and hosted on GitHub Pages. Features include dark mode, 
        responsive design, and a custom search functionality.
      </p>
      <div class="project-tech">
        <span class="tech-tag">Jekyll</span>
        <span class="tech-tag">Ruby</span>
        <span class="tech-tag">SCSS</span>
        <span class="tech-tag">JavaScript</span>
      </div>
    </div>

    <!-- Add more project cards here -->
  </div>
</div>

<style>
.projects-page {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem 0;
}

.projects-intro {
  margin-bottom: 3rem;
  text-align: center;
}

.projects-intro h1 {
  margin-bottom: 1rem;
}

.projects-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  padding: 0 1rem;
}

.project-card {
  background: #fff;
  border-radius: 8px;
  padding: 1.5rem;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  transition: transform 0.3s ease;
}

.project-card:hover {
  transform: translateY(-5px);
}

.project-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 1rem;
}

.project-header h2 {
  margin: 0;
  font-size: 1.5rem;
}

.project-links a {
  color: #666;
  margin-left: 1rem;
  text-decoration: none;
  font-size: 1.2rem;
}

.project-links a:hover {
  color: #000;
}

.project-description {
  color: #666;
  margin-bottom: 1.5rem;
  line-height: 1.6;
}

.project-tech {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
}

.tech-tag {
  background: #f0f0f0;
  padding: 0.25rem 0.75rem;
  border-radius: 15px;
  font-size: 0.9rem;
  color: #666;
}

[data-theme="dark"] {
  .project-card {
    background: #2d2d2d;
    box-shadow: 0 2px 4px rgba(0,0,0,0.2);
  }

  .project-links a {
    color: #999;
  }

  .project-links a:hover {
    color: #fff;
  }

  .project-description {
    color: #999;
  }

  .tech-tag {
    background: #3d3d3d;
    color: #ccc;
  }
}

@media (max-width: 768px) {
  .projects-grid {
    grid-template-columns: 1fr;
  }
}
</style>

<script src="https://kit.fontawesome.com/b6c09fd63e.js" crossorigin="anonymous"></script> 