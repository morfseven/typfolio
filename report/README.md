# Typfolio Report

An A4 document and report template for [Typst](https://typst.app). Clean, professional layouts for technical documents, formal requests, and business reports.

## Quick Start

```typ
#import "template/theme.typ": *

#show: tp-report.with(
  title: "Quarterly Analysis Report",
  author: "Jane Smith",
  company: "Acme Corp.",
)

#tp-cover(
  title: [Quarterly Analysis\ Report],
  subtitle: [Performance and reliability review],
  meta: (
    (label: "Date", value: "February 22, 2026"),
    (label: "Author", value: "Jane Smith"),
  ),
  company: "Acme Corp.",
)

#outline(title: [Table of Contents], indent: 1.5em, depth: 2)
#pagebreak()

= Introduction

Your content here.
```

Compile:

```bash
typst compile template/main.typ output.pdf
```

## Initializer

### `tp-report()`

Show-rule entry point that configures page layout, typography, heading styles, and running headers/footers.

| Parameter | Default | Description |
|-----------|---------|-------------|
| `title` | `none` | Document title (shown in running header) |
| `author` | `none` | Author name (used in PDF metadata) |
| `date` | `none` | Document date (used in PDF metadata) |
| `company` | `none` | Company name (shown in running header) |
| `lang` | `"en"` | Document language |
| `paper` | `"a4"` | Paper size |
| `margin` | `(top: 2.5cm, bottom: 2cm, left: 2.5cm, right: 2.5cm)` | Page margins |

## Cover Page

### `tp-cover()`

Centered cover page with optional logo, title, subtitle, metadata table, and company name.

| Parameter | Type | Description |
|-----------|------|-------------|
| `logo` | content / string | Logo image path or content (e.g. `image("logo.png")` or a `rect()` placeholder) |
| `title` | content | Main title (use `\` for line breaks) |
| `subtitle` | content | Subtitle below the title |
| `meta` | array | List of `(label: "...", value: "...")` dicts shown in a table |
| `company` | content | Company name at bottom of cover |

## Components

### `tp-styled-table()`

Table with blue top border, header row background, and alternating row colors. Accepts all standard `table()` arguments.

```typ
#tp-styled-table(
  columns: (1fr, auto, auto),
  [*Name*], [*Value*], [*Unit*],
  [CPU Usage], [68%], [percent],
  [Memory], [512], [GB],
)
```

### `tp-info-box()`

Blue information callout with optional title.

```typ
#tp-info-box(title: "Note")[
  This is an informational message.
]

#tp-info-box[
  A simpler info box without a title.
]
```

| Parameter | Default | Description |
|-----------|---------|-------------|
| `title` | `none` | Bold blue header text |

### `tp-warning-box()`

Amber warning callout.

```typ
#tp-warning-box[
  *Warning:* Storage is running low.
]
```

### `tp-question-box()`

Blue question callout with configurable prefix.

```typ
#tp-question-box[
  Has the measurement methodology changed?
]

#tp-question-box(prefix: "Q: ")[
  Is this caused by scheduled batch jobs?
]
```

| Parameter | Default | Description |
|-----------|---------|-------------|
| `prefix` | `"Question: "` | Bold prefix text |

### `tp-request-box()`

Green request/action callout with configurable prefix.

```typ
#tp-request-box[
  Please provide updated SLA targets.
]

#tp-request-box(prefix: "Action: ")[
  Prepare the expansion proposal by next meeting.
]
```

| Parameter | Default | Description |
|-----------|---------|-------------|
| `prefix` | `"Request: "` | Bold prefix text |

### `tp-contact-card()`

Centered contact information card.

```typ
#tp-contact-card(items: (
  (label: "Contact", value: "Jane Smith"),
  (label: "Email", value: "jane@example.com"),
  (label: "Phone", value: "+1-555-0123"),
))
```

| Parameter | Default | Description |
|-----------|---------|-------------|
| `items` | `()` | List of `(label: "...", value: "...")` dicts |
| `width` | `60%` | Card width |

## Color Palette

| Variable | Hex | Usage |
|----------|-----|-------|
| `tp-blue` | `#0066CC` | Primary — headings, borders, callouts |
| `tp-dark` | `#1A1A1A` | Heading text |
| `tp-body` | `#333333` | Body text |
| `tp-muted` | `#666666` | Subtitles, captions, header/footer |
| `tp-amber` | `#F0A000` | Warning callouts |
| `tp-green` | `#2E7D32` | Request callouts |
| `tp-red` | `#D32F2F` | Error/danger accent |
| `tp-surface` | `#F8F9FA` | Table header, card backgrounds |
| `tp-border` | `#DEE2E6` | Borders, dividers |

## Sample Document

The included `template/main.typ` demonstrates a 7-page report:

1. **Cover** — logo, title, subtitle, metadata table, company name
2. **Table of Contents** — auto-generated with heading numbering
3. **Overview** — styled table, bullet list
4. **Detailed Analysis** — two data tables, image placeholder
5. **Key Findings** — info box, warning box, question boxes, request boxes
6. **Technical Details** — incident table, numbered list, architecture placeholder
7. **Summary** — checklist table, next steps, contact card

## Font

The template uses **Pretendard** with **Apple SD Gothic Neo** as fallback. To change:

```typ
#let tp-font = ("Inter", "Helvetica Neue")
```

Monospace code uses **Menlo** by default:

```typ
#let tp-font-mono = "Fira Code"
```

## Installation

### From Typst Universe (once published)

```typ
#import "@preview/typfolio-report:0.1.0": *
```

Or scaffold a new project:

```bash
typst init @preview/typfolio-report:0.1.0 my-report
```

### Local

Clone and import directly:

```typ
#import "template/theme.typ": *
```

## Project Structure

```
report/
├── typst.toml            ← Package manifest
├── README.md
└── template/
    ├── theme.typ          ← Theme (colors, typography, components, layout)
    └── main.typ           ← Sample report (7 pages)
```

## License

MIT
