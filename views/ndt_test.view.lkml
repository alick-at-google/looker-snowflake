view: ndt_test {
    derived_table: {
      explore_source: order_items {
        column: rank { field: rank_derived_table.rank }
        column: status {}
      }
    }
    dimension: rank {
      type: number
    }
    dimension: status {}
  }


  ##### this ndt references an explore that usese derived tables we want to see how the sql generates if we pick one of these fields from the ndt in our
