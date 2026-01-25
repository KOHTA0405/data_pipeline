select
    source_freshness_execution_id,
    unique_id,
    status,
    max_loaded_at,
    snapshotted_at,
    generated_at
from {{ source('elementary_run_results', 'dbt_source_freshness_results') }}
