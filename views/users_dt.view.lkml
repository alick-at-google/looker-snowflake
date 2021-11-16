view: users_dt {
derived_table: {
  sql: SELECT
          users."STATE"  AS "users.state",
          COUNT(DISTINCT users."ID" ) AS "users.count"
      FROM "PUBLIC"."EVENTS"
           AS events
      LEFT JOIN "PUBLIC"."USERS"
           AS users ON (events."USER_ID") = (users."ID")
      WHERE (users."COUNTRY" ) = 'USA'
      GROUP BY
          1
      ORDER BY
          2 DESC
      FETCH NEXT 500 ROWS ONLY
       ;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: users_state {
  type: string
  sql: ${TABLE}."users.state" ;;
}

dimension: users_count {
  type: number
  sql: ${TABLE}."users.count" ;;
}

set: detail {
  fields: [users_state, users_count]
}
}



# view: users_dt_orig {
#     derived_table: {
#       sql: SELECT
#               *
#               FROM "PUBLIC"."USERS"
#                   AS users

#               LIMIT 500
#               ;;
#     }

#     parameter: state_parameter {
#       type: unquoted
#       suggest_dimension: state
#     }

#     measure: count {
#       type: count
#       drill_fields: [detail*]
#     }

#     dimension: id {
#       type: number
#       sql: ${TABLE}."ID" ;;
#     }

#     dimension: first_name {
#       type: string
#       sql: ${TABLE}."FIRST_NAME" ;;
#     }

#     dimension: last_name {
#       type: string
#       sql: ${TABLE}."LAST_NAME" ;;
#     }

#     dimension: email {
#       type: string
#       sql: ${TABLE}."EMAIL" ;;
#     }

#     dimension: age {
#       type: number
#       sql: ${TABLE}."AGE" ;;
#     }

#     dimension: city {
#       type: string
#       sql: ${TABLE}."CITY" ;;
#     }

#     dimension: state {
#       type: string
#       sql: ${TABLE}."STATE" ;;
#     }

#     dimension: country {
#       type: string
#       sql: ${TABLE}."COUNTRY" ;;
#     }

#     dimension: zip {
#       type: string
#       sql: ${TABLE}."ZIP" ;;
#     }

#     dimension: latitude {
#       type: number
#       sql: ${TABLE}."LATITUDE" ;;
#     }

#     dimension: longitude {
#       type: number
#       sql: ${TABLE}."LONGITUDE" ;;
#     }

#     dimension: gender {
#       type: string
#       sql: ${TABLE}."GENDER" ;;
#     }

#     dimension_group: created_at {
#       type: time
#       sql: ${TABLE}."CREATED_AT" ;;
#     }

#     dimension: traffic_source {
#       type: string
#       sql: ${TABLE}."TRAFFIC_SOURCE" ;;
#     }

#     dimension: location {
#       type: location
#       sql_latitude: ${TABLE}."latitude" ;;
#       sql_longitude: ${TABLE}."longitude" ;;
#     }

#     dimension: dimensionalized_count {
#       type: number
#       sql:${TABLE}."DIMENSIONALIZED_COUNT"  ;;
#     }

#     set: detail {
#       fields: [
#         id,
#         first_name,
#         last_name,
#         email,
#         age,
#         city,
#         state,
#         country,
#         zip,
#         latitude,
#         longitude,
#         gender,
#         created_at_time,
#         traffic_source,
#         location
#       ]
#     }
#   }
