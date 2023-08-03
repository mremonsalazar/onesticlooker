# The name of this view in Looker is "Total Cart Abandonment"
view: total_cart_abandonment {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gke-for-ops.analytics_353816733.total_cart_abandonment` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Total Cart Abandonment" in Explore.

  dimension: total_cart_abandonment {
    type: number
    sql: ${TABLE}.total_cart_abandonment ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_total_cart_abandonment {
    type: sum
    sql: ${total_cart_abandonment} ;;  }
  measure: average_total_cart_abandonment {
    type: average
    sql: ${total_cart_abandonment} ;;  }
  measure: count {
    type: count
  }
}
