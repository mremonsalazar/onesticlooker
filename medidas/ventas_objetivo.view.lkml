#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: ventas_objetivo {
  derived_table: {
    sql: WITH daily_revenue AS (-- raw sql results do not include filled-in values for 'smartieorders.created_date'


            SELECT
                (DATE(smartieorders.created_at )) AS smartieorders_created_date,
                COALESCE(SUM(smartieorders.total_without_tax ), 0) AS smartieorders_sum_without_tax
            FROM `alehop_dataset.smartie_orders`
                 AS smartieorders
            GROUP BY
                1
            ORDER BY
                1 DESC
            LIMIT 500 )
      SELECT
          ((DATE(daily_revenue.smartieorders_created_date )) ) AS daily_revenue_created_date_group_date,
          days_in_current_month.days  AS days_in_current_month_days,
          monthly_sales_target.sales_target  AS monthly_sales_target_sales_target,
          daily_revenue.smartieorders_sum_without_tax  AS daily_revenue_smartieorders_sum_without_tax
      FROM daily_revenue
      CROSS JOIN `gke-for-ops.alehop_dataset.monthly_sales_target`  AS monthly_sales_target
      CROSS JOIN `gke-for-ops.alehop_dataset.days_in_current_month`  AS days_in_current_month
      GROUP BY
          1,
          2,
          3,
          4
      ORDER BY
          1 DESC
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: daily_revenue_created_date_group_date {
    type: date
    datatype: date
    sql: ${TABLE}.daily_revenue_created_date_group_date ;;
  }

  dimension: days_in_current_month_days {
    type: number
    sql: ${TABLE}.days_in_current_month_days ;;
  }

  dimension: monthly_sales_target_sales_target {
    type: number
    sql: ${TABLE}.monthly_sales_target_sales_target ;;
  }

  dimension: daily_revenue_smartieorders_sum_without_tax {
    type: number
    sql: ${TABLE}.daily_revenue_smartieorders_sum_without_tax ;;
  }

  set: detail {
    fields: [
        daily_revenue_created_date_group_date,
  days_in_current_month_days,
  monthly_sales_target_sales_target,
  daily_revenue_smartieorders_sum_without_tax
    ]
  }

  measure: percentage_of_target_achieved {
    type: number
    sql: ${daily_revenue_smartieorders_sum_without_tax}*100 / (${monthly_sales_target_sales_target}/${days_in_current_month_days}) ;;
  }
}
