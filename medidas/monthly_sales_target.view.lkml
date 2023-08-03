# The name of this view in Looker is "Monthly Sales Target"
view: monthly_sales_target {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gke-for-ops.alehop_dataset.monthly_sales_target` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Sales Target" in Explore.

  dimension: sales_target {
    type: number
    sql: ${TABLE}.sales_target ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sales_target {
    type: sum
    sql: ${sales_target} ;;  }
  measure: average_sales_target {
    type: average
    sql: ${sales_target} ;;  }
  measure: count {
    type: count
  }
}
