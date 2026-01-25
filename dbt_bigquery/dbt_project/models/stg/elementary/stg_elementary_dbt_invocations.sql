select *
from {{ source('elementary_run_results', 'dbt_invocations') }}
