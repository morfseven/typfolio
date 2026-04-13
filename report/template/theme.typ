// =============================================================================
// Typfolio — Report Theme for Typst
// A4 document / report template
// =============================================================================

// =============================================================================
// COLOR SYSTEM
// =============================================================================

#let tp-blue = rgb("#0066cc")
#let tp-dark = rgb("#1a1a1a")
#let tp-body = rgb("#333333")
#let tp-muted = rgb("#666666")

// Accent colors
#let tp-amber = rgb("#f0a000")
#let tp-green = rgb("#2e7d32")
#let tp-red = rgb("#d32f2f")

// Callout backgrounds
#let tp-blue-light = rgb("#e7f3ff")
#let tp-blue-pale = rgb("#f0f7ff")
#let tp-amber-light = rgb("#fff8e6")
#let tp-green-light = rgb("#e8f5e9")

// Surface / border
#let tp-surface = rgb("#f8f9fa")
#let tp-border = rgb("#dee2e6")
#let tp-border-light = rgb("#dddddd")

// =============================================================================
// TYPOGRAPHY
// =============================================================================

#let tp-font = ("Pretendard", "Apple SD Gothic Neo")
#let tp-font-mono = "Menlo"
#let tp-base-size = 10pt

// =============================================================================
// STATE
// =============================================================================

#let _doc-title = state("tp-doc-title", none)
#let _doc-company = state("tp-doc-company", none)

// =============================================================================
// COMPONENTS
// =============================================================================

/// Styled table with blue top border and alternating row backgrounds
#let tp-styled-table(..args) = {
  set text(size: 9pt)
  table(
    stroke: (x, y) => (
      top: if y == 0 { 1.5pt + tp-blue } else if y == 1 { 0.75pt + tp-blue } else { 0pt },
      bottom: 0.5pt + tp-border-light,
      left: 0pt,
      right: 0pt,
    ),
    inset: (x: 8pt, y: 6pt),
    fill: (x, y) => if y == 0 { tp-surface } else if calc.odd(y) { rgb("#ffffff") } else { rgb("#fafafa") },
    ..args,
  )
}

/// Info callout box (blue, optional title)
#let tp-info-box(title: none, body) = {
  block(
    width: 100%,
    inset: 12pt,
    radius: 4pt,
    fill: tp-blue-light,
    stroke: (left: 3pt + tp-blue),
    [
      #if title != none [
        #text(weight: "bold", fill: tp-blue)[#title]
        #v(0.3em)
      ]
      #body
    ],
  )
}

/// Warning callout box (amber)
#let tp-warning-box(body) = {
  block(
    width: 100%,
    inset: 12pt,
    radius: 4pt,
    fill: tp-amber-light,
    stroke: (left: 3pt + tp-amber),
    body,
  )
}

/// Question callout box (blue, configurable prefix)
#let tp-question-box(prefix: "Question: ", body) = {
  block(
    width: 100%,
    inset: 12pt,
    radius: 4pt,
    fill: tp-blue-pale,
    stroke: (left: 3pt + tp-blue),
    [#text(weight: "bold", fill: tp-blue)[#prefix]#body],
  )
}

/// Request callout box (green, configurable prefix)
#let tp-request-box(prefix: "Request: ", body) = {
  block(
    width: 100%,
    inset: 12pt,
    radius: 4pt,
    fill: tp-green-light,
    stroke: (left: 3pt + tp-green),
    [#text(weight: "bold", fill: tp-green)[#prefix]#body],
  )
}

/// Contact card component
#let tp-contact-card(items: (), width: 60%) = {
  align(center)[
    #box(
      width: width,
      inset: 20pt,
      radius: 8pt,
      fill: tp-surface,
      stroke: 1pt + tp-border,
      [
        #set align(left)
        #grid(
          columns: (auto, 1fr),
          gutter: 12pt,
          ..items.map(item => (
            [*#item.at("label")*],
            item.at("value"),
          )).flatten()
        )
      ],
    )
  ]
}

// =============================================================================
// LAYOUT — COVER PAGE
// =============================================================================

/// Cover page
#let tp-cover(
  logo: none,
  title: none,
  subtitle: none,
  meta: (),
  company: none,
) = {
  align(center)[
    #v(2cm)

    #if logo != none {
      if type(logo) == content {
        logo
      } else {
        image(logo, width: 80pt)
      }
    }

    #v(1.5cm)

    #if title != none {
      text(size: 28pt, weight: "bold", fill: tp-dark, title)
    }

    #v(1.5cm)

    #if subtitle != none {
      text(size: 12pt, fill: tp-muted, subtitle)
    }

    #v(3cm)

    #if meta.len() > 0 {
      tp-styled-table(
        columns: (auto, auto),
        align: (right, left),
        ..meta.map(item => (
          [*#item.at("label")*],
          item.at("value"),
        )).flatten()
      )
    }

    #v(2cm)

    #if company != none {
      text(size: 16pt, weight: "bold", fill: tp-blue, company)
    }
  ]

  pagebreak()
}

// =============================================================================
// REPORT INITIALIZER
// =============================================================================

/// Report initializer (show rule entry point)
#let tp-report(
  title: none,
  author: none,
  date: none,
  company: none,
  lang: "en",
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2cm, left: 2.5cm, right: 2.5cm),
  body,
) = {
  // Document metadata
  set document(
    title: if title != none { title } else { "" },
    author: if author != none { author } else { "" },
  )

  // Update state
  _doc-title.update(title)
  _doc-company.update(company)

  // Page setup
  set page(
    paper: paper,
    margin: margin,
    header: context {
      if counter(page).get().first() > 1 {
        set text(size: 9pt, fill: tp-muted)
        grid(
          columns: (1fr, 1fr),
          align: (left, right),
          _doc-title.get(),
          _doc-company.get(),
        )
        v(-0.3em)
        line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
      }
    },
    footer: context {
      set align(center)
      set text(size: 9pt, fill: tp-muted)
      counter(page).display("— 1 —")
    },
  )

  // Text settings
  set text(
    font: tp-font,
    size: tp-base-size,
    lang: lang,
  )

  // Paragraph settings
  set par(
    leading: 0.8em,
    spacing: 1.3em,
    justify: true,
  )

  // Heading numbering
  set heading(numbering: "1.1")

  // Heading styles
  show heading.where(level: 1): it => {
    set text(size: 14pt, weight: "bold", fill: tp-dark)
    block(above: 2.4em, below: 1.4em)[
      #it
      #v(-0.5em)
      #line(length: 100%, stroke: 1.5pt + tp-blue)
    ]
  }

  show heading.where(level: 2): it => {
    set text(size: 11pt, weight: "bold", fill: tp-body)
    block(above: 2.2em, below: 1em)[#it]
  }

  show heading.where(level: 3): it => {
    set text(size: 10pt, weight: "bold", fill: rgb("#444444"))
    block(above: 1.6em, below: 0.9em)[#it]
  }

  // Inline code style
  show raw.where(block: false): it => {
    box(
      fill: rgb("#f5f5f5"),
      inset: (x: 3pt, y: 1pt),
      radius: 2pt,
      text(size: 9pt, font: tp-font-mono, it),
    )
  }

  body
}
