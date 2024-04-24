#!/bin/bash

# Function to handle errors
handle_error() {
    echo "Error: $1" >&2
    exit 1
}

# Check if virtual environment exists, create if not
if [ ! -d ".venv" ]; then
    python3 -m venv .venv || handle_error "Failed to create virtual environment"
fi

# Activate virtual environment
source .venv/bin/activate || handle_error "Failed to activate virtual environment"

# Upgrade pip
pip install --upgrade pip || handle_error "Failed to upgrade pip"

# Install Python dependencies
pip install -r requirements.txt || handle_error "Failed to install Python dependencies"

# Install or upgrade npm
npm install -g npm || handle_error "Failed to install or upgrade npm"

# Create Django project
django-admin startproject project . || handle_error "Failed to create Django project"

# Move settings, wsgi, and urls files to project directory
mv -f settings.py project/ || handle_error "Failed to move settings.py"
mv -f wsgi.py project/ || handle_error "Failed to move wsgi.py"
mv -f urls.py project/ || handle_error "Failed to move urls.py"

# Initialize Git repository
git init || handle_error "Failed to initialize Git repository"

# Add files to Git
git add . || handle_error "Failed to add files to Git"

# Commit initial changes
git commit -m "Initial commit" || handle_error "Failed to commit initial changes"

# Rename default branch to 'main'
git branch -M main || handle_error "Failed to rename default branch"

# Install Tailwind CSS
npm install -D tailwindcss || handle_error "Failed to install Tailwind CSS"

echo "Setup completed successfully."

