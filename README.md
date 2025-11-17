# Personal Website & Blog

This is my personal website and blog built with Jekyll, featuring articles about technology, product management, development, and personal experiences.

🌐 **Live Site:** [himanshuawasthi.com](https://himanshuawasthi.com)

## Features

### Content & Design
- ✨ Responsive design using plainwhite theme
- 🌙 Dark mode support
- 📝 Blog posts with categories and tags
- 🔍 Client-side search functionality
- 📊 Reading time calculator
- 💬 Disqus comments integration

### SEO & Analytics
- 🎯 SEO optimized with jekyll-seo-tag
- 📈 Google Analytics integration
- 🗺️ Automatic sitemap generation
- 🤖 robots.txt configuration
- 🐦 Twitter/social media card support

### Development Tools
- 🚀 Quick post creation script
- 🛠️ Development server helper
- 📤 Draft publishing tool
- ✅ GitHub Actions CI/CD
- 🔐 Automated dependency updates

## Quick Start

### Prerequisites
- Ruby 3.0+ (recommended: 3.2)
- Bundler
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/89hardy/89hardy.github.io.git
   cd 89hardy.github.io
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Run the development server**
   ```bash
   ./dev.sh
   # or
   bundle exec jekyll serve --livereload
   ```

4. **Visit** `http://localhost:4000` in your browser

## Creating Content

### Option 1: Quick Post Script (Recommended)

The easiest way to create a new post:

```bash
./new-post.sh
```

This interactive script will:
- Prompt for post title, description, categories, and tags
- Generate proper frontmatter automatically
- Create the file with the correct naming convention
- Open it in your default editor

**Example:**
```bash
$ ./new-post.sh
Post title: My Awesome New Post
Short description: This is what my post is about
Categories (comma-separated): tech, tutorial
Tags (comma-separated): jekyll, blogging
Create as draft? (y/N): n
✓ Post created successfully!
Location: _posts/2025-11-17-my-awesome-new-post.md
```

### Option 2: Manual Creation

Create a file in `_posts/` with the format: `YYYY-MM-DD-title.md`

```markdown
---
layout: post
title: "Your Post Title"
date: 2025-11-17 10:30:00 +1100
categories: [tech, tutorial]
tags: [jekyll, blogging]
description: "Brief description for SEO"
---

Your content here...
```

## Working with Drafts

### Create a Draft

```bash
./new-post.sh
# When prompted "Create as draft?", answer: y
```

Drafts are stored in `_drafts/` without a date in the filename.

### Preview Drafts Locally

```bash
./dev.sh --drafts
# or
bundle exec jekyll serve --drafts
```

### Publish a Draft

```bash
./publish-draft.sh
```

This script will:
- List all available drafts
- Let you select which one to publish
- Update the date in frontmatter
- Move it to `_posts/` with the correct filename
- Optionally delete the original draft

## Development Scripts

### `./dev.sh` - Development Server

Simplified Jekyll development server with options:

```bash
# Basic usage
./dev.sh

# Show drafts
./dev.sh --drafts

# Enable incremental builds (faster)
./dev.sh --incremental

# Custom port
./dev.sh --port 4001

# Disable live reload
./dev.sh --no-livereload

# Combine options
./dev.sh --drafts --incremental --port 4001
```

### `./new-post.sh` - Create New Post

Interactive script to create posts with proper frontmatter.

```bash
./new-post.sh
```

### `./publish-draft.sh` - Publish Draft

Convert a draft to a published post with the current date.

```bash
# Interactive mode (shows list of drafts)
./publish-draft.sh

# Direct mode
./publish-draft.sh my-draft-post.md
```

## Automated Workflows

This repository includes GitHub Actions for automation:

### 🔨 Jekyll Build & Deploy
- **Trigger:** Every push to main/master
- **Purpose:** Build and deploy to GitHub Pages
- **Features:** HTML validation, artifact upload

### ✅ Content Validation
- **Trigger:** Pull requests and pushes affecting posts/drafts
- **Purpose:** Validate post frontmatter and structure
- **Checks:**
  - Required fields (layout, title, date)
  - Filename format (YYYY-MM-DD-)
  - Non-empty titles
  - Basic spell checking (non-blocking)

### 🔄 Dependency Updates
- **Trigger:** Weekly (Dependabot)
- **Purpose:** Keep dependencies up to date
- **Monitors:** Jekyll gems, GitHub Actions, Python packages

## Project Structure

```
89hardy.github.io/
├── _config.yml           # Jekyll configuration
├── _posts/               # Published blog posts
├── _drafts/              # Draft posts (not published)
├── _layouts/             # HTML templates
├── _includes/            # Reusable HTML components
├── _sass/                # Stylesheets (SCSS)
├── assets/               # Images, fonts, static files
├── .github/
│   ├── workflows/        # GitHub Actions
│   ├── dependabot.yml    # Automated dependency updates
│   └── wordlist.txt      # Custom dictionary for spellcheck
├── app/                  # Flask CMS (optional, for local editing)
├── new-post.sh           # Quick post creation script
├── dev.sh                # Development server helper
└── publish-draft.sh      # Draft publishing tool
```

## Configuration

### Site Settings (_config.yml)

Key configuration options:

```yaml
title: Your Name
url: "https://yoursite.com"
timezone: Your/Timezone
plainwhite:
  analytics_id: "G-XXXXXXXXX"  # Google Analytics
  dark_mode: true
```

### Custom Domain

To use a custom domain:
1. Add your domain to `CNAME` file
2. Configure DNS with your registrar:
   - Add A records pointing to GitHub Pages IPs
   - Or add CNAME record pointing to `yourusername.github.io`
3. Enable "Enforce HTTPS" in repository settings

## Troubleshooting

### Bundle Install Fails

```bash
# Update RubyGems
gem update --system

# Install bundler
gem install bundler

# Try again
bundle install
```

### Port 4000 Already in Use

```bash
# Use a different port
./dev.sh --port 4001
```

### Changes Not Showing

```bash
# Clear Jekyll cache
bundle exec jekyll clean

# Rebuild
./dev.sh
```

### Livereload Not Working

```bash
# Check if using correct URL (not 0.0.0.0)
# Use http://localhost:4000 or http://127.0.0.1:4000
```

## Deployment

### GitHub Pages (Current Setup)

Automatic deployment on push to main/master:

```bash
git add .
git commit -m "Your commit message"
git push origin main
```

Site will be live in 1-2 minutes at your custom domain or `username.github.io`.

### Manual Deployment

To deploy to other platforms (Netlify, Vercel, etc.):

```bash
# Build the site
bundle exec jekyll build

# Output is in _site/ directory
# Upload contents to your hosting provider
```

## Maintenance

### Update Dependencies

```bash
# Update Ruby gems
bundle update

# Update specific gem
bundle update jekyll

# Check for outdated gems
bundle outdated
```

### Security Updates

Dependabot will automatically create PRs for security updates. Review and merge them regularly.

### Backup

```bash
# Your content is already in Git
# Just make sure to push regularly

# To backup locally
git clone https://github.com/yourusername/yourrepo.git backup/
```

## Performance Tips

1. **Optimize Images:** Use compressed images (JPEG/WebP)
2. **Enable Incremental Builds:** `./dev.sh --incremental`
3. **Use CDN:** Consider Cloudflare for image/asset delivery
4. **Minimize Plugins:** Only use necessary Jekyll plugins

## Advanced Features

### Adding Custom Pages

Create a new `.md` file in the root:

```markdown
---
layout: page
title: My New Page
permalink: /new-page/
---

Content here...
```

### Custom Navigation

Edit `_config.yml`:

```yaml
plainwhite:
  navigation:
    - title: Home
      url: "/"
    - title: Custom Page
      url: "/custom-page"
```

### Newsletter Integration

Add to your layout or page:

```html
<!-- Mailchimp, ConvertKit, Substack, etc. -->
<form action="your-signup-url" method="post">
  <input type="email" name="email" placeholder="Email">
  <button type="submit">Subscribe</button>
</form>
```

## FAQ

**Q: How do I change the theme?**
A: Modify the `remote_theme` in `_config.yml` or add your own custom styles in `_sass/`.

**Q: Can I use custom Jekyll plugins?**
A: On GitHub Pages, only [approved plugins](https://pages.github.com/versions/) work. For custom plugins, deploy to Netlify/Vercel.

**Q: How do I add comments?**
A: Disqus is already configured. Edit `_config.yml` to change the shortname or use alternatives like Utterances.

**Q: How do I add a contact form?**
A: A contact form using Formspree is already in `contact.md`. Update with your Formspree endpoint.

## Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [Plainwhite Theme](https://github.com/samarsault/plainwhite-jekyll)
- [GitHub Pages Docs](https://docs.github.com/en/pages)
- [Markdown Guide](https://www.markdownguide.org/)
- [IMPROVEMENTS.md](IMPROVEMENTS.md) - Detailed improvement recommendations

## Contributing

Contributions are welcome! Here's how:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE.txt](LICENSE.txt) file for details.

## Contact

**Himanshu Awasthi**
- Twitter: [@89hardy](https://twitter.com/89hardy)
- LinkedIn: [in/ha89](https://linkedin.com/in/ha89)
- GitHub: [@89hardy](https://github.com/89hardy)
- Email: himanshuawasthi9@gmail.com

**Project Link:** [himanshuawasthi.com](https://himanshuawasthi.com)

---

Made with ❤️ using [Jekyll](https://jekyllrb.com/) and [plainwhite theme](https://github.com/samarsault/plainwhite-jekyll)

# Blog CMS

A simple Content Management System for your Jekyll blog.

## Features

- Create, edit, and delete blog posts
- Markdown editor with preview
- Image upload support
- Categories and tags management
- Automatic frontmatter handling

## Setup

1. Clone this repository next to your Jekyll blog:
```bash
git clone https://github.com/yourusername/blog-cms.git
cd blog-cms
```

2. Create a virtual environment and install dependencies:
```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

3. Copy `.env.example` to `.env` and configure your settings:
```bash
cp .env.example .env
```

4. Edit `.env` with your credentials and paths:
```
SECRET_KEY=your-secret-key
ADMIN_USERNAME=your-username
ADMIN_PASSWORD=your-password
BLOG_PATH=path/to/your/jekyll/blog
GITHUB_TOKEN=your-github-token
GITHUB_USERNAME=your-github-username
```

5. Run the application:
```bash
python run.py
```

6. Visit `http://localhost:5000` and log in with your credentials.

## Usage

1. **Creating a Post**
   - Click "New Post" in the sidebar
   - Fill in the title, categories, and tags
   - Write your content in Markdown
   - Click "Save" to create the post

2. **Editing a Post**
   - Click "Posts" in the sidebar
   - Find the post you want to edit
   - Click "Edit"
   - Make your changes
   - Click "Save"

3. **Uploading Images**
   - While editing a post, click the image button in the editor
   - Select your image file
   - The image will be uploaded and inserted into your post

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
