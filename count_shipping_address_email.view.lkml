#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: count_shipping_address_email {
  derived_table: {
    sql: SELECT
          (FORMAT_TIMESTAMP('%Y-%m', smartieorders.created_at )) AS smartieorders_created_month,
          smartieorders.shipping_address_email  AS smartieorders_shipping_address_email,
          COUNT(DISTINCT smartieorders.id ) AS smartieorders_count
      FROM `alehop_dataset.smartie_order_lines`
           AS smartieorderlines
      LEFT JOIN `alehop_dataset.smartie_orders`
           AS smartieorders ON smartieorders.id = smartieorderlines.order_id
      GROUP BY
          1,
          2
      ORDER BY
          1 DESC
      LIMIT 5000 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: smartieorders_created_month {
    type: string
    sql: ${TABLE}.smartieorders_created_month ;;
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
    fields: [
        smartieorders_created_month,
	smartieorders_shipping_address_email,
	smartieorders_count
    ]
  }
}
