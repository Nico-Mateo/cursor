view: cx_csat_surveys {
  sql_table_name: schema.cx_csat_surveys ;;

  # ─── Primary Key ───

  dimension: survey_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.survey_id ;;
  }

  # ─── Dimensions ───

  dimension: case_id {
    type: string
    sql: ${TABLE}.case_id ;;
    hidden: yes
  }

  dimension_group: survey {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.survey_date ;;
  }

  dimension: csat_score {
    type: number
    sql: ${TABLE}.csat_score ;;
    description: "1-5 scale CSAT score"
  }

  dimension: is_satisfied {
    type: yesno
    sql: ${csat_score} >= 4 ;;
    description: "Score of 4 or 5 is considered satisfied"
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: survey_source {
    type: string
    sql: ${TABLE}.survey_source ;;
    description: "chatbot, phone, email, etc."
  }

  # ─── Measures ───

  measure: total_surveys {
    type: count
    drill_fields: [survey_id, survey_date, csat_score, channel, market]
  }

  measure: satisfied_surveys {
    type: count
    filters: [is_satisfied: "yes"]
    hidden: yes
  }

  measure: csat_percentage {
    type: number
    sql: 1.0 * ${satisfied_surveys} / NULLIF(${total_surveys}, 0) ;;
    value_format_name: percent_1
    label: "CSAT %"
  }

  measure: average_csat_score {
    type: average
    sql: ${csat_score} ;;
    value_format_name: decimal_2
    label: "Avg CSAT Score"
  }

  measure: chatbot_csat_percentage {
    type: number
    sql: 1.0 * COUNT(CASE WHEN ${survey_source} = 'chatbot' AND ${is_satisfied} THEN 1 END)
             / NULLIF(COUNT(CASE WHEN ${survey_source} = 'chatbot' THEN 1 END), 0) ;;
    value_format_name: percent_1
    label: "Chatbot CSAT %"
  }

  measure: csat_variance_across_markets {
    type: number
    sql: MAX(${csat_percentage}) - MIN(${csat_percentage}) ;;
    description: "Spread between highest and lowest market CSAT — requires market-level grouping upstream"
    label: "Market CSAT Variance (pts)"
  }
}
