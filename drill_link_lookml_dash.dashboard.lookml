- dashboard: drill_link_lookml_dash
  title: Drill Link Lookml Dash
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100
  crossfilter_enabled: true
  query_timezone: query_saved
  elements:
  - title: New Tile
    name: New Tile
    model: model_2
    explore: order_items
    type: looker_grid
    fields: [order_items.count, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters: {}
    sorts: [order_items.created_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_range: ["#ed69af", "#dd3333", "#80ce5d", "#f78131", "#369dc1", "#c572d3",
      "#36c1b3", "#b57052"]
    color_by: node
    show_null_points: true
    value_format_override: ''
    show_percent: true
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    font_size: 12
    columnOrder: {}
    y_axes: []
    listen:
      State: users.state
      Data As Of: order_items.data_as_of
      Created Quarter: order_items.created_quarter
      Brand: products.brand
    row: 6
    col: 0
    width: 8
    height: 6
  - title: Drill Link Test
    name: Drill Link Test
    model: model_2
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Here's My Title Let's Make It Longer Now
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      State: users.state
      Data As Of: order_items.data_as_of
      Created Quarter: order_items.created_quarter
      Brand: products.brand
    row: 0
    col: 0
    width: 5
    height: 6
  - title: New Tile (Copy)
    name: New Tile (Copy)
    model: model_2
    explore: order_items
    type: looker_line
    fields: [order_items.count, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters: {}
    sorts: [order_items.created_date desc]
    limit: 500
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
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
    color_range: ["#ed69af", "#dd3333", "#80ce5d", "#f78131", "#369dc1", "#c572d3",
      "#36c1b3", "#b57052"]
    color_by: node
    value_format_override: ''
    show_percent: true
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    font_size: 12
    columnOrder: {}
    y_axes: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      State: users.state
      Data As Of: order_items.data_as_of
      Created Quarter: order_items.created_quarter
      Brand: products.brand
    row: 12
    col: 0
    width: 8
    height: 6
  - title: Here's My Title Let's Make It Longer Now
    name: Here's My Title Let's Make It Longer Now
    model: model_2
    explore: order_items
    type: looker_grid
    fields: [order_items.count, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters:
      order_items.data_as_of: 2021/02/25
      order_items.created_quarter: after 2021/02/01
      users.state: New York,California
    sorts: [order_items.created_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels: {}
    series_cell_visualizations:
      order_items.count:
        is_active: true
    header_font_color: "#f9ffff"
    color_range: ["#ed69af", "#dd3333", "#80ce5d", "#f78131", "#369dc1", "#c572d3",
      "#36c1b3", "#b57052"]
    color_by: node
    show_null_points: true
    value_format_override: ''
    show_percent: true
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    font_size: 12
    columnOrder: {}
    y_axes: []
    listen:
      Brand: products.brand
    row: 18
    col: 0
    width: 8
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <p style="font-size:36px; margin:0px">
      <b>Testing 123
    row: 0
    col: 8
    width: 5
    height: 6
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <p style="font-size:36px">
      <b>Testing 123
    row: 0
    col: 13
    width: 5
    height: 6
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <p style="vertical-align:middle" "font-size:36px">

      <b>Is this text centered?
    row: 6
    col: 8
    width: 15
    height: 6
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h2 style="color:#003B4C;text-align:center;font-family:google sans">
      Total Smartphones</h2>   '
    row: 12
    col: 8
    width: 16
    height: 6
  - name: What font am I?
    type: text
    title_text: What font am I?
    subtitle_text: ''
    body_text: Here's My Title Let's Make It Longer Now
    row: 0
    col: 5
    width: 2
    height: 6
  - name: Here's My Title Let's Make It Longer Now (2)
    type: text
    title_text: Here's My Title Let's Make It Longer Now
    subtitle_text: here's a subtitle
    body_text: here's a body
    row: 18
    col: 8
    width: 16
    height: 6
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h2 style="text-align:center"> Here''s My Title Let''s Make It Longer
      Now (no font fam specified)</h2>   '
    row: 24
    col: 0
    width: 8
    height: 3
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h2 style="text-align:center;font-family:roboto"> Here''s My Title
      Let''s Make It Longer Now (Roboto)</h2>   '
    row: 24
    col: 8
    width: 8
    height: 3
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: 'Here''s My Title Let''s Make It Longer Now '
    row: 27
    col: 9
    width: 8
    height: 3
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h2 style="text-align:center;font-family:google sans"> Here''s My
      Title Let''s Make It Longer Now (google sans)</h2>   '
    row: 27
    col: 0
    width: 8
    height: 3
  - name: " (9)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <font color="grey" size="2.0">
      <ul>
      <li>It will increase 1st transactions - Prospect theory indicates that avoidance of loss is a major motivator for action. So the time-bound cash reward for little effort is likely to increase 1st transactions.</li>
      <li> It will increase speed to 1st transaction and virtual card usage - as the reward is time-bound (48hrs) the initiative is likely to mostly impact early and recent signup cohorts, so it’s easy to see impact and iterate quickly. Users will need to use their virtual card in most cases to get their reward which mitigates the friction and barrier of physical card deliveries.</li>
      </ul>
    row: 30
    col: 0
    width: 8
    height: 6
  - name: " (10)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      * It will increase 1st transactions - Prospect theory indicates that avoidance of loss is a major motivator for action. So the time-bound cash reward for little effort is likely to increase 1st transactions.
      * It will increase speed to 1st transaction and virtual card usage - as the reward is time-bound (48hrs) the initiative is likely to mostly impact early and recent signup cohorts, so it’s easy to see impact and iterate quickly. Users will need to use their virtual card in most cases to get their reward which mitigates the friction and barrier of physical card deliveries.
    row: 30
    col: 8
    width: 8
    height: 6
  filters:
  - name: State
    title: State
    type: field_filter
    default_value: New York,California
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: model_2
    explore: order_items
    listens_to_filters: []
    field: users.state
  - name: Data As Of
    title: Data As Of
    type: field_filter
    default_value: after 2021/02/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: model_2
    explore: order_items
    listens_to_filters: []
    field: order_items.data_as_of
  - name: Created Quarter
    title: Created Quarter
    type: field_filter
    default_value: after 2021/02/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: model_2
    explore: order_items
    listens_to_filters: []
    field: order_items.created_quarter
  - name: Brand
    title: Brand
    type: field_filter
    default_value: "!it Jeans"
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: model_2
    explore: order_items
    listens_to_filters: []
    field: products.brand
