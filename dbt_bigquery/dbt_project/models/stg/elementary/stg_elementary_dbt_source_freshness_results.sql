select *
from {{ source('elementary_run_results', 'dbt_source_freshness_results') }}
