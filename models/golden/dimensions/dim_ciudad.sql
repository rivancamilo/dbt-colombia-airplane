select
    id_ciudad,
    nombre_ciudad
from {{ ref('stg_ciudad') }}
