#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: count_purchase {
  derived_table: {
    sql: SELECT
          events.event_date  AS events_event_date,
          COUNT(*) AS events_count
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

  dimension: events_event_date {
    type: string
    sql: ${TABLE}.events_event_date ;;
  }

  dimension: events_count {
    type: number
    sql: ${TABLE}.events_count ;;
  }

  set: detail {
    fields: [
        events_event_date,
	events_count
    ]
  }
}
