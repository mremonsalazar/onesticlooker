# The name of this view in Looker is "Coste Ventas"
view: coste_ventas {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gke-for-ops.alehop_dataset.coste_ventas` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Coste Ventas" in Explore.

  dimension: coste_ventas {
    type: number
    sql: ROUND(${TABLE}.coste_ventas, 2) ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_coste_ventas {
    type: sum
    sql: ${coste_ventas} ;;  }
  measure: average_coste_ventas {
    type: average
    sql: ${coste_ventas} ;;  }
  measure: count {
    type: count
  }
}
