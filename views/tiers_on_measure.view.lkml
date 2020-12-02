view: tiers_on_measure {
  derived_table: {
    sql:
      SELECT
          users."ID"  AS "users.id",
          COUNT(*) as "lifetime_order_item_count",
          --COUNT(DISTINCT ( order_items."ORDER_ID"  ) ) AS "lifetime_orders_count",
          COUNT(DISTINCT ( order_items."USER_ID"  ) ) AS "lifetime_users_count"
      FROM "PUBLIC"."ORDER_ITEMS"
           AS order_items
      LEFT JOIN "PUBLIC"."USERS"
           AS users ON (order_items."USER_ID") = (users."ID")
      GROUP BY
          1
      ORDER BY
          2 DESC
       ;;
  }

  measure: count {
    type: count
    # drill_fields: [detail*]
  }

  dimension: users_id {
    type: number
    primary_key: yes
    sql: ${TABLE}."users.id" ;;
  }

  dimension: lifetime_order_items_count {
    type: number
    sql: COALESCE(${TABLE}."lifetime_order_item_count",0) ;;
  }

  dimension: lifetime_users_count {
    type: number
    sql: COALESCE(${TABLE}."lifetime_users_count",0) ;;
  }

  dimension: lifetime_orders_tiered {
    type: tier
    tiers: [1,2,3,5,10]
    style: integer
    sql: ${lifetime_order_items_count} ;;
  }

  measure: sum {
    type: sum
    sql: ${lifetime_users_count} ;;
  }

  set: detail {
    fields: [users_id, lifetime_order_items_count]
  }
}
