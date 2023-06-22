# Define the database connection to be used for this model.
connection: "bigquery_cdp"

# include all the views
include: "/views_alehop_dataset/**/*.view"
include: "/views_alehop_ads/**/*.view"


explore: smartieorderlines {
  group_label: "Smartie"
  label: "Orders"

  join: smartieorders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${smartieorders.id} = ${smartieorderlines.order_id};;
  }
}
explore: smartieorders {}
