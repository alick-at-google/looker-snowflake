view: rank2 {
  derived_table: {
    sql: SELECT rank_derived_table.*,
    --order_items.sale_price as sale_price
    sum(order_items.sale_price) * (case when rank_derived_table.rank > 150 then 0 else 1 end) as weighted_sales
    FROM rank_derived_table.SQL_TABLE_NAME
    JOIN PUBLIC.ORDER_ITEMS  AS order_items
    ON rank_derived_table.id = order_items.id

      --GROUP BY 1,DATE_TRUNC('month', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(order_items."CREATED_AT"  AS TIMESTAMP_NTZ))),DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(order_items."CREATED_AT"  AS TIMESTAMP_NTZ)))
     -- ORDER BY 3 DESC
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: created_month {
    type: string
    sql: ${TABLE}."created_month" ;;
  }

  dimension: created_time {
    type: string
    sql: ${TABLE}."created_time" ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}."RANK" ;;
  }

  dimension: total_sale_price {
    type: number
    sql: ${TABLE}."total_sale_price" ;;
  }

  dimension: weighted_sales {
    type: number
    sql: ${TABLE}."weighted_sales" ;;
  }

  measure: sum_weighted_sales {
    type: sum
    sql: ${TABLE}."weighted_sales" ;;

  }

  set: detail {
    fields: [id, created_month, created_time, rank]
  }
}
