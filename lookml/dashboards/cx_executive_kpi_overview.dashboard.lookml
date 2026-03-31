########################################################################
# Dashboard 1 — CX Executive KPI Overview
#
# Audience: CX VP, Directors, cross-functional leadership
# Purpose:  Bird's-eye view of all 5 goals, their KPIs, and YTD progress
########################################################################

- dashboard: cx_executive_kpi_overview
  title: "CX Executive KPI Overview — 2026"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "High-level view of the 5 CX goals, their target KPIs, and progress year-to-date."

  filters:
    - name: date_range
      title: "Date Range"
      type: date_filter
      default_value: "2026/01/01 to 2026/12/31"
      allow_multiple_values: false

    - name: market
      title: "Market"
      type: field_filter
      explore: cx_cases
      field: cx_cases.market
      default_value: ""
      allow_multiple_values: true

    - name: product
      title: "Product"
      type: field_filter
      explore: cx_cases
      field: cx_cases.product
      default_value: ""
      allow_multiple_values: true

    - name: channel
      title: "Channel"
      type: field_filter
      explore: cx_cases
      field: cx_cases.channel
      default_value: ""
      allow_multiple_values: true

  elements:

    # ────────────────────────────────────────────────
    # ROW 1 — Goal KPI Scorecards
    # ────────────────────────────────────────────────

    - title: "Goal 1: First Contact Resolution"
      name: tile_fcr
      explore: cx_cases
      type: single_value
      fields: [cx_cases.fcr_rate]
      filters:
        cx_cases.created_date: "2026"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        product: cx_cases.product
        channel: cx_cases.channel
      note_text: "Target: ≥ 90%"
      row: 0
      col: 0
      width: 5
      height: 4

    - title: "Goal 1: Avg Handle Time (min)"
      name: tile_aht
      explore: cx_cases
      type: single_value
      fields: [cx_cases.average_handle_time_minutes]
      filters:
        cx_cases.created_date: "2026"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        product: cx_cases.product
        channel: cx_cases.channel
      note_text: "Target: Reduce by 2 min vs baseline"
      row: 0
      col: 5
      width: 5
      height: 4

    - title: "Goal 2: Self-Service Rate"
      name: tile_self_service
      explore: cx_cases
      type: single_value
      fields: [cx_cases.self_service_rate]
      filters:
        cx_cases.created_date: "2026"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        product: cx_cases.product
        channel: cx_cases.channel
      note_text: "Target: ≥ 75%"
      row: 0
      col: 10
      width: 5
      height: 4

    - title: "Goal 2: Chatbot CSAT"
      name: tile_chatbot_csat
      explore: cx_cases
      type: single_value
      fields: [cx_csat_surveys.chatbot_csat_percentage]
      filters:
        cx_csat_surveys.survey_date: "2026"
      listen:
        date_range: cx_csat_surveys.survey_date
        market: cx_csat_surveys.market
        channel: cx_csat_surveys.channel
      note_text: "Target: +20 pp vs baseline"
      row: 0
      col: 15
      width: 4
      height: 4

    - title: "Goal 3: Global CSAT"
      name: tile_global_csat
      explore: cx_cases
      type: single_value
      fields: [cx_csat_surveys.csat_percentage]
      filters:
        cx_csat_surveys.survey_date: "2026"
      listen:
        date_range: cx_csat_surveys.survey_date
        market: cx_csat_surveys.market
        channel: cx_csat_surveys.channel
      note_text: "Target: ≥ 94%"
      row: 0
      col: 19
      width: 5
      height: 4

    # ────────────────────────────────────────────────
    # ROW 2 — Additional KPI Scorecards
    # ────────────────────────────────────────────────

    - title: "Goal 4: Avg Cost per Case"
      name: tile_cost_per_case
      explore: cx_cases
      type: single_value
      fields: [cx_cases.average_cost_per_case]
      filters:
        cx_cases.created_date: "2026"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        product: cx_cases.product
        channel: cx_cases.channel
      note_text: "Target: 15% YoY reduction"
      row: 4
      col: 0
      width: 5
      height: 4

    - title: "Goal 4: Total Cost Savings"
      name: tile_cost_savings
      explore: cx_opportunity_metrics
      type: single_value
      fields: [cx_opportunity_metrics.total_cost_impact]
      filters:
        cx_opportunity_metrics.reporting_date: "2026"
      listen:
        date_range: cx_opportunity_metrics.reporting_date
      note_text: "Target: $$$M run-rate savings"
      row: 4
      col: 5
      width: 5
      height: 4

    - title: "Goal 5: Total Contact Volume"
      name: tile_contact_volume
      explore: cx_cases
      type: single_value
      fields: [cx_cases.total_cases]
      filters:
        cx_cases.created_date: "2026"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        product: cx_cases.product
        channel: cx_cases.channel
      note_text: "Target: 25% reduction in contact rate"
      row: 4
      col: 10
      width: 5
      height: 4

    - title: "Goal 5: Automation Rate"
      name: tile_automation_rate
      explore: cx_cases
      type: single_value
      fields: [cx_cases.automation_rate]
      filters:
        cx_cases.created_date: "2026"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        product: cx_cases.product
        channel: cx_cases.channel
      note_text: "Automation contribution to deflection"
      row: 4
      col: 15
      width: 4
      height: 4

    - title: "Spam Cases"
      name: tile_spam_volume
      explore: cx_cases
      type: single_value
      fields: [cx_cases.spam_cases]
      filters:
        cx_cases.created_date: "2026"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      note_text: "Spam volume tracked for OPP-7"
      row: 4
      col: 19
      width: 5
      height: 4

    # ────────────────────────────────────────────────
    # ROW 3 — Goal Progress Over Time
    # ────────────────────────────────────────────────

    - title: "Goal KPI Trends — Monthly"
      name: tile_kpi_trends
      explore: cx_goal_kpis
      type: looker_line
      fields:
        - cx_goal_kpis.reporting_month
        - cx_goals.goal_short_name
        - cx_goal_kpis.latest_value
      pivots: [cx_goals.goal_short_name]
      filters:
        cx_goal_kpis.reporting_year: "2026"
      sorts: [cx_goal_kpis.reporting_month asc]
      listen:
        date_range: cx_goal_kpis.reporting_date
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      show_x_axis_label: true
      show_x_axis_ticks: true
      point_style: circle
      interpolation: monotone
      row: 8
      col: 0
      width: 24
      height: 8

    # ────────────────────────────────────────────────
    # ROW 4 — Opportunity Waterfall + Market Heatmap
    # ────────────────────────────────────────────────

    - title: "Opportunity Impact — Contact Volume Reduction"
      name: tile_opportunity_waterfall
      explore: cx_opportunity_metrics
      type: looker_waterfall
      fields:
        - cx_opportunities.opportunity_short_name
        - cx_opportunity_metrics.total_contact_volume_impact
      filters:
        cx_opportunity_metrics.reporting_year: "2026"
      sorts: [cx_opportunity_metrics.total_contact_volume_impact desc]
      listen:
        date_range: cx_opportunity_metrics.reporting_date
      show_value_labels: true
      row: 16
      col: 0
      width: 12
      height: 8

    - title: "CSAT by Market"
      name: tile_csat_market_heatmap
      explore: cx_cases
      type: looker_grid
      fields:
        - cx_cases.market
        - cx_csat_surveys.csat_percentage
      filters:
        cx_csat_surveys.survey_date: "2026"
      sorts: [cx_csat_surveys.csat_percentage desc]
      listen:
        date_range: cx_csat_surveys.survey_date
        product: cx_cases.product
        channel: cx_cases.channel
      conditional_formatting:
        - type: along a scale...
          value:
          background_color:
          font_color:
          color_application:
            collection_id: legacy
            palette_id: legacy_sequential1
          bold: false
          italic: false
          strikethrough: false
          fields: [cx_csat_surveys.csat_percentage]
      row: 16
      col: 12
      width: 12
      height: 8
