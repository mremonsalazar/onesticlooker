#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: count_item_id {
  derived_table: {
    sql: SELECT
          item_id  AS events_items_item_id,
          COUNT(item_id ) AS events_items_count
      FROM `gke-for-ops.analytics_353816733.events_*`  AS events
      LEFT JOIN UNNEST(events.items) as events_items
      WHERE (events.event_date ) IN ('20230623', '20230624', '20230625', '20230626', '20230627', '20230628', '20230629', '20230630')
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
