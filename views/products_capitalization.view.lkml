view: products_capitalization {
 derived_table: {
  sql: SELECT
        products."CATEGORY"  AS "products.category",
        products."DEPARTMENT"  AS "products.department",
        case when (products."CATEGORY") = 'Leggings' then 'pants'
          when (products."CATEGORY") = 'Accessories' then 'accessories'
          when (products."CATEGORY") = 'Skirts' then 'socks'
          when (products."CATEGORY") = 'Plus' then 'jeans-hi'
          when (products."CATEGORY") = 'Maternity' then 'pants'
          when (products."CATEGORY") = 'Swim' then null
          when (products."CATEGORY") = 'Shorts' then 'jeans'
          else (products."CATEGORY")
          end  AS "products.category_capitalization",
        COUNT(*) AS "products.count"
      FROM "PUBLIC"."PRODUCTS"
           AS products

      GROUP BY 1,2,3
      ORDER BY 4 DESC
      LIMIT 500
       ;;
      # persist_for: "24 hours"
      datagroup_trigger: snowflake_test_default_datagroup
}

measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: products_category {
  type: string
  sql: ${TABLE}."products.category" ;;
}

dimension: products_department {
  type: string
  sql: ${TABLE}."products.department" ;;
}

dimension: products_category_capitalization {
  type: string
  sql: ${TABLE}."products.category_capitalization" ;;
}

  dimension: products_category_capitalization_case_when {
    type: string
    case: {
      when: {
        sql: ${TABLE}."products.category_capitalization" = 'accessories' ;;
        label: "accessories"
      }
      when: {
        sql: ${TABLE}."products.category_capitalization" = 'Active' ;;
         label: "Active"
        }
        when: {
          sql: ${TABLE}."products.category_capitalization" = 'Jeans' ;;
          label: "Jeans"
        }
        when: {
          sql: ${TABLE}."products.category_capitalization" = 'jeans' ;;
          label: "jeans"
          }
          when: {
            sql: ${TABLE}."products.category_capitalization" = 'Pants' ;;
            label: "Pants"
            }
          when: {
            sql: ${TABLE}."products.category_capitalization"= 'pants' ;;
            label: "pants"
          }
          else: "clothing"
    }
  }

dimension: products_count {
  type: number
  sql: ${TABLE}."products.count" ;;
}

set: detail {
  fields: [products_category, products_department, products_category_capitalization, products_count]
}
}
