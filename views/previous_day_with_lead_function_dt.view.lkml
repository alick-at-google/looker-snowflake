view: previous_day_with_lead_function_dt {
 derived_table: {
  sql: SELECT
        TO_CHAR(TO_DATE(order_items."CREATED_AT" ), 'YYYY-MM-DD') AS "date",
        COUNT(*) AS "count_current_day",
        LEAD (COUNT(*),1) OVER (ORDER BY TO_DATE(order_items."CREATED_AT" ) DESC) AS "count_previous_day"
      FROM "PUBLIC"."ORDER_ITEMS"
           AS order_items

      GROUP BY TO_DATE(order_items."CREATED_AT" )
      ORDER BY 1 DESC
      LIMIT 2000
       ;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: date {
  type: string
  sql: ${TABLE}."date" ;;
  primary_key: yes
}

dimension: count_current_day {
  type: number
  sql: ${TABLE}."count_current_day" ;;
}

dimension: count_previous_day {
  type: number
  sql: ${TABLE}."count_previous_day" ;;
}

measure: previous_days_count {
  type: sum
  sql: ${count_previous_day} ;;
}

set: detail {
  fields: [date, count_current_day, count_previous_day]
}
}
