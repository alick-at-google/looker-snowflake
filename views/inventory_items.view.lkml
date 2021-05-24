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


  measure: dummycontact {
    # hidden: yes
    type: string
    sql: max('Contact Us');;
    html: <div class="tc w-100 h-100 flex items-center flex-column overflow-hidden" style="background:#FFFF">

      <div class='flex flex-grow-1 items-center' style="font-size:0.9em;color:white;">

      <a href="mailto:JWEITZ@its.jnj.com" target="_top"> Contact Us </a> </div>

      </div> ;;
  }


  measure: dummycontact2 {
    # hidden: yes
    type: string
    sql: max('Contact Us');;
    html:
      <a href="mailto:JWEITZ@its.jnj.com" target="_top"> Contact Us </a> ;;
  }


  measure: dummycontact3 {
    # hidden: yes
    type: string
    sql: max('Contact Us');;
    html:
      <a href="mailto:danielle.behette@looker.com" target="_top"> Contact Us </a> ;;
  }

  measure: dummycontact4 {
    # hidden: yes
    type: string
    sql: max('Contact Us');;
    html:
      <a href="mailto:danielle.behette@looker.com"> Contact Us </a> ;;
  }

  measure: dummycontact5 {
    # hidden: yes
    type: string
    sql: max('Contact Us');;
    html:
      <a href="www.google.com"> Contact Us </a> ;;
  }


  dimension: mailto {
    type: string
    sql: 'Contact Us' ;;
    link: {
      label: "Contact Warehouse Support"
      url: "mailto:danielle.behette@looker.com"
    }
  }

  # <a href="mailto:unsubscribeCSAT@looker.zendesk.com?subject=CSAT Unsubscribe" >click here</a>
}
