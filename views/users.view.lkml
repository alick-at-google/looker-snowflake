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

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
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
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."GENDER" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
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
    # map_layer_name: us_canada_postal_codes
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

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, events.count, order_items.count]
    value_format_name: decimal_0
    # html: {{ state._rendered_value }}: {{ rendered_value }} ;;
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
