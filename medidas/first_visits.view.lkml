#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: first_visits {
  derived_table: {
    sql: SELECT
      ((DATE(PARSE_DATE('%Y%m%d', events.event_date) )) ) AS events_event_date_group_date,
      events_event_params.value.int_value  AS events_event_params_value__int_value,
      events.user_pseudo_id  AS events_user_pseudo_id
  FROM `gke-for-ops.analytics_353816733.events_*`  AS events
  LEFT JOIN UNNEST(events.event_params) as events_event_params
  WHERE (events.event_name ) = 'first_visit' AND (key ) = 'ga_session_id'
  GROUP BY
      1,
      2,
      3
  ORDER BY
      1 DESC
      LIMIT 5000 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: events_event_date_group_date {
    type: date
    datatype: date
    sql: ${TABLE}.events_event_date_group_date ;;
  }

  dimension: events_event_params_value__int_value {
    type: number
    sql: ${TABLE}.events_event_params_value__int_value ;;
  }

  dimension: events_user_pseudo_id {
    type: string
    sql: ${TABLE}.events_user_pseudo_id ;;
  }

  set: detail {
    fields: [
        events_event_date_group_date,
  events_event_params_value__int_value,
  events_user_pseudo_id
    ]
  }
}
