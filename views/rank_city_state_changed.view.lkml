view: rank_city_state {
  derived_table: {
    sql:
            SELECT
                (TO_CHAR(TO_DATE(CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(order_items."CREATED_AT"  AS TIMESTAMP_NTZ))), 'YYYY-MM-DD')) AS "order_items.created_date",
                users."STATE"  AS "users.state",
                users."CITY"  AS "users.city",
                RANK() OVER (PARTITION BY users."STATE", users."CITY" ORDER BY (TO_CHAR(TO_DATE(CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(order_items."CREATED_AT"  AS TIMESTAMP_NTZ))), 'YYYY-MM-DD')) DESC) AS "rank"
            FROM "PUBLIC"."ORDER_ITEMS"
                 AS order_items
            LEFT JOIN "PUBLIC"."USERS"
                 AS users ON (order_items."USER_ID") = (users."ID")
            WHERE (users."COUNTRY" ) = 'USA'
            GROUP BY
                (TO_DATE(CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(order_items."CREATED_AT"  AS TIMESTAMP_NTZ)))),
                2,
                3
            ORDER BY
                2,3,1 DESC
             ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_items_created_date {
    type: string
    sql: ${TABLE}."order_items.created_date" ;;
  }

  dimension: users_state {
    type: string
    sql: ${TABLE}."users.state" ;;
  }

  dimension: users_city {
    type: string
    sql: ${TABLE}."users.city" ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}."rank" ;;
  }

  set: detail {
    fields: [order_items_created_date, users_state, users_city, rank]
  }
}
