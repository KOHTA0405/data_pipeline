select
    distribution_center_id,
    distribution_center_name,
    latitude,
    longitude,
    distribution_center_geom
from {{ ref('stg_ec_distribution_centers') }}

