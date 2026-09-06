select
    a.id_aeropuerto,
    a.nombre_aeropuerto,
    a.id_ciudad,
    c.nombre_ciudad as ciudad,
    a.ubicacion
from {{ ref('stg_aeropuerto') }} a
left join {{ ref('stg_ciudad') }} c on c.id_ciudad = a.id_ciudad
