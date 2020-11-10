view: orders_by_quarter_derived_table {
  derived_table: {
    sql: -- Did not use order_items::rollup__created_date__sale_price__status; query contains time based fields order_items.created_quarter, order_items.created_year and derived table has timezone America/Los_Angeles, while query has no query timezone (it is running in the db timezone)
      SELECT
          (TO_CHAR(DATE_TRUNC('month', CAST(DATE_TRUNC('quarter', order_items."CREATED_AT" ) AS DATE)), 'YYYY-MM')) AS "order_items.created_quarter",
          products."CATEGORY"  AS "products.category",
          COUNT(DISTINCT ( order_items."ORDER_ID"  ) ) AS "order_items.order_count_decimal_value_format"
      FROM "PUBLIC"."ORDER_ITEMS"
           AS order_items
      LEFT JOIN "PUBLIC"."INVENTORY_ITEMS"
           AS inventory_items ON (order_items."INVENTORY_ITEM_ID") = (inventory_items."ID")
      LEFT JOIN "PUBLIC"."PRODUCTS"
           AS products ON (inventory_items."PRODUCT_ID") = (products."ID")
      WHERE ((( order_items."CREATED_AT"  ) >= ((DATEADD('year', -1, DATE_TRUNC('year', CURRENT_DATE())))) AND ( order_items."CREATED_AT"  ) < ((DATEADD('year', 2, DATEADD('year', -1, DATE_TRUNC('year', CURRENT_DATE()))))))) AND (1=1 -- no filter on 'products.category_parameter'
       )
      GROUP BY
          1,
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

  dimension: order_items_created_quarter {
    type: string
    sql: ${TABLE}."order_items.created_quarter" ;;
  }

  dimension: products_category {
    type: string
    sql: ${TABLE}."products.category" ;;
  }

  dimension: order_items_order_count_decimal_value_format {
    type: number
    sql: ${TABLE}."order_items.order_count_decimal_value_format" ;;
  }

  set: detail {
    fields: [order_items_created_quarter, products_category, order_items_order_count_decimal_value_format]
  }
}
