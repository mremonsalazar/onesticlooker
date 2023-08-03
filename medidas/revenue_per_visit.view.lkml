# The name of this view in Looker is "Revenue per Visit"
view: revenue_per_visit {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gke-for-ops.analytics_353816733.revenue_per_visit` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Revenue per Visit" in Explore.

  dimension: revenue_per_visit {
    type: number
    sql: ${TABLE}.revenue_per_visit ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_revenue_per_visit {
    type: sum
    sql: ${revenue_per_visit} ;;  }
  measure: average_revenue_per_visit {
    type: average
    sql: ${revenue_per_visit} ;;  }
  measure: count {
    type: count
  }
}
