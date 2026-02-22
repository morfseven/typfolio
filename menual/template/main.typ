// =============================================================================
// Sample Manual — Typfolio Manual Template Demo
// Replace content with your own when using this template.
// =============================================================================

#import "theme.typ": *

#show: tp-manual.with(
  // logo: "path/to/logo.png",
  doc-type: "USER GUIDE",
)

// ─────────────────────────────────────────────
// 1. Title
// ─────────────────────────────────────────────

#title-slide(
  title: "Your Product Name",
  subtitle: "A guide to vibration analysis and data management",
  version: "This guide is based on Your Product v1.0.0.",
)

// ─────────────────────────────────────────────
// 2. Table of Contents
// ─────────────────────────────────────────────

#toc-slide(
  items: (
    "Getting Started",
    "Basic Usage",
    "Advanced Features",
    "Troubleshooting",
  ),
)

// ─────────────────────────────────────────────
// 3. Getting Started — System Requirements
// ─────────────────────────────────────────────

#content-slide(
  section-label: "Getting Started",
  section-title: "System Requirements",
)[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2em,

    {
      text(weight: "bold", size: 1.1em, fill: tp-dark)[System Requirements]
      v(0.8em)
      tp-check-item[Windows 10/11 or macOS 10.15+]
      v(0.3em)
      tp-check-item[RAM: 8 GB minimum (16 GB recommended)]
      v(0.3em)
      tp-check-item[Disk: 500 MB + data storage]
      v(0.3em)
      tp-check-item[Browser: Chrome, Edge, Safari]
    },

    {
      text(weight: "bold", size: 1.1em, fill: tp-dark)[Quick Start]
      v(0.8em)
      tp-step-list(
        [Run `start.sh` (Mac/Linux) or `start.bat` (Windows)],
        [Open `http://localhost:8551` in your browser],
        [Verify your data folder path (e.g., `D:/data/`)],
      )
    },
  )
]

// ─────────────────────────────────────────────
// 4. Getting Started — First Screen
// ─────────────────────────────────────────────

#content-slide(
  section-label: "Getting Started",
  section-title: "First Screen",
)[
  #text(weight: "bold", size: 1.1em, fill: tp-dark)[Screen Layout]
  #v(0.5em)

  #grid(
    columns: (1.2fr, 1fr),
    column-gutter: 2em,
    align: horizon,

    // Left: screenshot placeholder
    tp-screenshot(
      align(center + horizon,
        block(
          width: 100%,
          inset: (x: 1em, y: 3em),
          {
            text(size: 2em, fill: tp-muted)[🖥]
            v(0.5em)
            text(size: 0.85em, fill: tp-muted)[Application screenshot]
            v(0.2em)
            text(size: 0.7em, fill: tp-muted)[`image("assets/main-screen.png")`]
          },
        ),
      ),
      caption: "Main application screen after launch",
    ),

    // Right: description
    {
      tp-check-item[*Navigation menu* — Switch between analysis modes]
      v(0.4em)
      tp-check-item[*Data browser* — Browse files by machine, task, and date]
      v(0.4em)
      tp-check-item[*Analysis area* — Charts and data visualization]
      v(0.4em)
      tp-check-item[*Controls* — Adjust chart parameters and settings]
      v(1em)

      tp-tip-box[Start with the Trend tab for your first analysis — it provides the best overview of your data patterns over time.]
    },
  )
]

// ─────────────────────────────────────────────
// 5. Basic Usage — Opening a File
// ─────────────────────────────────────────────

#content-slide(
  section-label: "Basic Usage",
  section-title: "Opening Your First File",
)[
  #grid(
    columns: (1fr, 1.2fr),
    column-gutter: 2em,

    {
      text(weight: "bold", size: 1.1em, fill: tp-dark)[File Selection Steps]
      v(0.8em)
      tp-step-list(
        [Select *Analysis > Single Channel* from the navigation menu],
        [Choose the *Trend* tab],
        [Select a machine from the *Machine* dropdown],
        [Select a task from the *Work* dropdown],
        [Date folders will load automatically],
        [Select a date to see available time entries],
        [Click a time entry to load channel data],
      )
      v(0.8em)
      tp-tip-box[Start with the Trend tab to see an overview of changes over time.]
    },

    // Right: screenshot placeholder
    tp-screenshot(
      align(center + horizon,
        block(
          width: 100%,
          inset: (x: 1em, y: 3.5em),
          {
            text(size: 2em, fill: tp-muted)[📂]
            v(0.5em)
            text(size: 0.85em, fill: tp-muted)[File browser screenshot]
          },
        ),
      ),
      caption: "Data browser showing folder structure and file list",
    ),
  )
]

// ─────────────────────────────────────────────
// 6. Basic Usage — Chart Analysis
// ─────────────────────────────────────────────

#content-slide(
  section-label: "Basic Usage",
  section-title: "Chart Analysis",
)[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2em,

    {
      text(weight: "bold", size: 1.1em, fill: tp-dark)[Reading a Trend Chart]
      v(0.6em)
      tp-check-item[*X-axis:* Time (file creation timestamp)]
      v(0.3em)
      tp-check-item[*Y-axis:* Vibration magnitude]
      v(0.3em)
      tp-check-item[*Data points:* Peak value for each file]
      v(0.8em)

      text(weight: "bold", size: 1em, fill: tp-dark)[Pattern Interpretation]
      v(0.4em)
      tp-check-item(color: tp-green)[*Normal:* Consistent level maintained]
      v(0.3em)
      tp-check-item(color: tp-amber)[*Caution:* Sudden increase or irregular changes]
      v(0.3em)
      tp-check-item(color: rgb("#EF4444"))[*Danger:* Sustained upward trend]
    },

    {
      text(weight: "bold", size: 1.1em, fill: tp-dark)[Analysis Tips]
      v(0.6em)
      tp-tip-box[Focus on sudden changes rather than overall trends. Compare channels at the same time points for cross-reference analysis.]
      v(0.8em)

      tp-warning-box[Large frequency ranges (e.g., 5–3000 Hz) increase processing time. Narrow the range when analyzing specific frequency bands.]
    },
  )
]

// ─────────────────────────────────────────────
// 7. Advanced Features — Cursor & Interaction
// ─────────────────────────────────────────────

#content-slide(
  section-label: "Advanced Features",
  section-title: "Cursor & Interaction",
)[
  #set text(size: 0.95em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 1.5em,

    {
      text(weight: "bold", size: 1.05em, fill: tp-dark)[Single Cursor]
      v(0.5em)
      text(fill: tp-body, size: 0.85em)[Click on the spectrum chart to place a cursor at a specific frequency.]
      v(0.5em)
      tp-check-item[#text(size: 0.85em)[Exact frequency and amplitude display]]
      v(0.2em)
      tp-check-item[#text(size: 0.85em)[Fine-tune with arrow keys]]
      v(0.2em)
      tp-check-item[#text(size: 0.85em)[Track time history for that frequency]]
    },

    {
      text(weight: "bold", size: 1.05em, fill: tp-dark)[Harmonics Cursor]
      v(0.5em)
      text(fill: tp-body, size: 0.85em)[Analyze integer multiples (1X, 2X, 3X...) of a base frequency.]
      v(0.5em)
      tp-check-item[#text(size: 0.85em)[Automatic harmonic pattern overlay]]
      v(0.2em)
      tp-check-item[#text(size: 0.85em)[Detect imbalance and misalignment]]
      v(0.2em)
      tp-check-item[#text(size: 0.85em)[Bearing and gear fault diagnosis]]
    },

    {
      text(weight: "bold", size: 1.05em, fill: tp-dark)[Sideband Cursor]
      v(0.5em)
      text(fill: tp-body, size: 0.85em)[Analyze sidebands at fixed intervals around a center frequency.]
      v(0.5em)
      tp-check-item[#text(size: 0.85em)[Detect modulation patterns]]
      v(0.2em)
      tp-check-item[#text(size: 0.85em)[Configurable spacing interval]]
      v(0.2em)
      tp-check-item[#text(size: 0.85em)[Bearing and gear fault detection]]
    },
  )
]

// ─────────────────────────────────────────────
// 8. FAQ
// ─────────────────────────────────────────────

#faq-slide(
  section-label: "Troubleshooting",
  section-title: "FAQ",
  items: (
    (
      q: "Q1: The chart is not displaying.",
      answers: (
        "Check frequency range settings",
        "Verify channel selection",
        "Confirm data file exists",
      ),
    ),
    (
      q: "Q2: Loading takes too long.",
      answers: (
        "Check file count (single: 1000, multi: 300)",
        "Narrow frequency range (wider = slower)",
        "Refresh the browser",
      ),
    ),
    (
      q: "Q3: New folder/files not visible.",
      answers: (
        "Wait 5 minutes and retry (cache refresh)",
        "Refresh the browser",
        "Check folder structure",
        "Restart the system",
      ),
    ),
    (
      q: "Q4: Memory error appears.",
      answers: (
        "Reduce number of channels (2-3 at a time)",
        "Narrow file range",
        "Restart the browser",
      ),
    ),
  ),
)

// ─────────────────────────────────────────────
// 9. Closing
// ─────────────────────────────────────────────

#closing-slide(
  message: "Thank you.",
  support-label: "Technical Support",
  support-items: (
    "Email: support@example.com",
    "Phone: +1-555-0100",
  ),
)
