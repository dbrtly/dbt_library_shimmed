{%- macro my_macro() -%}
    {{ return(adapter.dispatch('my_macro', 'dbt_unit_testing')()) }}
{%- endmacro %}

{%- macro default__my_macro() -%}
'dbt_project_shimmed'
{%- endmacro %}

{%- macro bigquery__my_macro() -%}
'bugquery dbt_project_shimmed'
{%- endmacro %}

{%- macro duckdb__my_macro() -%}
'dbt_project_shimmed'
{%- endmacro %}
