explore: created_month_dt_test {}

view: created_month_dt_test {
  derived_table: {
    sql: SELECT
          (DATE_TRUNC('month', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(order_items."CREATED_AT"  AS TIMESTAMP_NTZ)))) AS "order_items.created_month",
          order_items."STATUS"  AS "order_items.status",
          COUNT(*) AS "order_items.count"
      FROM "PUBLIC"."ORDER_ITEMS"
           AS order_items
      GROUP BY
          (DATE_TRUNC('month', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(order_items."CREATED_AT"  AS TIMESTAMP_NTZ)))),
          2
      ORDER BY
          1 DESC
      FETCH NEXT 500 ROWS ONLY
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: order_items_created_month {
    type: time
    sql: ${TABLE}."order_items.created_month" ;;
  }

  dimension: created_month {
    type: date_month
    sql: ${order_items_created_month_raw} ;;
  }

  dimension: order_items_status {
    type: string
    sql: ${TABLE}."order_items.status" ;;
  }

  dimension: order_items_count {
    type: number
    sql: ${TABLE}."order_items.count" ;;
  }

  set: detail {
    fields: [order_items_created_month_time, order_items_status, order_items_count]
  }
}
