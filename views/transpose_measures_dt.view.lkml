view: transpose_measures_dt {
  derived_table: {
    explore_source: order_items {
      column: average_order_price {}
      column: average_order_price_2019 {}
      column: count {}
      column: count_orders_2019 {}
      column: max_sale_price_type_number {}
    }
  }
  dimension: average_order_price {
    value_format: "$#,##0"
    type: number
  }
  dimension: average_order_price_2019 {
    value_format: "$#,##0"
    type: number
  }
  dimension: count {
    type: number
  }
  dimension: count_orders_2019 {
    type: number
  }
  dimension: max_sale_price_type_number {
    type: number
  }
}
