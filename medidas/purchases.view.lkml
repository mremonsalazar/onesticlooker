#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: purchases {
  derived_table: {
    sql: SELECT
          events_event_params.value.int_value  AS events_event_params_value__int_value
      FROM `gke-for-ops.analytics_353816733.events_*`  AS events
      LEFT JOIN UNNEST(events.event_params) as events_event_params
      WHERE (events.event_name ) = 'purchase' AND (key ) = 'ga_session_id' AND (events_event_params.value.int_value ) IS NOT NULL
      GROUP BY
          1
      ORDER BY
          1
      LIMIT 5000 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: events_event_params_value__int_value {
    type: number
    sql: ${TABLE}.events_event_params_value__int_value ;;
  }

  set: detail {
    fields: [
        events_event_params_value__int_value
    ]
  }
}
