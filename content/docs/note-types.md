+++
title = "Note Types"
description = "Configure note types with templates for new notes"
weight = 11

[extra]
sidebar_group = "Guides"
+++

# Note Types

Every note in your repository belongs to a note type. To define a note type, create a directory with a `.config.md` file inside it.

The `.config.md` file serves two purposes:

1. **Configuration** (frontmatter) — Defines the note type, naming, and behavior
2. **Template** (body) — The default content for new notes

When you create a new note in a directory, Cache reads its `.config.md` to determine how to name the file and what content to start with.

---

## File Structure

A `.config.md` file has two parts:

```markdown
+++
name = 'Journal'
type = 'daily'
filename = '${date.iso}'
+++                               <-- Configuration (frontmatter)

# ${date.day_name}, ${date.day} ${date.month_name}

- {{CURSOR}}
                                  <-- Template (body)
```

---

## Configuration (Frontmatter)

The frontmatter defines how the directory behaves and how notes are created.

| Field | Required | Description | Example |
|-------|----------|-------------|---------|
| `name` | Yes | Display name for the directory | `'Journal'` |
| `singular` | No | Singular form for "New X" dialogs | `'Journal Entry'` |
| `type` | No | `'daily'` or `'reference'` (default: `'reference'`) | `'daily'` |
| `filename` | No | Filename pattern (supports variables) | `'${date.iso}'` |
| `date` | No | Date field for timed notes | `'${date.iso}'` |
| `sort` | No | Sort order for directory listings: `'modified'`, `'proximity'`, or `'filename'` | `'proximity'` |
| `directories` | No | How subdirectories display: `'separate'` (grouped at top) or `'mixed'` (interleaved with notes). Default: `'separate'` | `'mixed'` |
| `icon` | No | Icon name from Carbon icons | `'calendar'` |

### Note Types

- **`daily`** — Calendar-based notes tied to specific dates (journals, daily logs)
- **`reference`** — Standalone notes not tied to dates (pages, documents, meeting notes)

> For backward compatibility, `type = 'note'` is treated as `'reference'`.

---

## Template (Body)

Everything after the frontmatter becomes the content of new notes. Templates support variables and cursor positioning.

### Variable Syntax

Variables use `${namespace.variable}` format and are replaced when the note is created:

```markdown
# ${note.title}

Created: ${date.day_name}, ${date.month_name} ${date.day}
```

If a variable isn't recognized, it's left unchanged for debugging.

### Cursor Positioning

Use `{{CURSOR}}` to set where the cursor appears when the note opens:

```markdown
## Notes

- {{CURSOR}}
```

The marker is removed and the cursor positioned at that location.

---

## Available Variables

### Note Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `${note.title}` | Note title | `Meeting Notes` |
| `${note.type}` | Type ID | `journal` |

### Date Variables

For daily notes, these use the note's date. For reference notes, they use the creation date.

| Variable | Description | Example |
|----------|-------------|---------|
| `${date.iso}` | ISO format | `2026-02-05` |
| `${date.day}` | Day of month | `5` |
| `${date.month}` | Month (zero-padded) | `02` |
| `${date.year}` | Four-digit year | `2026` |
| `${date.day_name}` | Day of week | `Thursday` |
| `${date.month_name}` | Month name | `February` |
| `${date.week_number}` | Week of year (1-53) | `6` |

### Calculated Dates

Reference other dates relative to the note's date:

| Variable | Description | Example |
|----------|-------------|---------|
| `${date.today}` | The note's date | `2026-02-05` |
| `${date.week_start}` | Monday of that week | `2026-02-02` |
| `${date.week_end}` | Sunday of that week | `2026-02-08` |
| `${date.month_start}` | First of the month | `2026-02-01` |
| `${date.month_end}` | Last of the month | `2026-02-28` |
| `${date.year_start}` | January 1st | `2026-01-01` |
| `${date.year_end}` | December 31st | `2026-12-31` |
| `${date.last_friday}` | Most recent Friday | `2026-01-31` |
| `${date.next_monday}` | Coming Monday | `2026-02-09` |

### Date Arithmetic

Add or subtract time using `+` or `-` with a number and unit (`d` days, `w` weeks, `m` months, `y` years):

| Variable | Description | Example |
|----------|-------------|---------|
| `${date.today+1d}` | Tomorrow | `2026-02-06` |
| `${date.today-1w}` | One week ago | `2026-01-29` |
| `${date.month_end+1d}` | First of next month | `2026-03-01` |
| `${date.week_start+2w}` | Monday in 2 weeks | `2026-02-16` |

---

## Examples

### Daily Journal

A calendar-based journal with daily entries:

```markdown
+++
name = 'Journal'
type = 'daily'
date = '${date.iso}'
filename = '${date.iso}'
icon = 'calendar'
+++

# ${date.day_name}, ${date.day} ${date.month_name} ${date.year}

## What happened today?

- {{CURSOR}}

## Thoughts & reflections

-
```

**Creates:** `2026-02-05.md` with heading "Thursday, 5 February 2026"

> Include the `date` field for daily notes — Cache uses it to associate the note with that date, and tasks inherit their due date from it.

### Reference Pages

Simple standalone notes:

```markdown
+++
name = 'Pages'
singular = 'Page'
type = 'reference'
filename = '${note.title}'
+++

# ${note.title}

{{CURSOR}}
```

**Creates:** `meeting-notes.md` (sanitized from title "Meeting Notes")

### Weekly Reports

Reference notes can also use date variables (based on creation date):

```markdown
+++
name = 'Reports'
singular = 'Weekly Report'
type = 'reference'
sort = 'proximity'
filename = '${date.year}-week-${date.week_number}'
+++

# Week ${date.week_number} Report

**Period:** ${date.week_start} to ${date.week_end}

## Summary

- {{CURSOR}}
```

**Creates:** `2026-week-6.md` with the week's date range filled in
