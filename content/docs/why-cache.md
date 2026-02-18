+++
title = "Why Cache"
weight = 21

[extra]
sidebar_group = "About"
+++

# Why Cache

Hey, I'm Jimmy, the creator of Cache. I've been working on this concept for years after bouncing between various note-taking and personal knowledge management solutions. None of them solved the problems I needed solved, so I set out to create the app I always wanted.

As someone who lives a somewhat chaotic life, constantly juggling several projects, I need a tool that doesn't get in my way—literally a cache for my mind, allowing me to offload the minutiae I don't have the bandwidth to store.

## What I didn't want

To discover what I wanted, I had to know what I didn't want. After years of using almost every major note-taking app, I had a clear picture:

- **A slow app** — opening, navigating, authoring. Everything had to be fast.
- **Bad search** — I'm always surprised how some of the popular apps get this so wrong. I've sometimes been unable to find content I knew existed somewhere in my notes.
- **Editing/presentation awkwardness** — the constant flicking between markdown and rendered HTML is jarring. I experimented with hybrid editors, but when I decided markdown should be both the editing and presentation layer, everything clicked.
- **Source pollution** — I became familiar with the export/import process for moving notes between apps. The output is usually terrible: lost folder structure, files renamed to internal IDs, notes polluted with HTML and proprietary frontmatter. I wanted clean notes.
- **Loss of control** — I've read horror stories of people losing their notes due to bugs or company shutdowns. I wanted a solution that puts users in control, which also resolves privacy concerns.

## The solution

It took a couple of years and several false starts to land on my specification, but when I did, it just felt right:

- **Git sync to your own backend** — solves privacy, control, and transparency in one stroke
- **SQLite local search index** — solves speed, enables per-line indexing for precise results, works offline
- **Markdown as both authoring and presentation** — removes the awkward rendering layer, lets you take pride in beautifully formatted notes
- **1:1 folder mapping** — your note structure maps directly to folders and files. It's a note-focused file manager. Beautifully simple and transparent.
- **Speed obsession** — zero third-party dependencies, written in Flutter, starts in milliseconds, takes you straight to wherever you've configured (today's journal for me). Custom UI optimised for speed, all transitions sub-60ms or non-existent.

## Building it

I built Cache in Flutter for its pixel-perfect cross-platform rendering, which gave me the control I needed for features like syntax highlighting, multiple cursors, and block-level operations.

It was a new experience building an app with such a high privacy bar. I didn't use the Firebase toolset I'd relied on for years. I couldn't use payment SDKs that made network requests to analytics services I couldn't disable. The upside: Cache can now be distributed on privacy-focused app stores with no Google services requirement.

## What's next

I have lots of plans for Cache, but it will always remain a simple, transparent tool for knowledge management. No bloat, no feature creep—just fast, private note-taking.

The data layer (cache_core) will be open source—you'll be able to audit how your notes are parsed and indexed, or build your own compatible tools.

For a deeper dive into the technical decisions behind Cache, read [the full technical write-up](https://www.jimmyff.co.uk/blog/cache-note-taking-app/).

If you want to say hi, come join us in the [Matrix chat](https://matrix.to/#/#cache-app:matrix.org).

— Jimmy
