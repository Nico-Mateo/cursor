view: cx_goals {
  sql_table_name: schema.cx_goals ;;

  dimension: goal_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.goal_id ;;
  }

  dimension: goal_name {
    type: string
    sql: ${TABLE}.goal_name ;;
    order_by_field: goal_sort_order
  }

  dimension: goal_short_name {
    type: string
    sql: ${TABLE}.goal_short_name ;;
  }

  dimension: goal_sort_order {
    type: number
    sql: ${TABLE}.sort_order ;;
    hidden: yes
  }

  dimension: goal_description {
    type: string
    sql: ${TABLE}.description ;;
  }
}
