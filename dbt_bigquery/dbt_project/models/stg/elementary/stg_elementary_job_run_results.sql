select
    name,
    id,
    run_id,
    run_started_at,
    run_completed_at,
    run_execution_time
from {{ source('elementary_run_results', 'job_run_results') }}
