view: rank_derived_table {
    derived_table: {
      sql: SELECT
        order_items."ID"  AS "id",
        TO_CHAR(DATE_TRUNC('month', CAST(order_items."CREATED_AT"  AS TIMESTAMP_NTZ)), 'YYYY-MM') AS "created_month",
        TO_CHAR(DATE_TRUNC('second', CAST(order_items."CREATED_AT"  AS TIMESTAMP_NTZ)), 'YYYY-MM-DD HH24:MI:SS') AS "created_time",
        RANK() OVER(PARTITION BY TO_CHAR(DATE_TRUNC('month', CAST(order_items."CREATED_AT"  AS TIMESTAMP_NTZ)), 'YYYY-MM') ORDER BY TO_CHAR(DATE_TRUNC('second', CAST(order_items."CREATED_AT"  AS TIMESTAMP_NTZ)), 'YYYY-MM-DD HH24:MI:SS')) as rank
      FROM PUBLIC.ORDER_ITEMS  AS order_items

      --GROUP BY 1,DATE_TRUNC('month', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(order_items."CREATED_AT"  AS TIMESTAMP_NTZ))),DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(order_items."CREATED_AT"  AS TIMESTAMP_NTZ)))
      ORDER BY 3 DESC
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

    set: detail {
      fields: [id, created_month, created_time, rank]
    }
  }
