# The name of this view in Looker is "Estado Del Mes"
view: estado_del_mes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gke-for-ops.alehop_dataset.estado_del_mes` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Percentage of Target Achieved" in Explore.

  dimension: percentage_of_target_achieved {
    type: number
    sql: ${TABLE}.percentage_of_target_achieved ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_percentage_of_target_achieved {
    type: sum
    sql: ${percentage_of_target_achieved} ;;  }
  measure: average_percentage_of_target_achieved {
    type: average
    sql: ${percentage_of_target_achieved} ;;  }
  measure: count {
    type: count
  }
}
