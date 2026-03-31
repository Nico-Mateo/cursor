# CX Opportunities Dashboard — 2026 Plan

## Document Control

| Field            | Value                                      |
|------------------|--------------------------------------------|
| **Version**      | 1.0 — Draft                                |
| **Date**         | March 31, 2026                             |
| **Author**       | CX Analytics & Strategy Team               |
| **Status**       | Draft for Review                           |
| **Distribution** | CX Leadership, Product, Technology, BI     |

---

## 1. Executive Summary

This document outlines the plan for a Looker-based analytics dashboard that tracks
the **7 highest-impact improvement opportunities** identified by the CX organization
for 2026. Each opportunity maps directly to one or more of the **5 CX Goals** for
the year, allowing leadership to monitor whether day-to-day execution against these
opportunities is translating into progress on the annual targets.

The dashboard suite will consist of:

| Dashboard                          | Purpose                                                             |
|------------------------------------|---------------------------------------------------------------------|
| **CX Executive KPI Overview**      | Bird's-eye view of all 5 goals, their KPIs, and YTD progress       |
| **Opportunity Impact Tracker**     | Status and projected impact of each of the 7 opportunities          |
| **Opportunity Deep-Dive (×7)**     | One drill-down dashboard per opportunity with operational metrics   |

---

## 2. The 5 CX Goals for 2026

### Goal 1 — Faster, More Effective 1:1 Support

Provide faster, more effective 1:1 support across all CX touchpoints.

| KPI                         | 2026 Target              | Baseline (EOY 2025) |
|-----------------------------|--------------------------|----------------------|
| First Contact Resolution    | ≥ 90%                   | *TBD — pull from existing FCR reporting* |
| Total Time per Contact      | Reduce by 2 minutes     | *TBD — pull from AHT reporting* |

### Goal 2 — Automate Where Humans Don't Add Value

Automate customer interactions where a human doesn't add value.

| KPI                                | 2026 Target                              | Baseline (EOY 2025) |
|------------------------------------|------------------------------------------|----------------------|
| Self-Service Rate                  | ≥ 75% (+5 pp with automation)           | *TBD* |
| Chatbot CSAT                       | +20 pp improvement                       | *TBD* |
| Advocate Accuracy Rate             | 90% within 30 days of training/event/release | *TBD* |

### Goal 3 — AI & Automation for Quality at Scale

Leverage AI & Automation to reinforce quality at scale.

| KPI                              | 2026 Target                     | Baseline (EOY 2025) |
|----------------------------------|---------------------------------|----------------------|
| Global CSAT                      | ≥ 94%                          | *TBD* |
| Market-to-Market CSAT Variance   | < 5 points                     | *TBD* |

### Goal 4 — Optimize Top Cost Drivers

Aggressively optimize top cost drivers to drive efficiency, quality, and scale.

| KPI                                | 2026 Target                      | Baseline (EOY 2025) |
|------------------------------------|----------------------------------|----------------------|
| Global Cost per Case (YoY)         | 15% reduction by EOY            | *TBD* |
| Run-Rate Savings                   | $$$M delivered by EOY           | *TBD* |

### Goal 5 — Eliminate Top Contact Drivers

Identify and eliminate top contact drivers to improve growth, satisfaction, and engagement.

| KPI                                | 2026 Target                                  | Baseline (EOY 2025) |
|------------------------------------|----------------------------------------------|----------------------|
| Contact Rate                       | 25% reduction                               | *TBD* |
| Improvements Surfaced              | ≥ 15 improvements driving engagement/growth | *TBD* |
| Tech Contact Rate                  | ≤ 4.0                                       | *TBD* |

---

## 3. The 7 Opportunities — Descriptions & Goal Mapping

Each opportunity is mapped to the goals it most directly supports, along with the
primary metrics it is expected to move.

### OPP-1: Reducing Incorrect / Inaccessible Email Address Contacts

**Description:** A significant volume of inbound contacts stems from customers unable
to access their accounts due to incorrect or outdated email addresses. Reducing these
contacts requires both proactive email hygiene initiatives and improved self-service
flows for email updates.

| Attribute          | Detail                                                    |
|--------------------|-----------------------------------------------------------|
| **Primary Goals**  | Goal 1 (1:1 Support), Goal 5 (Eliminate Contact Drivers)  |
| **Key Metrics**    | Contact volume from email issues, FCR on email tickets, self-service completion rate for email changes |
| **Data Sources**   | CRM / ticketing system (contact reason taxonomy), IVR/chatbot logs, account management funnel data |

### OPP-2: Account Sharing Inquiry Surge — Mitigation with Product & Technology

**Description:** Policy and product changes around account sharing are expected to
generate a spike in customer inquiries. Proactive collaboration with Product and
Technology is needed to deflect avoidable contacts through better in-app messaging,
FAQ content, and policy clarity.

| Attribute          | Detail                                                    |
|--------------------|-----------------------------------------------------------|
| **Primary Goals**  | Goal 2 (Automation), Goal 4 (Cost Optimization), Goal 5 (Eliminate Contact Drivers) |
| **Key Metrics**    | Account sharing contact volume, deflection rate, chatbot resolution rate for sharing topics, CSAT on sharing interactions |
| **Data Sources**   | CRM / ticketing (contact reason), chatbot topic classification, product telemetry (sharing feature usage), CSAT surveys |

### OPP-3: Understanding OTP Journey Pain Points

**Description:** One-Time Password (OTP) flows are a friction point in the
authentication experience. Deeper data exploration is required to identify where
customers are failing, retrying, or abandoning the OTP journey.

| Attribute          | Detail                                                    |
|--------------------|-----------------------------------------------------------|
| **Primary Goals**  | Goal 1 (1:1 Support), Goal 5 (Eliminate Contact Drivers)  |
| **Key Metrics**    | OTP-related contact volume, OTP success/failure rate by step, OTP retry rate, time to complete OTP, OTP-triggered churn |
| **Data Sources**   | Authentication service logs, CRM (contact reason), product analytics (funnel events), chatbot logs |

### OPP-4: Disney Bundle Activation — Customer Confusion

**Description:** Customers are confused during the Disney bundle activation flow,
resulting in contacts and negative sentiment. Root-cause analysis of where confusion
arises (eligibility, linking, billing) is needed to drive UX and communication fixes.

| Attribute          | Detail                                                    |
|--------------------|-----------------------------------------------------------|
| **Primary Goals**  | Goal 1 (1:1 Support), Goal 3 (Quality at Scale), Goal 5 (Eliminate Contact Drivers) |
| **Key Metrics**    | Bundle activation contact volume, activation success rate, CSAT on bundle interactions, repeat contact rate for bundle issues |
| **Data Sources**   | CRM (contact reason), bundle activation funnel data, CSAT surveys, chatbot/IVR topic logs |

### OPP-5: Automation for FCCA & Third-Party Cancellations

**Description:** First Contact Cancellation Attempts (FCCA) and third-party
cancellations represent repeatable, rules-based interactions that are strong
candidates for automation. Evaluating and implementing automation will reduce cost
and handle time while maintaining quality.

| Attribute          | Detail                                                    |
|--------------------|-----------------------------------------------------------|
| **Primary Goals**  | Goal 2 (Automation), Goal 4 (Cost Optimization)           |
| **Key Metrics**    | FCCA volume, third-party cancellation volume, automation rate, AHT for cancellation contacts, cost per cancellation case, CSAT post-cancellation |
| **Data Sources**   | CRM / ticketing, billing system (cancellation events), workforce management (AHT), cost accounting, CSAT surveys |

### OPP-6: Refund Issues & Automation Opportunities

**Description:** Refund requests are a high-volume contact driver. Identifying
which refund scenarios can be safely automated — and which require human judgment —
will reduce volume, cost, and customer effort.

| Attribute          | Detail                                                    |
|--------------------|-----------------------------------------------------------|
| **Primary Goals**  | Goal 2 (Automation), Goal 4 (Cost Optimization), Goal 5 (Eliminate Contact Drivers) |
| **Key Metrics**    | Refund contact volume, refund automation rate, refund processing time, refund CSAT, cost per refund case |
| **Data Sources**   | CRM / ticketing, billing/payment system, automation platform logs, CSAT surveys |

### OPP-7: Additional Deflection Levers to Reduce Spam

**Description:** Spam and non-actionable contacts waste agent capacity. Identifying
and implementing additional deflection mechanisms (better IVR trees, CAPTCHA,
authentication gates) will free capacity for genuine customer needs.

| Attribute          | Detail                                                    |
|--------------------|-----------------------------------------------------------|
| **Primary Goals**  | Goal 4 (Cost Optimization), Goal 5 (Eliminate Contact Drivers) |
| **Key Metrics**    | Spam contact volume, spam deflection rate, false-positive rate, agent utilization gained |
| **Data Sources**   | CRM / ticketing (spam classification), IVR/chatbot logs, telephony platform data |

---

## 4. Opportunity → Goal Mapping Matrix

|                           | Goal 1: 1:1 Support | Goal 2: Automation | Goal 3: Quality at Scale | Goal 4: Cost Optimization | Goal 5: Eliminate Contact Drivers |
|---------------------------|:---:|:---:|:---:|:---:|:---:|
| OPP-1: Email Addresses    | ●   |     |     |     | ●   |
| OPP-2: Account Sharing    |     | ●   |     | ●   | ●   |
| OPP-3: OTP Journey        | ●   |     |     |     | ●   |
| OPP-4: Disney Bundle      | ●   |     | ●   |     | ●   |
| OPP-5: FCCA / 3P Cancel   |     | ●   |     | ●   |     |
| OPP-6: Refunds            |     | ●   |     | ●   | ●   |
| OPP-7: Spam Deflection    |     |     |     | ●   | ●   |

---

## 5. Dashboard Architecture

### 5.1 Dashboard 1 — CX Executive KPI Overview

**Audience:** CX VP, Directors, cross-functional leadership

**Layout:**

```
┌─────────────────────────────────────────────────────────────────────┐
│  FILTERS: Date Range | Market | Product | Channel                  │
├──────────┬──────────┬──────────┬──────────┬──────────┐             │
│ Goal 1   │ Goal 2   │ Goal 3   │ Goal 4   │ Goal 5   │  KPI TILES │
│ FCR: 88% │ SS: 72%  │CSAT: 93% │CPC: -11% │CR: -18%  │  (color-  │
│ AHT: -1m │ Bot: +15 │Var: 4.8  │Sav: $XM  │Imp: 10   │  coded)   │
├──────────┴──────────┴──────────┴──────────┴──────────┘             │
│                                                                     │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │  GOAL PROGRESS OVER TIME (multi-line time series)       │       │
│  │  — FCR %, Self-Service %, CSAT %, CPC trend, CR trend   │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
│  ┌──────────────────────────┐  ┌──────────────────────────┐       │
│  │  OPPORTUNITY IMPACT      │  │  GOAL HEALTH HEATMAP     │       │
│  │  CONTRIBUTION WATERFALL  │  │  (by market × goal)      │       │
│  └──────────────────────────┘  └──────────────────────────┘       │
└─────────────────────────────────────────────────────────────────────┘
```

**Tiles detail:**

| Tile                               | Visualization | Description |
|------------------------------------|---------------|-------------|
| Goal KPI Scorecards (×5)           | Single-value tiles with target comparison | Show current value, target, and RAG status |
| Goal Progress Over Time            | Multi-line time series | Weekly/monthly trend for each primary KPI |
| Opportunity Impact Waterfall       | Waterfall chart | Estimated contact-volume reduction contributed by each opportunity |
| Goal Health Heatmap                | Heatmap | Rows = markets, columns = goals; cell color = RAG status |

### 5.2 Dashboard 2 — Opportunity Impact Tracker

**Audience:** CX Directors, Opportunity Owners, Program Managers

**Layout:**

```
┌─────────────────────────────────────────────────────────────────────┐
│  FILTERS: Date Range | Opportunity | Owner | Status                │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │  OPPORTUNITY STATUS TABLE                                │       │
│  │  Opp | Owner | Status | Est. Impact | Actual | Gap      │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
│  ┌──────────────────────────┐  ┌──────────────────────────┐       │
│  │  CONTACT VOLUME BY OPP   │  │  PROJECTED vs ACTUAL     │       │
│  │  (stacked bar, monthly)  │  │  SAVINGS (dual-axis)     │       │
│  └──────────────────────────┘  └──────────────────────────┘       │
│                                                                     │
│  ┌──────────────────────────┐  ┌──────────────────────────┐       │
│  │  GOAL CONTRIBUTION       │  │  OPPORTUNITY TIMELINE    │       │
│  │  SANKEY / ALLUVIAL       │  │  (Gantt-style)           │       │
│  └──────────────────────────┘  └──────────────────────────┘       │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

**Tiles detail:**

| Tile                              | Visualization  | Description |
|-----------------------------------|----------------|-------------|
| Opportunity Status Table          | Table with conditional formatting | One row per opportunity; RAG status, owner, estimated vs. actual impact |
| Contact Volume by Opportunity     | Stacked bar chart (monthly) | Shows volume attributable to each opportunity over time |
| Projected vs Actual Savings       | Dual-axis line/bar | Compares forecasted cost/volume savings against actuals |
| Goal Contribution Sankey          | Sankey / alluvial diagram | Visual flow from opportunities → goals showing contribution relationships |
| Opportunity Timeline              | Gantt chart | Milestones and phases for each opportunity's implementation |

### 5.3 Dashboard 3 (×7) — Opportunity Deep-Dives

Each of the 7 opportunities gets its own drill-down dashboard. The general layout is
consistent, but the specific metrics vary by opportunity.

**Common Layout:**

```
┌─────────────────────────────────────────────────────────────────────┐
│  HEADER: Opportunity Name | Owner | Status | Target Impact         │
├─────────────────────────────────────────────────────────────────────┤
│  FILTERS: Date Range | Market | Channel | Sub-Category             │
├──────────┬──────────┬──────────┬──────────┐                        │
│ Metric 1 │ Metric 2 │ Metric 3 │ Metric 4 │  KPI SCORECARDS       │
├──────────┴──────────┴──────────┴──────────┘                        │
│                                                                     │
│  ┌──────────────────────────────────────────────────────────┐      │
│  │  PRIMARY METRIC TREND (time series with target line)     │      │
│  └──────────────────────────────────────────────────────────┘      │
│                                                                     │
│  ┌──────────────────────────┐  ┌───────────────────────────┐      │
│  │  BREAKDOWN BY DIMENSION  │  │  ROOT CAUSE / CATEGORY    │      │
│  │  (bar or pie chart)      │  │  ANALYSIS                 │      │
│  └──────────────────────────┘  └───────────────────────────┘      │
│                                                                     │
│  ┌──────────────────────────────────────────────────────────┐      │
│  │  DETAIL TABLE (drillable)                                 │      │
│  └──────────────────────────────────────────────────────────┘      │
└─────────────────────────────────────────────────────────────────────┘
```

**Opportunity-specific metrics:**

| Opportunity | Scorecard Metrics | Breakdown Dimension | Root Cause View |
|---|---|---|---|
| OPP-1: Email | Email-contact vol, FCR, self-service email-update rate, repeat rate | By market, by email issue sub-type | Top reasons for email inaccessibility |
| OPP-2: Account Sharing | Sharing contact vol, deflection rate, bot resolution rate, CSAT | By market, by inquiry sub-type | Sharing policy confusion categories |
| OPP-3: OTP Journey | OTP contact vol, OTP success rate, retry rate, abandonment rate | By OTP step, by device/platform | Funnel drop-off analysis |
| OPP-4: Disney Bundle | Bundle contact vol, activation success rate, CSAT, repeat rate | By confusion category, by channel | Activation funnel failure points |
| OPP-5: FCCA/3P Cancel | Cancel vol, automation rate, AHT, cost per case | By cancellation type, by channel | Automation eligibility segmentation |
| OPP-6: Refunds | Refund contact vol, automation rate, processing time, CSAT | By refund reason, by amount tier | Automation vs. human-required segmentation |
| OPP-7: Spam Deflection | Spam vol, deflection rate, false-positive rate, capacity freed | By spam type, by entry channel | Deflection mechanism effectiveness |

---

## 6. Data Requirements & Sources

### 6.1 Required Data Sources

| Source                       | Key Tables / Feeds                     | Refresh Cadence | Owner |
|------------------------------|----------------------------------------|-----------------|-------|
| CRM / Ticketing System       | Cases, contact reasons, dispositions   | Daily           | CX Ops |
| CSAT Survey Platform         | Survey responses, scores, verbatims    | Daily           | CX Analytics |
| Chatbot / IVR Platform       | Conversations, intents, outcomes       | Daily           | Digital CX |
| Billing / Payment System     | Transactions, refunds, cancellations   | Daily           | Finance / Billing |
| Authentication Service       | OTP events, success/fail/retry logs    | Daily           | Technology |
| Product Analytics            | Funnel events, feature usage           | Daily           | Product Analytics |
| Workforce Management         | AHT, schedule adherence, utilization   | Daily           | WFM |
| Cost Accounting              | Cost per case, headcount, vendor costs | Monthly         | Finance |
| Bundle Activation Funnel     | Activation attempts, completions       | Daily           | Product |
| Spam Classification          | Spam flags, confidence scores          | Daily           | CX Ops |

### 6.2 Data Model Summary

The LookML model is organized around these primary views:

- **cx_cases** — The core fact table; one row per customer contact/case
- **cx_csat_surveys** — CSAT survey responses joined to cases
- **cx_goals** — Goal definitions, KPIs, and targets (dimension table)
- **cx_opportunities** — Opportunity definitions and metadata (dimension table)
- **cx_opportunity_metrics** — Time-series metrics for each opportunity
- **cx_goal_kpis** — Time-series KPI values for each goal

---

## 7. Implementation Phases

### Phase 1 — Foundation (Target: Weeks 1–3)

- [ ] Finalize data source access and ETL pipelines
- [ ] Build LookML views for core data (cases, CSAT, goals, opportunities)
- [ ] Deploy **CX Executive KPI Overview** dashboard
- [ ] Validate KPI calculations with CX Analytics team

### Phase 2 — Opportunity Tracking (Target: Weeks 4–6)

- [ ] Build opportunity_metrics data pipeline
- [ ] Deploy **Opportunity Impact Tracker** dashboard
- [ ] Set up automated alerting for KPI threshold breaches
- [ ] Validate opportunity-to-goal attribution logic

### Phase 3 — Deep-Dives (Target: Weeks 7–12)

- [ ] Deploy deep-dive dashboards for OPP-1 through OPP-7
- [ ] Integrate additional data sources (OTP logs, bundle funnel, spam classification)
- [ ] Build drill-through links between dashboards
- [ ] User acceptance testing with opportunity owners

### Phase 4 — Optimization (Ongoing)

- [ ] Refine visualizations based on stakeholder feedback
- [ ] Add predictive/forecasting tiles where data supports it
- [ ] Automate monthly executive summary delivery via Looker schedules
- [ ] Iterate on goal-to-opportunity attribution as new data becomes available

---

## 8. Access & Governance

| Role                  | Access Level                                  |
|-----------------------|-----------------------------------------------|
| CX VP / SVP           | Full access to all dashboards                 |
| CX Directors          | Full access to all dashboards                 |
| Opportunity Owners    | Full access to their opportunity deep-dive + tracker |
| CX Managers           | Read access to Executive KPI + Tracker        |
| Cross-Functional (Product, Tech) | Read access to relevant deep-dives |

---

## 9. Open Questions & Risks

| # | Item | Status |
|---|------|--------|
| 1 | Baseline values for all KPIs need to be confirmed from EOY 2025 reporting | Open |
| 2 | Cost per case data granularity — is it available at the case level or only aggregated? | Open |
| 3 | OTP authentication logs — access and format TBD with Technology team | Open |
| 4 | Account Sharing contact volume projections — dependent on Product roadmap timing | Open |
| 5 | Spam classification model accuracy — need to validate false-positive rates before using as a dashboard metric | Open |
| 6 | Run-rate savings target ($$$M) — exact figure to be confirmed by Finance | Open |

---

## 10. Appendix — Dashboard Wireframe Descriptions

Detailed wireframes are captured in the accompanying LookML dashboard files:

- `lookml/dashboards/cx_executive_kpi_overview.dashboard.lookml`
- `lookml/dashboards/cx_opportunity_impact_tracker.dashboard.lookml`
- `lookml/dashboards/cx_opportunity_deep_dives.dashboard.lookml`

These files are importable into a Looker instance and serve as the starting
configuration for each dashboard.
