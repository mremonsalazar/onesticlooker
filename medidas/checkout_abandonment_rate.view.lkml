# The name of this view in Looker is "Checkout Abandonment Rate"
view: checkout_abandonment_rate {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gke-for-ops.analytics_353816733.checkout_abandonment_rate` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Checkout Abandonment Rate" in Explore.

  dimension: checkout_abandonment_rate {
    type: number
    sql: ${TABLE}.checkout_abandonment_rate ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_checkout_abandonment_rate {
    type: sum
    sql: ${checkout_abandonment_rate} ;;  }
  measure: average_checkout_abandonment_rate {
    type: average
    sql: ${checkout_abandonment_rate} ;;  }
  measure: count {
    type: count
  }
}
