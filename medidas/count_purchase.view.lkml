#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines

view: purchase {
  derived_table: {
    sql: SELECT
          events.event_date  AS event_date,
          COUNT(*) AS count_purchase
      FROM `gke-for-ops.analytics_353816733.events_*`  AS events
      WHERE (events.event_name ) = 'purchase'
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
    sql: ${count_session_start.count_session_start} ;;
  }

  dimension: count_purchase {
    type: number
    sql: ${TABLE}.count_purchase ;;
  }

  measure: multiplicacion {
    type: number
    sql: ${count_session_start}*${count_purchase} ;;
  }

  set: detail {
    fields: [
      event_date,
      count_session_start
    ]
  }
}
