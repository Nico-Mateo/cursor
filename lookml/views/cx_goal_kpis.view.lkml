view: cx_goal_kpis {
  sql_table_name: schema.cx_goal_kpis ;;

  dimension: goal_kpi_id {
    primary_key: yes
    type: string
    sql: CONCAT(${goal_id}, '-', ${kpi_name}, '-', ${reporting_date}) ;;
  }

  dimension: goal_id {
    type: string
    sql: ${TABLE}.goal_id ;;
    hidden: yes
  }

  dimension: kpi_name {
    type: string
    sql: ${TABLE}.kpi_name ;;
    description: "e.g. fcr_rate, self_service_rate, global_csat, cost_per_case, contact_rate"
  }

  dimension: kpi_display_name {
    type: string
    sql: ${TABLE}.kpi_display_name ;;
  }

  dimension_group: reporting {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.reporting_date ;;
  }

  dimension: current_value {
    type: number
    sql: ${TABLE}.current_value ;;
    value_format_name: decimal_2
  }

  dimension: target_value {
    type: number
    sql: ${TABLE}.target_value ;;
    value_format_name: decimal_2
  }

  dimension: baseline_value {
    type: number
    sql: ${TABLE}.baseline_value ;;
    value_format_name: decimal_2
    description: "EOY 2025 baseline"
  }

  dimension: progress_pct {
    type: number
    sql: CASE
           WHEN ${target_value} = ${baseline_value} THEN NULL
           ELSE (${current_value} - ${baseline_value}) / NULLIF(${target_value} - ${baseline_value}, 0)
         END ;;
    value_format_name: percent_1
    label: "Progress Toward Target"
  }

  dimension: rag_status {
    type: string
    sql: CASE
           WHEN ${progress_pct} >= 0.9 THEN 'green'
           WHEN ${progress_pct} >= 0.6 THEN 'amber'
           ELSE 'red'
         END ;;
    html:
      {% if value == 'green' %}
        <span style="background-color:#4CAF50; color:white; padding:2px 8px; border-radius:4px;">On Track</span>
      {% elsif value == 'amber' %}
        <span style="background-color:#FF9800; color:white; padding:2px 8px; border-radius:4px;">At Risk</span>
      {% else %}
        <span style="background-color:#F44336; color:white; padding:2px 8px; border-radius:4px;">Off Track</span>
      {% endif %} ;;
  }

  # ─── Measures ───

  measure: latest_value {
    type: max
    sql: ${current_value} ;;
    value_format_name: decimal_2
    description: "Most recent reported value — use with a date filter"
  }

  measure: latest_target {
    type: max
    sql: ${target_value} ;;
    value_format_name: decimal_2
  }

  measure: latest_baseline {
    type: max
    sql: ${baseline_value} ;;
    value_format_name: decimal_2
  }
}
