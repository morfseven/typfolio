// =============================================================================
// Typfolio — Manual / User Guide Theme for Typst
// Product manual & user guide presentation template
// =============================================================================

// =============================================================================
// COLOR SYSTEM
// =============================================================================

#let tp-blue = rgb("#2563EB")
#let tp-dark = rgb("#1A1A1A")
#let tp-body = rgb("#4B5563")
#let tp-muted = rgb("#9CA3AF")
#let tp-surface = rgb("#F8FAFC")
#let tp-border = rgb("#E5E7EB")
#let tp-white = rgb("#FFFFFF")
#let tp-amber = rgb("#F59E0B")
#let tp-green = rgb("#10B981")

// Light accent backgrounds
#let tp-amber-light = rgb("#FFF8E6")
#let tp-green-light = rgb("#ECFDF5")
#let tp-blue-light = rgb("#EFF6FF")

// =============================================================================
// TYPOGRAPHY
// =============================================================================

#let tp-font = ("Pretendard",)
#let tp-base-size = 14pt

// =============================================================================
// STATE
// =============================================================================

#let _manual-logo = state("tp-manual-logo", none)
#let _manual-doc-type = state("tp-manual-doc-type", "USER GUIDE")
#let _slide-counter = counter("tp-manual-slide")

// =============================================================================
// COMPONENTS
// =============================================================================

/// Checklist item
#let tp-check-item(body, color: tp-blue) = {
  grid(
    columns: (auto, 1fr),
    column-gutter: 8pt,
    align: (center + top, left),
    text(fill: color, weight: "bold", size: 1em)[✓],
    body,
  )
}

/// Tip callout box
#let tp-tip-box(body) = {
  block(
    width: 100%,
    inset: (x: 14pt, y: 10pt),
    radius: 4pt,
    fill: tp-green-light,
    stroke: (left: 3pt + tp-green),
    {
      grid(
        columns: (auto, 1fr),
        column-gutter: 10pt,
        align: (center + top, left),
        text(size: 1.1em)[💡],
        { set text(size: 0.85em, fill: tp-body); body },
      )
    },
  )
}

/// Warning callout box
#let tp-warning-box(body) = {
  block(
    width: 100%,
    inset: (x: 14pt, y: 10pt),
    radius: 4pt,
    fill: tp-amber-light,
    stroke: (left: 3pt + tp-amber),
    {
      grid(
        columns: (auto, 1fr),
        column-gutter: 10pt,
        align: (center + top, left),
        text(size: 1.1em)[⚠],
        { set text(size: 0.85em, fill: tp-body); body },
      )
    },
  )
}

/// Numbered step list
#let tp-step-list(..items) = {
  let item-list = items.pos()
  for (i, item) in item-list.enumerate() {
    grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      align: (right + top, left),
      text(weight: "bold", fill: tp-dark, size: 0.95em)[#(i + 1).],
      { set text(size: 0.95em, fill: tp-body); item },
    )
    if i < item-list.len() - 1 { v(0.3em) }
  }
}

/// Screenshot container with optional caption
#let tp-screenshot(body, caption: none) = {
  block(
    width: 100%,
    radius: 8pt,
    clip: true,
    stroke: 1pt + tp-border,
    {
      block(width: 100%, fill: tp-surface, inset: 0pt, body)
      if caption != none {
        block(
          width: 100%,
          inset: (x: 12pt, y: 8pt),
          fill: tp-white,
          text(size: 0.75em, fill: tp-muted, style: "italic", caption),
        )
      }
    },
  )
}

/// Logo badge for page headers
#let tp-logo-badge(logo) = {
  if logo != none {
    box(
      fill: tp-blue,
      radius: 6pt,
      inset: (x: 10pt, y: 6pt),
      {
        if type(logo) == content { logo }
        else { image(logo, height: 1.4em) }
      },
    )
  }
}

/// Page number indicator (blue circle)
#let tp-page-number() = context {
  let num = _slide-counter.get().first()
  box(
    fill: tp-blue,
    radius: 50%,
    width: 1.8em,
    height: 1.8em,
    align(center + horizon, text(fill: tp-white, weight: "bold", size: 0.7em)[#num]),
  )
}

/// Internal content header for slide layouts
#let _content-header(section-label, section-title) = context {
  let logo-val = _manual-logo.get()
  block(
    width: 100%,
    inset: (x: 2em, top: 1.2em, bottom: 0.8em),
    {
      grid(
        columns: (1fr, auto),
        align: (left + bottom, right + top),
        {
          text(size: 0.75em, fill: tp-muted, weight: "medium", section-label)
          v(0.2em)
          text(size: 1.8em, weight: "black", fill: tp-dark, section-title)
        },
        {
          grid(
            columns: (auto, auto),
            column-gutter: 8pt,
            align: (center + horizon, center + horizon),
            tp-logo-badge(logo-val),
            tp-page-number(),
          )
        },
      )
    },
  )
}

// =============================================================================
// MANUAL INITIALIZER
// =============================================================================

/// Manual initializer (show rule entry point)
#let tp-manual(
  aspect-ratio: "16-9",
  logo: none,
  doc-type: "USER GUIDE",
  body,
) = {
  set text(font: tp-font, size: tp-base-size, lang: "en")
  set strong(delta: 200)
  set par(leading: 0.7em)

  set page(
    paper: "presentation-" + aspect-ratio,
    fill: tp-white,
    margin: 0em,
  )

  show heading.where(level: 1): set text(size: 1.4em, weight: "bold", fill: tp-dark)
  show heading.where(level: 2): set text(size: 1.2em, weight: "bold", fill: tp-dark)
  show heading.where(level: 3): set text(size: 1em, weight: "bold", fill: tp-dark)

  _manual-logo.update(logo)
  _manual-doc-type.update(doc-type)

  body
}
