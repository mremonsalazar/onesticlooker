#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: mas_stock_poco_vistos {
  derived_table: {
    sql: WITH ProductVisibility AS (
          SELECT items.item_id AS product_sku, COUNT(*) AS visibility_count
          FROM `gke-for-ops.analytics_353816733.events_*`,
              UNNEST(event_params) AS event_params,
              UNNEST(items) AS items
          WHERE event_name = 'view_item'
          AND TIMESTAMP_MICROS(event_timestamp) >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 7 DAY)
          GROUP BY items.item_id
      ),
      ProductStocks AS (
          SELECT product_sku, quantity
          FROM`gke-for-ops.alehop_dataset.smartie_stocks`
          WHERE quantity > 0
      )
      SELECT DISTINCT m.title, p.product_sku, p.visibility_count, s.quantity,
          IFNULL(CAST(p.visibility_count AS FLOAT64) / NULLIF(s.quantity, 0), 0) AS visibility_stock_ratio
      FROM ProductVisibility AS p
      JOIN ProductStocks AS s
          ON p.product_sku = CAST (s.product_sku AS STRING)
      JOIN `gke-for-ops.alehop_merchant_center.Products_670518068` AS m
          ON CAST(m.offer_id AS INT64) = s.product_sku
      WHERE m.content_language = 'es'
      ORDER BY visibility_stock_ratio ASC ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }

  dimension: visibility_count {
    type: number
    sql: ${TABLE}.visibility_count ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: visibility_stock_ratio {
    type: number
    sql: ${TABLE}.visibility_stock_ratio ;;
  }

  set: detail {
    fields: [
        title,
	product_sku,
	visibility_count,
	quantity,
	visibility_stock_ratio
    ]
  }
}
