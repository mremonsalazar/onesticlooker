# The name of this view in Looker is "Tipo Eventos Embudo"
view: tipo_eventos_embudo {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gke-for-ops.analytics_353816733.tipo_eventos_embudo` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Event Name" in Explore.

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }

  dimension: unique_visitors {
    type: number
    sql: ${TABLE}.unique_visitors ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_unique_visitors {
    type: sum
    sql: ${unique_visitors} ;;  }
  measure: average_unique_visitors {
    type: average
    sql: ${unique_visitors} ;;  }
  measure: count {
    type: count
    drill_fields: [event_name]
  }
}
