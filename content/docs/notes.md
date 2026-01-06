+++
title = "Notes"
description = "Note file structure, frontmatter, and date fields"
weight = 1
+++

# Notes

Notes are markdown files with TOML frontmatter that can be stored anywhere in your repository.

## File Structure

Each note consists of:
1. **Frontmatter** (metadata in TOML format)
2. **Body** (markdown content)

Example:
```md
+++
type = "journal"
title = "2024-11-29"
date = "2024-11-29"
created_date = "2024-11-29T12:00:00.000Z"
+++

# My Daily Journal

This is the note body in markdown format.
```

## Frontmatter

Frontmatter uses TOML format enclosed in `+++` delimiters.

### Required Fields

- **type**: Note type ID (e.g., `"journal"`, `"pages"`)
- **title**: Display title for the note

### Optional Fields

- **date**: Semantic date the note relates to
- **modified_date**: Last modification timestamp
- **created_date**: Creation timestamp
- **links**: List of aliases for linking

## Date Fields

Notes support three timestamp fields for organization and search ranking. More recent notes are prioritized in search results:

### date

Semantic date the note relates to (ISO 8601: `YYYY-MM-DD`).

**Use case**: Daily journals, meeting notes, dated content
**Auto-population**: For daily notes, inferred from filename if not set
**Example**: `date = "2024-11-29"`

### modified_date

Last modification timestamp (ISO 8601 with time: `YYYY-MM-DDTHH:MM:SS.sssZ`).

**Use case**: Track when content was last edited
**Auto-population**: Updated automatically when saving
**Example**: `modified_date = "2024-11-29T14:30:00.000Z"`

### created_date

Creation timestamp (ISO 8601 with time: `YYYY-MM-DDTHH:MM:SS.sssZ`).

**Use case**: Record when note was first created
**Auto-population**: Set automatically on creation
**Example**: `created_date = "2024-11-29T12:00:00.000Z"`

## File Organization

Notes can be stored anywhere in your repository. By default, Cache organizes notes into folders named after the plural form of their note type:

```
/Journal/
  2024-11-29.md
  2024-11-30.md
/Pages/
  fitness.md
  rowing.md
/Projects/
  cache-development.md
```

The folder structure follows note types defined in `config/types/`. For example, a note with `type = "journal"` appears in the `Journal/` folder by default.

You're free to organize notes differently—Cache indexes notes based on their frontmatter `type` field, not their location.
