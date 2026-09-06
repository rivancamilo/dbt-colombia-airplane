select
    id_avion,
    nombre_avion,
    capacidad_pasajeros
from {{ ref('stg_avion') }}
