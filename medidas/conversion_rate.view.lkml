#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: conversion_rate {
  derived_table: {
    sql: WITH count_purchase AS (SELECT
                events.event_date  AS event_date,
                COUNT(*) AS count_purchase
            FROM `gke-for-ops.analytics_353816733.events_*`  AS events
            WHERE (events.event_name ) = 'purchase'
            GROUP BY
                1
            ORDER BY
                2
            LIMIT 500 )
        ,  count_session_start AS (SELECT
                events.event_date  AS event_date,
                COUNT(*) AS count_session_start
            FROM `gke-for-ops.analytics_353816733.events_*`  AS events
            WHERE (events.event_name ) = 'session_start'
            GROUP BY
                1
            LIMIT 500 )
      SELECT
          count_purchase.event_date  AS count_purchase_event_date,
          count_purchase.count_purchase  AS count_purchase_count_purchase,
          count_session_start.count_session_start  AS count_session_start_count_session_start
      FROM count_purchase
      LEFT JOIN count_session_start ON count_purchase.event_date=count_session_start.event_date
      GROUP BY
          1,
          2,
          3
      ORDER BY
          1
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_date {
    hidden: yes
    type: date
    sql: PARSE_DATE('%Y%m%d', ${TABLE}.count_purchase_event_date) ;;
  }

  dimension_group: event_date_group {
    type: time
    timeframes: [time, date, week, month, month_num,quarter, year, raw]
    datatype: date
    sql: ${event_date} ;;
  }

  dimension: count_purchase {
    type: number
    sql: ${TABLE}.count_purchase_count_purchase ;;
  }

  dimension: count_session_start {
    type: number
    sql: ${TABLE}.count_session_start_count_session_start ;;
  }

  set: detail {
    fields: [
        event_date,
  count_purchase,
  count_session_start
    ]
  }

  measure: conversion_rate {
    type: number
    sql: (${count_purchase}*100)/${count_session_start} ;;
  }
}
