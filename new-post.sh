#!/bin/bash

# Simple Jekyll Post Creator
# Usage: ./new-post.sh

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}   Jekyll Post Creator${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Get post title
read -p "$(echo -e ${GREEN}Post title:${NC} )" title

if [ -z "$title" ]; then
    echo -e "${RED}Error: Title cannot be empty${NC}"
    exit 1
fi

# Get description
read -p "$(echo -e ${GREEN}Short description:${NC} )" description

# Get categories (comma-separated)
read -p "$(echo -e ${GREEN}Categories (comma-separated):${NC} )" categories_input

# Get tags (comma-separated)
read -p "$(echo -e ${GREEN}Tags (comma-separated):${NC} )" tags_input

# Ask if it should be a draft
read -p "$(echo -e ${GREEN}Create as draft? (y/N):${NC} )" is_draft

# Generate filename-safe slug from title
slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-+|-+$//g')

# Get current date in Jekyll format
post_date=$(date +"%Y-%m-%d")
post_datetime=$(date +"%Y-%m-%d %H:%M:%S %z")

# Determine file location
if [[ "$is_draft" =~ ^[Yy]$ ]]; then
    post_dir="_drafts"
    filename="${slug}.md"
else
    post_dir="_posts"
    filename="${post_date}-${slug}.md"
fi

filepath="${post_dir}/${filename}"

# Check if file already exists
if [ -f "$filepath" ]; then
    echo -e "${RED}Error: File already exists: ${filepath}${NC}"
    exit 1
fi

# Process categories into YAML array
if [ -n "$categories_input" ]; then
    IFS=',' read -ra CATS <<< "$categories_input"
    categories_yaml="["
    for i in "${!CATS[@]}"; do
        cat="${CATS[$i]}"
        cat=$(echo "$cat" | xargs) # trim whitespace
        if [ $i -eq 0 ]; then
            categories_yaml+="\"$cat\""
        else
            categories_yaml+=", \"$cat\""
        fi
    done
    categories_yaml+="]"
else
    categories_yaml="[]"
fi

# Process tags into YAML array
if [ -n "$tags_input" ]; then
    IFS=',' read -ra TAGS <<< "$tags_input"
    tags_yaml="["
    for i in "${!TAGS[@]}"; do
        tag="${TAGS[$i]}"
        tag=$(echo "$tag" | xargs) # trim whitespace
        if [ $i -eq 0 ]; then
            tags_yaml+="\"$tag\""
        else
            tags_yaml+=", \"$tag\""
        fi
    done
    tags_yaml+="]"
else
    tags_yaml="[]"
fi

# Create post with frontmatter
cat > "$filepath" << EOF
---
layout: post
title: "$title"
date: $post_datetime
categories: $categories_yaml
tags: $tags_yaml
description: "$description"
---

Write your post content here.

## Introduction

Start with an engaging introduction that hooks the reader.

## Main Content

Organize your thoughts with clear headings and sections.

### Code Examples

\`\`\`python
# Add code examples like this
def hello_world():
    print("Hello, World!")
\`\`\`

### Lists

- Point one
- Point two
- Point three

### Blockquotes

> Quote important insights or reference other sources.

## Conclusion

Wrap up your thoughts and provide key takeaways.

---

**What do you think?** Leave a comment below or reach out on [Twitter](https://twitter.com/89hardy).
EOF

echo ""
echo -e "${GREEN}✓ Post created successfully!${NC}"
echo -e "${YELLOW}Location:${NC} ${filepath}"
echo ""

# Ask if user wants to open the file
read -p "$(echo -e ${GREEN}Open in editor? (Y/n):${NC} )" open_editor

if [[ ! "$open_editor" =~ ^[Nn]$ ]]; then
    # Try to detect the best editor
    if [ -n "$EDITOR" ]; then
        $EDITOR "$filepath"
    elif command -v code &> /dev/null; then
        code "$filepath"
    elif command -v vim &> /dev/null; then
        vim "$filepath"
    elif command -v nano &> /dev/null; then
        nano "$filepath"
    else
        echo -e "${YELLOW}No editor found. Please open manually:${NC} ${filepath}"
    fi
fi

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}Next steps:${NC}"
echo ""
if [[ "$is_draft" =~ ^[Yy]$ ]]; then
    echo -e "  1. Edit the draft: ${YELLOW}${filepath}${NC}"
    echo -e "  2. Preview with: ${YELLOW}bundle exec jekyll serve --drafts${NC}"
    echo -e "  3. When ready, move to _posts with date: ${YELLOW}mv ${filepath} _posts/${post_date}-${slug}.md${NC}"
else
    echo -e "  1. Edit the post: ${YELLOW}${filepath}${NC}"
    echo -e "  2. Preview locally: ${YELLOW}bundle exec jekyll serve${NC}"
    echo -e "  3. Commit and push: ${YELLOW}git add ${filepath} && git commit -m \"Add post: ${title}\" && git push${NC}"
fi
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
