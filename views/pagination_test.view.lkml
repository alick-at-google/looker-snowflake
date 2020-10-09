view: pagination_test {
derived_table: {
  sql:
    SELECT * FROM "PUBLIC"."ORDER_ITEMS"
    LIMIT {{ number_per_page._parameter_value }}
    OFFSET {{ number_per_page._parameter_value | times: page._parameter_value | minus: number_per_page._parameter_value }} ;;
}

parameter: page {
  type: number
}

parameter: number_per_page {
  type: number
}

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}."INVENTORY_ITEM_ID" ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}."SALE_PRICE" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension_group: returned_at {
    type: time
    sql: ${TABLE}."RETURNED_AT" ;;
  }

  dimension_group: shipped_at {
    type: time
    sql: ${TABLE}."SHIPPED_AT" ;;
  }

  dimension_group: delivered_at {
    type: time
    sql: ${TABLE}."DELIVERED_AT" ;;
  }

  set: detail {
    fields: [
      id,
      order_id,
      user_id,
      inventory_item_id,
      sale_price,
      status,
      created_at_time,
      returned_at_time,
      shipped_at_time,
      delivered_at_time
    ]
  }
}
