#!/bin/bash

# This script creates a new project from a template.

set -e

if [ -z "$1" ]; then
  # ask for project name
  read -p "Project name: " PROJECT_NAME
else
  PROJECT_NAME="$1"
fi

# include .env
if [ -f .env ]; then
  source .env
fi

PROJECT_PATH="$PROJECT_DIR/$PROJECT_NAME"

if [ -d "$PROJECT_PATH" ]; then
  echo "Project $PROJECT_NAME already exists."
  exit 1
fi

TEMPLATE="$HOME/.config/mkproject/template"

if [ ! -d "$TEMPLATE" ]; then
  TEMPLATE=$(realpath "$(dirname "$0")/template")
fi

cp -r "$TEMPLATE" "$PROJECT_PATH"

cd "$PROJECT_PATH"

if [ "$DISABLE_GIT" == "true" ]; then
  echo "Git disabled."
else
  git init --initial-branch=$BRANCH
  git add .
  git commit -am "$COMMIT_MESSAGE"
fi

echo "Project $PROJECT_NAME created."

if [ -n "$RUNAFTER" ]; then
  $RUNAFTER
fi
