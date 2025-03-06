{% macro log_results(results) %}

  {% if execute %}
  {{ log("========== Begin Summary ==========", info=True) }}
  {% for res in results -%}
    {% if res.status == 'error' %}
      {% set line -%}
          node: {{ res.node.unique_id }}; status: {{ res.status }} (message: {{ res.message }})
      {%- endset %}
      {{ log(line, info=True) }}
    {% endif %}
  {% endfor %}
  {{ log("========== End Summary ==========", info=True) }}
  {% endif %}

{% endmacro %}