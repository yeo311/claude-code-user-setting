#!/bin/bash

# Status line with directory, git branch, and Node.js version

# Read input JSON
input=$(cat)

# Get current directory from workspace
current_dir=$(echo "$input" | jq -r '.workspace.current_dir')

# Extract directory name
dir_name=$(basename "$current_dir")

# Get git branch (skip optional locks for performance)
branch=$(cd "$current_dir" && git -c core.useOptionalLocks=false rev-parse --abbrev-ref HEAD 2>/dev/null)

# Get Node.js version
node_version=$(node --version 2>/dev/null)

# ANSI color codes
CYAN='\033[96m'
LIGHT_PINK='\033[95m'
LIGHT_GREEN='\033[92m'
RESET='\033[0m'

# Icons (using Nerd Font icons)
GIT_ICON="󰘬"
NODE_ICON=""

# Build status line with colors
result=$(printf "${CYAN}%s${RESET}" "$dir_name")

if [ -n "$branch" ]; then
  result="${result}$(printf " on ${LIGHT_PINK} %s${RESET}" "$branch")"
fi

if [ -n "$node_version" ]; then
  result="${result}$(printf " via ${LIGHT_GREEN} %s${RESET}" "$node_version")"
fi

printf "%s\n" "$result"
