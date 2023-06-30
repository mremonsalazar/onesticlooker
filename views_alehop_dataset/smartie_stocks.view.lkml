# The name of this view in Looker is "Smartie Stocks"
view: smartie_stocks {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gke-for-ops.alehop_dataset.smartie_stocks` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Internal Product ID" in Explore.

  dimension: internal_product_id {
    type: number
    description: "product_id"
    sql: ${TABLE}.internal_product_id ;;
  }

  dimension: product_sku {
    type: number
    sql: ${TABLE}.product_sku ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_product_sku {
    type: sum
    sql: ${product_sku} ;;  }
  measure: average_product_sku {
    type: average
    sql: ${product_sku} ;;  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: stock_id {
    type: number
    sql: ${TABLE}.stock_id ;;
  }

  dimension: warehouse_id {
    type: number
    sql: ${TABLE}.warehouse_id ;;
  }
  measure: count {
    type: count
  }
}
