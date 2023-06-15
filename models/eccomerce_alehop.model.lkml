# Define the database connection to be used for this model.
connection: "bigquery_cdp"

# include all the views
include: "/views_alehop_dataset/**/*.view"
include: "/views_alehop_ads/**/*.view"


explore: smartieorders {
  group_label: "Smartie"
  label: "Orders"

  join: smartieorderlines {
    type: left_outer
    relationship: many_to_one
    sql_on: ${smartieorderlines.order_id} = ${smartieorderlines.id};;
  }
}
