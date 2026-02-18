+++
title = "Task Management"
description = "Track tasks across your notes with due dates and urgency categories"
weight = 12

[extra]
sidebar_group = "Guides"
+++

# Task Management

Cache tracks tasks across your entire repository — every checkbox in every note, organized by urgency.

Tasks are standard markdown checkboxes. Write them anywhere in your notes and Cache automatically indexes them, calculates due dates, and surfaces what needs attention.

---

## Task Syntax

Tasks use markdown checkbox syntax with four states:

| State | Syntax | Description |
|-------|--------|-------------|
| Pending | `- [ ]` | Not started |
| In Progress | `- [/]` | Currently working on |
| Complete | `- [x]` | Finished |
| Cancelled | `- [-]` | No longer needed |

Any list marker works: `-`, `*`, `+`, or numbered (`1.`). Nested/indented tasks are supported.

```markdown
- [ ] Pending task
- [/] Task I'm working on
- [x] Completed task
- [-] Cancelled task
```

Toggle between states by editing the character inside the brackets. In modal editing modes, use the designated keybind to cycle states.

---

## Due Dates

Tasks can have due dates, which determine their urgency category.

### Inherited from Note

Notes with a `date` field in their frontmatter pass that date to all tasks within. Daily notes always have dates — add a task to a future day's note and it automatically becomes due on that date.

```markdown
+++
date = "2025-02-15"
+++

# Saturday, 15 February 2025

- [ ] This task is due 2025-02-15 (inherited)
- [ ] This one too
```

This makes planning simple: create tomorrow's journal entry, add your tasks, and they're tracked as due tomorrow.

### Explicit Due Dates

Override the inherited date or add a due date to tasks in undated notes using `due:YYYY-MM-DD`:

```markdown
- [ ] Submit report due:2025-03-31
- [ ] Call dentist due:2025-02-15
```

The `due:` prefix can appear anywhere in the task content. It's case-insensitive (`due:`, `Due:`, `DUE:` all work).

Explicit due dates override any inherited date from the note.

---

## Urgency Categories

Cache groups incomplete tasks by urgency:

| Category | Definition |
|----------|------------|
| **Overdue** | Due date has passed |
| **Due Today** | Due today |
| **Due Soon** | Due within threshold (default: 7 days) |
| **Upcoming** | Due after the "due soon" threshold |
| **No Date** | No due date set |

Completed and cancelled tasks are tracked but don't appear in urgency categories.

### Configuring "Due Soon"

The "due soon" threshold is configurable from 2 to 28 days. Access this in **User Settings → Appearance → Due soon threshold**.

---

## Task Button

The task button (checkbox icon) appears in the navigation bar and throughout the app. It displays a badge showing your most urgent task category.

Tap the task button or press `Ctrl+T` to open the **Task Dialog**.

### Task Dialog

The task dialog shows all incomplete tasks grouped by urgency. From here you can:

- View tasks across your entire repository
- Filter tasks by folder path
- Search task content
- Tap a task to jump directly to that line in its note

Tasks are sorted by due date — most urgent first.

---

## Badge Customization

Control which task categories show badges throughout the UI. In **User Settings → Appearance** you can configure badges for:

- **Navigation pins** — badges on your pinned folders
- **Date tabs** — badges on calendar date cells
- **Task button** — the main task button badge
- **Reference listings** — badges on reference note entries

Choose the categories that matter to you — show only overdue, or include due today and due soon for fuller visibility.

Available badge categories:

| Option | Shows badges for |
|--------|------------------|
| Overdue | Overdue tasks only |
| Due Today | Overdue + due today |
| Due Soon | Overdue + due today + due soon |
| All | All incomplete tasks |

---

## Tips

**Plan ahead with daily notes**: Create future journal entries and add tasks to them. They'll automatically be due on that date.

**Use reference notes for undated tasks**: Tasks in reference notes have no date by default — perfect for someday/maybe lists.

**Add explicit dates for deadlines**: When a task has a hard deadline, add `due:YYYY-MM-DD` regardless of what note it's in.

**Filter by folder**: Use the path filter in the task dialog to focus on tasks from a specific area (e.g., just your work folder).
