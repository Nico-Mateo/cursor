view: cx_cases {
  sql_table_name: schema.cx_cases ;;

  # ─── Primary Key ───

  dimension: case_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.case_id ;;
  }

  # ─── Dimensions ───

  dimension_group: created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: contact_reason {
    type: string
    sql: ${TABLE}.contact_reason ;;
  }

  dimension: contact_reason_detail {
    type: string
    sql: ${TABLE}.contact_reason_detail ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
    description: "Contact channel: phone, chat, email, chatbot, self-service"
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
    description: "FK to cx_opportunities — NULL if the case is not attributed to one of the 7 opportunities"
  }

  dimension: is_first_contact_resolution {
    type: yesno
    sql: ${TABLE}.is_first_contact_resolution ;;
  }

  dimension: is_repeat_contact {
    type: yesno
    sql: ${TABLE}.is_repeat_contact ;;
  }

  dimension: is_self_service {
    type: yesno
    sql: ${TABLE}.is_self_service ;;
  }

  dimension: is_automated {
    type: yesno
    sql: ${TABLE}.is_automated ;;
  }

  dimension: is_spam {
    type: yesno
    sql: ${TABLE}.is_spam ;;
  }

  dimension: handle_time_seconds {
    type: number
    sql: ${TABLE}.handle_time_seconds ;;
    hidden: yes
  }

  dimension: handle_time_minutes {
    type: number
    sql: ${handle_time_seconds} / 60.0 ;;
    value_format_name: decimal_1
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
    value_format_name: usd
    hidden: yes
  }

  dimension: resolution_status {
    type: string
    sql: ${TABLE}.resolution_status ;;
  }

  # ─── Measures ───

  measure: total_cases {
    type: count
    drill_fields: [case_id, created_date, contact_reason, channel, market]
  }

  measure: fcr_cases {
    type: count
    filters: [is_first_contact_resolution: "yes"]
    hidden: yes
  }

  measure: fcr_rate {
    type: number
    sql: 1.0 * ${fcr_cases} / NULLIF(${total_cases}, 0) ;;
    value_format_name: percent_1
    label: "First Contact Resolution Rate"
  }

  measure: self_service_cases {
    type: count
    filters: [is_self_service: "yes"]
    hidden: yes
  }

  measure: self_service_rate {
    type: number
    sql: 1.0 * ${self_service_cases} / NULLIF(${total_cases}, 0) ;;
    value_format_name: percent_1
    label: "Self-Service Rate"
  }

  measure: automated_cases {
    type: count
    filters: [is_automated: "yes"]
    hidden: yes
  }

  measure: automation_rate {
    type: number
    sql: 1.0 * ${automated_cases} / NULLIF(${total_cases}, 0) ;;
    value_format_name: percent_1
    label: "Automation Rate"
  }

  measure: spam_cases {
    type: count
    filters: [is_spam: "yes"]
    label: "Spam Cases"
  }

  measure: repeat_cases {
    type: count
    filters: [is_repeat_contact: "yes"]
    hidden: yes
  }

  measure: repeat_contact_rate {
    type: number
    sql: 1.0 * ${repeat_cases} / NULLIF(${total_cases}, 0) ;;
    value_format_name: percent_1
    label: "Repeat Contact Rate"
  }

  measure: average_handle_time_minutes {
    type: average
    sql: ${handle_time_minutes} ;;
    value_format_name: decimal_1
    label: "Avg Handle Time (min)"
  }

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    value_format_name: usd_0
    label: "Total Cost"
  }

  measure: average_cost_per_case {
    type: number
    sql: ${total_cost} / NULLIF(${total_cases}, 0) ;;
    value_format_name: usd
    label: "Avg Cost per Case"
  }
}
