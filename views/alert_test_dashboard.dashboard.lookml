- dashboard: alert_test_dashboard_testing
# - dashboard: alert_test_dashboard_testing_with_a_very_long_lookml_dashboard_name_to_see_how_many_total_characters_input_in_the_name_here_will_cause_an_errortoseehowmanycharactersicanincludeherebeforethelookmlvalidatorfreaksoutormaybeitwontamnotsureifthereisacharaterlimithereintermsofthedashboardnameajsndkjahfsjkfsndjkfmuehnxfgnvmxhjwnjkdfj_kjasjkhtndmlkksfmhjgnkjhgmlksmfdmkj_plqwkrnfamxnmfhklagshnsalnvjkfbmbalfjehmglekz_qwoieualksdjz_mxbghtyslnf_qwertyuioplkjhgfdsazxcvbnmmnbvcxzasdfghjklpoiuytrewq_qwertyuioplkjhgfdsazxcvbnm_mmnnbbvvccxxzzllkkjjhhggffddssaappooiiuuyyttrreewwqq_qwertyuiopplkjhgfdsazxcvbnmnbvcxzasdfghjklpoiuytrewq
  title: Alert Test Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Value Format decimal_2
    name: Value Format decimal_2
    model: model_2
    explore: order_items
    type: looker_column
    fields: [order_items.created_month, order_items.status, order_items.order_count_decimal_value_format]
    pivots: [order_items.status]
    fill_fields: [order_items.created_month]
    sorts: [order_items.created_month desc, order_items.status]
    limit: 500
    query_timezone: UTC
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
  - title: Value Format usd
    name: Value Format usd
    model: model_2
    explore: order_items
    type: looker_column
    fields: [order_items.created_month, order_items.status, order_items.order_count_usd_value_format]
    pivots: [order_items.status]
    fill_fields: [order_items.created_month]
    sorts: [order_items.created_month desc, order_items.status]
    limit: 500
    query_timezone: UTC
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
  - title: Value Format decimal_2 with HTML parameter
    name: Value Format decimal_2 with HTML parameter
    model: model_2
    explore: order_items
    type: looker_column
    fields: [order_items.created_month, order_items.status, order_items.order_count_decimal_value_format_html]
    pivots: [order_items.status]
    fill_fields: [order_items.created_month]
    sorts: [order_items.created_month desc, order_items.status]
    limit: 500
    query_timezone: UTC
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
