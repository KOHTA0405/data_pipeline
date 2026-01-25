select
    id,
    test_unique_id,
    status,
    detected_at,
    created_at
from {{ source('elementary_run_results', 'elementary_test_results') }}
