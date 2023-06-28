view: count_shipping_address_email {
  derived_table: {
    sql: SELECT
          smartieorders.shipping_address_email  AS smartieorders_shipping_address_email,
          COUNT(DISTINCT smartieorders.id ) AS smartieorders_count
      FROM `alehop_dataset.smartie_order_lines`
           AS smartieorderlines
      LEFT JOIN `alehop_dataset.smartie_orders`
           AS smartieorders ON smartieorders.id = smartieorderlines.order_id
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

  dimension: smartieorders_shipping_address_email {
    type: string
    sql: ${TABLE}.smartieorders_shipping_address_email ;;
  }

  dimension: smartieorders_count {
    type: number
    sql: ${TABLE}.smartieorders_count ;;
  }

  set: detail {
    fields: [smartieorders_shipping_address_email, smartieorders_count]
  }

  measure: avg {
    type: average
    sql: ${smartieorders_count} ;;
  }
}
