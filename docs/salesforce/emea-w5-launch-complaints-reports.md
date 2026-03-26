# EMEA W5 Launch Complaints — Salesforce Reports & Dashboard Tiles

## Objective

Create five Salesforce reports, one per complaint category, and add corresponding tiles to the existing **DB9: EMEA W5 Launch** Lightning dashboard. Each report isolates a distinct complaint theme so operations and leadership can track root-cause volumes independently.

## Scope

### Markets

- United Kingdom
- Ireland

### Date range

All cases with a contact date of **2026-03-26 or later** (EMEA Wave 5 launch date).

### Case population

Only cases classified as EMEA Wave 5 launch contacts from the UK and Ireland markets.

## Report naming convention

Use a consistent prefix so the five reports group together in report folders and are easy to associate with the dashboard:

`W5 Complaints - [##] - [Short Title]`

Examples:

- `W5 Complaints - 01 - HBO Max Activation Errors`
- `W5 Complaints - 02 - TNT Sports HBO Entertainment Access Confusion`

## Shared report filters (apply to every report)

| Filter | Operator | Value | Notes |
| --- | --- | --- | --- |
| Contact Date | greater or equal | 2026-03-26 | Wave 5 launch date cutoff |
| Market | equals | UK, Ireland | EMEA W5 target markets only |

Each report adds issue-specific filters on top of these shared filters, detailed in the per-report sections below.

## Dashboard target

**DB9: EMEA W5 Launch**

Add five new tiles — one per complaint category. The tiles should be placed in a dedicated section or row labeled **Launch Complaint Categories** to keep them visually grouped but clearly separated from one another.

---

## Report 1 — HBO Max Activation Errors

### Context

94 cases (63 % of tracked complaints). Sky Q, Sky Glass, and Sky Stream customers activating their included HBO Max entitlement encounter one of three failure modes:

1. Registering with the wrong email address.
2. A redirect loop returning them to a "renew my subscription" page.
3. A generic "something went wrong" error blocking account creation.

Most cases required an advocate-guided walkthrough to resolve.

### Report name

`W5 Complaints - 01 - HBO Max Activation Errors`

### Recommended report type

Summary report grouped by **Sub-Issue** or **Error Type** (depending on field availability), then by **Device Type** (Sky Q / Glass / Stream).

### Key filters (in addition to shared filters)

| Filter | Operator | Value |
| --- | --- | --- |
| Issue Category | equals | Activation / Account Creation |
| Provider / Platform | equals | Sky |
| Error Type or Case Reason | contains | wrong email, renew subscription, something went wrong |

### Recommended fields

- Case Number
- Contact Date
- Market
- Customer Email (masked if PII rules require)
- Device Type (Sky Q / Sky Glass / Sky Stream)
- Error Type / Sub-Issue
- Resolution (self-serve vs advocate-assisted)
- Case Owner

### Summary metric for tile

**Total case count**, with a secondary breakdown by error type.

### Tile specification

| Property | Value |
| --- | --- |
| Tile title | HBO Max Activation Errors |
| Visualization | Donut chart (segments = error type) |
| Primary metric | Case count |
| Drill-through | Opens full report |

---

## Report 2 — TNT Sports: HBO Entertainment Access Confusion

### Context

18 cases (12 %). Sky TNT Sports subscribers expect full HBO Max entertainment access but land on the Basic tier or see "Get Access" locked on all entertainment content. Sky TNT customers **can** add Entertainment via DTC hybrid billing at hbomax.com, but the path is non-obvious from the Sky activation flow and is not surfaced in the app.

### Report name

`W5 Complaints - 02 - TNT Sports HBO Entertainment Access Confusion`

### Recommended report type

Summary report grouped by **Scenario Variant** (e.g., landed on Basic tier, "Get Access" locked), then by **Resolution Path**.

### Key filters (in addition to shared filters)

| Filter | Operator | Value |
| --- | --- | --- |
| Issue Category | equals | Entitlement / Access |
| Provider / Package | equals | Sky TNT Sports |
| Issue Subcategory | contains | entertainment access, basic tier, get access locked |

### Recommended fields

- Case Number
- Contact Date
- Market
- Customer Package / Tier
- Scenario Variant
- Expected Tier vs Actual Tier
- Resolution Path (DTC hybrid billing, advocate redirect, unresolved)
- Case Owner

### Summary metric for tile

**Total case count**, with a secondary breakdown by scenario variant.

### Tile specification

| Property | Value |
| --- | --- |
| Tile title | TNT Sports — HBO Entertainment Access Confusion |
| Visualization | Horizontal bar (bars = scenario variant) |
| Primary metric | Case count |
| Drill-through | Opens full report |

---

## Report 3 — Region Lock / Out-of-Region Error

### Context

11 cases (7 %). Ireland-based Sky customers with legacy VPN or US-region HBO Max accounts cannot complete activation — error message: _"your email address is already registered in a different region."_ Also firing for some UK customers with old US accounts. No self-serve resolution; requires an account-level region reset by support.

### Report name

`W5 Complaints - 03 - Region Lock Out of Region Error`

### Recommended report type

Summary report grouped by **Market** (UK vs Ireland), then by **Account Origin Region** (US, other).

### Key filters (in addition to shared filters)

| Filter | Operator | Value |
| --- | --- | --- |
| Issue Category | equals | Activation / Account Creation |
| Error Type or Case Reason | contains | region, already registered, different region |

### Recommended fields

- Case Number
- Contact Date
- Market
- Customer Email (masked)
- Account Origin Region (US / UK / IE / other)
- VPN / Legacy Account Flag (if available)
- Resolution (region reset completed, pending, escalated)
- Case Owner

### Summary metric for tile

**Total case count**, with a secondary breakdown by market.

### Tile specification

| Property | Value |
| --- | --- |
| Tile title | Region Lock / Out-of-Region Error |
| Visualization | Stacked bar (stack = market, bars = account origin) |
| Primary metric | Case count |
| Drill-through | Opens full report |

---

## Report 4 — Discovery+ Credentials Not Recognised

### Context

11 cases (7 %). Sky-billed TNT Sports subscribers attempt to log in with their Discovery+ email and receive _"email does not exist"_ at hbomax.com. These customers are unaware that Sky's HBO Max entitlement requires a new account creation via the Sky activation portal — their Discovery+ credentials do not transfer.

### Report name

`W5 Complaints - 04 - Discovery Plus Credentials Not Recognised`

### Recommended report type

Summary report grouped by **Provider Billing Source** (Sky-billed TNT Sports), then by **Resolution Path**.

### Key filters (in addition to shared filters)

| Filter | Operator | Value |
| --- | --- | --- |
| Issue Category | equals | Sign In / Authentication |
| Provider / Package | equals | Sky TNT Sports |
| Error Type or Case Reason | contains | email does not exist, discovery+, credentials not recognised |

### Recommended fields

- Case Number
- Contact Date
- Market
- Provider Billing Source
- Login Method Attempted (Discovery+ email)
- Error Message
- Resolution Path (redirected to Sky activation portal, new account created, unresolved)
- Case Owner

### Summary metric for tile

**Total case count**, with a secondary breakdown by resolution path.

### Tile specification

| Property | Value |
| --- | --- |
| Tile title | Discovery+ Credentials Not Recognised |
| Visualization | Donut chart (segments = resolution path) |
| Primary metric | Case count |
| Drill-through | Opens full report |

---

## Report 5 — Double Accounts / Consolidation Queries

### Context

10 cases (7 %). Customers holding both an EE/BT TNT Sports-linked HBO Max account and a separate Sky-linked HBO Max account want to merge them into a single login. No self-serve consolidation path exists.

### Report name

`W5 Complaints - 05 - Double Accounts Consolidation Queries`

### Recommended report type

Summary report grouped by **Account Source Pair** (e.g., EE + Sky, BT + Sky), then by **Resolution Status**.

### Key filters (in addition to shared filters)

| Filter | Operator | Value |
| --- | --- | --- |
| Issue Category | equals | Account Management / Consolidation |
| Issue Subcategory | contains | merge, consolidation, double account, duplicate account |

### Recommended fields

- Case Number
- Contact Date
- Market
- Account 1 Provider (EE / BT)
- Account 2 Provider (Sky)
- Consolidation Requested (Yes / No)
- Resolution Status (merged, pending, not possible)
- Case Owner

### Summary metric for tile

**Total case count**, with a secondary breakdown by account source pair.

### Tile specification

| Property | Value |
| --- | --- |
| Tile title | Double Accounts / Consolidation Queries |
| Visualization | Horizontal bar (bars = account source pair) |
| Primary metric | Case count |
| Drill-through | Opens full report |

---

## Dashboard tile layout — DB9: EMEA W5 Launch

All five tiles belong in a new section titled **Launch Complaint Categories**.

| Tile | Report | Visualization | Baseline volume | Share |
| --- | --- | --- | --- | --- |
| 1 | W5 Complaints - 01 - HBO Max Activation Errors | Donut | 94 cases | 63 % |
| 2 | W5 Complaints - 02 - TNT Sports HBO Entertainment Access Confusion | Horizontal bar | 18 cases | 12 % |
| 3 | W5 Complaints - 03 - Region Lock Out of Region Error | Stacked bar | 11 cases | 7 % |
| 4 | W5 Complaints - 04 - Discovery Plus Credentials Not Recognised | Donut | 11 cases | 7 % |
| 5 | W5 Complaints - 05 - Double Accounts Consolidation Queries | Horizontal bar | 10 cases | 7 % |

### Suggested tile sizes

- Tile 1 (HBO Max Activation Errors) — large or medium-wide, since it represents 63 % of volume and benefits from visible error-type segments.
- Tiles 2–5 — medium, uniform sizing to keep the section balanced.

## Dashboard filter requirements

The following filters should be available on the **DB9: EMEA W5 Launch** dashboard and should apply to all five tiles:

| Filter | Default value | Allowed values |
| --- | --- | --- |
| Market | UK, Ireland | UK, Ireland |
| Contact Date | 2026-03-26 onward | Date range picker |
| Provider / Package | All | Sky, Sky TNT Sports, EE, BT, All |
| Resolution Status | All | Resolved, Pending, Escalated, All |

## Report folder

Store all five reports in a shared folder:

**Folder name:** `W5 Launch Complaints - EMEA`

This keeps them separate from the provider-review reports and any other dashboard-supporting report sets.

## Build steps

1. Create the report folder `W5 Launch Complaints - EMEA`.
2. Build Report 01 (HBO Max Activation Errors) using the filters, fields, and groupings above.
3. Build Report 02 (TNT Sports HBO Entertainment Access Confusion).
4. Build Report 03 (Region Lock / Out-of-Region Error).
5. Build Report 04 (Discovery+ Credentials Not Recognised).
6. Build Report 05 (Double Accounts / Consolidation Queries).
7. Open **DB9: EMEA W5 Launch** in edit mode.
8. Add a new section row titled **Launch Complaint Categories**.
9. Add tile 1 backed by Report 01; set visualization to donut chart.
10. Add tile 2 backed by Report 02; set visualization to horizontal bar.
11. Add tile 3 backed by Report 03; set visualization to stacked bar.
12. Add tile 4 backed by Report 04; set visualization to donut chart.
13. Add tile 5 backed by Report 05; set visualization to horizontal bar.
14. Apply the shared dashboard filters to all five tiles.
15. Save the dashboard.

## Risks and assumptions

- Field names (Issue Category, Error Type, Provider / Package, etc.) are based on expected Salesforce object schema. Adjust filter values to match the actual picklist or text field values in the org.
- The 94 / 18 / 11 / 11 / 10 case counts are the baseline snapshot provided at the time of this specification. Live reports will reflect real-time counts.
- Some filter values (e.g., "something went wrong", "email does not exist") rely on free-text matching. If the org uses structured picklists instead, replace `contains` filters with `equals` against the corresponding picklist values.
- No self-serve resolution exists for Report 3 (region lock) or Report 5 (consolidation). These tiles will primarily track volume and escalation status until a product fix is available.
- Discovery+ credential issues (Report 4) may decrease over time as customers learn the new activation flow; the report should still be kept active to monitor the long tail.
