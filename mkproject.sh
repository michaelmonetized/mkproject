#!/bin/bash

# This script creates a new project from a template.

set -e

INSTALL_DIR=$(dirname "$(realpath "$0")")

# Set sane defaults
PROJECT_DIR="$PWD"
BRANCH="main"
COMMIT_MESSAGE="initialized by michaelmonetized/mkproject"
RUNAFTER="code ."
DISABLE_GIT="false"

if [ -z "$1" ]; then
  # Ask for project name
  read -p "Project name: " PROJECT_NAME
else
  PROJECT_NAME="$1"
fi

CONFIG_PATH=$HOME/.config/mkproject

if [ ! -d "$CONFIG_PATH" ]; then
  mkdir -p "$CONFIG_PATH"
fi

USER_CONFIG=$CONFIG_PATH/.env
ORIG_CONFIG=$INSTALL_DIR/.env

if [ ! -f "$USER_CONFIG" ]; then
  cp "$ORIG_CONFIG" "$USER_CONFIG"
fi

source "$USER_CONFIG"

USER_TEMPLATE=$CONFIG_PATH/template
ORIG_TEMPLATE=$INSTALL_DIR/template

if [ ! -d "$USER_TEMPLATE" ]; then
  cp -r "$ORIG_TEMPLATE" "$USER_TEMPLATE"
fi

if [ ! -d "$PROJECT_DIR" ]; then
  echo "Project Directory $PROJECT_DIR does not exist"
  exit 1
fi

PROJECT_PATH="$PROJECT_DIR/$PROJECT_NAME"

if [ -d "$PROJECT_PATH" ]; then
  echo "Project $PROJECT_NAME already exists."
  exit 1
fi

cp -r "$USER_TEMPLATE" "$PROJECT_PATH"

cd "$PROJECT_PATH"

if [ "$DISABLE_GIT" == "true" ]; then
  echo "Git disabled."
else
  git init --initial-branch="$BRANCH"
  git add .
  git commit -am "$COMMIT_MESSAGE"
fi

echo "Project $PROJECT_NAME created."

if [ -n "$RUNAFTER" ]; then
  $RUNAFTER
  exit $?
else
  exit 0
fi
