view: inventory_items {
  sql_table_name: "PUBLIC"."INVENTORY_ITEMS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: cost {
    # label: "{% if _view._name == 'inventoryitems' %} Inventory Items Cost {% else %} Cost {% endif %}"
    type: number
    sql: ${TABLE}."COST" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: product_brand {
    type: string
    sql: ${TABLE}."PRODUCT_BRAND" ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}."PRODUCT_CATEGORY" ;;
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}."PRODUCT_DEPARTMENT" ;;
  }

  dimension: product_distribution_center_id {
    type: number
    sql: ${TABLE}."PRODUCT_DISTRIBUTION_CENTER_ID" ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."PRODUCT_ID" ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}."PRODUCT_NAME" ;;
  }

  dimension: product_retail_price {
    type: number
    sql: ${TABLE}."PRODUCT_RETAIL_PRICE" ;;
  }

  dimension: retail_price_with_case_when {
    type: string
    sql: case when ${product_retail_price} < 5 then null else to_varchar(${product_retail_price}) end ;;
    # html:
    # {% if retail_price_with_case_when %}
    # {{ rendered_value }}
    # {% else %}
    # {% endif %} ;;
  }

  dimension: show_nulls_as_blanks {
    type: string
    sql: case when ${retail_price_with_case_when} is null then '' else to_varchar(${retail_price_with_case_when}) end ;;
  }


  dimension: product_sku {
    type: string
    sql: ${TABLE}."PRODUCT_SKU" ;;
  }

  dimension_group: sold {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."SOLD_AT" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, product_name, products.id, products.name, order_items.count]
  }

  measure: total_retail_price {
    type: sum
    sql: ${product_retail_price} ;;
    value_format: "#,##0.00"
  }

  measure: percentile_25 {
    type: percentile
    percentile: 25
    sql: ${product_retail_price} ;;
  }
}
