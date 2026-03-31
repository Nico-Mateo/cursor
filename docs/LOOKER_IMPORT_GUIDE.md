# How to Import These Dashboards Into Looker

This guide walks you through getting the LookML files from this repository into your Looker instance so the dashboards are live and queryable.

---

## Prerequisites

Before you start, make sure you have:

1. **A Looker instance** — with Developer or Admin access
2. **A database connection** — already configured in Looker under **Admin > Connections** that points to your data warehouse (BigQuery, Snowflake, Redshift, etc.)
3. **Your actual table names** — the view files use placeholder names like `schema.cx_cases`; you'll need to swap these for your real schema/table names
4. **Seed data loaded** — run the two SQL scripts in `lookml/seed_data/` against your warehouse to create the `cx_goals` and `cx_opportunities` dimension tables

---

## Option A — Connect This Git Repository to Looker (Recommended)

This is the cleanest approach because Looker stays synced with the repo.

### Step-by-step:

1. **Go to** Looker → **Develop** → **Manage LookML Projects** → **New LookML Project**

2. **Select** "Clone Public Git Repository" and paste the URL of this repository

3. **Looker auto-discovers the files.** You should see:
   - `lookml/cx_opportunities.model.lkml` (the model)
   - `lookml/views/*.view.lkml` (6 view files)
   - `lookml/explores/cx_explores.explore.lkml` (explore definitions)
   - `lookml/dashboards/*.dashboard.lookml` (3 dashboards)

4. **Update the connection name.** Open `cx_opportunities.model.lkml` and change:
   ```
   connection: "your_database_connection"
   ```
   to the name of your actual Looker connection (you can find this in **Admin > Connections**)

5. **Update table names.** In each view file under `lookml/views/`, find the `sql_table_name` line and replace the placeholder:
   ```
   sql_table_name: schema.cx_cases ;;
   ```
   with your actual schema and table name, e.g.:
   ```
   sql_table_name: analytics.cx_cases ;;
   ```

6. **Validate.** Click the **"Validate LookML"** button in the IDE. Fix any errors (usually just table/column name mismatches).

7. **Deploy.** Click **"Deploy to Production"** to make the dashboards available to all users.

8. **Find your dashboards.** Navigate to **Browse > Dashboards** and search for:
   - "CX Executive KPI Overview — 2026"
   - "CX Opportunity Impact Tracker — 2026"
   - "CX Opportunity Deep-Dives — 2026"

---

## Option B — Copy/Paste Into an Existing LookML Project

Use this if you already have a LookML project and don't want to create a new one.

### Step-by-step:

1. In Looker, switch to **Development Mode** (toggle in the bottom-left)

2. Open your existing project in **Develop > [Your Project]**

3. **Create the model file:**
   - Click **"+"** → **"Create Model File"**
   - Name it `cx_opportunities`
   - Paste the contents of `lookml/cx_opportunities.model.lkml`
   - Update the `connection:` line and the `include:` paths to match your project structure

4. **Create view files:**
   - For each file in `lookml/views/`, click **"+"** → **"Create View File"**
   - Paste the contents and update `sql_table_name` references

5. **Create the explore file:**
   - Paste the contents of `lookml/explores/cx_explores.explore.lkml`

6. **Create dashboard files:**
   - For each file in `lookml/dashboards/`, click **"+"** → **"Create Dashboard File"**
   - Paste the full contents

7. **Validate and deploy** as described in Option A steps 6-8

---

## Option C — Push via Git (for CI/CD pipelines)

If your Looker project is already connected to a Git repository:

1. Copy the `lookml/` directory contents into your project's repo
2. Commit and push to the branch Looker watches
3. In Looker, pull the changes from Git (**Develop > Pull from Remote**)
4. Validate and deploy

---

## After Import — What to Customize

| What | Where | Why |
|------|-------|-----|
| Connection name | `cx_opportunities.model.lkml` line 1 | Must match your Looker connection |
| Schema/table names | Every `.view.lkml` file, `sql_table_name` line | Must match your warehouse |
| Column names | Dimension/measure `sql:` parameters in view files | If your columns are named differently |
| Opportunity owners | `lookml/seed_data/cx_opportunities_seed.sql` | Add the real owner names before running the seed |
| Baseline values | Fill in once EOY 2025 reporting is finalized | Currently marked TBD in the plan doc |

---

## File Inventory

Here's exactly what gets imported and what each file does:

```
lookml/
├── cx_opportunities.model.lkml           ← Defines the Looker model (connection + includes)
├── views/
│   ├── cx_cases.view.lkml                ← Customer contact/case data (fact table)
│   ├── cx_csat_surveys.view.lkml         ← CSAT survey responses
│   ├── cx_goals.view.lkml                ← The 5 CX goals (dimension table)
│   ├── cx_goal_kpis.view.lkml            ← Goal KPI values over time
│   ├── cx_opportunities.view.lkml        ← The 7 opportunities (dimension table)
│   └── cx_opportunity_metrics.view.lkml  ← Opportunity metrics over time
├── explores/
│   └── cx_explores.explore.lkml          ← Joins views together for querying
├── dashboards/
│   ├── cx_executive_kpi_overview.dashboard.lookml     ← Dashboard 1: Executive KPIs
│   ├── cx_opportunity_impact_tracker.dashboard.lookml ← Dashboard 2: Opportunity Tracker
│   └── cx_opportunity_deep_dives.dashboard.lookml     ← Dashboard 3: Deep-Dives (all 7)
└── seed_data/
    ├── cx_goals_seed.sql                 ← Run in your warehouse to create goals table
    └── cx_opportunities_seed.sql         ← Run in your warehouse to create opportunities table
```

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| "Connection not found" | Update the `connection:` in the model file to match an existing connection in Admin > Connections |
| "Table not found" | Update `sql_table_name` in the view file to your actual schema.table |
| "Column not found" | Check the `sql:` parameter in the dimension/measure — the column name must match your warehouse |
| Dashboard tiles show "Error" | Usually means the explore can't query — check connection + table names first |
| "Model not allowed" | Ask a Looker Admin to allow the model for your connection in Admin > Connections > your connection > "Allowed Models" |
