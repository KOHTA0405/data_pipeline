select *
from {{ source('elementary_run_results', 'model_run_results') }}
