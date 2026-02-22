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
// PAGE FUNCTIONS
// =============================================================================

/// Title slide — product title page
#let title-slide(
  title: none,
  subtitle: none,
  version: none,
  logo: none,
) = {
  pagebreak(weak: true)
  _slide-counter.step()

  block(
    width: 100%,
    height: 100%,
    fill: tp-white,
    {
      v(1fr)
      align(center, {
        if logo != none {
          if type(logo) == content { logo }
          else { image(logo, height: 3em) }
          v(2em)
        }
        if title != none {
          text(size: 2.8em, weight: "black", fill: tp-dark, title)
          v(0.6em)
        }
        if subtitle != none {
          text(size: 1.1em, fill: tp-body, subtitle)
          v(2em)
        }
      })
      v(1fr)
      if version != none {
        align(center, text(size: 0.8em, fill: tp-muted, version))
        v(2em)
      }
    },
  )
}

/// Table of contents slide — split layout with blue panel
#let toc-slide(
  title: "Contents",
  items: (),
) = {
  pagebreak(weak: true)
  _slide-counter.step()

  block(
    width: 100%,
    height: 100%,
    fill: tp-white,
    {
      grid(
        columns: (2fr, 1fr),
        rows: (100%,),
        block(
          width: 100%,
          height: 100%,
          inset: (x: 3em, y: 2.5em),
          {
            text(size: 1.8em, weight: "black", fill: tp-dark, title)
            v(2em)
            block(
              inset: (left: 1em),
              stroke: (left: 3pt + tp-blue),
              {
                for (i, item) in items.enumerate() {
                  v(0.8em)
                  grid(
                    columns: (auto, 1fr),
                    column-gutter: 8pt,
                    align: (center, left),
                    text(fill: tp-blue, weight: "bold")[▸],
                    text(size: 1.1em, fill: tp-blue, weight: "medium", item),
                  )
                }
                v(0.8em)
              },
            )
          },
        ),
        block(width: 100%, height: 100%, fill: tp-blue),
      )
    },
  )
}

/// Content slide — standard page with header
#let content-slide(
  section-label: "",
  section-title: "",
  body,
) = {
  pagebreak(weak: true)
  _slide-counter.step()

  block(
    width: 100%,
    height: 100%,
    fill: tp-white,
    {
      _content-header(section-label, section-title)
      block(
        width: 100%,
        inset: (x: 2.5em, top: 0.2em, bottom: 1em),
        {
          set text(fill: tp-body, size: tp-base-size)
          body
        },
      )
    },
  )
}

/// FAQ slide — 2-column grid of Q&A items
#let faq-slide(
  section-label: "Troubleshooting",
  section-title: "FAQ",
  items: (),
) = {
  pagebreak(weak: true)
  _slide-counter.step()

  block(
    width: 100%,
    height: 100%,
    fill: tp-white,
    {
      _content-header(section-label, section-title)
      block(
        width: 100%,
        inset: (x: 3em, top: 1em),
        {
          let col-count = 2
          let row-count = calc.ceil(items.len() / col-count)
          for row-idx in range(row-count) {
            grid(
              columns: (1fr, 1fr),
              column-gutter: 3em,
              ..range(col-count).map(col-idx => {
                let idx = row-idx * col-count + col-idx
                if idx < items.len() {
                  let item = items.at(idx)
                  {
                    text(weight: "bold", size: 1em, fill: tp-dark, item.at("q"))
                    v(0.5em)
                    let answers = item.at("answers", default: ())
                    for answer in answers {
                      tp-check-item[#text(size: 0.85em)[#answer]]
                      v(0.2em)
                    }
                  }
                }
              }),
            )
            if row-idx < row-count - 1 { v(1.5em) }
          }
        },
      )
    },
  )
}

/// Closing slide — thank you page
#let closing-slide(
  message: "Thank you.",
  support-label: none,
  support-items: (),
) = {
  pagebreak(weak: true)
  _slide-counter.step()

  block(
    width: 100%,
    height: 100%,
    fill: tp-white,
    {
      v(1fr)
      align(center, text(size: 2.4em, weight: "black", fill: tp-dark, message))
      v(1fr)
      if support-label != none or support-items.len() > 0 {
        align(right, block(
          inset: (right: 3em, bottom: 2em),
          {
            if support-label != none {
              text(weight: "bold", size: 0.85em, fill: tp-dark, support-label)
              v(0.3em)
            }
            for item in support-items {
              text(size: 0.8em, fill: tp-body)[- #item]
              v(0.15em)
            }
          },
        ))
      }
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
