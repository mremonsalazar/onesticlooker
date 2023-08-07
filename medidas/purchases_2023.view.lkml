#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: purchases_2023 {
  derived_table: {
    sql: SELECT
          (EXTRACT(YEAR FROM smartieorders.created_at )) AS smartieorders_created_year,
              (EXTRACT(MONTH FROM smartieorders.created_at )) AS smartieorders_created_month_num,
          COALESCE(SUM(ROUND( smartieorders.total_without_tax  , 2) ), 0) AS smartieorders_sum_without_tax
      FROM `alehop_dataset.smartie_orders`
           AS smartieorders
      WHERE ((( smartieorders.created_at  ) >= ((TIMESTAMP_TRUNC(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY, 'Europe/Madrid'), YEAR))) AND ( smartieorders.created_at  ) < ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP_TRUNC(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY, 'Europe/Madrid'), YEAR)), INTERVAL 1 YEAR))))))
      GROUP BY
          1,
          2
      ORDER BY
          2
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: smartieorders_created_year {
    type: number
    sql: ${TABLE}.smartieorders_created_year ;;
  }

  dimension: smartieorders_created_month_num {
    type: number
    sql: ${TABLE}.smartieorders_created_month_num ;;
  }

  dimension: smartieorders_sum_without_tax {
    type: number
    sql: ${TABLE}.smartieorders_sum_without_tax ;;
  }

  set: detail {
    fields: [
        smartieorders_created_year,
	smartieorders_created_month_num,
	smartieorders_sum_without_tax
    ]
  }
}
