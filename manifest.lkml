project_name: "snowflake_test"

constant: schema_test {
  value: "{% if 1==0 %} test {% else %} test2 {% endif %}"
  export: override_optional
}

constant: schema_test {
  value: "{% if _user_attributes['email'] == 'danielle.behette@looker.com' %}PUBLIC
  {% else %}
  schema
  {% endif %}"
}

constant: schema_test_2 {
  value:
  "{% assign user_name = _user_attributes['first_name'] %}
  {% if user_name == 'Danielle' %}
  PUBLIC
  {% else %}
  schema
  {% endif %}"
}



# {% assign user_can_view_pii = _user_attributes["can_view_pii"]|upcase %}
# {% if user_can_view_pii == "FALSE" %}
# {% assign schema = {{_user_attributes['schema_name']|upcase}}"_NON_PII" %}
# {% else %}
# {% assign schema = {{_user_attributes['schema_name']|upcase}} %}
# {% endif %}
# "{{schema}}"."DIM_CRISIS_VOTES"

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
