#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines

include: "/medidas/**/count_session_start.view"
explore: count_purchase {
  label: "Counts purchase session start"
  join: count_session_start {
    type: left_outer
    relationship: one_to_one
    sql_on: ${count_purchase.event_date}=${count_session_start.event_date};;
  }
}

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

  measure: multiplicacion {
    type: number
    sql: ${count_purchase}*${count_session_start} ;;
  }

  dimension: event_date {
    type: string
    sql: ${TABLE}.event_date ;;
  }

  dimension: count_session_start {
    type: number
    sql: ${TABLE}.count_session_start ;;
  }

  dimension: count_purchase {
    type: number
    sql: ${TABLE}.count_purchase ;;
  }

  set: detail {
    fields: [
        event_date,
  count_purchase
    ]
  }

}
