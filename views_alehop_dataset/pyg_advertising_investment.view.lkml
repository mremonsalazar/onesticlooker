include: "/views_alehop_dataset/**/smartieorders.view"

# The name of this view in Looker is "Pyg Advertising Investment"
view: pyg_advertising_investment {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gke-for-ops.alehop_dataset.pyg_advertising_investment`
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

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: sum_advertising_investment {
    type: sum
    sql: ${advertising_investment} ;;
  }

  measure: average_advertising_investment {
    type: average
    sql: ${advertising_investment} ;;
  }

  dimension: month {
    type: date
    sql: ${TABLE}.month ;;
  }

  dimension: year {
    type: date
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  dimension: date {
    hidden: yes
    type: string
    sql: PARSE_DATE('%Y%m', CONCAT(${TABLE}.year, ${TABLE}.month)) ;;
  }

  dimension_group: event_date_group {
    type: time
    timeframes: [date, month, month_num, year]
    datatype: date
    sql: ${date} ;;
  }

  dimension: month_group {
    type: string
    primary_key: yes
    sql: ${event_date_group_month} ;;
  }
}
