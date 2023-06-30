# Define the database connection to be used for this model.
connection: "bigquery_cdp"

# include all the views
include: "/views_alehop_dataset/**/*.view"
include: "/views_alehop_ads/**/*.view"
include: "/medidas/**/*.view"
include: "/views_alehop_analytics/*.view"


explore: smartieorderlines {
  group_label: "Smartie"
  label: "Orders"

  join: smartieorders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${smartieorders.id} = ${smartieorderlines.order_id};;
  }
}

#explore: sum_without_tax_by_day {
#  join: pygsalestarget {
#    sql_on: 1 = 1 ;;
#    type: cross
#  }
#}

explore: smartieorders {}
explore: smartie_stocks {}
explore: pyg_advertising_investment {}
explore: pygsalestarget {}
explore: sum_quantity_orderlines {}
explore: sum_without_tax_by_day {}
explore: count_shipping_address_email {}
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
