########################################################################
# Dashboard 3 — CX Opportunity Deep-Dives
#
# One section per opportunity. In production, each could be its own
# dashboard; they are combined here as a starting template.
#
# Audience: Opportunity Owners, CX Managers, Analysts
########################################################################

- dashboard: cx_opportunity_deep_dives
  title: "CX Opportunity Deep-Dives — 2026"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Detailed operational dashboards for each of the 7 CX improvement opportunities."

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

    - name: channel
      title: "Channel"
      type: field_filter
      explore: cx_cases
      field: cx_cases.channel
      default_value: ""
      allow_multiple_values: true

  elements:

    # ════════════════════════════════════════════════
    # OPP-1: INCORRECT / INACCESSIBLE EMAIL ADDRESSES
    # ════════════════════════════════════════════════

    - title: "[OPP-1] Email Address Issues — Contact Volume"
      name: opp1_volume
      explore: cx_cases
      type: single_value
      fields: [cx_cases.total_cases]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_1"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      note_text: "Contacts from incorrect/inaccessible email addresses"
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "[OPP-1] Email Issues — FCR Rate"
      name: opp1_fcr
      explore: cx_cases
      type: single_value
      fields: [cx_cases.fcr_rate]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_1"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "[OPP-1] Email Issues — Self-Service Rate"
      name: opp1_self_service
      explore: cx_cases
      type: single_value
      fields: [cx_cases.self_service_rate]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_1"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      note_text: "Self-service email update completion rate"
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "[OPP-1] Email Issues — Repeat Contact Rate"
      name: opp1_repeat
      explore: cx_cases
      type: single_value
      fields: [cx_cases.repeat_contact_rate]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_1"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "[OPP-1] Email Contact Volume — Monthly Trend"
      name: opp1_volume_trend
      explore: cx_cases
      type: looker_line
      fields:
        - cx_cases.created_month
        - cx_cases.total_cases
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_1"
      sorts: [cx_cases.created_month asc]
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      show_view_names: false
      point_style: circle
      interpolation: monotone
      row: 4
      col: 0
      width: 12
      height: 6

    - title: "[OPP-1] Email Issues by Sub-Type"
      name: opp1_by_subtype
      explore: cx_cases
      type: looker_pie
      fields:
        - cx_cases.contact_reason_detail
        - cx_cases.total_cases
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_1"
      sorts: [cx_cases.total_cases desc]
      limit: 10
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      show_view_names: false
      row: 4
      col: 12
      width: 12
      height: 6

    # ════════════════════════════════════════════════
    # OPP-2: ACCOUNT SHARING INQUIRY SURGE
    # ════════════════════════════════════════════════

    - title: "[OPP-2] Account Sharing — Contact Volume"
      name: opp2_volume
      explore: cx_cases
      type: single_value
      fields: [cx_cases.total_cases]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_2"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 10
      col: 0
      width: 6
      height: 4

    - title: "[OPP-2] Account Sharing — Bot Resolution Rate"
      name: opp2_bot_resolution
      explore: cx_cases
      type: single_value
      fields: [cx_cases.automation_rate]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_2"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      note_text: "Chatbot/automation resolution rate for sharing inquiries"
      row: 10
      col: 6
      width: 6
      height: 4

    - title: "[OPP-2] Account Sharing — CSAT"
      name: opp2_csat
      explore: cx_cases
      type: single_value
      fields: [cx_csat_surveys.csat_percentage]
      filters:
        cx_csat_surveys.survey_year: "2026"
        cx_opportunities.opportunity_id: "opp_2"
      listen:
        date_range: cx_csat_surveys.survey_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 10
      col: 12
      width: 6
      height: 4

    - title: "[OPP-2] Account Sharing — Self-Service Rate"
      name: opp2_self_service
      explore: cx_cases
      type: single_value
      fields: [cx_cases.self_service_rate]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_2"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 10
      col: 18
      width: 6
      height: 4

    - title: "[OPP-2] Account Sharing Volume — Monthly Trend"
      name: opp2_volume_trend
      explore: cx_cases
      type: looker_line
      fields:
        - cx_cases.created_month
        - cx_cases.total_cases
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_2"
      sorts: [cx_cases.created_month asc]
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      show_view_names: false
      point_style: circle
      interpolation: monotone
      row: 14
      col: 0
      width: 12
      height: 6

    - title: "[OPP-2] Account Sharing by Inquiry Sub-Type"
      name: opp2_by_subtype
      explore: cx_cases
      type: looker_bar
      fields:
        - cx_cases.contact_reason_detail
        - cx_cases.total_cases
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_2"
      sorts: [cx_cases.total_cases desc]
      limit: 10
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      show_view_names: false
      show_value_labels: true
      row: 14
      col: 12
      width: 12
      height: 6

    # ════════════════════════════════════════════════
    # OPP-3: OTP JOURNEY PAIN POINTS
    # ════════════════════════════════════════════════

    - title: "[OPP-3] OTP Journey — Contact Volume"
      name: opp3_volume
      explore: cx_cases
      type: single_value
      fields: [cx_cases.total_cases]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_3"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 20
      col: 0
      width: 6
      height: 4

    - title: "[OPP-3] OTP Journey — FCR Rate"
      name: opp3_fcr
      explore: cx_cases
      type: single_value
      fields: [cx_cases.fcr_rate]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_3"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 20
      col: 6
      width: 6
      height: 4

    - title: "[OPP-3] OTP Journey — AHT (min)"
      name: opp3_aht
      explore: cx_cases
      type: single_value
      fields: [cx_cases.average_handle_time_minutes]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_3"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 20
      col: 12
      width: 6
      height: 4

    - title: "[OPP-3] OTP Journey — Repeat Contact Rate"
      name: opp3_repeat
      explore: cx_cases
      type: single_value
      fields: [cx_cases.repeat_contact_rate]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_3"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 20
      col: 18
      width: 6
      height: 4

    - title: "[OPP-3] OTP Contact Volume — Monthly Trend"
      name: opp3_volume_trend
      explore: cx_cases
      type: looker_line
      fields:
        - cx_cases.created_month
        - cx_cases.total_cases
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_3"
      sorts: [cx_cases.created_month asc]
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      show_view_names: false
      point_style: circle
      interpolation: monotone
      row: 24
      col: 0
      width: 12
      height: 6

    - title: "[OPP-3] OTP Issues by Failure Step"
      name: opp3_by_step
      explore: cx_cases
      type: looker_bar
      fields:
        - cx_cases.contact_reason_detail
        - cx_cases.total_cases
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_3"
      sorts: [cx_cases.total_cases desc]
      limit: 10
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      show_view_names: false
      show_value_labels: true
      row: 24
      col: 12
      width: 12
      height: 6

    # ════════════════════════════════════════════════
    # OPP-4: DISNEY BUNDLE ACTIVATION CONFUSION
    # ════════════════════════════════════════════════

    - title: "[OPP-4] Disney Bundle — Contact Volume"
      name: opp4_volume
      explore: cx_cases
      type: single_value
      fields: [cx_cases.total_cases]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_4"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 30
      col: 0
      width: 6
      height: 4

    - title: "[OPP-4] Disney Bundle — CSAT"
      name: opp4_csat
      explore: cx_cases
      type: single_value
      fields: [cx_csat_surveys.csat_percentage]
      filters:
        cx_csat_surveys.survey_year: "2026"
        cx_opportunities.opportunity_id: "opp_4"
      listen:
        date_range: cx_csat_surveys.survey_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 30
      col: 6
      width: 6
      height: 4

    - title: "[OPP-4] Disney Bundle — FCR Rate"
      name: opp4_fcr
      explore: cx_cases
      type: single_value
      fields: [cx_cases.fcr_rate]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_4"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 30
      col: 12
      width: 6
      height: 4

    - title: "[OPP-4] Disney Bundle — Repeat Contact Rate"
      name: opp4_repeat
      explore: cx_cases
      type: single_value
      fields: [cx_cases.repeat_contact_rate]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_4"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 30
      col: 18
      width: 6
      height: 4

    - title: "[OPP-4] Disney Bundle Volume — Monthly Trend"
      name: opp4_volume_trend
      explore: cx_cases
      type: looker_line
      fields:
        - cx_cases.created_month
        - cx_cases.total_cases
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_4"
      sorts: [cx_cases.created_month asc]
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      show_view_names: false
      point_style: circle
      interpolation: monotone
      row: 34
      col: 0
      width: 12
      height: 6

    - title: "[OPP-4] Disney Bundle by Confusion Category"
      name: opp4_by_category
      explore: cx_cases
      type: looker_pie
      fields:
        - cx_cases.contact_reason_detail
        - cx_cases.total_cases
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_4"
      sorts: [cx_cases.total_cases desc]
      limit: 10
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      show_view_names: false
      row: 34
      col: 12
      width: 12
      height: 6

    # ════════════════════════════════════════════════
    # OPP-5: FCCA & THIRD-PARTY CANCELLATIONS
    # ════════════════════════════════════════════════

    - title: "[OPP-5] FCCA & 3P Cancel — Contact Volume"
      name: opp5_volume
      explore: cx_cases
      type: single_value
      fields: [cx_cases.total_cases]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_5"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 40
      col: 0
      width: 6
      height: 4

    - title: "[OPP-5] FCCA & 3P Cancel — Automation Rate"
      name: opp5_automation
      explore: cx_cases
      type: single_value
      fields: [cx_cases.automation_rate]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_5"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 40
      col: 6
      width: 6
      height: 4

    - title: "[OPP-5] FCCA & 3P Cancel — Avg Handle Time"
      name: opp5_aht
      explore: cx_cases
      type: single_value
      fields: [cx_cases.average_handle_time_minutes]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_5"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 40
      col: 12
      width: 6
      height: 4

    - title: "[OPP-5] FCCA & 3P Cancel — Avg Cost per Case"
      name: opp5_cost
      explore: cx_cases
      type: single_value
      fields: [cx_cases.average_cost_per_case]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_5"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 40
      col: 18
      width: 6
      height: 4

    - title: "[OPP-5] FCCA & 3P Cancel Volume — Monthly Trend"
      name: opp5_volume_trend
      explore: cx_cases
      type: looker_line
      fields:
        - cx_cases.created_month
        - cx_cases.total_cases
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_5"
      sorts: [cx_cases.created_month asc]
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      show_view_names: false
      point_style: circle
      interpolation: monotone
      row: 44
      col: 0
      width: 12
      height: 6

    - title: "[OPP-5] Cancellations by Type"
      name: opp5_by_type
      explore: cx_cases
      type: looker_bar
      fields:
        - cx_cases.contact_reason_detail
        - cx_cases.total_cases
        - cx_cases.automation_rate
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_5"
      sorts: [cx_cases.total_cases desc]
      limit: 10
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      show_view_names: false
      show_value_labels: true
      row: 44
      col: 12
      width: 12
      height: 6

    # ════════════════════════════════════════════════
    # OPP-6: REFUND ISSUES & AUTOMATION
    # ════════════════════════════════════════════════

    - title: "[OPP-6] Refunds — Contact Volume"
      name: opp6_volume
      explore: cx_cases
      type: single_value
      fields: [cx_cases.total_cases]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_6"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 50
      col: 0
      width: 6
      height: 4

    - title: "[OPP-6] Refunds — Automation Rate"
      name: opp6_automation
      explore: cx_cases
      type: single_value
      fields: [cx_cases.automation_rate]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_6"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 50
      col: 6
      width: 6
      height: 4

    - title: "[OPP-6] Refunds — CSAT"
      name: opp6_csat
      explore: cx_cases
      type: single_value
      fields: [cx_csat_surveys.csat_percentage]
      filters:
        cx_csat_surveys.survey_year: "2026"
        cx_opportunities.opportunity_id: "opp_6"
      listen:
        date_range: cx_csat_surveys.survey_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 50
      col: 12
      width: 6
      height: 4

    - title: "[OPP-6] Refunds — Avg Cost per Case"
      name: opp6_cost
      explore: cx_cases
      type: single_value
      fields: [cx_cases.average_cost_per_case]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_6"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 50
      col: 18
      width: 6
      height: 4

    - title: "[OPP-6] Refund Volume — Monthly Trend"
      name: opp6_volume_trend
      explore: cx_cases
      type: looker_line
      fields:
        - cx_cases.created_month
        - cx_cases.total_cases
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_6"
      sorts: [cx_cases.created_month asc]
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      show_view_names: false
      point_style: circle
      interpolation: monotone
      row: 54
      col: 0
      width: 12
      height: 6

    - title: "[OPP-6] Refunds by Reason"
      name: opp6_by_reason
      explore: cx_cases
      type: looker_pie
      fields:
        - cx_cases.contact_reason_detail
        - cx_cases.total_cases
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_6"
      sorts: [cx_cases.total_cases desc]
      limit: 10
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      show_view_names: false
      row: 54
      col: 12
      width: 12
      height: 6

    # ════════════════════════════════════════════════
    # OPP-7: SPAM DEFLECTION
    # ════════════════════════════════════════════════

    - title: "[OPP-7] Spam — Total Volume"
      name: opp7_volume
      explore: cx_cases
      type: single_value
      fields: [cx_cases.spam_cases]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_7"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 60
      col: 0
      width: 6
      height: 4

    - title: "[OPP-7] Spam — Total Cases (All)"
      name: opp7_total
      explore: cx_cases
      type: single_value
      fields: [cx_cases.total_cases]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_7"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 60
      col: 6
      width: 6
      height: 4

    - title: "[OPP-7] Spam — Automation Rate"
      name: opp7_automation
      explore: cx_cases
      type: single_value
      fields: [cx_cases.automation_rate]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_7"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      note_text: "Automated deflection rate for spam contacts"
      row: 60
      col: 12
      width: 6
      height: 4

    - title: "[OPP-7] Spam — Avg Cost per Case"
      name: opp7_cost
      explore: cx_cases
      type: single_value
      fields: [cx_cases.average_cost_per_case]
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_7"
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      row: 60
      col: 18
      width: 6
      height: 4

    - title: "[OPP-7] Spam Volume — Monthly Trend"
      name: opp7_volume_trend
      explore: cx_cases
      type: looker_line
      fields:
        - cx_cases.created_month
        - cx_cases.spam_cases
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_7"
      sorts: [cx_cases.created_month asc]
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      show_view_names: false
      point_style: circle
      interpolation: monotone
      row: 64
      col: 0
      width: 12
      height: 6

    - title: "[OPP-7] Spam by Type / Entry Channel"
      name: opp7_by_type
      explore: cx_cases
      type: looker_bar
      fields:
        - cx_cases.contact_reason_detail
        - cx_cases.total_cases
      filters:
        cx_cases.created_year: "2026"
        cx_opportunities.opportunity_id: "opp_7"
      sorts: [cx_cases.total_cases desc]
      limit: 10
      listen:
        date_range: cx_cases.created_date
        market: cx_cases.market
        channel: cx_cases.channel
      show_view_names: false
      show_value_labels: true
      row: 64
      col: 12
      width: 12
      height: 6
