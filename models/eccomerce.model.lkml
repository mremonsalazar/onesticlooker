connection: "bigquery_cdp"

include: "/views_alehop_dataset/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }

explore: smartieorders {
  group_label: "Smartie"
  label: "Orders"
  ##
  #join: smartieorderlines {
  #  type: left_outer
  #  relationship: many_to_one
  #  sql_on: ${smartieorderlines.id} = d;;
}
# }
