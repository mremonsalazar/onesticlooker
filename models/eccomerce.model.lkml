
# Define the database connection to be used for this model.
connection: "bigquery_cdp"

# include all the views
include: "/views_alehop_dataset/**/*.view"
include: "/views_alehop_ads/**/*.view"
include: "/medidas/**/*.view"
include: "/views_alehop_analytics/*.view"
include: "/alehop_merchant_center/**/products_670518068.view"


#explore: sum_without_tax_by_day {
#  join: pygsalestarget {
#    sql_on: 1 = 1 ;;
#    type: cross
#  }
#}

explore: smartieorders {}
explore: smartie_stocks {}
#explore: pyg_advertising_investment {}
explore: pygsalestarget {}
explore: sum_quantity_orderlines {}
explore: sum_without_tax_by_day {}
explore: count_shipping_address_email {}
explore: first_visits {}
explore: conversion_rate {}
explore: gross_margin {}
explore: cart_abandonment_rate {}
explore: checkout_abandonment_rate {}
explore: total_cart_abandonment {}
explore: revenue_per_visit {}
explore: cancellation_ratio {}
explore: ventas_objetivo {}
explore: not_sold_in_last_week {}
explore: alto_stock_pocas_visitas {}
explore: poco_stock_muchas_visitas {}
explore: sin_stock_mas_vendidos {}
explore: top_prodcutos_unidades_no_vendidos {}
explore: coste_ventas {}
explore: advertising_investment_with_purchases {}
explore: embudo_compras {}
explore: tipo_eventos_embudo {}
explore: cesta_media {}
#explore: daily_revenue {}


explore: events {
  hidden: no
  join: events_items {
    view_label: "Events: Items"
    sql: LEFT JOIN UNNEST(${events.items}) as events_items ;;
    relationship: one_to_many
  }
  join: events_event_params {
    view_label: "Events: Event Params"
    sql: LEFT JOIN UNNEST(${events.event_params}) as events_event_params ;;
    relationship: one_to_many
  }
  join: events_user_properties {
    view_label: "Events: User Properties"
    sql: LEFT JOIN UNNEST(${events.user_properties}) as events_user_properties ;;
    relationship: one_to_many
  }
}

explore: smartieorderlines {
  group_label: "Smartie"
  label: "Orders"

  join: smartieorders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${smartieorders.id} = ${smartieorderlines.order_id};;
  }
}

explore: allcustomers {
  group_label: "Tasa cancelacion"
  label: "Customers and purchases"

  join: recentpurchases {
    type: left_outer
    relationship: many_to_one
    sql_on: ${allcustomers.events_user_pseudo_id} = ${recentpurchases.events_user_pseudo_id};;
  }
}

explore: daily_revenue {
  join: monthly_sales_target {
    relationship: many_to_many
    sql_on: 1 = 1 ;; # this sql_on condition is required in some dialects,
    type: cross      # but causes problems in other dialects, try adding or
  }                  # removing if you experience problems with cross joins
  join: days_in_current_month {
    relationship: many_to_many
    sql_on: 1 = 1 ;; # this sql_on condition is required in some dialects,
    type: cross      # but causes problems in other dialects, try adding or
  }
}


explore: pyg_advertising_investment {
  join: smartieorders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${smartieorders.created_month} = ${pyg_advertising_investment.event_date_group_month};;
  }
}
