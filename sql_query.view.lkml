view: sql_query {
  derived_table: {
    sql: select DATE(created_at) AS date, count(*) AS total
      from `alehop_dataset.smartie_orders`
      group by DATE(created_at)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  set: detail {
    fields: [date, total]
  }
}
