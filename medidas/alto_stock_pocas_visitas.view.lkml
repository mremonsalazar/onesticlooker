# The name of this view in Looker is "Alto Stock Pocas Visitas"
view: alto_stock_pocas_visitas {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gke-for-ops.analytics_353816733.alto_stock_pocas_visitas` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Product SKU" in Explore.

  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_quantity {
    type: sum
    sql: ${quantity} ;;  }
  measure: average_quantity {
    type: average
    sql: ${quantity} ;;  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: visibility_count {
    type: number
    sql: ${TABLE}.visibility_count ;;
  }

  dimension: visibility_stock_ratio {
    type: number
    sql: ${TABLE}.visibility_stock_ratio ;;
  }
  measure: count {
    type: count
  }
}
