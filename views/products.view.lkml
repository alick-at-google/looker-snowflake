view: products {
  sql_table_name: "PUBLIC"."PRODUCTS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: line_break {
    type: string
    html: <div style="white-space:pre">{{ value }}</div> ;;
    sql: concat(${department},'\r\n',${category}) ;;
   }

  parameter: dimension_picker {
    type:  string
    allowed_value: {
      label: "Brand"
      value: "brand" }
    allowed_value: {
      label: "Category"
      value: "category" }
    allowed_value: {
      label: "Department"
      value: "department" }
    allowed_value: {
      label: "None"
      value: "-" }
  }

  parameter: category_parameter {
    type: string
    allowed_value: {
      label: "Accessories"
      value: "Accessories" }
    allowed_value: {
      label: "Jeans"
      value: "Jeans" }
  }

  dimension: dynamic_dimension {
    type: string
    label_from_parameter: dimension_picker
    sql:     {% if dimension_picker._parameter_value == "'brand'" %}
       ${brand}
    {% elsif dimension_picker._parameter_value == "'category'" %}
       ${category}
    {% elsif dimension_picker._parameter_value == "'department'" %}
        ${department}
    {% elsif dimension_picker._parameter_value == "'-'" %}
       '-'
    {% endif %} ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}."BRAND" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }


  dimension: categories_yesno {
    type: yesno
    sql: ${category} = 'Accessories' OR ${category} = 'Jeans';;
  }

  dimension: category_capitalization {
    type: string
    sql: case when ${category} = 'Leggings' then 'pants'
    when ${category} = 'Accessories' then 'accessories'
    when ${category} = 'Skirts' then 'socks'
    when ${category} = 'Plus' then 'jeans-hi'
    when ${category} = 'Maternity' then 'pants'
    when ${category} = 'Swim' then null
    when ${category} = 'Shorts' then 'jeans'
    else ${category}
    end ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}."COST" ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}."DEPARTMENT" ;;
  }

  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."DISTRIBUTION_CENTER_ID" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}."RETAIL_PRICE" ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}."SKU" ;;
  }

  dimension: special_character_test {
    type: string
    # sql: case when ${department} ='Men' then 'https://ad.doubleclick.net/ddm/trackclk/N5797.1618589PIXABILITYINC./B24521269.280243013;dc_trk_aid=474528003;dc_trk_cid=136662220;dc_lat=;dc_rdid=;tag_for_child_directed_treatment=;tfua=;gdpr=$\{GDPR\};gdpr_consent=$\{GDPR_CONSENT_755\}'
    #       else 'https://company.looker.com/test$\{testing\}'
    #       end;;
    sql: 'https://company.looker.com/test$\{testing\}' ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, distribution_centers.name, distribution_centers.id, inventory_items.count]
  }

  measure: group_concat_category {
    type: string
    sql: GROUP_CONCAT(${category}) ;;
  }
}
