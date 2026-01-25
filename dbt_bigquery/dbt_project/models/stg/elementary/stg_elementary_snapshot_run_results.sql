select *
from {{ source('elementary_run_results', 'snapshot_run_results') }}
