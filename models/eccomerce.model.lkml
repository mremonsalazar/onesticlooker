# Define the database connection to be used for this model.
connection: "bigquery_cdp"

# include all the views
include: "/views_alehop_dataset/**/*.view"
include: "/views_alehop_ads/**/*.view"
include: "/medidas/**/*.view"
include: "/views/*.view"


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
explore: pyg_advertising_investment {}
explore: pygsalestarget {}
explore: sum_quantity_orderlines {}
explore: sum_without_tax_by_day {}
explore: count_shipping_address_email {}
explore: query1 {}
explore: query2 {}
explore: events_20230523 {
  hidden: no
  join: events_20230523__items {
    view_label: "Events 20230523: Items"
    sql: LEFT JOIN UNNEST(${events_20230523.items}) as events_20230523__items ;;
    relationship: one_to_many
  }
  join: events_20230523__event_params {
    view_label: "Events 20230523: Event Params"
    sql: LEFT JOIN UNNEST(${events_20230523.event_params}) as events_20230523__event_params ;;
    relationship: one_to_many
  }
  join: events_20230523__user_properties {
    view_label: "Events 20230523: User Properties"
    sql: LEFT JOIN UNNEST(${events_20230523.user_properties}) as events_20230523__user_properties ;;
    relationship: one_to_many
  }
}
