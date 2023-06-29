#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: query2 {
  derived_table: {
    sql: SELECT AVG(Cantidad) AS average_products_per_order
      FROM (
        SELECT `alehop_dataset.smartie_order_lines`.`order_id`, SUM(`alehop_dataset.smartie_order_lines`.`quantity`) AS Cantidad
        FROM `alehop_dataset.smartie_order_lines`, `alehop_dataset.smartie_orders`
        WHERE `alehop_dataset.smartie_order_lines`.`order_id` = `alehop_dataset.smartie_orders`.`id`
        GROUP BY `alehop_dataset.smartie_order_lines`.`order_id`
      ) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: average_products_per_order {
    type: number
    sql: ${TABLE}.average_products_per_order ;;
  }

  set: detail {
    fields: [
        average_products_per_order
    ]
  }
}
