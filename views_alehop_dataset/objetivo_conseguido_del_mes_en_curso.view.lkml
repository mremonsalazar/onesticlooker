view: objetivo_conseguido_del_mes_en_curso {
  derived_table: {
    sql: WITH
          daily_revenue AS (
              SELECT
                  DATE(created_at) as day,
                  SUM(total_without_tax) AS revenue_per_day
              FROM
                  `alehop_dataset.smartie_orders`
              WHERE
                  DATE(created_at) BETWEEN DATE_TRUNC(CURRENT_DATE(), MONTH) AND CURRENT_DATE()
              GROUP BY
                  day
          ),
          monthly_sales_target AS (
              SELECT
                  sales_target
              FROM
                  `alehop_dataset.pyg_sales_target`
              WHERE
                  year = EXTRACT(YEAR FROM CURRENT_DATE()) AND
                  month = EXTRACT(MONTH FROM CURRENT_DATE())
          )
      SELECT
          daily_revenue.day,
          daily_revenue.revenue_per_day,
          monthly_sales_target.sales_target,
          (daily_revenue.revenue_per_day / (monthly_sales_target.sales_target / 30)) AS percentage_of_target_achieved
      FROM
          daily_revenue
      CROSS JOIN
          monthly_sales_target
      ORDER BY
          daily_revenue.day
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: day {
    type: date
    datatype: date
    sql: ${TABLE}.day ;;
  }

  dimension: revenue_per_day {
    type: number
    sql: ${TABLE}.revenue_per_day ;;
  }

  dimension: sales_target {
    type: number
    sql: ${TABLE}.sales_target ;;
  }

  dimension: percentage_of_target_achieved {
    type: number
    sql: ${TABLE}.percentage_of_target_achieved ;;
  }

  set: detail {
    fields: [day, revenue_per_day, sales_target, percentage_of_target_achieved]
  }
}
