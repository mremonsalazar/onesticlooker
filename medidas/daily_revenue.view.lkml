#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines
#include: "/medidas/**/days_in_current_month.view"
#include: "/medidas/**/monthly_sales_target.view"

view: daily_revenue {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'smartieorders.created_date'


      SELECT
          (DATE(smartieorders.created_at )) AS smartieorders_created_date,
          COALESCE(SUM(smartieorders.total_without_tax ), 0) AS smartieorders_sum_without_tax
      FROM `alehop_dataset.smartie_orders`
           AS smartieorders
      GROUP BY
          1
      ORDER BY
          1 DESC
      LIMIT 500 ;;
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
    fields: [
        smartieorders_created_date,
  smartieorders_sum_without_tax
    ]
  }

  measure: percentage_of_target_achieved {
    type: number
    sql: ${smartieorders_sum_without_tax} ;;
  }
}
