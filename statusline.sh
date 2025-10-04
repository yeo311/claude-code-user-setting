#!/bin/bash
# Read JSON input from stdin
input=$(cat)

# Extract values using jq
MODEL_DISPLAY=$(echo "$input" | jq -r '.model.display_name')
CURRENT_DIR=$(echo "$input" | jq -r '.workspace.current_dir')

# Color codes
ORANGE="\033[38;5;220m"
LIME_GREEN="\033[38;5;154m"
RESET="\033[0m"

# Show git branch if in a git repo
GIT_BRANCH=""
if git rev-parse --git-dir > /dev/null 2>&1; then
    BRANCH=$(git branch --show-current 2>/dev/null)
    if [ -n "$BRANCH" ]; then
        GIT_BRANCH=" | $BRANCH"
    fi
fi

# Show Node.js version if installed
NODE_VERSION=""
if command -v node > /dev/null 2>&1; then
    VERSION=$(node -v 2>/dev/null)
    if [ -n "$VERSION" ]; then
        NODE_VERSION=" | ${LIME_GREEN}${VERSION}${RESET}"
    fi
fi

echo -e "${ORANGE}${MODEL_DISPLAY}${RESET} | ${CURRENT_DIR##*/}$GIT_BRANCH$NODE_VERSION"