select *
from {{ source('elementary_run_results', 'elementary_test_results') }}
