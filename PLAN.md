# mkproject Development Plan

## Project Overview

mkproject is a simple bash script for scaffolding new projects with sensible defaults. It creates a new project directory with common configuration files (.gitignore, .editorconfig, .prettierrc, LICENSE, README) and initializes a git repository, preventing common mistakes like accidentally pushing .env files.

**Tech Stack:** Bash, Git

## Current State

- Core script (`mkproject.sh`) functional
- Template system with user customization via `~/.config/mkproject/`
- Configuration via `.env` file for defaults
- Basic files included: .gitignore, README.md, LICENSE.md, .editorconfig, .prettierrc, .vscode/settings.json
- Published on GitHub with releases

## Phase 1: Enhanced Templates (Weeks 1-2)

### Goals
- Multiple project type templates
- Interactive template selection
- Language-specific configurations

### Deliverables
- [ ] Template categories (web, api, cli, library)
- [ ] Interactive menu for template selection
- [ ] Node.js template with package.json
- [ ] Python template with pyproject.toml
- [ ] Go template with go.mod
- [ ] Rust template with Cargo.toml

## Phase 2: Advanced Features (Weeks 3-4)

### Goals
- Git remote setup automation
- Dependency installation
- Post-creation hooks

### Deliverables
- [ ] GitHub repo creation integration (`gh repo create`)
- [ ] GitLab/Bitbucket support
- [ ] Auto-install dependencies based on project type
- [ ] Custom post-creation hook scripts
- [ ] Template variables (author, license, description)
- [ ] Dry-run mode for previewing output

## Phase 3: Distribution & Ecosystem (Weeks 5-6)

### Goals
- Easy installation methods
- Community templates
- Documentation

### Deliverables
- [ ] Homebrew formula
- [ ] AUR package
- [ ] npm wrapper for cross-platform
- [ ] Community template repository
- [ ] Comprehensive documentation
- [ ] Template contribution guide

## Success Metrics

| Metric | Target |
|--------|--------|
| Installation methods | 3+ (brew, npm, manual) |
| Built-in templates | 6+ project types |
| GitHub stars | 50+ |
| Community templates | 5+ contributed |

## Timeline Summary

| Phase | Duration | Focus |
|-------|----------|-------|
| Phase 1 | Weeks 1-2 | Multiple templates, interactive selection |
| Phase 2 | Weeks 3-4 | Git integration, hooks, variables |
| Phase 3 | Weeks 5-6 | Distribution, community, docs |
