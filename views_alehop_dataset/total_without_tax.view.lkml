view: total_without_tax {
  derived_table: {
    sql: SELECT
          ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE( smartieorders.total_without_tax  ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST( smartieorders.id   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( smartieorders.id   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST( smartieorders.id   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( smartieorders.id   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6) AS smartieorders_sum_without_tax
      FROM `alehop_dataset.smartie_order_lines`
           AS smartieorderlines
      LEFT JOIN `alehop_dataset.smartie_orders`
           AS smartieorders ON smartieorders.id = smartieorderlines.order_id
      WHERE ((( smartieorders.created_at  ) >= ((TIMESTAMP_TRUNC(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY, 'Europe/Madrid'), MONTH))) AND ( smartieorders.created_at  ) < ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP_TRUNC(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY, 'Europe/Madrid'), MONTH)), INTERVAL 1 MONTH))))))
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: smartieorders_sum_without_tax {
    type: number
    sql: ${TABLE}.smartieorders_sum_without_tax ;;
  }

  set: detail {
    fields: [smartieorders_sum_without_tax]
  }

  measure: gross_margin {
    type: number
    sql: ${smartieorders_sum_without_tax}*${gross_margin} ;;
  }
}
