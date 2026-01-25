select *
from {{ source('elementary_run_results', 'job_run_results') }}
