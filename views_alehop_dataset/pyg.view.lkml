# The name of this view in Looker is "Pyg"
view: pyg {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `alehop_dataset.pyg`)
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Advertising Investment" in Explore.

  dimension: advertising_investment {
    type: number
    sql: ${TABLE}.advertising_investment ;;
  }

  dimension: analytics_id {
    type: number
    sql: ${TABLE}.analytics_id ;;
  }

  dimension: cost_of_sales {
    type: number
    sql: ${TABLE}.cost_of_sales ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost_of_sales {
    type: sum
    sql: ${cost_of_sales} ;;
  }

  measure: average_cost_of_sales {
    type: average
    sql: ${cost_of_sales} ;;
  }

  dimension: gross_margin {
    type: number
    sql: ${TABLE}.gross_margin ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
