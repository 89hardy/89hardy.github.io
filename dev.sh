#!/bin/bash

# Jekyll Development Server Helper
# Usage: ./dev.sh [options]

set -e

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}   Jekyll Development Server${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Check if bundle is installed
if ! command -v bundle &> /dev/null; then
    echo -e "${YELLOW}Bundler not found. Installing...${NC}"
    gem install bundler
fi

# Check if dependencies are installed
if [ ! -d "vendor/bundle" ] && [ ! -f "Gemfile.lock" ]; then
    echo -e "${YELLOW}Installing dependencies...${NC}"
    bundle install
    echo ""
fi

# Parse command line options
SHOW_DRAFTS=""
LIVERELOAD="--livereload"
INCREMENTAL=""
HOST="127.0.0.1"
PORT="4000"

while [[ $# -gt 0 ]]; do
    case $1 in
        --drafts|-d)
            SHOW_DRAFTS="--drafts"
            shift
            ;;
        --no-livereload)
            LIVERELOAD=""
            shift
            ;;
        --incremental|-i)
            INCREMENTAL="--incremental"
            shift
            ;;
        --host)
            HOST="$2"
            shift 2
            ;;
        --port|-p)
            PORT="$2"
            shift 2
            ;;
        --help|-h)
            echo "Usage: ./dev.sh [options]"
            echo ""
            echo "Options:"
            echo "  -d, --drafts        Show draft posts"
            echo "  -i, --incremental   Enable incremental build"
            echo "  --no-livereload     Disable live reload"
            echo "  --host HOST         Set host (default: 127.0.0.1)"
            echo "  -p, --port PORT     Set port (default: 4000)"
            echo "  -h, --help          Show this help message"
            echo ""
            exit 0
            ;;
        *)
            echo -e "${YELLOW}Unknown option: $1${NC}"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# Display configuration
echo -e "${GREEN}Configuration:${NC}"
echo -e "  Host: ${YELLOW}${HOST}${NC}"
echo -e "  Port: ${YELLOW}${PORT}${NC}"
echo -e "  Live Reload: ${YELLOW}$([ -n "$LIVERELOAD" ] && echo "enabled" || echo "disabled")${NC}"
echo -e "  Show Drafts: ${YELLOW}$([ -n "$SHOW_DRAFTS" ] && echo "yes" || echo "no")${NC}"
echo -e "  Incremental: ${YELLOW}$([ -n "$INCREMENTAL" ] && echo "yes" || echo "no")${NC}"
echo ""
echo -e "${GREEN}Starting server...${NC}"
echo -e "${YELLOW}Press Ctrl+C to stop${NC}"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Start Jekyll server
bundle exec jekyll serve \
    --host "$HOST" \
    --port "$PORT" \
    $LIVERELOAD \
    $SHOW_DRAFTS \
    $INCREMENTAL
