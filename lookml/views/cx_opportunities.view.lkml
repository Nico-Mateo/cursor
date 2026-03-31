view: cx_opportunities {
  sql_table_name: schema.cx_opportunities ;;

  dimension: opportunity_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}.opportunity_name ;;
    order_by_field: opportunity_sort_order
  }

  dimension: opportunity_short_name {
    type: string
    sql: ${TABLE}.opportunity_short_name ;;
    description: "Abbreviated name for chart labels"
  }

  dimension: opportunity_sort_order {
    type: number
    sql: ${TABLE}.sort_order ;;
    hidden: yes
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: owner {
    type: string
    sql: ${TABLE}.owner ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    description: "not_started, in_progress, completed, blocked"
  }

  dimension: status_rag {
    type: string
    sql: CASE
           WHEN ${status} = 'completed' THEN 'green'
           WHEN ${status} = 'in_progress' THEN 'amber'
           WHEN ${status} = 'blocked' THEN 'red'
           ELSE 'grey'
         END ;;
    html:
      {% if value == 'green' %}
        <span style="background-color:#4CAF50; color:white; padding:2px 8px; border-radius:4px;">{{ value }}</span>
      {% elsif value == 'amber' %}
        <span style="background-color:#FF9800; color:white; padding:2px 8px; border-radius:4px;">{{ value }}</span>
      {% elsif value == 'red' %}
        <span style="background-color:#F44336; color:white; padding:2px 8px; border-radius:4px;">{{ value }}</span>
      {% else %}
        <span style="background-color:#9E9E9E; color:white; padding:2px 8px; border-radius:4px;">{{ value }}</span>
      {% endif %} ;;
  }

  dimension: estimated_contact_volume_reduction {
    type: number
    sql: ${TABLE}.estimated_contact_volume_reduction ;;
    value_format_name: decimal_0
    label: "Est. Contact Volume Reduction"
  }

  dimension: estimated_cost_savings {
    type: number
    sql: ${TABLE}.estimated_cost_savings ;;
    value_format_name: usd_0
    label: "Est. Cost Savings"
  }

  dimension: primary_goal_ids {
    type: string
    sql: ${TABLE}.primary_goal_ids ;;
    description: "Comma-separated list of goal IDs this opportunity supports"
  }

  dimension_group: target_start {
    type: time
    timeframes: [date, month, quarter]
    sql: ${TABLE}.target_start_date ;;
  }

  dimension_group: target_end {
    type: time
    timeframes: [date, month, quarter]
    sql: ${TABLE}.target_end_date ;;
  }

  # ─── Measures ───

  measure: count_opportunities {
    type: count
    drill_fields: [opportunity_id, opportunity_name, owner, status]
  }

  measure: total_estimated_contact_reduction {
    type: sum
    sql: ${estimated_contact_volume_reduction} ;;
    value_format_name: decimal_0
  }

  measure: total_estimated_cost_savings {
    type: sum
    sql: ${estimated_cost_savings} ;;
    value_format_name: usd_0
  }
}
