view: order_items {
  sql_table_name: "PUBLIC"."ORDER_ITEMS"
    ;;
  drill_fields: [id]

  dimension: status2 {
    type: string
    sql: case when ${TABLE}."STATUS" is null then 'static string' else ${TABLE}."STATUS" end;;
}

  dimension: status_total {
    type: string
    sql: 'Total' ;;
  }

  dimension: status_case_when {
    type: string
    case: {
      when: {
        label: "Complete"
        sql: ${status} = 'Complete' ;;
      }
      when: {
        label: "Cancelled"
        sql: ${status} = 'Cancelled' ;;
      }
      when: {
        label: "Returned"
        sql: ${status} = 'Returned' ;;
      }
      when: {
        label: "Shipped"
        sql: ${status} = 'Shipped' ;;
      }
      when: {
        label: "Processing"
        sql: ${status} = 'Processing' ;;
      }
      when: {
        label: "Total"
        sql: 1=1 ;;
      }
    }
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension_group: delivered {
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
    sql: ${TABLE}."DELIVERED_AT" ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."INVENTORY_ITEM_ID" ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}."RETURNED_AT" ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}."SALE_PRICE" ;;
    # value_format_name: id
  }

  dimension: sale_price_value_format_id_type {
    type: string
    # sql: ${TABLE}."SALE_PRICE"*1234567898765000;;
    sql: CONCAT('\'',${TABLE}."SALE_PRICE"*12345678987650000::VARCHAR);;
    # sql: CONCAT('\'',${TABLE}."SALE_PRICE"*12345678987650000);;
    value_format: "id"
  }

  dimension: sale_price_value_format_id_type_2 {
    type: string
    sql: ${sale_price_value_format_id_type};;
    # sql: CONCAT('\'',${TABLE}."SALE_PRICE"*12345678987650000);;
    value_format_name: id
  }

  dimension_group: shipped {
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
    sql: ${TABLE}."SHIPPED_AT" ;;
  }

  dimension_group: shipped_datatype_datetime {
    type: time
    datatype: datetime
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."SHIPPED_AT" ;;
  }

  dimension_group: shipped_datatype_timestamp {
    type: time
    datatype: timestamp
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."SHIPPED_AT" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
#     html: <div class="btn-group btn-group-toggle" data-toggle="buttons">
# <label class="btn btn-secondary active">
# <input type="radio" name="options" id="option1" autocomplete="off" checked>
# <a class="btn btn-lg btn-light" href="https://dcl.dev.looker.com/dashboards/112">
# <i class="fa fa-globe fa-2x"></i>
# <br />
# {{value}}
# </a>
# </label>
# <label class="btn btn-secondary">
# <input type="radio" name="options" id="option2" autocomplete="off">
# <a class="btn btn-lg btn-light" href="https://dcl.dev.looker.com/dashboards/113">
# <i class="fa fa-pencil fa-2x" aria-hidden="true"></i>
# <br />
# Usage
# </a>
# </label>
# <label class="btn btn-secondary">
# <input type="radio" name="options" id="option3" autocomplete="off">
# <a class="btn btn-lg btn-light" href="https://dcl.dev.looker.com/dashboards/114">
# <i class="fa fa-check-square-o fa-2x" aria-hidden="true"></i>
# <br />
# Performance
# </a>
# </label>
# </div> ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: url {
    type: string
    sql: 'https://www.google.com' ;;
    html: <a href="{{value}}">{{value}}</a> ;;
  }

  dimension: special_character_test {
    label: "Curly Braces Test"
    type: string
    sql: case when ${status} ='Complete' then 'https://company.com/test=$\{testing\}'
          else ${TABLE}."STATUS" end;;
  }

  dimension: special_character_test_2 {
    type: string
    case: {
      when: {
        sql: ${status} ='Cancelled';;
        label: "https://company.looker.com/test$\{test\}"
        }
      else: "{{ order_items.status._value }}"
      }
  }

  dimension: special_character_test_3 {
    type: string
    sql: case when ${status} ='Cancelled' then concat('https://ad.doubleclick.net/ddm/trackclk/N5797.1618589PIXABILITYINC./B24521269.280243013;dc_trk_aid=474528003;dc_trk_cid=136662220;dc_lat=;dc_rdid=;tag_for_child_directed_treatment=;tfua=;gdpr=$','{GDPR};gdpr_consent=$','{GDPR_CONSENT_755}')
    when ${status} ='Complete' then concat('https://company.looker.com/test$','{testing}')
    else ${TABLE}."STATUS" end;;
  }

  dimension: special_character_test_4 {
    type: string
    sql: case when ${status} ='Cancelled' then 'https://ad.doubleclick.net/ddm/trackclk/N5797.1618589PIXABILITYINC./B24521269.280243013;dc_trk_aid=474528003;dc_trk_cid=136662220;dc_lat=;dc_rdid=;tag_for_child_directed_treatment=;tfua=;gdpr=$\{GDPR\};gdpr_consent=$\{GDPR_CONSENT_755\}'
          when ${status} ='Complete' then 'https://company.looker.com/test$\{testing\}'
          else ${TABLE}."STATUS" end;;
  }

  dimension: special_character_test_5 {
    type: string
    sql: concat('https://company.looker.com/test$','{testing}');;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd_0
    # html: {%if total_sale_price < 0 %}
    # {{value}}
    # {% else %}
    # {% endif %};;
  }

  measure: order_count_usd_value_format {
    type: count_distinct
    sql: ${order_id} ;;
    value_format_name: usd
  }

  measure: order_count_decimal_value_format {
    type: count_distinct
    sql: ${order_id} ;;
    value_format_name: decimal_2
  }

  measure: order_count_decimal_value_format_html {
    type: count_distinct
    sql: ${order_id} ;;
    value_format_name: decimal_2
    html: €{{rendered_value}} ;;
    # drill_fields: [drill_set*]
  }

############ Total Sale Price per Year Parameter Test ##############

parameter: year_selector {
  type: string
  allowed_value: { value: "2016" }
  allowed_value: { value: "2017" }
  allowed_value: { value: "2018" }
  allowed_value: { value: "2019" }
  allowed_value: { value: "2020" }
}

  measure: dynamic_total_sale_price_by_year {
    type: number
    label_from_parameter: year_selector
    sql:
      CASE
        WHEN {% parameter year_selector %} = '2016' THEN ${total_sale_price_2016}
        WHEN {% parameter year_selector %} = '2017' THEN ${total_sale_price_2017}
        WHEN {% parameter year_selector %} = '2018' THEN ${total_sale_price_2018}
        WHEN {% parameter year_selector %} = '2019' THEN ${total_sale_price_2019}
        WHEN {% parameter year_selector %} = '2020' THEN ${total_sale_price_2020}
        ELSE NULL
        END ;;
    value_format_name: usd_0
  }

  # measure: dynamic_total_sale_price_by_year_filter {
  #   type: number
  #   sql:
  #   {% condition year_selector_filter %} = '2016' THEN ${total_sale_price_2016}
  #       WHEN {% parameter year_selector %} = '2017' THEN ${total_sale_price_2017}
  #       WHEN {% parameter year_selector %} = '2018' THEN ${total_sale_price_2018}
  #       WHEN {% parameter year_selector %} = '2019' THEN ${total_sale_price_2019}
  #       WHEN {% parameter year_selector %} = '2020' THEN ${total_sale_price_2020}
  #       ELSE NULL
  #       END ;;
  #   value_format_name: usd_0
  # }


  filter: year_selector_filter {
    type: string
    suggest_dimension: created_year
  }

  measure: total_sale_price_2020 {
    group_label: "Total Sale Price - Specific Years"
    type: sum
    sql: ${sale_price};;
    value_format_name: usd_0
    filters: [created_year: "2020"]
  }

  measure: total_sale_price_2019 {
    group_label: "Total Sale Price - Specific Years"
    type: sum
    sql: ${sale_price};;
    value_format_name: usd_0
    filters: [created_year: "2019"]
  }

  measure: total_sale_price_2018 {
    group_label: "Total Sale Price - Specific Years"
    type: sum
    sql: ${sale_price};;
    value_format_name: usd_0
    filters: [created_year: "2018"]
  }

  measure: total_sale_price_2017 {
    group_label: "Total Sale Price - Specific Years"
    type: sum
    sql: ${sale_price};;
    value_format_name: usd_0
    filters: [created_year: "2017"]
  }

  measure: total_sale_price_2016 {
    group_label: "Total Sale Price - Specific Years"
    type: sum
    sql: ${sale_price};;
    value_format_name: usd_0
    filters: [created_year: "2016"]
  }


###############


  measure: count_orders_2019 {
    type: count
    filters: [created_year: "2019"]
  }

  measure: average_order_price {
    type: number
    sql: 1.0*${total_sale_price}/nullif(${count},0) ;;
    value_format_name: usd_0
  }

  measure: average_order_price_2019 {
    type: number
    sql: 1.0*${total_sale_price_2019}/nullif(${count_orders_2019},0) ;;
    value_format_name: usd_0
  }

##### Aggregate table test using measures of type: number

  measure: sum_sale_price_type_number {
    type: number
    sql: sum(${sale_price}) ;;
  }

  measure: max_sale_price_type_number {
    type: number
    sql: max(${sale_price}) ;;
  }

  measure: count_sale_price_type_number {
    type: number
    sql: count(${sale_price}) ;;
  }

  measure: total_sale_price_type_number {
    description: "references the total_sale_price measure of type: sum"
    type: number
    sql: ${total_sale_price} ;;
  }

  measure: reference_sums_and_divide {
    type: number
    sql: 1.0*${total_sale_price}/nullif(${total_sale_price},${total_sale_price}+2) ;;
  }


  # measure: ctr {
  #   type: number
  #   label: "CTR"
  #   sql: COALESCE( SUM(${videoclicks}) * 1.00 / IFNULL( SUM(${adviews}), SUM(${videoclicks})) ,0) ;;
  #   value_format: "0.0%"
  #   drill_fields: [activity_month_month, custom_deal_type, modality, section, ctr]
  # }


######## Rank test for CJ

  # measure: rank_calculation_test_with_case_statement {
  #   type: number
  #   sql: ${total_sale_price} * (case when ${rank_derived_table.rank} > 8400 then 0 else 1 end) ;;
  # }

  # measure: test_with_measure_rank {
  #   type: number
  #   sql: ${total_sale_price} * (case when ${sum_rank} > 150 then 0 else 1 end) ;;
  # }

  # measure: sum_rank {
  #   type: sum
  #   sql:${rank_derived_table.rank} ;;
  # }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.first_name,
      users.last_name,
      users.id,
      inventory_items.id,
      inventory_items.product_name
    ]
  }
}
