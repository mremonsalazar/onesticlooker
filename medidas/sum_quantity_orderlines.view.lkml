view: sum_quantity_orderlines {
  derived_table: {
    sql: SELECT
          smartieorderlines.order_id  AS smartieorderlines_order_id,
          smartieorderlines.origin  AS smartieorderlines_origin,
          smartieorderlines.country  AS smartieorderlines_country,
          smartieorderlines.created_at  AS smartieorderlines_created_at,
          COALESCE(SUM(smartieorderlines.quantity ), 0) AS smartieorderlines_sum_quantity
      FROM `alehop_dataset.smartie_order_lines`
           AS smartieorderlines
      GROUP BY
          1
      ORDER BY
          2 DESC
      LIMIT 5000
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: smartieorderlines_order_id {
    type: number
    sql: ${TABLE}.smartieorderlines_order_id ;;
  }

  dimension: smartieorderlines_sum_quantity {
    type: number
    sql: ${TABLE}.smartieorderlines_sum_quantity ;;
  }

  set: detail {
    fields: [smartieorderlines_order_id, smartieorderlines_sum_quantity]
  }

  measure: avg {
    type: average
    sql: ${smartieorderlines_sum_quantity} ;;
  }
}
