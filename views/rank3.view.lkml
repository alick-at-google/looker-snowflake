view: rank3 {
    derived_table: {
      explore_source: order_items {
        column: order_id {}
        column: created_date {}
        column: created_month {}
        column: sale_price {}
        column: rank { field: rank_derived_table.rank }
        derived_column: weighted_sale_price { sql: sale_price * (case when rank > 100 then 0 else 1 end) + (case when created_date > '2019-10-01' then 0 sale_price) * -1;; }
      }
    }
    dimension: order_id {
      type: number
    }
    dimension: created_date {
      type: date
    }
    dimension: created_month {
      type: date_month
    }

    dimension: rank {
      type: number
    }

    dimension: weighted_sale_price {
      type: number
    }

    measure: sum_weighted {
      type: sum
      sql: ${weighted_sale_price} ;;
    }
  }
