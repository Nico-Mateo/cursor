explore: cx_cases {
  label: "CX Cases"
  description: "Core case-level data for all CX contacts, with CSAT and opportunity attribution"

  join: cx_csat_surveys {
    type: left_outer
    relationship: one_to_one
    sql_on: ${cx_cases.case_id} = ${cx_csat_surveys.case_id} ;;
  }

  join: cx_opportunities {
    type: left_outer
    relationship: many_to_one
    sql_on: ${cx_cases.opportunity_id} = ${cx_opportunities.opportunity_id} ;;
  }
}

explore: cx_goal_kpis {
  label: "CX Goal KPIs"
  description: "Time-series goal-level KPIs with targets and RAG status"

  join: cx_goals {
    type: left_outer
    relationship: many_to_one
    sql_on: ${cx_goal_kpis.goal_id} = ${cx_goals.goal_id} ;;
  }
}

explore: cx_opportunity_metrics {
  label: "CX Opportunity Metrics"
  description: "Time-series metrics for each of the 7 CX opportunities"

  join: cx_opportunities {
    type: left_outer
    relationship: many_to_one
    sql_on: ${cx_opportunity_metrics.opportunity_id} = ${cx_opportunities.opportunity_id} ;;
  }
}
