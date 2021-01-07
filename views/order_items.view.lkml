view: order_items {
  sql_table_name: "PUBLIC"."ORDER_ITEMS"
    ;;
  drill_fields: [id]

#hi

  dimension: status2 {
    type: string
    sql: case when ${TABLE}."STATUS" is null then 'static string' else ${TABLE}."STATUS" end;;
}

  dimension: status_total {
    type: string
    sql: 'Total' ;;
  }

  measure: static_value {
    type: number
    sql: 2500 ;;
  }

  filter: date_filter_1 {
    type: date
  }

  filter: number {
    type: number
  }

  dimension: html_drill_test {
    type: string
    sql: 1=1 ;;
    html: <a style="color: #EA4335; border: solid 1px #EA4335; float: left; font-weight: 400; text-align: center; vertical-align: middle; cursor: pointer; user-select: none; padding: 10px; margin: 5px;  font-size: 1rem; line-height: 1.5;  border-radius: 5px;"
 href="https://dcl.dev.looker.com/dashboards-next/856?Department+Test={{ _filters['products.department'] | url_encode }}" target="_blank">Day</a> ;;
  }


  dimension: user_attribute_test {
    type: number
    sql: {{ _user_attributes['danielle_number_test'] }} ;;
  }

  dimension: sale_price_filtered {
    type: number
    sql: case when {% condition number %} ${sale_price} {% endcondition %} then ${sale_price} else null end;;
  }

  dimension: 45_date_range {
    type: number
    sql: DATEDIFF(day, {% date_start date_filter_1 %}, {% date_end date_filter_1 %});;
  }

  dimension: 45_date_range_dim_ref {
    type: yesno
    sql: DATEDIFF(day, {% date_start create_test_date %}, {% date_end create_test_date %}) <= 45;;
  }

  dimension_group: time_between_created_and_returned {
    type: duration
    intervals: [second, minute, hour, day, week]
    # sql: {% condition date_filter_1 %} ${TABLE}.created_at {% endcondition %};;
    sql_start: ${TABLE}.created_at ;;
    sql_end: ${TABLE}.returned_at ;;
  }

  dimension: create_test_date {
    type: date
    sql: ${created_date} ;;
  }

  dimension: current_date {
    type: date
    sql: current_date();;
  }

  dimension: current_time {
    type: date_time
    sql: current_timestamp();;
  }

  measure: total_sale_price_2020_test {
    # group_label: "Total Sale Price - Specific Years"
    label: "total sale price for {{ order_items.current_date._value }}"
    type: sum
    sql: ${sale_price};;
    value_format_name: usd_0
    filters: [created_year: "2020"]
  }


  ######################

  filter: custom_date_sql_filter {
    type: date
    # sql: SELECT ${TABLE.created_raw} where  ;;
  }

  ###### HTML IMAGES ###########
  dimension: aon_logo {
    type: string
    sql: 1 ;;
    html: <img src="https://cdn.filestackcontent.com/fMVx1x2rQb5oHLv0QA4l" height=60% width=60% /> ;;
  }

  dimension: aon_logo_div_tags {
    type: string
    sql: 1 ;;
    html: <div class="single-value"><img src="https://cdn.filestackcontent.com/fMVx1x2rQb5oHLv0QA4l" height=60% width=60% /> </div> ;;
  }

  ##########

  parameter: is_large_order {
    type: number
    allowed_value: {
      label: "Yes"
      value: "1"
    }
    allowed_value: {
      label: "No"
      value: "0"
    }
    allowed_value: {
      label: "All Results"
      value: ""
    }
  }

  dimension: is_big_order {
    type: yesno
    sql: ${sale_price}>=200 ;;
  }

  dimension: large_order_flag {
    type: number
    sql: case when ${sale_price}>=200 then 1 else 0 end;;
  }

  measure: count_big_orders {
    type: count_distinct
    sql: case when ${is_big_order} then ${order_id} else null end;;
  }

  measure: count_small_orders {
    type: count_distinct
    sql: case when NOT(${is_big_order}) then ${order_id} else null end;;
  }

  measure: count_small_orders_filters_param {
    type: count_distinct
    sql: ${order_id} ;;
    filters: [is_big_order: "false"]
  }

  dimension: status_lookml_case_when {
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

  dimension: year {
    type: string
    sql: ${created_year} ;;
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

  dimension_group: delivered_html_test {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      day_of_week,
      day_of_week_index,
      week,
      day_of_month,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."DELIVERED_AT" ;;
    html: {% if delivered_html_test_day_of_week_index == 5 %} <font color="green">{{ value }}</font>
    {% else %} {{value}}
    {% endif %};;
  }

  dimension: concat_date_dimension_test {
    type: string
    sql: ${delivered_html_test_day_of_week} || ', ' || to_char(${delivered_html_test_day_of_month}) || ' ' || ${delivered_html_test_month_name} || ' ' || ${delivered_html_test_time_of_day} ;;
    order_by_field: delivered_html_test_time
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

  dimension: html_spacing_test {
    type: string
    sql: 'here is some text' ;;
    html:
<p style="font-size:25px; text-align:center; font-weight: bold">{{ order_items.status._value }}</p>
<p style="color: black; background-color: gold; font-size:30px; text-align:center">{{ rendered_value }}</p>
<p style="font-size:15px; text-align:center">The Warehouse load has not yet competed<br>Looks or Dashboards using this Wareouse<br>will not yet return data</p> ;;
  }

  dimension: html_spacing_test_2 {
    type: string
    sql: 'here is some text' ;;
    html: <p style="font-size:25px; text-align:center; font-weight: bold; line-height: 1.5">{{ order_items.status._value }}</p>
    <p class="small" style="color: black; background-color: crimson; font-size:30px; text-align:center; line-height: 1.5">{{ rendered_value }}<br><span style="font-size:25px; line-height: 1.5">{{ order_items.created_date._value }}</span></p>
    <p class="small" style="font-size:15px; text-align:center; line-height: 1.5">The updated date is listed above</p>
    ;;
  }


  dimension: sale_price {
    type: number
    sql: ${TABLE}."SALE_PRICE" ;;
    # value_format_name: id
  }

  dimension: sale_price_tiers {
    type: tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 100, 150, 200, 250, 300]
    style: integer
    sql: ${sale_price} ;;
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

  dimension: sale_price_times_100 {
    type: number
    sql: ${TABLE}.sale_price * 100 ;;
    value_format_name: decimal_2
    # value_format: "[>=1000000000]0.00,,,\"B\";[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
  }

  dimension: sale_price_times_negative_10 {
    type: number
    sql: ${TABLE}.sale_price * -10 ;;
    value_format_name: decimal_2
  }

  dimension: sale_price_manual_tiers {
    type: string
    sql: case when ${sale_price_times_100} <= 1000 then 'Under $1000'
          when ${sale_price_times_100} > 1000 AND ${sale_price_times_100} <= 2500 then '$1,000 - $2,500'
          when ${sale_price_times_100} > 2500 AND ${sale_price_times_100} <= 5000 then '$2,500 - $5,000'
          when ${sale_price_times_100} > 5000 AND ${sale_price_times_100} <= 10000 then '$5,000 - $10,000'
          when ${sale_price_times_100} > 10000 AND ${sale_price_times_100} <= 12500 then '$10,000 - $12,500'
          when ${sale_price_times_100} > 12500 AND ${sale_price_times_100} <= 20000 then '$12,500 - $20,000'
          when ${sale_price_times_100} > 20000 AND ${sale_price_times_100} <= 25000 then '$20,000 - $25,000'
          when ${sale_price_times_100} > 25000 AND ${sale_price_times_100} <= 100000 then 'Above $100,000'
          else null end;;
    order_by_field: sort_order_2
  }

  dimension: sort_order_2 {
    type: number
    sql: case when ${sale_price_times_100} <= 1000 then 1
          when ${sale_price_times_100} > 1000 AND ${sale_price_times_100} <= 2500 then 10
          when ${sale_price_times_100} > 2500 AND ${sale_price_times_100} <= 5000 then 25
          when ${sale_price_times_100} > 5000 AND ${sale_price_times_100} <= 10000 then 50
          when ${sale_price_times_100} > 10000 AND ${sale_price_times_100} <= 12500 then 100
          when ${sale_price_times_100} > 12500 AND ${sale_price_times_100} <= 20000 then 125
          when ${sale_price_times_100} > 20000 AND ${sale_price_times_100} <= 25000 then 200
          when ${sale_price_times_100} > 25000 AND ${sale_price_times_100} <= 100000 then 250
      end
       ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: day_over_day_percent_change {
    type: number
    sql: COALESCE(((${count}-${previous_day_with_lead_function_dt.previous_days_count})/${previous_day_with_lead_function_dt.previous_days_count}),0) ;;
    value_format_name: percent_2
    drill_fields: [detail*]
  }

  measure: count_complete {
    type: count
    filters: [status: "Complete"]
    value_format_name: decimal_0
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

  measure: total_sale_price_negative {
    type: sum
    sql: ${sale_price_times_negative_10} ;;
    value_format_name: decimal_2
  }

  measure: percent_of_total_sale_price {
    type: percent_of_total
    sql: ${total_sale_price};;
    value_format_name: percent_2
  }

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  # measure: average_sale_price_filtered_measure_1 {
  #   type: average
  #   sql: ${sale_price} ;;
  #   filters: [percent_rank_dt.percentile_buckets: "1"]
  # }


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

  measure: count_orders_2020 {
    type: count
    filters: [created_year: "2020"]
  }

  measure: count_orders_2019 {
    type: count
    filters: [created_year: "2019"]
  }

  measure: yoy_percent_change_order_items{
    type: number
    sql: (${count_orders_2020}-${count_orders_2019})/nullif(${count_orders_2019},0) ;;
    value_format_name: percent_2
  }

  measure: total_users_over_total_orders {
    type: number
    sql: ${users.count}/nullif(${count},0) ;;
    value_format_name: percent_2
  }

  measure: average_order_price {
    type: number
    sql: 1.0*${total_sale_price}/nullif(${count},0) ;;
    value_format_name: decimal_0
  }

  measure: average_order_price_value_format {
    type: average
    sql: ${sale_price} ;;
    value_format: "[mod 0]0;[mod 1]0.#;[mod 2]0.##"
  }

  measure: average_order_price_2019 {
    type: number
    sql: 1.0*${total_sale_price_2019}/nullif(${count_orders_2019},0) ;;
    value_format_name: usd_0
  }

  measure: running_total {
    type: running_total
    sql: ${count} ;;
    direction: "column"
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
