select
    idavion               as id_avion,
    capacidadpasajeros    as capacidad_pasajeros,
    trim(nombre_avion)    as nombre_avion
from {{ source('dbt_raw', 'avion') }}
