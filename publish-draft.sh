#!/bin/bash

# Publish a draft post
# Usage: ./publish-draft.sh <draft-filename>

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

DRAFTS_DIR="_drafts"
POSTS_DIR="_posts"

# Check if draft filename provided
if [ -z "$1" ]; then
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}   Available Drafts${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""

    # List all drafts
    if [ -d "$DRAFTS_DIR" ] && [ "$(ls -A $DRAFTS_DIR 2>/dev/null)" ]; then
        drafts=($(ls -1 "$DRAFTS_DIR"))
        for i in "${!drafts[@]}"; do
            draft="${drafts[$i]}"
            # Extract title from frontmatter if possible
            title=$(grep -m 1 "^title:" "$DRAFTS_DIR/$draft" | sed 's/^title: *//; s/"//g' 2>/dev/null || echo "")
            if [ -n "$title" ]; then
                echo -e "  ${GREEN}$((i+1)).${NC} ${YELLOW}$draft${NC}"
                echo -e "      $title"
            else
                echo -e "  ${GREEN}$((i+1)).${NC} ${YELLOW}$draft${NC}"
            fi
        done
        echo ""
        echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo ""
        read -p "$(echo -e ${GREEN}Select draft number to publish (or filename):${NC} )" selection

        # Check if selection is a number
        if [[ "$selection" =~ ^[0-9]+$ ]]; then
            index=$((selection-1))
            if [ $index -ge 0 ] && [ $index -lt ${#drafts[@]} ]; then
                draft_file="${drafts[$index]}"
            else
                echo -e "${RED}Error: Invalid selection${NC}"
                exit 1
            fi
        else
            draft_file="$selection"
        fi
    else
        echo -e "${YELLOW}No drafts found in ${DRAFTS_DIR}${NC}"
        exit 0
    fi
else
    draft_file="$1"
fi

# Ensure .md extension
if [[ ! "$draft_file" =~ \.md$ ]] && [[ ! "$draft_file" =~ \.markdown$ ]]; then
    draft_file="${draft_file}.md"
fi

draft_path="${DRAFTS_DIR}/${draft_file}"

# Check if draft exists
if [ ! -f "$draft_path" ]; then
    echo -e "${RED}Error: Draft not found: ${draft_path}${NC}"
    exit 1
fi

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}   Publishing Draft${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Extract title for display
title=$(grep -m 1 "^title:" "$draft_path" | sed 's/^title: *//; s/"//g' 2>/dev/null || echo "Unknown")
echo -e "${GREEN}Draft:${NC} ${draft_file}"
echo -e "${GREEN}Title:${NC} ${title}"
echo ""

# Ask for publish date
read -p "$(echo -e ${GREEN}Publish date (YYYY-MM-DD) [today]:${NC} )" publish_date

if [ -z "$publish_date" ]; then
    publish_date=$(date +"%Y-%m-%d")
fi

# Validate date format
if ! [[ "$publish_date" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    echo -e "${RED}Error: Invalid date format. Use YYYY-MM-DD${NC}"
    exit 1
fi

# Generate post filename
post_filename="${publish_date}-${draft_file}"
post_path="${POSTS_DIR}/${post_filename}"

# Check if post already exists
if [ -f "$post_path" ]; then
    echo -e "${RED}Error: Post already exists: ${post_path}${NC}"
    exit 1
fi

# Create temporary file to update frontmatter
temp_file=$(mktemp)

# Update date in frontmatter
current_datetime="${publish_date} $(date +"%H:%M:%S %z")"
awk -v new_date="$current_datetime" '
BEGIN { in_frontmatter=0; frontmatter_count=0; date_updated=0 }
/^---$/ {
    frontmatter_count++
    if (frontmatter_count <= 2) {
        in_frontmatter = (frontmatter_count == 1)
    }
    print
    next
}
in_frontmatter && /^date:/ {
    print "date: " new_date
    date_updated=1
    next
}
in_frontmatter && frontmatter_count == 1 && /^---$/ {
    if (!date_updated) {
        print "date: " new_date
    }
    in_frontmatter=0
    print
    next
}
{ print }
' "$draft_path" > "$temp_file"

# Move draft to posts
mv "$temp_file" "$post_path"

echo -e "${GREEN}✓ Draft published successfully!${NC}"
echo -e "${YELLOW}Location:${NC} ${post_path}"
echo ""

# Ask if user wants to delete the draft
read -p "$(echo -e ${GREEN}Delete original draft? (y/N):${NC} )" delete_draft

if [[ "$delete_draft" =~ ^[Yy]$ ]]; then
    rm "$draft_path"
    echo -e "${GREEN}✓ Draft deleted${NC}"
fi

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}Next steps:${NC}"
echo ""
echo -e "  1. Review the post: ${YELLOW}${post_path}${NC}"
echo -e "  2. Preview locally: ${YELLOW}./dev.sh${NC}"
echo -e "  3. Commit and push: ${YELLOW}git add ${post_path} && git commit -m \"Publish: ${title}\" && git push${NC}"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
