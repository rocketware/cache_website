+++
title = "Why Cache"
weight = 21

[extra]
sidebar_group = "About"
+++

# Why Cache

After years of bouncing between note-taking apps - and none of them solving the problems I actually had - I set out to build the app I always wanted. That was five years ago.

Hey, I'm Jimmy, an indie developer juggling several projects and platforms. My brain tends to be pretty good at storing intricate project, tech or obscure 'interesting-to-me' knowledge but generally pretty terrible at everything else; classic ADHD brain. I needed a tool I could rely on - a cache for my mind - somewhere to capture the minutiae and offload general life stuff before it falls out of my limited short-term RAM.

## What I needed from a note-taking app

After years of using almost every major note-taking app, I knew exactly what I needed - and what kept falling short.

- **It had to be fast, very fast** - opening, navigating, authoring. When an idea comes to mind or a note needs updating, there can't be friction.
- **It needed great search** - I've lost count of the times I couldn't find content I knew was in my notes. Most apps give you one result per file and call it a day - often highlighting the wrong section entirely.
- **Frictionless authoring** - flicking between raw markdown and rendered HTML is jarring and adds unnecessary friction.
- **Clean note source files** - every time I migrated between apps, the export resulted in a similar outcome: lost folder structure, files renamed to internal IDs, notes polluted with HTML and proprietary frontmatter. **My notes should be portable, and outlive the software I use to author them.**
- **Transparency and control** - app bugs, company shutdowns, policy changes - there are too many ways to lose access to your own notes. I wanted a solution where users own their data completely, no lock-in, no privacy trade-offs.
- **Track every single task** - if I create a task and don't complete it, it shouldn't fall off the radar. I needed something that surfaces incomplete tasks until they're resolved or deliberately cancelled.
- **Privacy** - I want to know that my notes aren't being scanned, profiled, used to train AI models, or sold to data brokers. I should control who has access to my notes - and the answer should default to nobody but me.

## What I built

It took a few years and several false starts, but when the pieces came together, it just felt right:

- **Git sync to your own backend** - your notes live on your Git provider (GitHub, GitLab, self-hosted - your choice). Cache never sees your data. Privacy, control, and portability in one stroke.
- **Fast local search** - SQLite-powered index on your device. Per-line results, works offline, instant.
- **Task tracking** - every checkbox across every note, tracked until resolved. Due dates inferred from journal entries or set explicitly.
- **Markdown as both authoring and presentation** - no awkward rendering layer. What you write is what you see, beautifully syntax-highlighted.
- **1:1 folder mapping** - your note structure maps directly to folders and files on disk. A note-focused file manager - beautifully simple and transparent.
- **Speed obsession** - starts in milliseconds, takes you straight to where you left off. Every transition is sub-60ms or non-existent. Custom UI built from the ground up with speed as the priority.
- **Custom interface and editor** - off-the-shelf components couldn't deliver the experience I wanted. I built a custom UI toolkit for full control over the interface and theming, and a custom text editor from scratch - enabling modal editing, multiple cursors, and beautifully rendered markdown.

## The hard choices

Building to a high privacy bar meant giving things up. I abandoned the Firebase toolset I'd relied on for years. I couldn't use payment SDKs that made network requests to analytics services I couldn't disable. Every dependency had to be audited. The upside: Cache uses zero third-party services, can be distributed on privacy-focused app stores with no Google services requirement, and collects absolutely no data.

## What's next

I have plenty of plans for Cache, but it will always be what I set out to build five years ago: a fast, private, transparent tool for knowledge management. No bloat, no feature creep.

I plan to open source the core note-taking package (cache_core) so you can audit exactly how your notes are parsed and indexed, or build your own compatible tools.

<!-- For a deeper dive into the technical decisions behind Cache, read [the full technical write-up](https://www.jimmyff.co.uk/blog/cache-note-taking-app/). -->

If you'd like to follow along or get involved, come join us in the [Matrix chat](https://matrix.to/#/#cache-app:matrix.org).

-Jimmy
