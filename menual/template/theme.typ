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
