---
layout: default
title: Contact
permalink: /contact/
---

<div class="contact-page">
  <div class="contact-intro">
    <p>Feel free to reach out to me through any of the following channels. I'm always open to interesting conversations, collaborations, or opportunities.</p>
  </div>

  <div class="contact-methods">
    <div class="social-links">
      <h3>Connect with me</h3>
      <ul>
        <li><a href="https://twitter.com/89hardy" target="_blank"><i class="fab fa-twitter"></i> Twitter</a></li>
        <li><a href="https://www.linkedin.com/in/ha89" target="_blank"><i class="fab fa-linkedin"></i> LinkedIn</a></li>
        <li><a href="https://github.com/89hardy" target="_blank"><i class="fab fa-github"></i> GitHub</a></li>
        <li><a href="mailto:himanshuawasthi9@gmail.com"><i class="fas fa-envelope"></i> Email</a></li>
      </ul>
    </div>

    <div class="contact-form">
      <h3>Send me a message</h3>
      <form action="https://formspree.io/f/mqaerggo" method="POST">
        <div class="form-group">
          <label for="name">Name:</label>
          <input type="text" id="name" name="name" required>
        </div>
        
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="email" id="email" name="_replyto" required>
        </div>
        
        <div class="form-group">
          <label for="message">Message:</label>
          <textarea id="message" name="message" rows="5" required></textarea>
        </div>
        
        <button type="submit">Send Message</button>
      </form>
    </div>
  </div>
</div>

<style>
.contact-page {
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem 0;
}

.contact-intro {
  margin-bottom: 2rem;
  font-size: 1.1em;
  line-height: 1.6;
}

.contact-methods {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2rem;
}

@media (max-width: 768px) {
  .contact-methods {
    grid-template-columns: 1fr;
  }
}

.social-links ul {
  list-style: none;
  padding: 0;
}

.social-links li {
  margin-bottom: 1rem;
}

.social-links a {
  text-decoration: none;
  color: inherit;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.form-group {
  margin-bottom: 1rem;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
}

.form-group input,
.form-group textarea {
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #ddd;
  border-radius: 4px;
}

button[type="submit"] {
  background-color: #333;
  color: white;
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
  background-color: #555;
}

[data-theme="dark"] {
  .form-group input,
  .form-group textarea {
    background-color: #2d2d2d;
    border-color: #444;
    color: #fff;
  }

  button[type="submit"] {
    background-color: #666;
  }

  button[type="submit"]:hover {
    background-color: #888;
  }
}
</style>

<script src="https://kit.fontawesome.com/b6c09fd63e.js" crossorigin="anonymous"></script> 