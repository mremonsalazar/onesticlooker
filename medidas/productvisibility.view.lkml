#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: productvisibility {
  derived_table: {
    sql: SELECT
          item_id  AS events_items_item_id,
          COUNT(item_id ) AS events_items_count
      FROM `gke-for-ops.analytics_353816733.events_*`  AS events
      LEFT JOIN UNNEST(events.items) as events_items
      WHERE ((( (DATE(PARSE_DATE('%Y%m%d', events.event_date) ))  ) >= ((DATE_ADD(CURRENT_DATE('Europe/Madrid'), INTERVAL -6 DAY))) AND ( (DATE(PARSE_DATE('%Y%m%d', events.event_date) ))  ) < ((DATE_ADD(DATE_ADD(CURRENT_DATE('Europe/Madrid'), INTERVAL -6 DAY), INTERVAL 7 DAY))))) AND (events.event_name ) = 'view_item'
      GROUP BY
          1
      ORDER BY
          2 DESC
      LIMIT 5000 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: events_items_item_id {
    type: string
    sql: ${TABLE}.events_items_item_id ;;
  }

  dimension: events_items_count {
    type: number
    sql: ${TABLE}.events_items_count ;;
  }

  set: detail {
    fields: [
        events_items_item_id,
	events_items_count
    ]
  }
}
