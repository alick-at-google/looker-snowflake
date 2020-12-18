connection: "snowflakelooker"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
include: "/*/alert_test_dashboard.dashboard"   # include a LookML dashboard called my_dashboard
include: "/*/alert_test_dashboard_2.dashboard"   # include a LookML dashboard called my_dashboard

include: "/new_folder/testing.view"

include: "/snowflake_test/*.view"

# explore: order_items {
#   join: products {
#     relationship: many_to_one
#     sql_on: ${order_items.special_character_test_5} = ${products.special_character_test} ;;
#   }
# }

view: +order_items {
  dimension: new_dimension_test {
    type: string
    sql: 'new dimension' ;;
  }
}

datagroup: snowflake_test_default_datagroup {
  sql_trigger: SELECT current_date() ;;
  max_cache_age: "1 hour"
}

explore: products_capitalization {}

# explore: transpose_measures_dt {}

explore: running_total_derived_table {}

explore: running_total_ndt {}

explore: tiers_on_measure {
  cancel_grouping_fields: []
}

# explore: order_items {
# }

# Place in `model_2` model
# explore: +order_items {
#   aggregate_table: rollup__created_date__sale_price__status {
#     query: {
#       dimensions: [created_date, sale_price, status]
#       # measures: [sum_sale_price_type_number]
#       measures: [reference_sums_and_divide]
#       timezone: "America/Los_Angeles"
#     }

#     materialization: {
#       persist_for: "5 minutes"
#     }
#   }
# }


  # access_filter: {
  #   field: products.category
  #   user_attribute: categories_test
  # }

# cancel_grouping_fields: [users.state,users.city]

explore: order_items {

  # sql_always_where: {%condition order_items.is_large_order%} ${order_items.large_order_flag} {%endcondition%};;
  # {% condition products.category_parameter %} products.category {% endcondition %} AND
  # sql_always_where: {% if order_items.date_filter_1._is_filtered %} ${order_items.created_test_date} BETWEEN ifnull({% date_start order_items.date_filter_1 %},to_date('2000-01-01')) AND ifnull({% date_end order_items.date_filter_1 %},to_date('2100-01-01')) {%else%} 1=1 {%endif%} ;;
  # sql_always_where: {% if order_items.create_test_date._is_filtered %} ${45_date_range_dim_ref} {% else %} 1=1 {% endif %} ;;
  # sql_always_where: ${45_date_range_dim_ref} ;;

# access_filter: {
#   field: order_items.status
#   user_attribute: status
# }


  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }

  join: rank_derived_table {
    type: left_outer
    sql_on: ${order_items.id} = ${rank_derived_table.id} ;;
    relationship: many_to_one
  }

  join: orders_by_quarter_derived_table {
    type: left_outer
    sql_on: ${order_items.created_quarter} = ${orders_by_quarter_derived_table.order_items_created_quarter} AND ${products.category} = ${orders_by_quarter_derived_table.products_category};;
    relationship: many_to_one
  }

  join: running_total_derived_table {
    type: left_outer
    sql_on: ${order_items.created_month} = ${running_total_derived_table.created_month} ;;
    relationship: many_to_one
  }

  join: percent_rank_dt {
    type: left_outer
    sql_on: ${products.brand} = ${percent_rank_dt.brand} ;;
    relationship: many_to_one
  }
}

explore: products {
  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}



##### Customer's agg table

# explore: fw_agaw_static_operative_capacity_intl {
#   required_access_grants: [can_access_fw]
#   label: "FW Daily/Monthly Aggregated Explore"

#   aggregate_table: rollup__activity_date__new_property {
#     query: {
#       dimensions: [activity_date, new_property,international_audience,videoclicks,adviews]
#       measures: [ctr_simple_test]
#       filters: [
#         fw_agaw_static_operative_capacity_intl.activity_date: "2020/01/01 to 2020/12/31",
#         fw_agaw_static_operative_capacity_intl.international_audience: "Yes"
#       ]
#       timezone: "UTC"
#     }

#     materialization: {
#       datagroup_trigger: cnni_dvi_default_datagroup
#     }
#   }
# }
