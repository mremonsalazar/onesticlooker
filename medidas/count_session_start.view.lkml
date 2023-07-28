#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: count_session_start {
  derived_table: {
    sql: SELECT
          events.event_date  AS event_date,
          COUNT(*) AS count_session_start
      FROM `gke-for-ops.analytics_353816733.events_*`  AS events
      WHERE (events.event_name ) = 'session_start'
      GROUP BY
          1
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_date {
    type: string
    sql: ${TABLE}.event_date ;;
  }

  dimension: count_session_start {
    type: number
    sql: ${TABLE}.count_session_start ;;
  }

  set: detail {
    fields: [
        event_date,
  count_session_start
    ]
  }
}
