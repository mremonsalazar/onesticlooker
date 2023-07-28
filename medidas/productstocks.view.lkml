#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: productstocks {
  derived_table: {
    sql: SELECT
          smartie_stocks.product_sku  AS smartie_stocks_product_sku,
          smartie_stocks.quantity  AS smartie_stocks_quantity
      FROM `gke-for-ops.alehop_dataset.smartie_stocks`  AS smartie_stocks
      WHERE (smartie_stocks.quantity ) > 0
      GROUP BY
          1,
          2
      ORDER BY
          2 DESC
      LIMIT 5000 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: smartie_stocks_product_sku {
    type: string
    sql: ${TABLE}.smartie_stocks_product_sku ;;
  }

  dimension: smartie_stocks_quantity {
    type: number
    sql: ${TABLE}.smartie_stocks_quantity ;;
  }

  set: detail {
    fields: [
        smartie_stocks_product_sku,
	smartie_stocks_quantity
    ]
  }
}
