#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: recentpurchases {
  derived_table: {
    sql: SELECT
          events.user_pseudo_id  AS events_user_pseudo_id
      FROM `gke-for-ops.analytics_353816733.events_*`  AS events
      WHERE ((( (DATE(PARSE_DATE('%Y%m%d', events.event_date) ))  ) >= ((DATE_ADD(CURRENT_DATE('Europe/Madrid'), INTERVAL -29 DAY))) AND ( (DATE(PARSE_DATE('%Y%m%d', events.event_date) ))  ) < ((DATE_ADD(DATE_ADD(CURRENT_DATE('Europe/Madrid'), INTERVAL -29 DAY), INTERVAL 30 DAY))))) AND (events.event_name ) = 'purchase'
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

  dimension: events_user_pseudo_id {
    type: string
    sql: ${TABLE}.events_user_pseudo_id ;;
  }

  set: detail {
    fields: [
        events_user_pseudo_id
    ]
  }
}
