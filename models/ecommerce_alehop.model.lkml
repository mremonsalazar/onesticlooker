# Define the database connection to be used for this model.
connection: "bigquery_cdp"

# include all the views
include: "/views_alehop_dataset/**/*.view"
include: "/views_alehop_ads/**/*.view"
include: "/medidas/**/*.view"


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
explore: count_shipping_address_email {}
explore: sum_quantity_orderlines {}
explore: sum_without_tax_by_day {}
explore: sum_without_tax_por_paises {}
