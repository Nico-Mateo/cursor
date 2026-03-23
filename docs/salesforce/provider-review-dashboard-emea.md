# Provider Review Dashboard - EMEA

## Objective

Build a provider-focused Salesforce Lightning dashboard for EMEA customer reviews, with a hard limit of 20 dashboard tiles. The dashboard should answer:

- How customers in the UK access HBO/Max through different providers and package types
- Which provider-specific pain points drive contact or negative reviews
- Which scenarios are most common for sign in/sign up, billing and subscription, and RFC
- Which flows are already handled by Digital Assistant (DA) and where Advocate Assist should be surfaced

This document is designed as a build-ready blueprint while the remaining source inputs are still arriving.

## Recommended dashboard name

`EMEA Provider Review Dashboard - UK Access & Pain Points`

## Build approach in Salesforce

1. Make a copy of the existing `EMEA W5 Launch` dashboard.
2. Save the copy to `Private Dashboards`.
3. Rename it to the recommended name above.
4. Duplicate the supporting reports into a private report folder so filters and groupings can be changed safely.
5. Preserve the original layout shell where possible, then replace tiles with the provider-focused reports below.

## Scope

### Primary market

- UK

### Primary focus areas

- Sign in / sign up
- Billing and subscription
- RFC

### Provider and access-path emphasis

At minimum, the UK dashboard should distinguish:

- Direct app or web subscription
- Provider access through NOW
- Provider access through entertainment-only tiers
- Provider access through pay1 movie tiers
- Provider access through TNT Sports package
- Other provider-specific partner paths that appear in review data

## Key provider scenarios to capture

The report layer should separate the access route from the customer problem. Example scenarios:

- Customer accesses HBO/Max through a NOW subscription
- Subscription only includes the basic plan
- Customer wants to upgrade or add features
- Customer cannot log in after provider authentication
- Customer expects movie or sports access that is tied to a different tier
- Customer has billing questions but the bill belongs to the provider instead of HBO/Max directly

## Required dashboard filters

Use dashboard filters that keep the tile count low while still allowing provider-specific drill-down.

| Filter | Recommended values | Notes |
| --- | --- | --- |
| Market | UK default, other EMEA markets optional | Keep UK as default landing view |
| Brand | All brands default | Overview section should stay inclusive of all brands |
| Provider | All, NOW, TNT Sports bundle, Direct, Other partner | Adjust values to match actual data taxonomy |
| Access path | Direct, Provider SSO, Bundle, Add-on | Useful for scenario isolation |
| Package tier | All, Basic, Entertainment Only, Pay1 Movies, TNT Sports, Unknown | Use normalized tier labels |
| Issue focus | Sign in/up, Billing & Subscription, RFC, All | Matches current priority |
| Review period | Last 7, 30, 90 days | Optional if already inherited from source reports |

## Recommended report naming convention

Use a consistent prefix so related reports are easy to manage:

`PRD EMEA - [Section] - [Tile Number] - [Short Title]`

Example:

`PRD EMEA - Overview - 01 - UK Review Volume`

## 20-tile dashboard plan

The layout below uses all 20 available tiles. Tiles 1-5 are cross-brand overview tiles. Tiles 6-20 are provider- and scenario-focused.

| Tile | Section | Title | Visualization | Primary question answered |
| --- | --- | --- | --- | --- |
| 1 | Overview | UK review volume | Metric | How many reviews are in scope for the selected period? |
| 2 | Overview | Review volume by brand | Stacked bar | Which brands generate the most review volume? |
| 3 | Overview | Review volume by provider access path | Horizontal bar | How are customers getting access today? |
| 4 | Overview | Top issue categories | Donut | Are sign in, billing, or RFC driving the most feedback? |
| 5 | Overview | RFC rate and contact volume | Combo chart | Which share of reviews becomes contact-driving or RFC-related? |
| 6 | Access paths | UK access route breakdown | Horizontal bar | Compare Direct vs NOW vs other provider paths |
| 7 | Provider spotlight | NOW - Entertainment Only pain points | Stacked bar | What goes wrong for the basic entertainment tier? |
| 8 | Provider spotlight | NOW - Pay1 Movies pain points | Stacked bar | What issues appear for movie-tier customers? |
| 9 | Provider spotlight | TNT Sports package pain points | Stacked bar | What pain points are unique to the full TNT Sports bundle? |
| 10 | Provider spotlight | Other provider paths | Heat map | Which non-NOW partner paths need attention? |
| 11 | Journey | Sign-up issues by provider | Horizontal bar | Where are customers failing to create or activate access? |
| 12 | Journey | Sign-in issues by provider | Horizontal bar | Which providers create the most login or entitlement friction? |
| 13 | Journey | Billing and subscription issues by provider | Horizontal bar | Which providers create the most billing confusion? |
| 14 | Journey | Upgrade and add-on issues | Stacked bar | Where do customers struggle to upgrade from basic tiers? |
| 15 | Journey | Cannot login / cannot access scenario mix | Donut | What sub-scenarios are hidden inside "can't log in"? |
| 16 | Journey | Provider ownership confusion | Stacked bar | Do customers know whether HBO/Max or the provider owns the issue? |
| 17 | DA flows | DA migration flow usage by provider | Horizontal bar | Which provider scenarios already route through DA flows? |
| 18 | DA flows | DA flow containment vs escalation | Combo chart | Which flows solve the issue and which still escalate? |
| 19 | Support | High-level contact numbers by provider | Metric table | Where are contacts highest by provider or access path? |
| 20 | Watchlist | Emerging provider pain points | Table | What should be reviewed weekly for new provider-specific issues? |

## Section guidance

### 1. Overview area (tiles 1-5)

This area must stay inclusive of all brands and should be the landing section for leadership. It should quickly answer:

- Volume
- Brand mix
- Provider mix
- Top issue categories
- RFC or contact-driving impact

### 2. Provider-specific breakdown area (tiles 6-16)

This is the main operational section. Use it to isolate provider scenarios and the differences between:

- Entertainment-only access
- Pay1 movie access
- TNT Sports package access
- Other partner access paths
- Sign-up versus sign-in problems
- Billing/subscription confusion versus entitlement confusion

### 3. DA and support area (tiles 17-20)

Use the final section to bridge review insights to support operations:

- Which DA migration flows are relevant
- Which issues still need Advocate Assist
- Which providers are generating the most contacts
- Which pain points are newly emerging

## Minimum field requirements for the source report layer

Before the dashboard is built, the reporting dataset should normalize at least the following fields:

- Review date
- Market
- Brand
- Provider name
- Provider group
- Access path
- Package tier
- Issue category
- Issue subcategory
- Scenario
- Scenario variant
- Contact required flag
- RFC flag
- Review count
- Contact count
- DA flow name
- DA flow outcome
- Advocate Assist topic or article

## RFC filter guidance

If RFC is already present in source data, expose it as both:

- a dashboard filter (`RFC: Yes / No / Unknown`)
- a metric used in tiles 5, 13, 18, and 19

If RFC is not yet standardized, create a mapping rule in the source dataset so the dashboard does not depend on free-text review interpretation.

## High-level contact number guidance

Tile 19 should aggregate contact counts at the provider level and optionally at the access-path level. Recommended view:

- Provider
- Review volume
- Contact volume
- Contact rate
- Top associated issue category

## Pending inputs to fold in later

Two future resources were called out and should map into the dashboard as soon as they arrive:

1. **Advocate Assist tool**  
   Major dependency for tiles 18 and 20. Add mappings between scenario, recommended support content, and escalation outcomes.

2. **Provider/issues sheet**  
   Major dependency for provider normalization, package-tier labeling, and scenario completeness.

## Suggested implementation order

1. Copy `EMEA W5 Launch` into `Private Dashboards`
2. Duplicate and rename the report set
3. Normalize provider, access-path, and package-tier dimensions
4. Build tiles 1-5 first for a stable cross-brand overview
5. Build tiles 6-16 for UK provider scenarios
6. Add DA and support tiles once DA flow and Advocate Assist inputs are available
7. Validate RFC and contact-number definitions with stakeholders

## Risks and assumptions

- The current repository does not include Salesforce metadata, so this document acts as a build specification rather than a deployed dashboard asset.
- Provider naming may be inconsistent across review sources and will likely require manual normalization.
- The dashboard can support only 20 tiles, so the design relies on filters instead of dedicated tiles for every provider.
- Tiles 17-20 depend on incoming DA flow and Advocate Assist inputs and may start as placeholders.
