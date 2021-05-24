# project_name: "snowflake_test"

# constant: schema_name {
#   value: "schema_1"
# }

# constant: negative_percentage_refund_decimal{
#   value:
#   "
#   {% assign digits = value | split:'.' | last | split:'' %}
#   {% assign length = digits | size | minus: 1 %}
#   {% assign res = '' %}
#   {% for i in (0...length) %}
#   {% if i == 1 %}
#   {% assign res = res | append: digits[i] | append: '.' | append: ';' %}
#   {% else %}
#   {% assign res = res | append: digits[i] | append: 1;1%}
#   {% endif %}
#   {% endfor %}
#   <p style=\"text-align:left;color:red;line-height:1.5;padding: 11px 0;\">({{res| remove_last: ';' | split: ';' | join:''| round }}%)</p>"
# }

# constant: simple_constant {
#   value: "helloworld"
# }

# constant: liquid_constant {
#   value: "
#   {% if view._name == order_items %}
#   <p style=\"text-align:left;color:red;line-height:1.5;padding: 11px 0;\">({{ value }}%)</p>
#   {% else %}
#   <p style=\"text-align:left;color:blue;line-height:1.5;padding: 11px 0;\">({{ value }}%)</p>
#   {% endif %}
# "
# }

# visualization: {
#   id: "treemap-danielle"
#   label: "Treemap Danielle"
#   url: "https://github.com/looker/custom_visualizations_v2/tree/master/dist/treemap.js"
# }

# visualization: {
#   id: "treemap-danielle-test"
#   label: "Treemap Danielle Test"
#   url: "https://looker-custom-viz-a.lookercdn.com/master/treemap.js"
# }

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
