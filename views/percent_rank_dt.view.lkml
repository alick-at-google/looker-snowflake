view: percent_rank_dt {
  derived_table: {
    sql: SELECT
        products."BRAND"  AS "brand",
        COALESCE(SUM((order_items."SALE_PRICE") ), 0) AS "total_sale_price",
         --PERCENT_RANK () OVER (ORDER BY SUM(order_items.sale_price) DESC) AS "percent_rank"
        NTILE(4) OVER (ORDER BY SUM(order_items.sale_price) DESC) AS "percentile_buckets"
      FROM "PUBLIC"."ORDER_ITEMS"
           AS order_items
      LEFT JOIN "PUBLIC"."INVENTORY_ITEMS"
           AS inventory_items ON (order_items."INVENTORY_ITEM_ID") = (inventory_items."ID")
      LEFT JOIN "PUBLIC"."PRODUCTS" AS products ON (inventory_items."PRODUCT_ID") = (products."ID")

      GROUP BY 1
      ORDER BY 2 DESC
       ;;
  }

  measure: count {
    type: count
    # drill_fields: [detail*]
  }

  dimension: brand {
    type: string
    sql: ${TABLE}."brand" ;;
  }

  dimension: total_sale_price {
    type: number
    sql: ${TABLE}."total_sale_price" ;;
  }

  # dimension: percent_rank {
  #   type: number
  #   sql: ${TABLE}."percent_rank" ;;
  # }

  # dimension: percentile_tiers {
  #   type: tier
  #   tiers: [0.25,0.5,0.75,0.9,0.95]
  #   sql: ${percent_rank} ;;
  # }

    dimension: percentile_buckets {
    type: number
    sql: ${TABLE}."percentile_buckets" ;;
  }

  # set: detail {
  #   fields: [brand, total_sale_price, percent_rank]
  # }
}
