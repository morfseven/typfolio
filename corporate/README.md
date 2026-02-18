# Typfolio

A corporate presentation template for [Typst](https://typst.app). Clean, professional slide layouts for proposals, pitch decks, and business presentations.

## Quick Start

```typ
#import "template/theme.typ": *

#show: tp-presentation.with(
  footer-left: [Acme *Corp*],
  doc-type: "PROPOSAL",
)

#cover-slide(
  category: "AI SOLUTIONS",
  title: "Product ",
  title-accent: "Name",
  subtitle: "One-line description of your product",
  quote: "Your key message goes here",
  prepared-for: "Client Name",
  date: "2026-01-01",
  presented-by: "Your Company",
)

#content-slide(
  section-num: "01",
  section-title: "Overview",
  section-subtitle: "PROJECT OVERVIEW",
)[
  Your content here.
]
```

Compile:

```bash
typst compile template/main.typ output.pdf
```

## Slide Functions

### `cover-slide()`

Title slide with centered layout, accent line, quote, and 3-column footer.

| Parameter | Type | Description |
|-----------|------|-------------|
| `category` | content | Small badge above the title (e.g. `"AI SOLUTIONS"`) |
| `title` | content | Main title text |
| `title-accent` | content | Accent-colored portion of the title |
| `subtitle` | content | Subtitle below the title |
| `quote` | content | Quoted message below the accent line |
| `prepared-for` | content | Footer left: client name |
| `date` | content | Footer center: date |
| `presented-by` | content | Footer right: presenter name |

### `toc-slide()`

Table of contents with blue left panel and numbered item grid.

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | string | Panel title (default: `"TABLE OF CONTENTS"`) |
| `description` | content | Description text on the blue panel |
| `items` | array | List of `(num: "01", title: "...", desc: "...")` dicts |
| `contact-phone` | content | Phone info at bottom |
| `contact-email` | content | Email info at bottom |

### `content-slide()`

Standard content slide with section header, separator line, and footer.

| Parameter | Type | Description |
|-----------|------|-------------|
| `section-num` | string | Section number shown in blue badge (e.g. `"01"`) |
| `section-title` | string | Section title |
| `section-subtitle` | string | English subtitle (auto-uppercased) |
| body | content | Slide content — use grids, cards, tables, etc. |

### `section-divider-slide()`

Full-bleed blue transition slide between sections.

| Parameter | Type | Description |
|-----------|------|-------------|
| `num` | string | Large background number |
| `title` | string | Section title in white |
| `subtitle` | string | English subtitle |
| `description` | content | Optional description paragraph |

### `closing-slide()`

Final slide with centered quote, contact cards, and copyright.

| Parameter | Type | Description |
|-----------|------|-------------|
| `quote` | content | Main closing message |
| `quote-accent` | content | Blue-colored portion of the message |
| `description` | content | Supporting description |
| `contacts` | array | List of `(icon: "👤", label: "...", value: "...")` dicts |
| `copyright` | content | Copyright line at bottom |

## Components

### `tp-card()`

Rounded card with optional title.

```typ
#tp-card(title: "Card Title")[
  Card body content goes here.
  #tp-check-item[A checklist item inside the card]
]
```

| Parameter | Default | Description |
|-----------|---------|-------------|
| `title` | `none` | Bold header text |
| `accent` | `none` | Accent color (currently reserved) |
| `fill` | `tp-white` | Background color |
| `width` | `100%` | Card width |

### `tp-badge()`

Pill-shaped label/tag.

```typ
#tp-badge("Label")                          // filled blue
#tp-badge("Warning", color: tp-red)         // filled red
#tp-badge("Outline", color: tp-muted, outlined: true)  // outlined
```

### `tp-check-item()`

Checkmark + text row.

```typ
#tp-check-item[This is a checked item]
#tp-check-item(color: tp-red)[This is a red checked item]
```

### `tp-comparison-table()`

Table with optional highlighted column.

```typ
#tp-comparison-table(
  headers: ("Category", "Before", "After"),
  highlight-col: 2,
  rows: (
    ([*Row 1*], [Old state], [New state]),
    ([*Row 2*], [Old state], [New state]),
  ),
)
```

## Color Palette

| Variable | Hex | Usage |
|----------|-----|-------|
| `tp-blue` | `#2563EB` | Primary — badges, headers, accents |
| `tp-dark` | `#1A1A1A` | Headings, bold text |
| `tp-body` | `#4B5563` | Body text |
| `tp-muted` | `#9CA3AF` | Subtitles, captions |
| `tp-surface` | `#F8FAFC` | Card/section backgrounds |
| `tp-border` | `#E5E7EB` | Borders, dividers |
| `tp-red` | `#EF4444` | Danger, problems |
| `tp-orange` | `#F59E0B` | Warnings, threats |
| `tp-green` | `#10B981` | Success, opportunities |
| `tp-teal` | `#06B6D4` | Info accent |
| `tp-purple` | `#7C3AED` | Secondary accent |

## Sample Layouts

The included `template/main.typ` demonstrates 15 slide types:

1. **Cover** — title, subtitle, quote, 3-column footer
2. **Table of Contents** — blue panel + numbered grid
3. **Two-column** — problem vs. solution cards
4. **Three-column cards** — user personas with icons
5. **2x2 Grid** — four feature cards
6. **Comparison table** — AS-IS vs TO-BE with highlight
7. **KPI + Summary** — stat cards + detail cards
8. **Timeline** — 4-phase implementation plan
9. **Section divider** — full-bleed blue transition
10. **Process flow** — horizontal step cards with arrows
11. **SWOT analysis** — colored quadrant grid
12. **Testimonial** — centered quote with attribution
13. **Image + text (left)** — screenshot + description
14. **Image + text (right)** — description + diagram
15. **Closing** — quote, contacts, copyright

## Font

The template uses **Pretendard** by default. Install it system-wide or change the font in `theme.typ`:

```typ
#let tp-font = ("Inter", "Helvetica Neue",)
```

## Installation

### From Typst Universe (once published)

```typ
#import "@preview/typfolio:0.1.0": *
```

Or scaffold a new project:

```bash
typst init @preview/typfolio:0.1.0 my-presentation
```

### Local

Clone and import directly:

```typ
#import "template/theme.typ": *
```

## Project Structure

```
typfolio/
├── typst.toml            ← Package manifest
├── thumbnail.png         ← Universe listing thumbnail
├── template/
│   ├── theme.typ         ← Theme definition (colors, fonts, components, slides)
│   └── main.typ          ← Sample presentation (15 slides)
└── README.md
```

## License

MIT
