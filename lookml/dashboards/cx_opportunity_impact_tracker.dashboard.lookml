########################################################################
# Dashboard 2 — Opportunity Impact Tracker
#
# Audience: CX Directors, Opportunity Owners, Program Managers
# Purpose:  Track status and measurable impact of each of the 7 opportunities
########################################################################

- dashboard: cx_opportunity_impact_tracker
  title: "CX Opportunity Impact Tracker — 2026"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Status, progress, and projected vs actual impact for the 7 CX improvement opportunities."

  filters:
    - name: date_range
      title: "Date Range"
      type: date_filter
      default_value: "2026/01/01 to 2026/12/31"
      allow_multiple_values: false

    - name: opportunity
      title: "Opportunity"
      type: field_filter
      explore: cx_opportunity_metrics
      field: cx_opportunities.opportunity_name
      default_value: ""
      allow_multiple_values: true

    - name: owner
      title: "Owner"
      type: field_filter
      explore: cx_opportunity_metrics
      field: cx_opportunities.owner
      default_value: ""
      allow_multiple_values: true

    - name: status
      title: "Status"
      type: field_filter
      explore: cx_opportunity_metrics
      field: cx_opportunities.status
      default_value: ""
      allow_multiple_values: true

  elements:

    # ────────────────────────────────────────────────
    # ROW 1 — Opportunity Status Table
    # ────────────────────────────────────────────────

    - title: "Opportunity Status Overview"
      name: tile_opp_status_table
      explore: cx_opportunity_metrics
      type: looker_grid
      fields:
        - cx_opportunities.opportunity_name
        - cx_opportunities.owner
        - cx_opportunities.status_rag
        - cx_opportunities.estimated_contact_volume_reduction
        - cx_opportunity_metrics.total_contact_volume_impact
        - cx_opportunities.estimated_cost_savings
        - cx_opportunity_metrics.total_cost_impact
        - cx_opportunity_metrics.projection_gap
      filters:
        cx_opportunity_metrics.reporting_year: "2026"
      sorts: [cx_opportunities.opportunity_name asc]
      listen:
        date_range: cx_opportunity_metrics.reporting_date
        opportunity: cx_opportunities.opportunity_name
        owner: cx_opportunities.owner
        status: cx_opportunities.status
      show_view_names: false
      show_row_numbers: true
      row: 0
      col: 0
      width: 24
      height: 7

    # ────────────────────────────────────────────────
    # ROW 2 — Contact Volume by Opportunity (Monthly)
    # ────────────────────────────────────────────────

    - title: "Monthly Contact Volume by Opportunity"
      name: tile_opp_volume_monthly
      explore: cx_cases
      type: looker_column
      fields:
        - cx_cases.created_month
        - cx_opportunities.opportunity_short_name
        - cx_cases.total_cases
      pivots: [cx_opportunities.opportunity_short_name]
      filters:
        cx_cases.created_year: "2026"
        cx_cases.opportunity_id: "-NULL"
      sorts: [cx_cases.created_month asc]
      listen:
        date_range: cx_cases.created_date
        opportunity: cx_opportunities.opportunity_name
      stacking: normal
      show_value_labels: false
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      row: 7
      col: 0
      width: 12
      height: 8

    # ────────────────────────────────────────────────
    # ROW 2 — Projected vs Actual Savings
    # ────────────────────────────────────────────────

    - title: "Projected vs Actual Cost Savings"
      name: tile_projected_vs_actual
      explore: cx_opportunity_metrics
      type: looker_line
      fields:
        - cx_opportunity_metrics.reporting_month
        - cx_opportunity_metrics.avg_projected_value
        - cx_opportunity_metrics.avg_actual_value
      filters:
        cx_opportunity_metrics.reporting_year: "2026"
        cx_opportunity_metrics.metric_name: "cost_savings"
      sorts: [cx_opportunity_metrics.reporting_month asc]
      listen:
        date_range: cx_opportunity_metrics.reporting_date
        opportunity: cx_opportunities.opportunity_name
      show_view_names: false
      show_value_labels: true
      point_style: circle
      interpolation: monotone
      y_axes:
        - label: "Cost Savings ($)"
          orientation: left
      series_colors:
        cx_opportunity_metrics.avg_projected_value: "#9E9E9E"
        cx_opportunity_metrics.avg_actual_value: "#4CAF50"
      row: 7
      col: 12
      width: 12
      height: 8

    # ────────────────────────────────────────────────
    # ROW 3 — Goal Contribution + Timeline
    # ────────────────────────────────────────────────

    - title: "Contact Reduction by Opportunity"
      name: tile_contact_reduction_bar
      explore: cx_opportunity_metrics
      type: looker_bar
      fields:
        - cx_opportunities.opportunity_short_name
        - cx_opportunity_metrics.total_contact_volume_impact
      filters:
        cx_opportunity_metrics.reporting_year: "2026"
      sorts: [cx_opportunity_metrics.total_contact_volume_impact desc]
      listen:
        date_range: cx_opportunity_metrics.reporting_date
        opportunity: cx_opportunities.opportunity_name
      show_view_names: false
      show_value_labels: true
      color_application:
        collection_id: legacy
        palette_id: legacy_sequential1
      row: 15
      col: 0
      width: 12
      height: 8

    - title: "Opportunity Timeline"
      name: tile_opp_timeline
      explore: cx_opportunity_metrics
      type: looker_grid
      fields:
        - cx_opportunities.opportunity_name
        - cx_opportunities.target_start_date
        - cx_opportunities.target_end_date
        - cx_opportunities.status
        - cx_opportunities.owner
      sorts: [cx_opportunities.target_start_date asc]
      listen:
        opportunity: cx_opportunities.opportunity_name
        owner: cx_opportunities.owner
        status: cx_opportunities.status
      show_view_names: false
      show_row_numbers: false
      row: 15
      col: 12
      width: 12
      height: 8

    # ────────────────────────────────────────────────
    # ROW 4 — Cumulative impact trend
    # ────────────────────────────────────────────────

    - title: "Cumulative Contact Volume Impact (YTD)"
      name: tile_cumulative_impact
      explore: cx_opportunity_metrics
      type: looker_area
      fields:
        - cx_opportunity_metrics.reporting_month
        - cx_opportunities.opportunity_short_name
        - cx_opportunity_metrics.total_contact_volume_impact
      pivots: [cx_opportunities.opportunity_short_name]
      filters:
        cx_opportunity_metrics.reporting_year: "2026"
      sorts: [cx_opportunity_metrics.reporting_month asc]
      listen:
        date_range: cx_opportunity_metrics.reporting_date
        opportunity: cx_opportunities.opportunity_name
      stacking: normal
      show_view_names: false
      show_value_labels: false
      interpolation: monotone
      row: 23
      col: 0
      width: 24
      height: 8
