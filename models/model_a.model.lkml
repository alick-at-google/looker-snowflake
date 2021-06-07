connection: "snowflakelooker"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include: "/**/map_layers.lkml"


# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: order_items {
  fields: [ALL_FIELDS*, -order_items.sale_price_with_negatives]
  join: users {
    relationship: many_to_one
    sql_on: ${users.id} = ${order_items.user_id} ;;
  }
}
