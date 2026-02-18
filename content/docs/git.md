+++
title = "Git Setup"
description = "Sync your notes with Git for backup and multi-device access"
weight = 1

[extra]
sidebar_group = "Guides"
+++

# Git Setup

Cache stores your notes as plain markdown files in a [Git](https://en.wikipedia.org/wiki/Git) repository that you control. Your data lives on your own Git provider—GitHub, GitLab, Bitbucket, Gitea, or any self-hosted solution. Cache never sees or stores your notes.

---

## Requirements

- **HTTPS authentication** (SSH not currently supported)
- **Personal Access Token** (recommended) or username + password
- **Any Git provider** that supports HTTPS

---

## GitHub Quick Start

> **Self-hosted alternative:** [Gitea](https://about.gitea.com/products/gitea/) gives you full control over your data and privacy.

New to Git? GitHub is a popular Git hosting platform owned by Microsoft—convenient and beginner-friendly with free private repositories. Here's how to get started:

### 1. Create a GitHub Account

Visit [github.com](https://github.com) and sign up for a free account.

### 2. Create a Private Repository

This is where Cache stores your notes.

1. Go to [github.com/new](https://github.com/new)
2. Name it something like `notes` or `cache-notes`
3. Select **Private** visibility (keeps your notes visible only to you)
4. **Important**: Leave all initialization options off—the repository must be empty (no README, no .gitignore, no license)
5. Click **Create repository**
6. Note the **HTTPS** URL for your repository—Cache will need this. It should look like `https://github.com/username/repository.git`

<img src="/images/github_new_repository.webp" alt="GitHub new repository settings" class="screenshot">

### 3. Generate a Personal Access Token

This lets Cache securely sync with your repository.

1. Go to [GitHub Personal Access Tokens](https://github.com/settings/personal-access-tokens) → [Generate new token](https://github.com/settings/personal-access-tokens/new)
2. Enter a name and set an expiration
3. Under **Repository access**, select **Only select repositories** and choose your notes repository
4. Under **Permissions**, click **Add permissions**, set **Contents** to **Read and write**
5. Click **Generate token** and save it somewhere secure (e.g., a password manager)—you'll need it again when setting up additional devices

<img src="/images/github_new_token.webp" alt="GitHub fine-grained token settings" class="screenshot">

### 4. Connect in Cache

1. Open Cache and navigate to **Repository Settings**
2. Enter your repository URL: `https://github.com/USERNAME/REPO.git`
3. Select **Personal Access Token** authentication
4. Enter your GitHub username
5. Paste your Personal Access Token as the password
6. Cache will initialize your repository

<img src="/images/git_setup.webp" alt="Cache repository setup" class="screenshot">

---

## Syncing to Additional Devices

To sync your notes to another device:

1. Open Cache and select **Returning User**
2. Enter your repository URL and token
3. Cache will clone and sync your existing notes

All devices stay in sync through Git. Changes sync automatically when the app is open.

<img src="/images/git_clone.webp" alt="Cache clone repository settings" class="screenshot">

---

## Other Git Providers

Cache works with any Git provider that supports HTTPS:

- **GitLab**: Use a Personal Access Token with `read_repository` and `write_repository` scopes
- **Bitbucket**: Use an App Password with repository read/write permissions
- **Gitea**: Use an Access Token with repository read/write permissions
- **Self-hosted**: Any Git server accessible via HTTPS

---

## Limitations

- **HTTPS only**: SSH authentication is not currently supported
- **Empty repositories**: New repositories must be empty (no README or .gitignore)
- **Token permissions**: Ensure your token has repository read/write access
- **Network required**: Initial clone and sync operations require internet connectivity
