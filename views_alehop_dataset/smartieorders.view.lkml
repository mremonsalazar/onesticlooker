# The name of this view in Looker is "Smartieorders"
view: smartieorders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `alehop_dataset.smartie_orders`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Billing Address City" in Explore.

  dimension: billing_address_city {
    type: string
    sql: ${TABLE}.billing_address_city ;;
  }

  dimension: billing_address_country {
    type: string
    sql: ${TABLE}.billing_address_country ;;
  }

  dimension: billing_address_email {
    type: string
    description: "anonymized"
    sql: ${TABLE}.billing_address_email ;;
  }

  dimension: billing_address_nif {
    type: string
    description: "anonymized"
    sql: ${TABLE}.billing_address_nif ;;
  }

  dimension: billing_address_postal_code {
    type: number
    sql: ${TABLE}.billing_address_postal_code ;;
  }

  dimension: billing_address_region {
    type: string
    sql: ${TABLE}.billing_address_region ;;
  }

  dimension: channel {
    type: string
    description: "view.channel.name"
    sql: ${TABLE}.channel ;;
  }

  dimension: channel_status {
    type: string
    sql: ${TABLE}.channel_status ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: coupons {
    type: string
    sql: ${TABLE}.coupons ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    description: "channel_created_date"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_email {
    type: string
    description: "anonymized"
    sql: ${TABLE}.customer_email ;;
  }

  dimension: customer_gender {
    type: string
    sql: ${TABLE}.customer_gender ;;
  }

  dimension: customer_nif {
    type: string
    description: "anonymized"
    sql: ${TABLE}.customer_nif ;;
  }

  dimension: customer_reference {
    type: string
    sql: ${TABLE}.customer_reference ;;
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

  dimension: local_status {
    type: string
    sql: ${TABLE}.local_status ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}.payment_method ;;
  }

  dimension: reference {
    type: number
    sql: ${TABLE}.reference ;;
  }

  dimension: reference_external {
    type: string
    sql: ${TABLE}.reference_external ;;
  }

  dimension: shipping_address_city {
    type: string
    sql: ${TABLE}.shipping_address_city ;;
  }

  dimension: shipping_address_country {
    type: string
    sql: ${TABLE}.shipping_address_country ;;
  }

  dimension: shipping_address_email {
    type: string
    description: "anonymized"
    sql: ${TABLE}.shipping_address_email ;;
  }

  dimension: shipping_address_nif {
    type: string
    description: "anonymized"
    sql: ${TABLE}.shipping_address_nif ;;
  }

  dimension: shipping_address_postal_code {
    type: number
    sql: ${TABLE}.shipping_address_postal_code ;;
  }

  dimension: shipping_address_region {
    type: string
    sql: ${TABLE}.shipping_address_region ;;
  }

  dimension: shipping_method {
    type: string
    sql: ${TABLE}.shipping_method ;;
  }

  dimension: shipping_price {
    type: number
    sql: ${TABLE}.shipping_price ;;
  }

  dimension: shipping_price_tax_type {
    type: number
    sql: ${TABLE}.shipping_price_tax_type ;;
  }

  dimension: shipping_tax {
    type: number
    sql: ${TABLE}.shipping_tax ;;
  }

  dimension: shipping_with_tax {
    type: number
    sql: ${TABLE}.shipping_with_tax ;;
  }

  dimension: store_pickup {
    type: yesno
    sql: ${TABLE}.store_pickup ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: tax {
    type: number
    sql: ${TABLE}.total_tax ;;
  }

  dimension: total_without_tax {
    type: number
    sql: ${TABLE}.total_without_tax ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_shipping_price {
    type: sum
    sql: ${shipping_price} ;;
  }

  measure: average_without_tax {
    label: "Media Tax"
    description: "[Alehop Dashboard] Valor medio del pedido"
    type: average
    sql: ${total_without_tax} ;;
    value_format_name: eur
  }

  measure: total_tax {
    type: sum
    sql: ${tax} ;;
    value_format_name: eur
  }

  measure: average_shipping_price {
    type: average
    sql: ${shipping_price} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_without_tax {
    type: sum
    sql: ${total_without_tax} ;;
  }

  measure: avg_without_tax {
    type: average
    sql: ${total_without_tax} ;;
  }
}
