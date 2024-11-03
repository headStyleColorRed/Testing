#!/bin/bash
# https://github.com/headStyleColorRed/Testing.git

# Check if a repository URL was passed as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <repository-url>"
    exit 1
fi

REPO_URL=$1
REPO_DIR=$(basename "$REPO_URL" .git)

# Clone the repository if it doesn't exist
if [ ! -d "$REPO_DIR" ]; then
    git clone "$REPO_URL"
fi

# Navigate to the repository
cd "$REPO_DIR" || { echo "Repository not found"; exit 1; }

# Infinite loop
while true; do
    # Fetch the latest changes from the remote repository
    git fetch origin

    # Check if there are any changes in the repository
    if git diff --quiet origin/main; then
        echo "No changes detected in the repository."
    else
        echo "Changes detected in the repository."
        # Optionally, you can pull changes or take other actions here
        git pull
    fi

    # Wait for 30 minutes (10 seconds)
    sleep 10
done
