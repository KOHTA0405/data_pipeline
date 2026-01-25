select *
from {{ source('elementary_run_results', 'test_result_rows') }}
