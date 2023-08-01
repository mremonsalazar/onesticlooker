#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines

include: "/medidas/**/count_session_start.view"
explore: count_purchase {
  label: "Counts purchase session start"
  join: count_session_start {
    type: left_outer
    relationship: one_to_one
    sql_on: ${count_purchase.event_date}=${count_session_start.event_date} ;;
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
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_date {
    hidden: no
    type: date
    sql: PARSE_DATE('%Y%m%d', ${TABLE}.event_date) ;;
  }

  dimension_group: event_date_group {
    type: time
    timeframes: [time, date, week, month, month_num,quarter, year, raw]
    datatype: date
    sql: ${event_date} ;;
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

  measure: conversion_rate {
    type: number
    sql: (${count_purchase}*100)/${count_session_start} ;;
  }

  set: detail {
    fields: [
      event_date,
      count_session_start
    ]
  }
}
