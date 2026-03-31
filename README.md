# CX Opportunities Dashboard — 2026

Looker dashboard suite for tracking the **7 highest-impact improvement opportunities** under the CX organization, mapped to the **5 CX Goals** for 2026.

## Repository Structure

```
.
├── docs/
│   ├── CX_Opportunities_Dashboard_Plan_2026.docx  # Word document — full plan (share this!)
│   ├── CX_Opportunities_Dashboard_Plan_2026.md    # Same plan in Markdown format
│   └── LOOKER_IMPORT_GUIDE.md                     # Step-by-step instructions for importing into Looker
│
├── scripts/
│   └── generate_word_doc.py                       # Script to regenerate the .docx if you edit the plan
│
└── lookml/
    ├── cx_opportunities.model.lkml                # LookML model definition
    ├── views/
    │   ├── cx_cases.view.lkml                     # Core case/contact fact table
    │   ├── cx_csat_surveys.view.lkml              # CSAT survey responses
    │   ├── cx_goals.view.lkml                     # Goal dimension table
    │   ├── cx_goal_kpis.view.lkml                 # Goal KPI time-series
    │   ├── cx_opportunities.view.lkml             # Opportunity dimension table
    │   └── cx_opportunity_metrics.view.lkml       # Opportunity metric time-series
    ├── explores/
    │   └── cx_explores.explore.lkml               # Explore definitions
    ├── dashboards/
    │   ├── cx_executive_kpi_overview.dashboard.lookml      # Dashboard 1: Executive KPI Overview
    │   ├── cx_opportunity_impact_tracker.dashboard.lookml  # Dashboard 2: Opportunity Impact Tracker
    │   └── cx_opportunity_deep_dives.dashboard.lookml      # Dashboard 3: Deep-Dives (all 7 opportunities)
    └── seed_data/
        ├── cx_goals_seed.sql                      # SQL to populate goals dimension table
        └── cx_opportunities_seed.sql              # SQL to populate opportunities dimension table
```

## Dashboards Overview

| Dashboard | Purpose | Audience |
|-----------|---------|----------|
| **CX Executive KPI Overview** | Bird's-eye view of all 5 goals, KPI scorecards, progress trends, and market heatmaps | CX VP, Directors, cross-functional leadership |
| **Opportunity Impact Tracker** | Status table, projected vs actual impact, monthly volume by opportunity, cumulative YTD impact | CX Directors, Opportunity Owners, Program Managers |
| **Opportunity Deep-Dives** | Per-opportunity scorecards, monthly trends, breakdowns by sub-type/category | Opportunity Owners, CX Managers, Analysts |

## The 5 CX Goals

1. **Faster, more effective 1:1 support** — 90%+ FCR, reduce AHT by 2 min
2. **Automate where humans don't add value** — 75%+ self-service rate, +20pp chatbot CSAT, 90% advocate accuracy
3. **AI & Automation for quality at scale** — 94% global CSAT, <5pt market CSAT variance
4. **Optimize top cost drivers** — 15% YoY cost per case reduction, $$$M run-rate savings
5. **Eliminate top contact drivers** — 25% reduced contact rate, 15+ improvements surfaced, 4.0 tech contact rate

## The 7 Opportunities

1. Reducing incorrect/inaccessible email address contacts
2. Account Sharing inquiry surge mitigation (with Product & Technology)
3. OTP journey pain point analysis
4. Disney bundle activation customer confusion
5. FCCA & third-party cancellation automation
6. Refund issues & automation opportunities
7. Additional deflection levers to reduce spam

## Getting Started

1. **Share the plan** — Download and distribute `docs/CX_Opportunities_Dashboard_Plan_2026.docx` (the Word doc) for stakeholder review.
2. **Import into Looker** — Follow the step-by-step guide in `docs/LOOKER_IMPORT_GUIDE.md` (three options: Git clone, copy-paste, or CI/CD push).
3. **Run seed SQL** — Execute the scripts in `lookml/seed_data/` to create the goals and opportunities dimension tables.
4. **Configure the model** — Update `connection` in `cx_opportunities.model.lkml` to point to your data warehouse.
5. **Update table names** — Adjust `sql_table_name` in each view file to match your warehouse schema.
6. **Validate and deploy** — Use Looker's "Validate LookML" button, then deploy to production.
