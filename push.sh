#!/bin/bash

filename=version

# Read current version from file
current_version=$(<"$filename")

# Calculate new version
new_version=$(echo $current_version | awk -F. -v OFS=. '{$NF = $NF + 1; print}')

# echo $new_version

# Prompt user for commit message
read -p "Enter commit message: " commit

# Commit changes
git add .
git commit -m "$commit"

# Push changes to remote master branch
git push origin main

# Tag the commit with the new version
git tag "v$new_version"

# Push the tag to the remote repository
git push origin "v$new_version"

# Replace file content with the new release version
echo "$new_version" > "$filename"

