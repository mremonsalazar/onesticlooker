view: sum_without_tax_by_day {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'smartieorders.created_date'


      SELECT
      (DATE(smartieorders.created_at )) AS smartieorders_created_date,
      ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE( smartieorders.total_without_tax  ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST( smartieorders.id   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( smartieorders.id   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST( smartieorders.id   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( smartieorders.id   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6) AS smartieorders_sum_without_tax
      FROM `alehop_dataset.smartie_order_lines`
      AS smartieorderlines
      LEFT JOIN `alehop_dataset.smartie_orders`
      AS smartieorders ON smartieorders.id = smartieorderlines.order_id
      GROUP BY
      1
      ORDER BY
      1 DESC
      LIMIT 5000
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: smartieorders_created_date {
    type: date
    datatype: date
    sql: ${TABLE}.smartieorders_created_date ;;
  }

  dimension: smartieorders_sum_without_tax {
    type: number
    sql: ${TABLE}.smartieorders_sum_without_tax ;;
  }

  set: detail {
    fields: [smartieorders_created_date, smartieorders_sum_without_tax]
  }

  measure: avg {
    type: average
    sql: ${smartieorders_sum_without_tax} ;;
  }
}
