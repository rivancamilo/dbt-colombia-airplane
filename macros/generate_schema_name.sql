{#
  Override del macro estándar de dbt: por defecto, un custom schema se
  concatena como "<target.schema>_<custom_schema>". Aquí necesitamos que
  cada capa aterrice en el dataset exacto declarado en dbt_project.yml
  (dbt_silver / dbt_gold), sin prefijo del target.
#}
{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- if custom_schema_name is none -%}
        {{ target.schema }}
    {%- else -%}
        {{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro %}
