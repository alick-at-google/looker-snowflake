view: products {
  sql_table_name: "PUBLIC"."PRODUCTS";;
  # sql_table_name: "PUBLIC".{% parameter category_param %}_table ;;
  drill_fields: [id]


  # parameter: category_param {
  #   type: unquoted
  #   suggest_dimension: products.category
  # }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: html_test {
    type: string
    sql: 1 ;;
    html:
    <div style="background: #339966;
    color: #ffffff;
    font-size: medium;
    padding: 5px 5px;
    align-self: center;
    font: Tahoma;
    vertical-align: middle;
    word-wrap:break-word;
    max-width: 100%" class="single-value">Missing Data</div>;;
  }

  dimension: line_break {
    type: string
    html: <div style="white-space:pre">{{ value }}</div> ;;
    sql: concat(${department},'\r\n',${category}) ;;
   }

  dimension: html_font_size_test {
    type: string
    sql: 'test' ;;
    html: <p style="font-size: 50%"><a href="/dashboards/980">Latest data as of {{rendered_value}}</a></p> ;;
  }

  dimension: html_font_size_2 {
    type: string
    sql: 'test' ;;
    html: <p style="font-size:14px"><a href="/dashboards/980">Click to drill to dashboard</a></p> ;;
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

  parameter: category_param_with_suggest_dimension {
    type: string
    suggest_persist_for: "1 minute"
    suggest_dimension: products.category
  }

  parameter: category_param_wo_suggest_dimension {
    type: string
    suggest_persist_for: "1 minute"
    # suggest_dimension: products.category
  }

  dimension: update_category_based_on_category_suggest_dim_param {
    type: string
    sql: {% parameter category_param_with_suggest_dimension %} ;;
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


  dimension: brands_to_filter {
    type: yesno
    sql: ${brand} ILIKE ANY ('%blue%' , '%jeans%' , '%design%' , '%boutique%', '%big%') ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}."BRAND" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
    # order_by_field: products.count
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
    value_format_name: decimal_0
  }

  measure: median_test {
    type: median
    sql: ${cost} ;;
  }

  measure: group_concat_category {
    type: string
    sql: GROUP_CONCAT(${category}) ;;
  }
}
