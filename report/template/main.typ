#import "theme.typ": *

#show: tp-report.with(
  title: "Quarterly System Analysis Report",
  author: "Jane Smith",
  date: datetime(year: 2026, month: 2, day: 22),
  company: "Typfolio Inc.",
)

// ============================================
// Cover
// ============================================

#tp-cover(
  logo: rect(width: 80pt, height: 40pt, fill: tp-blue, radius: 4pt)[
    #align(center + horizon)[
      #text(fill: white, weight: "bold", size: 14pt)[LOGO]
    ]
  ],
  title: [Quarterly System\ Analysis Report],
  subtitle: [Performance, reliability, and infrastructure review for Q4 2025],
  meta: (
    (label: "Date", value: "February 22, 2026"),
    (label: "Document No.", value: "TP-2026-0222-001"),
    (label: "Author", value: "Jane Smith"),
  ),
  company: "Typfolio Inc.",
)

// ============================================
// Table of Contents
// ============================================

#outline(
  title: [Table of Contents],
  indent: 1.5em,
  depth: 2,
)

#pagebreak()

// ============================================
// 1. Overview
// ============================================

= Overview

== Purpose

This report provides a comprehensive analysis of system operations during Q4 2025, covering service performance metrics, incident history, and infrastructure resource utilization. It identifies areas for improvement and proposes actionable next steps.

== Scope

#tp-styled-table(
  columns: (1fr, 1.5fr, auto),
  align: (left, left, center),
  [*System*], [*Description*], [*Team*],
  [Web Service (API)], [Customer-facing REST API server], [Backend],
  [Data Pipeline], [Real-time data ingestion and transformation], [Data Eng.],
  [Monitoring], [Infrastructure and service monitoring], [SRE],
)

== Analysis Period

- *Start date:* October 1, 2025
- *End date:* December 31, 2025
- *Duration:* 3 months (Q4)

#pagebreak()

// ============================================
// 2. Detailed Analysis
// ============================================

= Detailed Analysis

== Service Performance Metrics

#tp-styled-table(
  columns: (1fr, auto, auto, auto, auto),
  align: (left, right, right, right, center),
  [*Service*], [*Avg Latency*], [*P99 Latency*], [*Throughput*], [*Uptime*],
  [API Gateway], [45 ms], [210 ms], [12,500 req/s], [99.97%],
  [Auth Service], [32 ms], [185 ms], [3,200 req/s], [99.99%],
  [Data Pipeline], [120 ms], [450 ms], [8,700 msg/s], [99.95%],
  [Search Service], [85 ms], [320 ms], [2,100 req/s], [99.92%],
)

== Infrastructure Utilization

#tp-styled-table(
  columns: (1fr, auto, auto, 1fr),
  align: (left, right, right, left),
  [*Resource*], [*Allocated*], [*Usage*], [*Notes*],
  [CPU (vCPU)], [256 cores], [68%], [Peaks at 85% during rush hours],
  [Memory (RAM)], [512 GB], [72%], [Includes cache],
  [Storage (SSD)], [10 TB], [54%], [Growing at 3% per month],
  [Network], [10 Gbps], [35%], [Stable],
)

=== Performance Trend (Placeholder)

#align(center)[
  #rect(
    width: 90%,
    height: 120pt,
    fill: tp-surface,
    stroke: 1pt + tp-border,
    radius: 4pt,
  )[
    #align(center + horizon)[
      #text(fill: tp-muted, size: 9pt)[[ Quarterly performance trend chart — image placeholder ]]
    ]
  ]
]

#pagebreak()

// ============================================
// 3. Key Findings
// ============================================

= Key Findings

== Performance Observations

The analysis revealed several noteworthy findings.

#tp-info-box(title: "Performance Improvement")[
  API Gateway average latency decreased by 15% compared to the previous quarter. This improvement is attributed to caching strategy optimization and connection pooling adjustments.
]

#v(0.5em)

#tp-warning-box[
  *Warning:* Storage utilization is growing at 3% per month. At the current rate, capacity will be exhausted within 6 months. A proactive expansion plan is recommended.
]

== Action Items

The following items require confirmation or action from the relevant teams.

#tp-question-box[
  The Search Service P99 latency was measured at 320 ms, but the previous quarterly report recorded 280 ms. Has the measurement methodology changed?
]

#v(0.5em)

#tp-question-box(prefix: "Q: ")[
  Data Pipeline throughput drops significantly between 02:00–05:00. Is this caused by scheduled batch jobs?
]

#v(0.5em)

#tp-request-box[
  Please provide updated SLA targets for all services based on current operational standards.
]

#v(0.5em)

#tp-request-box(prefix: "Action: ")[
  A storage expansion proposal should be prepared before the next operations review meeting.
]

#pagebreak()

// ============================================
// 4. Technical Details
// ============================================

= Technical Details

== Incident History

A total of 3 incidents occurred during the analysis period.

#tp-styled-table(
  columns: (auto, 1.5fr, auto, auto, auto),
  align: (center, left, center, center, center),
  [\#], [*Description*], [*Date*], [*Recovery*], [*Severity*],
  [1], [API Gateway certificate expiry caused outage], [10/15], [23 min], [High],
  [2], [DB connection pool exhaustion led to latency spike], [11/08], [12 min], [Medium],
  [3], [DNS misconfiguration caused intermittent timeouts], [12/22], [45 min], [Low],
)

=== Root Cause Analysis

Each incident was traced to a specific root cause:

+ *Certificate expiry:* The auto-renewal script had a cron misconfiguration. `renewal_days` was set to `365` instead of `30`.
+ *Connection pool exhaustion:* Long-running batch jobs held connections, starving regular requests. Resolved by increasing `max_pool_size` from 50 to 100.
+ *DNS timeout:* Internal DNS cache TTL expired, causing upstream query delays. TTL was increased to 3600 seconds.

=== Architecture Diagram (Placeholder)

#align(center)[
  #rect(
    width: 90%,
    height: 150pt,
    fill: tp-surface,
    stroke: 1pt + tp-border,
    radius: 4pt,
  )[
    #align(center + horizon)[
      #text(fill: tp-muted, size: 9pt)[[ System architecture diagram — image placeholder ]]
    ]
  ]
]

#tp-info-box[
  The architecture shown above reflects the current production configuration. A microservices migration is planned for Q1 2026. Updated architecture documentation will be distributed separately.
]

#pagebreak()

// ============================================
// 5. Summary
// ============================================

= Summary

== Conclusion

Overall system stability is satisfactory, with most services meeting SLA targets. However, storage capacity and Search Service latency require attention in the coming quarter.

== Review Checklist

#tp-styled-table(
  columns: (auto, 2fr, 1fr),
  align: (center, left, center),
  [\#], [*Item*], [*Status*],
  [1], [Search Service P99 measurement methodology change], [To confirm],
  [2], [Nightly Data Pipeline throughput drop cause], [To confirm],
  [3], [Updated SLA targets for all services], [Requested],
  [4], [Storage expansion proposal], [Action needed],
  [5], [Microservices migration schedule], [To confirm],
)

== Next Steps

#enum(
  [Develop storage expansion plan and request budget approval],
  [Profile and optimize Search Service performance],
  [Automate certificate renewal verification],
  [Prepare for Q1 2026 microservices migration],
)

== Contact

For questions or feedback, please reach out to the team below.

#tp-contact-card(items: (
  (label: "Contact", value: "Jane Smith"),
  (label: "Team", value: "System Operations"),
  (label: "Email", value: "jane@typfolio.com"),
  (label: "Phone", value: "+1-555-0123"),
))
