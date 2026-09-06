
select
    idaeropuerto             as id_aeropuerto,
    trim(nombreaeropuerto)   as nombre_aeropuerto,
    ciudadid                 as id_ciudad,
    trim(ubicacion)          as ubicacion
from {{ source('dbt_raw', 'aeropuerto') }}

