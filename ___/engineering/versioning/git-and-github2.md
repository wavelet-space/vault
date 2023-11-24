---
status: draft
---

# Git and GitHub guide

## Motivation

As a developer I am able to use Git and GitHub service for development and colaboration on projects.

## Local machine settings

Pokud pracujeme sami a potřebujem verzovat projekt, použijeme nástroj `git`.

### Configure default editor

Setup the Visual Studio Code as a Git default editor.

    git config --global core.editor "code --wait"

### Configure name and email

    git config --global user.name "your name"
    git config --global user.email "your@email.com"

### Configure SSH a PGP for secure access

    ...

## Project colaboration workflow

Use the following branching model.

- The main branch has name `main`.
- All the branches for a new features and fixes are made from the main branch with these prefixes:
  - `bugfix/` e.g. `bugfix/<bugfix-name>`
  - `feature/` e.g. `feature/<feature-name>`
  - `release/` e.g  `release/<version-number>`
