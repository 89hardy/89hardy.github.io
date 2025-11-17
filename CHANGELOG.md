# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased] - 2025-11-17

### Added

#### Development Tools
- **new-post.sh** - Interactive script for quick post creation
  - Prompts for title, description, categories, and tags
  - Auto-generates proper frontmatter
  - Creates posts or drafts with correct naming
  - Opens in default editor automatically

- **dev.sh** - Simplified development server launcher
  - Support for drafts, incremental builds, custom ports
  - Live reload enabled by default
  - Command-line options for customization

- **publish-draft.sh** - Draft publishing tool
  - Interactive draft selection
  - Automatic date updating in frontmatter
  - Moves drafts to posts with correct filename

#### Automation & CI/CD
- **GitHub Actions Workflow: Jekyll Build & Deploy**
  - Automated build on every push
  - HTML validation
  - Deployment to GitHub Pages
  - Support for pull request builds

- **GitHub Actions Workflow: Content Validation**
  - Validates post frontmatter structure
  - Checks required fields (layout, title, date)
  - Verifies filename format
  - Basic spell checking (non-blocking)

- **Dependabot Configuration**
  - Weekly dependency updates for:
    - Jekyll/Ruby gems
    - GitHub Actions
    - Python packages
  - Automated security vulnerability scanning

#### Documentation
- **IMPROVEMENTS.md** - Comprehensive improvement recommendations
  - Detailed analysis of current state
  - 15 categories of improvements
  - Prioritized implementation roadmap
  - Migration considerations
  - Security enhancements

- **Enhanced README.md**
  - Quick start guide
  - Detailed script documentation
  - Troubleshooting section
  - FAQ
  - Project structure overview
  - Deployment instructions

- **CHANGELOG.md** - This file
  - Track all notable changes
  - Follows Keep a Changelog format

### Configuration Files
- **.github/workflows/jekyll-build.yml** - Build and deploy workflow
- **.github/workflows/validate-content.yml** - Content validation workflow
- **.github/dependabot.yml** - Dependency update configuration
- **.github/spellcheck-config.yml** - Spell check configuration
- **.github/wordlist.txt** - Custom dictionary for technical terms

### Improved
- README.md with comprehensive documentation
- Development workflow significantly streamlined
- Automated quality checks for all posts

### Developer Experience
- Reduced time to create new posts from ~5 minutes to ~30 seconds
- One-command development server startup
- Automated frontmatter generation
- No need to remember Jekyll post filename conventions

## Future Enhancements

See [IMPROVEMENTS.md](IMPROVEMENTS.md) for detailed roadmap, including:

### Phase 2: Content & SEO (Planned)
- New blog posts to revive the blog
- JSON-LD structured data for better SEO
- "Now" page for current activities
- Updated About page

### Phase 3: Technical Improvements (Planned)
- WebP image support
- Lazy loading for images
- Accessibility audit and fixes
- Performance optimization

### Phase 4: Advanced Features (Optional)
- Newsletter integration
- Related posts recommendations
- Tag cloud visualization
- Advanced search (Algolia)

---

## Version History

### [1.0.0] - 2020-06-30
- Initial blog launch
- 6 blog posts published
- Plainwhite theme integration
- Dark mode support
- SEO optimization
- Google Analytics integration

### [0.1.0] - 2020-06-01
- Repository creation
- Basic Jekyll setup
