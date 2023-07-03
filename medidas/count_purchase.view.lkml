#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: count_purchase {
  derived_table: {
    sql: SELECT
          events.event_date  AS event_date,
          COUNT(*) AS count_purchase
      FROM `gke-for-ops.analytics_353816733.events_*`  AS events
      WHERE (events.event_name ) = 'purchase'
      GROUP BY
          1
      ORDER BY
          2
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_date {
    type: string
    sql: ${TABLE}.events_event_date ;;
  }

  dimension: count_purchase {
    type: number
    sql: ${TABLE}.events_count ;;
  }

  set: detail {
    fields: [
        event_date,
  count_purchase
    ]
  }
}
