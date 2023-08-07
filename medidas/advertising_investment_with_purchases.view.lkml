#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: advertising_investment_with_purchases {
  derived_table: {
    sql: SELECT
          (FORMAT_TIMESTAMP('%Y-%m', smartieorders.created_at )) AS smartieorders_created_month,
          pyg_advertising_investment.advertising_investment  AS pyg_advertising_investment_advertising_investment,
          ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE( ROUND( smartieorders.total_without_tax  , 2)  ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST( smartieorders.id   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( smartieorders.id   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST( smartieorders.id   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( smartieorders.id   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS NUMERIC), 0), 6) AS smartieorders_sum_without_tax
      FROM `gke-for-ops.alehop_dataset.pyg_advertising_investment`
           AS pyg_advertising_investment
      LEFT JOIN `alehop_dataset.smartie_orders`
           AS smartieorders ON (FORMAT_TIMESTAMP('%Y-%m', smartieorders.created_at )) = (FORMAT_DATE('%Y-%m', (PARSE_DATE('%Y%m', CONCAT(pyg_advertising_investment.year, pyg_advertising_investment.month))) ))
      WHERE ((( (PARSE_DATE('%Y%m', CONCAT(pyg_advertising_investment.year, pyg_advertising_investment.month)))  ) >= ((DATE_TRUNC(CURRENT_DATE('Europe/Madrid'), YEAR))) AND ( (PARSE_DATE('%Y%m', CONCAT(pyg_advertising_investment.year, pyg_advertising_investment.month)))  ) < ((DATE_ADD(DATE_TRUNC(CURRENT_DATE('Europe/Madrid'), YEAR), INTERVAL 1 YEAR))))) AND ((( smartieorders.created_at  ) IS NOT NULL))
      GROUP BY
          1,
          2
      ORDER BY
          1
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: smartieorders_created_month {
    type: string
    sql: ${TABLE}.smartieorders_created_month ;;
  }

  dimension: pyg_advertising_investment_advertising_investment {
    type: number
    sql: ${TABLE}.pyg_advertising_investment_advertising_investment ;;
  }

  dimension: smartieorders_sum_without_tax {
    type: number
    sql: ${TABLE}.smartieorders_sum_without_tax ;;
  }

  measure: retorno_inversion {
    type: number
    sql: ${smartieorders_sum_without_tax}/${pyg_advertising_investment_advertising_investment} ;;
  }

  set: detail {
    fields: [
        smartieorders_created_month,
  pyg_advertising_investment_advertising_investment,
  smartieorders_sum_without_tax
    ]
  }
}
