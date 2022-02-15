view: title_count {
  derived_table: {
    sql: SELECT
          order_items."USER_ID"  AS "order_items.user_id",
          COUNT(CASE WHEN ((order_items."STATUS") = 'Complete') THEN 1 ELSE NULL END) AS "order_items.count_complete",
          COUNT(DISTINCT users."ID" ) AS "users.count"
      FROM "PUBLIC"."ORDER_ITEMS"
           AS order_items
      LEFT JOIN "PUBLIC"."USERS"
           AS users ON (order_items."USER_ID") = (users."ID")
      GROUP BY
          1
      HAVING COUNT(CASE WHEN ((order_items."STATUS") = 'Complete') THEN 1 ELSE NULL END) > 1
      ORDER BY
          2 DESC
      FETCH NEXT 500 ROWS ONLY
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_items_user_id {
    type: number
    primary_key: yes
    sql: ${TABLE}."order_items.user_id" ;;
  }

  dimension: order_items_count_complete {
    type: number
    sql: ${TABLE}."order_items.count_complete" ;;
  }

  dimension: users_count {
    type: number
    sql: ${TABLE}."users.count" ;;
  }

  # measure: sum_of_display_names_per_user {
  #   type: sum
  #   sql: ${order_items_count_complete} ;;
  # }

  measure: sum_of_count_unique_visitors {
    type: sum
    sql: ${users_count} ;;
  }

  set: detail {
    fields: [order_items_user_id, order_items_count_complete, users_count]
  }
}
