+++
title = "Templates"
description = "Customize the structure and content of new notes with templates"
weight = 2
+++

# Templates

Templates allow you to customize the structure and content of new notes. They're used in two places:

- **Content templates** - The default content when creating a new note
- **Filename templates** - How note files are named

Templates use variables that are automatically replaced when a note is created.

## Template Syntax

Variables use the format `${namespace.variable}`:

```markdown
# ${note.title}

Date: ${date.day_name}, ${date.month_name} ${date.day}
```

If a variable isn't defined, it's left unchanged for debugging.

## Note Variables

Available for all note types:

| Variable        | Description | Example         |
| --------------- | ----------- | --------------- |
| `${note.title}` | Note title  | `Meeting Notes` |
| `${note.type}`  | Type ID     | `journal`       |

## Date Variables

Available only for **daily notes** (type = `daily`):

| Variable             | Description                | Example      |
| -------------------- | -------------------------- | ------------ |
| `${date.iso}`        | ISO date format            | `2025-10-22` |
| `${date.day}`        | Day of month               | `22`         |
| `${date.month}`      | Month number (zero-padded) | `10`         |
| `${date.year}`       | Four-digit year            | `2025`       |
| `${date.day_name}`   | Day of week                | `Wednesday`  |
| `${date.month_name}` | Month name                 | `October`    |

## Cursor Positioning

Use `{{CURSOR}}` to set where the cursor appears when a new note opens:

```markdown
# ${date.day_name}, ${date.day} ${date.month_name} ${date.year}

- {{CURSOR}}
```

The cursor marker is removed and the cursor is positioned at that location.

## Examples

### Daily Note Template

A journal entry with automatic date formatting:

```markdown
+++
name = 'Journal'
type = 'daily'
filename = '${date.iso}'
+++

# ${date.day_name}, ${date.day} ${date.month_name} ${date.year}

## What happened today?

- {{CURSOR}}

## Thoughts & reflections

-
```

**Result:** Creates `2025-10-22.md` with title "Wednesday, 22 October 2025"

### Reference Note Template

A simple page template:

```markdown
+++
name = 'Pages'
singular = 'Page'
type = 'reference'
filename = '${note.title}'
+++

# ${note.title}

- {{CURSOR}}
```

**Result:** Creates `meeting-notes.md` (sanitized) with title "Meeting Notes"

## Configuration Fields

| Field | Required | Description | Example |
|-------|----------|-------------|---------|
| `name` | Yes | Display name for the directory | `'Journal'` |
| `singular` | No | Singular form for "New X Note" dialogs | `'Journal Entry'` |
| `type` | No | `'daily'` or `'reference'` (default: `'reference'`) | `'daily'` |
| `filename` | No | Filename pattern template | `'${date.iso}'` |
| `icon` | No | Icon name from Carbon icons | `'calendar'` |
| `emoji` | No | Emoji fallback for icon | `'📔'` |

> **Note:** For backward compatibility, `type = 'note'` is still accepted and treated as `'reference'`.
