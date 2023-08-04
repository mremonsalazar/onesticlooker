# The name of this view in Looker is "Not Sold In Last Week"
view: not_sold_in_last_week {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gke-for-ops.alehop_dataset.NotSoldInLastWeek` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Product SKU" in Explore.

  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }

  dimension: stocks {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_quantity {
    type: sum
    sql: ${stocks} ;;  }
  measure: average_quantity {
    type: average
    sql: ${stocks} ;;  }

  dimension: producto {
    type: string
    sql: ${TABLE}.title ;;
  }
  measure: count {
    type: count
  }
}
