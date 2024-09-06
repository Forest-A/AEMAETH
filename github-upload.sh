#!/bin/bash

# Check if both the GitHub repository URL and the folder path are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <GitHub-repo-URL> <local-folder-path>"
  exit 1
fi

REPO_URL="$1"
FOLDER_PATH="$2"

# Change to the provided folder path
if [ -d "$FOLDER_PATH" ]; then
  cd "$FOLDER_PATH"
else
  echo "The folder path provided does not exist."
  exit 1
fi

# Initialize git if not already initialized
if [ ! -d ".git" ]; then
  echo "Initializing git repository..."
  git init
  git remote add origin "$REPO_URL"
fi

# Check if the remote is set correctly
git remote -v | grep "$REPO_URL" > /dev/null
if [ $? -ne 0 ]; then
  echo "Remote URL does not match. Setting correct remote URL..."
  git remote set-url origin "$REPO_URL"
fi

# Add all changes to git
echo "Adding files to git..."
git add .

# Commit changes with a default or custom message
read -p "Enter commit message: " commit_message
if [ -z "$commit_message" ]; then
  commit_message="Automatic upload: $(date)"
fi
git commit -m "$commit_message"

# Push changes to GitHub
echo "Pushing to GitHub..."
git branch -M main  # Ensure branch is 'main'
git push -u origin main
