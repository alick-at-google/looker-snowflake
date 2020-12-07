view: running_total_derived_table {
  derived_table: {
    sql: SELECT
        TO_CHAR(DATE_TRUNC('month', order_count_by_month.created_month), 'YYYY-MM') AS "created_month",
        order_count_by_month.count AS "count",
        SUM(order_count_by_month.count) OVER(order by "created_month" asc rows between unbounded preceding and current row) as "running_total"
      FROM

      (SELECT
        DATE_TRUNC('month', order_items."CREATED_AT" ) AS created_month,
        COUNT(*) AS count
      FROM "PUBLIC"."ORDER_ITEMS"
           AS order_items
      GROUP BY DATE_TRUNC('month', order_items."CREATED_AT" )) as order_count_by_month

      ORDER BY 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: created_month {
    type: string
    sql: ${TABLE}."created_month" ;;
  }

  dimension: count_ {
    type: number
    sql: ${TABLE}."count" ;;
  }

  dimension: running_total {
    type: number
    sql: ${TABLE}."running_total" ;;
  }

  set: detail {
    fields: [created_month, count_, running_total]
  }
}
