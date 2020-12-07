# include: "model_2.model.lkml"

view: running_total_ndt {
    derived_table: {
      explore_source: order_items {
        column: created_month {}
        column: count {}
        column: running_total {}
      }
    }
    dimension: created_month {
      type: date_month
    }
    dimension: count {
      type: number
    }
    dimension: running_total {
      type: number
    }
  }
