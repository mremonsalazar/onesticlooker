# The name of this view in Looker is "Days In Current Month"
view: days_in_current_month {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gke-for-ops.alehop_dataset.days_in_current_month` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Days" in Explore.

  dimension: days {
    type: number
    sql: ${TABLE}.days ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_days {
    type: sum
    sql: ${days} ;;  }
  measure: average_days {
    type: average
    sql: ${days} ;;  }
  measure: count {
    type: count
  }
}
