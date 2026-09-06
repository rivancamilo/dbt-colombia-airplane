select
    idciudad         as id_ciudad,
    trim(nombreciudad) as nombre_ciudad
from {{ source('dbt_raw', 'ciudad') }}
