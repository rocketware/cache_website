+++
title = "Theme Authoring"
description = "Create custom themes for Cache using TOML format"
weight = 13
draft = true

[extra]
sidebar_group = "Guides"
+++

# Theme Authoring

Cache themes use a simple TOML format to define colors and styles for both syntax highlighting and UI elements. This guide will help you create your own custom themes.

## Theme Structure

Every theme file has three main sections:

```toml
[metadata]
name = "My Theme"
author = "Your Name"

[scopes]
"*" = { fg = "$foreground" }
# ... more scopes

[palette]
foreground = "#d4d4d4"
background = "#1e1e1e"
# ... more colors
```

### Metadata

Basic information about your theme:

| Field    | Required | Description          | Example         |
| -------- | -------- | -------------------- | --------------- |
| `name`   | Yes      | Theme display name   | `"Nord Dark"`   |
| `author` | No       | Creator name         | `"Your Name"`   |

### Scopes

Scopes define how different elements are styled. There are two types:

1. **Syntax scopes** - Code highlighting (prefix with `syntax.`)
2. **UI scopes** - Application interface (prefix with `ui.`)

### Palette

Define colors once, reuse them everywhere using `$name` references:

```toml
[palette]
# Base colors
bg = "#1e1e1e"
fg = "#d4d4d4"

# Accent colors
blue = "#569cd6"
green = "#6a9955"
red = "#f48771"

# Derived colors
fg-dim = "#808080"
selection = "#264f78"
```

---

## Color Formats

Blink supports multiple color formats:

| Format | Example           | Use Case           |
| ------ | ----------------- | ------------------ |
| Hex    | `"#569cd6"`       | Standard RGB       |
| RGB    | `"rgb(86,156,214)"` | Explicit RGB     |
| HSL    | `"hsl(210,79%,59%)"` | Hue-based        |
| Oklab  | `"oklab(0.6,0.1,-0.1)"` | Perceptual   |

**Tip:** Hex is simplest for most use cases. Use HSL when you want to adjust lightness/saturation easily.

## Syntax Scopes

Syntax scopes control code highlighting. All must start with `syntax.`:

```toml
[scopes]
# Keywords (if, for, return)
"syntax.keyword" = { fg = "$blue", modifiers = ["bold"] }

# Strings and text
"syntax.string" = { fg = "$green" }

# Comments
"syntax.comment" = { fg = "$fg-dim", modifiers = ["italic"] }

# Functions and methods
"syntax.title.function" = { fg = "$yellow" }

# Variables
"syntax.variable" = { fg = "$fg" }

# Numbers
"syntax.number" = { fg = "$green" }
```

### Common Syntax Scopes

| Scope                         | What it styles           |
| ----------------------------- | ------------------------ |
| `syntax.keyword`              | Language keywords        |
| `syntax.string`               | String literals          |
| `syntax.comment`              | Code comments            |
| `syntax.title.function`       | Function names           |
| `syntax.variable`             | Variable names           |
| `syntax.number`               | Numeric literals         |
| `syntax.type`                 | Type names               |
| `syntax.operator`             | Operators (+, -, *, /)   |
| `syntax.markup.heading`       | Markdown headings        |
| `syntax.markup.bold`          | **Bold text**            |
| `syntax.markup.italic`        | *Italic text*            |
| `syntax.markup.link`          | [Links](url)             |
| `syntax.diagnostic.error`     | Error highlights         |
| `syntax.diagnostic.warning`   | Warning highlights       |

---

## UI Scopes

UI scopes style the application interface. They use **semantic classes** to separate concerns:

### Semantic Class Pattern

UI scopes follow this pattern: `scope.class:state`

- **Scope** - Where in the UI (e.g., `ui.chrome.navbar`)
- **Class** - What kind of element (`background`, `text`, `border`, `icon`)
- **State** - Optional interaction state (`:active`, `:hover`, `:inactive`)

### Common Semantic Classes

| Class        | Used For           | Property |
| ------------ | ------------------ | -------- |
| `background` | Container surfaces | `bg`     |
| `text`       | Text content       | `fg`     |
| `border`     | Dividers, outlines | `fg`     |
| `icon`       | Icons and glyphs   | `fg`     |

### Required UI Scopes

Every theme **must** define these scopes:

```toml
# Root fallback
"*" = { fg = "$fg" }

# Editor surface
"ui.editor.background" = { bg = "$bg" }
"ui.editor.cursor.background" = { bg = "$cursor" }
"ui.editor.selection.background" = { bg = "$selection" }
```

### Common UI Scopes

Here are the most commonly used UI scopes:

```toml
# Editor
"ui.editor.background" = { bg = "$bg" }
"ui.editor.text" = { fg = "$fg" }
"ui.editor.gutter.background" = { bg = "$gutter-bg" }
"ui.editor.gutter.text" = { fg = "$gutter-fg" }

# Document tabs
"ui.chrome.tab.background" = { bg = "$tab-bg" }
"ui.chrome.tab.item.text:active" = { fg = "$fg", modifiers = ["bold"] }
"ui.chrome.tab.item.text:inactive" = { fg = "$fg-dim" }
"ui.chrome.tab.item.text:modified" = { fg = "$yellow" }

# Navigation bar (bottom)
"ui.chrome.navbar.background" = { bg = "$chrome-bg" }
"ui.chrome.navbar.item.text:active" = { fg = "$accent" }
"ui.chrome.navbar.item.text:inactive" = { fg = "$fg-dim" }

# Notes list
"ui.list.background" = { bg = "$bg" }
"ui.list.text" = { fg = "$fg" }
"ui.list.icon" = { fg = "$fg-alt" }
"ui.list.item.background:selected" = { bg = "$selection" }
"ui.list.item.background:hover" = { bg = "$hover-bg" }
```

## States

States define how elements look during interaction:

| State       | When Used                      | Example                                 |
| ----------- | ------------------------------ | --------------------------------------- |
| `:active`   | Currently selected/active      | `ui.chrome.tab.item.text:active`        |
| `:inactive` | Not selected                   | `ui.chrome.tab.item.text:inactive`      |
| `:hover`    | Mouse hovering over element    | `ui.list.item.background:hover`         |
| `:selected` | Item is selected in a list     | `ui.list.item.background:selected`      |
| `:modified` | File has unsaved changes       | `ui.chrome.tab.item.text:modified`      |

**Tip:** States are optional. If a state isn't defined, the theme falls back to the base style without the state.

### Content Variants

Some UI elements use content-based variants (class suffixes, not states):

| Variant      | When Used                      | Example                                          |
| ------------ | ------------------------------ | ------------------------------------------------ |
| `.primary`   | Item has content               | `ui.chrome.navbar.item.primary.text:active`      |
| `.secondary` | Item has no content (dimmed)   | `ui.chrome.navbar.item.secondary.text:inactive`  |

These can be combined with states for fine-grained control:

```toml
# Date tabs with notes (primary)
"ui.chrome.navbar.item.primary.text:active" = { fg = "$blue", modifiers = ["bold"] }
"ui.chrome.navbar.item.primary.text:inactive" = { fg = "$black" }

# Date tabs without notes (secondary - dimmed)
"ui.chrome.navbar.item.secondary.text:active" = { fg = "$blue", modifiers = ["bold"] }
"ui.chrome.navbar.item.secondary.text:inactive" = { fg = "$gray" }
```

---

## Text Modifiers

Add visual emphasis to text:

```toml
# Bold text
"syntax.keyword" = { fg = "$blue", modifiers = ["bold"] }

# Italic text
"syntax.comment" = { fg = "$green", modifiers = ["italic"] }

# Dim (reduced opacity)
"ui.chrome.navbar.item.text" = { modifiers = ["dim"] }

# Multiple modifiers
"syntax.markup.heading" = { fg = "$yellow", modifiers = ["bold", "italic"] }
```

Available modifiers: `bold`, `italic`, `strikethrough`, `dim`

## Underlines

Add custom underlines to text:

```toml
# Simple underline
"syntax.markup.link" = { fg = "$blue", underline = { style = "line" } }

# Error squiggle
"syntax.diagnostic.error" = {
  fg = "$red",
  underline = {
    color = "$red",
    style = "curl"
  }
}
```

Underline styles: `line`, `curl`, `dashed`, `dotted`

---

## Complete Example Theme

Here's a complete minimal theme showing all the key elements:

```toml
[metadata]
name = "Midnight"
author = "You"

[scopes]
# Root fallback
"*" = { fg = "$fg" }

# === SYNTAX HIGHLIGHTING ===
"syntax.keyword" = { fg = "$purple", modifiers = ["bold"] }
"syntax.string" = { fg = "$green" }
"syntax.comment" = { fg = "$comment", modifiers = ["italic"] }
"syntax.title.function" = { fg = "$yellow" }
"syntax.number" = { fg = "$orange" }
"syntax.markup.heading" = { fg = "$blue", modifiers = ["bold"] }
"syntax.markup.link" = { fg = "$cyan", underline = { style = "line" } }
"syntax.diagnostic.error" = { fg = "$red", underline = { color = "$red", style = "curl" } }

# === UI - EDITOR ===
"ui.editor.background" = { bg = "$bg" }
"ui.editor.text" = { fg = "$fg" }
"ui.editor.cursor.background" = { bg = "$cursor" }
"ui.editor.selection.background" = { bg = "$selection" }
"ui.editor.gutter.background" = { bg = "$bg-alt" }
"ui.editor.gutter.text" = { fg = "$comment" }

# === UI - CHROME ===
"ui.chrome.appbar.background" = { bg = "$bg-dark" }
"ui.chrome.statusbar.background" = { bg = "$bg-dark" }
"ui.chrome.statusbar.text" = { fg = "$comment" }

# === UI - TABS ===
"ui.chrome.tab.background" = { bg = "$bg-dark" }
"ui.chrome.tab.border" = { fg = "$border" }
"ui.chrome.tab.item.text:active" = { fg = "$fg", modifiers = ["bold"] }
"ui.chrome.tab.item.text:inactive" = { fg = "$comment" }
"ui.chrome.tab.item.text:modified" = { fg = "$orange" }

# === UI - NAVBAR ===
"ui.chrome.navbar.background" = { bg = "$bg-dark" }
"ui.chrome.navbar.item.text:active" = { fg = "$cyan", modifiers = ["bold"] }
"ui.chrome.navbar.item.text:inactive" = { fg = "$comment" }

# === UI - LISTS ===
"ui.list.background" = { bg = "$bg" }
"ui.list.text" = { fg = "$fg" }
"ui.list.icon" = { fg = "$fg-dim" }
"ui.list.item.background:selected" = { bg = "$selection" }
"ui.list.item.background:hover" = { bg = "$bg-alt" }

[palette]
# Base
bg = "#0a0e14"
bg-alt = "#11151c"
bg-dark = "#01060e"
fg = "#b3b1ad"
fg-dim = "#4d5566"

# UI
border = "#11151c"
selection = "#1e2633"
cursor = "#ffcc66"
comment = "#626a73"

# Colors
red = "#f07178"
orange = "#ffaa33"
yellow = "#ffcc66"
green = "#c2d94c"
cyan = "#59c2ff"
blue = "#5ccfe6"
purple = "#d4bfff"
```

---

## Testing Your Theme

After creating your theme:

1. **Save** your theme file as `my-theme.toml` in your themes directory
2. **Restart** the application to load the new theme
3. **Switch** to your theme in Settings > Theme
4. **Test** different UI states:
   - Open multiple tabs (active/inactive states)
   - Hover over list items
   - Select items in lists
   - Edit code to see syntax highlighting

## Tips for Great Themes

1. **Start simple** - Copy an existing theme and modify colors
2. **Use palette references** - Define colors once, reuse with `$name`
3. **Test contrast** - Ensure text is readable against backgrounds
4. **Consider states** - Active, inactive, and hover states should be distinct
5. **Check accessibility** - Aim for WCAG AA contrast ratios (4.5:1 minimum)
6. **Less is more** - You don't need to style every possible scope

## Getting Help

- **Browse bundled themes** - `shared/blink_theme_assets/storm-amethyst.toml` and `mist-amethyst.toml`
- **Read the spec** - `packages/blink_theme/THEME_SCOPE_SYSTEM.md` for technical details
- **Ask questions** - Check the documentation or ask for help
