# The name of this view in Looker is "Smartieorderlines"
view: smartieorderlines {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `{{ _user_attributes['table_name'] }}_dataset.smartie_order_lines`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Comments" in Explore.

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: coupons {
    type: string
    sql: ${TABLE}.coupons ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}.discount ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_snapshot {
    type: string
    sql: ${TABLE}.product_snapshot ;;
  }

  dimension: product_view {
    type: string
    sql: ${TABLE}.product_view ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: quantity_shipped {
    type: number
    sql: ${TABLE}.quantity_shipped ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: regular_unit_price_tax {
    type: number
    sql: ${TABLE}.regular_unit_price_tax ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_regular_unit_price_tax {
    type: sum
    sql: ${regular_unit_price_tax} ;;
  }

  measure: average_regular_unit_price_tax {
    type: average
    sql: ${regular_unit_price_tax} ;;
  }

  dimension: regular_unit_price_with_tax {
    type: number
    sql: ${TABLE}.regular_unit_price_with_tax ;;
  }

  dimension: regular_unit_price_without_tax {
    type: number
    sql: ${TABLE}.regular_unit_price_without_tax ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: total_tax {
    type: number
    sql: ${TABLE}.total_tax ;;
  }

  dimension: total_without_tax {
    type: number
    sql: ${TABLE}.total_without_tax ;;
  }

  dimension: unit_price_tax_type {
    type: number
    sql: ${TABLE}.unit_price_tax_type ;;
  }

  dimension: unit_price_with_tax {
    type: number
    sql: ${TABLE}.unit_price_with_tax ;;
  }

  dimension: unit_price_without_tax {
    type: number
    sql: ${TABLE}.unit_price_without_tax ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }

  measure: sum_quantity {
    type: sum
    sql: ${quantity} ;;
  }
}
