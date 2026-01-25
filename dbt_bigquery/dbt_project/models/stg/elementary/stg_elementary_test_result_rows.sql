select
    elementary_test_results_id,
    result_row,
    detected_at,
    created_at
from {{ source('elementary_run_results', 'test_result_rows') }}
