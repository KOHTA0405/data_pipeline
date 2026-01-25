select *
from {{ source('elementary_run_results', 'seed_run_results') }}
