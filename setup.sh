#!/bin/bash

echo "Welcome to Magic CMS Setup!"

# Prompt user for input with default values
read -p "Enter Site Title (Default: My Awesome Site): " siteTitle
siteTitle=${siteTitle:-'My Awesome Site'}

read -p "Enter Site Description (Default: A simple Node.js project with Express and EJS): " siteDescription
siteDescription=${siteDescription:-'A simple Node.js project with Express and EJS'}

read -p "Enter Author Name (Default: Author Name): " author
author=${author:-'Author Name'}

read -p "Enter Keywords (Default: node, express, ejs, seo): " keywords
keywords=${keywords:-'node, express, ejs, seo'}

read -p "Choose a package manager [npm/yarn] (Default: npm): " packageManager
packageManager=${packageManager:-'npm'}

if [ "$packageManager" != "npm" ] && [ "$packageManager" != "yarn" ]; then
  echo "Invalid package manager selected! Please choose either npm or yarn."
  exit 1
fi

# Initialize a new project
echo "Initializing a new Node.js project..."
if [ "$packageManager" == "npm" ]; then
  npm init -y
elif [ "$packageManager" == "yarn" ]; then
  yarn init -y
fi

# Install necessary packages
echo "Installing Express and EJS using $packageManager..."
if [ "$packageManager" == "npm" ]; then
  npm install express ejs
elif [ "$packageManager" == "yarn" ]; then
  yarn add express ejs
fi

# Call content-generator.sh with the necessary arguments
chmod +x content-generator.sh
./content-generator.sh "$siteTitle" "$siteDescription" "$author" "$keywords"

echo "Project has been set up successfully!"
