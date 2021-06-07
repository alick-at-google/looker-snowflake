connection: "snowflakelooker"

view: test {
  derived_table: {
    sql: select 1 as num ;;
  }

  dimension: num {
    type: number
    primary_key: yes
    sql: ${TABLE}.num ;;
  }
}

explore: test {}
