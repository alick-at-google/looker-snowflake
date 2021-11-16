view: users {
  sql_table_name: "PUBLIC"."USERS"
    ;;
  drill_fields: [id]


  filter: state_filter {
    type: string
    suggest_dimension: state
  }

  filter: year_filter {
    type: string
  }

  dimension: year_filter_satisfied {
    type: yesno
    sql: {% condition year_filter %} ${created_year} {% endcondition %} ;;
  }

  measure: count_by_selected_year{
    type: count
    filters: [year_filter_satisfied: "yes"]
    # html: {{ state._rendered_value }}: {{ rendered_value }} ;;
  }

  # parameter: state_parameter {
  #   type: unquoted
  #   suggest_dimension: state
  # }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}."AGE" ;;
  }

  measure: median_age {
    type: median
    sql: ${age} ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
    # map_layer_name: us_municipalities
  }

  dimension: city_case_when {
    type: string
    sql: case when ${country}='UK' then 'UK' else ${TABLE}."CITY" end;;
    # map_layer_name: us_municipalities
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
    # required_fields: [id]
  }

  filter: first_name_filter_field {
    suggest_dimension: first_name
  }

  parameter: first_name_parameter {
    suggest_dimension: first_name
  }

  dimension: first_name_liquid {
    type: string
    # sql: {% condition first_name_filter_field %} ${first_name} {% endcondition %};;
    sql: ${TABLE}."FIRST_NAME";;
    # skip_drill_filter: yes
    html:
    {% if first_name_filter_field._is_filtered and value == _filters['users.first_name_filter_field'] %}
    {{value}}
    {% elsif first_name_filter_field._is_filtered and value <> _filters['users.first_name_filter_field'] %}
    Other Group
    {% else %}
    {{value}}
    {% endif %};;
  }

  dimension: first_name_liquid_3 {
    type: string
    # sql: {% condition first_name_filter_field %} ${first_name} {% endcondition %};;
    sql: ${TABLE}."FIRST_NAME";;
    # skip_drill_filter: yes
    html:
    {% if value == _filters['users.first_name_parameter'] %}
    {{value}}
    {% else %}
    Other Group
    {% endif %};;
  }

  dimension: first_name_liquid_2 {
    type: string
    sql: ${TABLE}.first_name ;;
    html:
    {% if first_name_liquid_2._is_filtered and value == _filters['users.first_name_liquid_2'] %}
    {{value}}
    {% else %}
    Other Group
    {% endif %};;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."GENDER" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: full_name {
    type: string
    sql: concat(${first_name}, ' ', ${last_name}) ;;
    html: {{first_name._value}}<br>{{last_name._rendered_value}} ;;
    required_fields: [state]
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}."LATITUDE" ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}."LONGITUDE" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }

  dimension: city_comma_state {
    type: string
    sql: case when ${country} = 'USA' then concat(${city}, ', ', ${state}) else concat(${city},${state}) end ;;
  }

  dimension: liquid_contains_test {
    type: string
    # sql:
    # {% if ${gender} == 'Female' %}
    # female
    # {% elsif ${city_comma_state} contains ',' %}
    # contains comma
    # {% elsif ${city_comma_state} %}
    # does not contain comma
    # {% endif %};;
    sql:
    {% if users.gender == 'Female' %}
    'female'
    {% elsif users.city contains 'city' or users.city contains 'City' %}
    'contains city'
    {% endif %};;
  }

    #   {% elsif users.city does not contain 'city' or users.city does not contain 'City' %}
    # 'does not contain city'

  dimension: traffic_source {
    type: string
    sql: ${TABLE}."TRAFFIC_SOURCE" ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}."ZIP" ;;
  }

  dimension: zip_with_map_layer {
    type: zipcode
    sql: ${TABLE}."ZIP" ;;
    map_layer_name: us_canada_postal_codes
  }

  dimension: first_name_action {
    type: string
    sql: ${TABLE}.first_name ;;
    action: {
      label: "Cool Name?"
      url: "https://my_server_name/endpoint_name"

      param: {
        name: "name"
        value: "{{ value }}"
      }
      form_param: {
        name: "annotation"
        type: select
        label: "Cool name?"
        default: "No"
        description: "Do you think that this name is a cool name?"
        option: {
          name: "No"
        }
        option: {
          name: "Yes"
        }
      }
    }
  }

  measure: max_state_test {
    type: string
    sql: max(${state}) ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, events.count, order_items.count]
    value_format_name: decimal_2
    # html: {{ state._rendered_value }}: {{ rendered_value }} ;;
  }

  measure: user_count_running_total {
    type: running_total
    sql: ${count} ;;
    direction: "column"
  }

  measure: most_recent_user_created_date {
    type: date
    sql: max(${created_date}) ;;
  }

  measure: count_users_in_ny {
    type: count
    filters: [state: "New York"]
  }

  measure: count_users_in_specific_state {
    type: sum
    sql: case when {% condition state_filter %} ${state} {% endcondition %} then 1 else null end ;;
    # filters: [state: "New York"]
  }
}
