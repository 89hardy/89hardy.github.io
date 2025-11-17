# Site Improvements & Recommendations

**Generated:** 2025-11-17
**Repository:** 89hardy.github.io

## Executive Summary

This document outlines recommended updates, improvements, and modernization strategies for the Jekyll-based personal website. The site is well-architected but has been dormant since mid-2020 and could benefit from dependency updates, streamlined workflows, and modern features.

---

## 1. Dependency Updates

### Current Status
- ✅ Jekyll 4.3.2 (relatively recent)
- ✅ Modern Jekyll plugins
- ⚠️ Flask CMS dependencies (2024 versions, should check for security updates)

### Recommendations

#### Ruby/Jekyll Dependencies (Gemfile)
```ruby
# Recommended updates:
gem "jekyll", "~> 4.3.4" # Latest stable
gem "jekyll-feed", "~> 0.17.0" # Current
gem "jekyll-seo-tag", "~> 2.8.0" # Current
gem "jekyll-sitemap", "~> 1.4.0" # Current
```

**Action:** Run `bundle update` to get latest patch versions within constraints.

#### Python Dependencies (requirements.txt)
Current versions are from early 2024. Recommend updating to latest:
```
Flask==3.1.0
Flask-Login==0.6.3
python-dotenv==1.0.1
Werkzeug==3.1.3
PyGithub==2.5.0
Markdown==3.7
python-frontmatter==1.1.0
Pillow==11.0.0
```

**Security Note:** Older Pillow versions may have vulnerabilities. Update recommended.

---

## 2. Simplified Post Creation

### Current Situation
- Flask CMS exists but is overly complex for simple post creation
- Requires Python environment, configuration, database setup
- No quick way to create posts from command line

### Implemented Solution: `new-post.sh`

Created a simple bash script that:
- ✅ Interactive prompts for post details
- ✅ Auto-generates filename with date
- ✅ Creates proper YAML frontmatter
- ✅ Opens in default editor
- ✅ No dependencies except bash

**Usage:**
```bash
./new-post.sh
```

### Alternative: GitHub Actions Post Creator

Could add a workflow that creates posts via:
- GitHub Issues (create issue → auto-convert to post)
- Manual workflow dispatch with form inputs
- Web-based UI without local setup

---

## 3. Automation & CI/CD

### Current Status
- No GitHub Actions workflows
- Relying on GitHub Pages default Jekyll build
- No automated testing or validation

### Recommended GitHub Actions Workflows

#### A. Jekyll Build & Deploy (Quality Checks)
**File:** `.github/workflows/jekyll.yml`

Features:
- ✅ Automated Jekyll build on every push/PR
- ✅ HTML validation
- ✅ Link checking
- ✅ Spell checking (optional)
- ✅ Deploy preview for PRs

#### B. Dependency Updates
**File:** `.github/workflows/dependency-update.yml`

Features:
- ✅ Weekly Bundler dependency updates
- ✅ Automated security vulnerability scanning
- ✅ Auto-create PRs for updates

#### C. Content Validation
**File:** `.github/workflows/validate-content.yml`

Features:
- ✅ Validate post frontmatter
- ✅ Check for required fields
- ✅ Ensure proper date formatting
- ✅ Verify image references exist

---

## 4. Content Improvements

### Recommendations for New Posts

**High-Impact Topics (Based on Existing Content):**
1. **"4 Years Later: Reflections on Serverless"** - Update your 2020 serverless post
2. **"Product Management in 2025"** - Share PM insights
3. **"From Code to Cockpit"** - Aviation + Tech crossover
4. **"The Art of Being Fast: Follow-up"** - Revisit "The Notion of Being Slow"
5. **"Tools I Use Daily"** - Developer productivity

**Content Strategy:**
- Aim for 1-2 posts per month minimum
- Mix technical deep-dives with personal reflections
- Add "series" or "tags" to group related posts
- Consider guest posts or interviews

### Missing Content Ideas
- **Resume/CV page** - Separate from About
- **Now page** - What you're currently working on (inspired by nownownow.com)
- **Uses page** - Hardware, software, gear
- **Newsletter signup** - Build email list
- **Project case studies** - Deep dives on specific projects

---

## 5. Technical Enhancements

### A. Performance Optimizations

**Image Optimization:**
- ✅ jekyll-image-optim already configured
- Add WebP format support
- Implement lazy loading
- Consider using a CDN (Cloudflare)

**Build Performance:**
```yaml
# _config.yml additions
incremental: true
liquid:
  error_mode: strict
  strict_filters: true
```

### B. SEO Improvements

**Already Implemented:** ✅
- Sitemap
- SEO meta tags
- Social media cards
- robots.txt

**Additional Recommendations:**
- Add JSON-LD structured data for articles
- Create dedicated landing pages for key topics
- Add internal linking strategy
- Create pillar content with topic clusters

### C. Analytics & Monitoring

**Current:** Google Analytics (G-NRC69TXSJF)

**Enhancements:**
- Add privacy-focused alternative (Plausible/Fathom)
- Set up Google Search Console
- Monitor Core Web Vitals
- Track 404 errors

### D. Accessibility

**Audit & Fix:**
- Run WAVE or axe accessibility checker
- Ensure proper heading hierarchy
- Add alt text to all images
- Verify keyboard navigation
- Test screen reader compatibility

---

## 6. Development Experience

### Recommended Scripts

#### A. Local Development Helper
**File:** `dev.sh`
```bash
#!/bin/bash
# One-command development startup
bundle exec jekyll serve --drafts --livereload
```

#### B. Post Management
**File:** `scripts/publish-draft.sh`
- Move draft to _posts with correct date
- Update frontmatter automatically

#### C. Image Optimizer
**File:** `scripts/optimize-images.sh`
- Batch optimize all images
- Generate WebP versions
- Create thumbnails

### Docker Support

Create `Dockerfile` and `docker-compose.yml` for:
- Consistent development environment
- No Ruby version conflicts
- Easy onboarding for collaborators

---

## 7. Security Enhancements

### Current Issues

**_headers file:**
- ⚠️ Configured for Netlify, not GitHub Pages
- Won't work without custom server or Pages plugin

**Solutions:**

#### Option A: Migrate to Netlify
- Better control over headers
- Faster builds
- Deploy previews
- Form handling (better than Formspree)

#### Option B: Stay on GitHub Pages
- Remove _headers (not functional)
- Add security headers via meta tags where possible
- Document limitations

### Recommended Security Practices

1. **Dependency Scanning:**
   - Enable Dependabot on GitHub
   - Run `bundle audit` regularly
   - Monitor for CVEs

2. **Content Security:**
   - Sanitize any user inputs in forms
   - Use HTTPS everywhere (already doing)
   - Implement subresource integrity (SRI) for external scripts

3. **Access Control:**
   - Review and rotate API tokens
   - Use environment secrets for sensitive data
   - Limit repository access appropriately

---

## 8. Flask CMS Recommendations

### Current State
The Flask CMS at `/app` is functional but complex for personal use.

### Options:

#### Option A: Simplify & Improve
- Add Docker support
- Create one-click deployment (Heroku/Railway)
- Add preview functionality
- Improve UI with modern CSS framework

#### Option B: Replace with Alternatives
- **Forestry.io** - Git-based CMS (free tier)
- **Netlify CMS** - Open source, integrated
- **Tina CMS** - Modern, React-based
- **Decap CMS** - Fork of Netlify CMS (actively maintained)

#### Option C: Remove
- Use `new-post.sh` script instead
- Edit posts directly in GitHub web editor
- Use VS Code with extensions

**Recommendation:** Option C + enhanced scripts. Simpler is better for personal sites.

---

## 9. Testing Strategy

### Automated Tests

#### A. Content Tests
```ruby
# Test post frontmatter validation
RSpec.describe "Posts" do
  it "have required frontmatter fields" do
    # Verify title, date, categories exist
  end
end
```

#### B. Build Tests
- Ensure Jekyll builds without errors
- Validate generated HTML
- Check for broken links

#### C. Visual Regression
- Use Percy or Chromatic
- Catch unintended design changes

---

## 10. Migration Considerations

### Should You Stay on GitHub Pages?

**Pros:**
✅ Free
✅ Simple deployment (push to deploy)
✅ Custom domain support
✅ HTTPS by default

**Cons:**
❌ Limited build control
❌ No custom headers
❌ Can't use custom Jekyll plugins (only approved ones)
❌ No deploy previews
❌ Slower builds

### Alternatives to Consider

#### Netlify
- **Pros:** Headers, redirects, forms, deploy previews, faster builds
- **Cons:** Build minute limits on free tier
- **Migration:** Easy (just connect repo)

#### Vercel
- **Pros:** Excellent performance, generous free tier
- **Cons:** Primarily React/Next.js focused
- **Migration:** Moderate

#### Cloudflare Pages
- **Pros:** Unlimited builds, excellent CDN, generous limits
- **Cons:** Newer service, fewer integrations
- **Migration:** Easy

**Recommendation:** Stay on GitHub Pages unless you need specific features. Consider Cloudflare Pages for migration.

---

## 11. Implementation Priority

### Phase 1: Quick Wins (1-2 hours)
1. ✅ Create `new-post.sh` script
2. ⏳ Update dependencies (bundle update, pip update)
3. ⏳ Add GitHub Actions for build validation
4. ⏳ Create development helper scripts

### Phase 2: Content & SEO (Ongoing)
1. Write 2-3 new posts to revive blog
2. Update About page with recent info
3. Add Now page
4. Implement JSON-LD structured data

### Phase 3: Technical Improvements (4-6 hours)
1. Add WebP image support
2. Implement lazy loading
3. Accessibility audit and fixes
4. Performance optimization

### Phase 4: Advanced Features (Optional)
1. Newsletter integration
2. Related posts recommendations
3. Tag cloud visualization
4. Advanced search (Algolia)

---

## 12. Specific File Changes Needed

### Files to Update
```
_config.yml          # Add incremental builds, liquid strict mode
Gemfile              # Update dependency versions
requirements.txt     # Update Python packages
about.md             # Update bio, recent activities
README.md            # Add development instructions
```

### Files to Create
```
.github/workflows/jekyll.yml     # Build validation
.github/workflows/dependencies.yml # Auto-updates
scripts/new-post.sh              # Post creation
scripts/dev.sh                   # Dev helper
scripts/publish-draft.sh         # Draft management
now.md                           # What I'm doing now
uses.md                          # Tools and gear
```

### Files to Remove/Consider
```
_headers                # Doesn't work on GitHub Pages
app/                    # Complex Flask CMS (consider removing)
test.html               # Debug file?
debug.html              # Debug file?
pylint                  # Empty file
```

---

## 13. Documentation Improvements

### README.md Enhancement

Add sections:
- Local development setup
- Post creation workflow
- Deployment process
- Troubleshooting
- Contributing guidelines (if accepting contributions)

### Create CONTRIBUTING.md

If you plan to collaborate or open source:
- Code style guide
- Commit message format
- PR process
- Issue templates

---

## 14. Monitoring & Maintenance

### Ongoing Tasks

**Weekly:**
- Check analytics for broken links
- Review spam comments (if any)
- Monitor site performance

**Monthly:**
- Update dependencies
- Review and respond to GitHub security alerts
- Check for 404 errors in Search Console
- Backup site content

**Quarterly:**
- Content audit - update outdated posts
- Performance audit
- Accessibility review
- SEO review

---

## 15. Cost Analysis

**Current Setup: $0/month**
- GitHub Pages: Free
- Custom domain: ~$12/year (external)
- Formspree: Free tier

**If Migrating:**

Netlify:
- Free tier: 100GB bandwidth, 300 build minutes
- Pro: $19/month (if needed)

Cloudflare Pages:
- Free: Unlimited builds, requests
- No need to upgrade for personal site

**Recommendation:** Stay free. Current stack is sufficient.

---

## Summary of Immediate Actions

### Must Do (Today)
1. ✅ Create post creation script
2. Update dependencies (`bundle update`)
3. Add GitHub Actions workflow

### Should Do (This Week)
1. Write 1-2 new posts
2. Update About page
3. Remove unused files
4. Add development documentation

### Nice to Have (This Month)
1. Accessibility audit
2. Performance optimization
3. Add Now page
4. Set up automated dependency updates

---

## Questions to Consider

1. **Hosting:** Stay on GitHub Pages or migrate?
2. **CMS:** Keep Flask app, simplify it, or remove?
3. **Theme:** Keep plainwhite or customize further?
4. **Comments:** Keep Disqus or switch to privacy-friendly alternative?
5. **Analytics:** Keep Google Analytics or add privacy-focused option?
6. **Content cadence:** How often do you want to publish?

---

## Resources & References

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Plainwhite Theme](https://github.com/samarsault/plainwhite-jekyll)
- [Jekyll SEO Tag](https://github.com/jekyll/jekyll-seo-tag)
- [Web.dev Performance](https://web.dev/measure/)
- [WAVE Accessibility Tool](https://wave.webaim.org/)

---

## Conclusion

Your site has a solid foundation. The main improvements needed are:
1. **Revive content creation** - The biggest priority
2. **Streamline workflows** - Make posting easier
3. **Modernize tooling** - Add automation
4. **Enhance discoverability** - SEO and performance

The technical infrastructure is sound. Focus on creating great content and the rest will follow.

---

**Next Steps:** Review this document and let me know which improvements you'd like to prioritize. I can implement any of these recommendations immediately.
