# The name of this view in Looker is "Pygsalestarget"
view: pygsalestarget {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `alehop_dataset.pyg_sales_target`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Month" in Explore.

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_month {
    type: sum
    sql: ${month} ;;
  }

  measure: average_month {
    type: average
    sql: ${month} ;;
  }

  dimension: sales_target {
    type: number
    sql: ${TABLE}.sales_target ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: date {
    hidden: no
    type: date
    sql: FORMAT_DATE('%Y-%m', ${TABLE}.year, ${TABLE}.month) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: salestarget30 {
    type: number
    sql: ${sales_target}/30;;
  }

}
