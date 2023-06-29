#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: query1 {
  derived_table: {
    sql: WITH PurchaseData AS (
          SELECT `alehop_dataset.smartie_orders`.`shipping_address_email`, COUNT(*) AS num_purchases
          FROM `alehop_dataset.smartie_orders`
          GROUP BY `alehop_dataset.smartie_orders`.`shipping_address_email`)
      SELECT num_purchases AS total_purchases
      FROM PurchaseData ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: total_purchases {
    type: number
    sql: ${TABLE}.total_purchases ;;
  }

  set: detail {
    fields: [
        total_purchases
    ]
  }
}
