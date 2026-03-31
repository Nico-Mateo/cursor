view: cx_opportunity_metrics {
  sql_table_name: schema.cx_opportunity_metrics ;;

  dimension: metric_id {
    primary_key: yes
    type: string
    sql: CONCAT(${opportunity_id}, '-', ${metric_name}, '-', ${reporting_date}) ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
    hidden: yes
  }

  dimension: metric_name {
    type: string
    sql: ${TABLE}.metric_name ;;
  }

  dimension: metric_display_name {
    type: string
    sql: ${TABLE}.metric_display_name ;;
  }

  dimension_group: reporting {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.reporting_date ;;
  }

  dimension: actual_value {
    type: number
    sql: ${TABLE}.actual_value ;;
    value_format_name: decimal_2
  }

  dimension: projected_value {
    type: number
    sql: ${TABLE}.projected_value ;;
    value_format_name: decimal_2
  }

  dimension: contact_volume_impact {
    type: number
    sql: ${TABLE}.contact_volume_impact ;;
    description: "Number of contacts reduced/avoided attributed to this opportunity"
  }

  dimension: cost_impact {
    type: number
    sql: ${TABLE}.cost_impact ;;
    value_format_name: usd_0
    description: "Cost savings attributed to this opportunity"
  }

  # ─── Measures ───

  measure: total_contact_volume_impact {
    type: sum
    sql: ${contact_volume_impact} ;;
    value_format_name: decimal_0
    label: "Total Contacts Reduced"
  }

  measure: total_cost_impact {
    type: sum
    sql: ${cost_impact} ;;
    value_format_name: usd_0
    label: "Total Cost Savings"
  }

  measure: avg_actual_value {
    type: average
    sql: ${actual_value} ;;
    value_format_name: decimal_2
  }

  measure: avg_projected_value {
    type: average
    sql: ${projected_value} ;;
    value_format_name: decimal_2
  }

  measure: projection_gap {
    type: number
    sql: ${avg_actual_value} - ${avg_projected_value} ;;
    value_format_name: decimal_2
    description: "Positive = ahead of plan, Negative = behind plan"
  }
}
