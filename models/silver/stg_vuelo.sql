select
    idvuelo                                as id_vuelo,
    fecharealizacion                       as fecha_realizacion,
    -- El dato fuente usa el string 'NULL' (en vez de NULL real) para los
    -- vuelos "Pendiente" sin hora asignada todavía.
    nullif(horarealizacion, 'NULL')        as hora_realizacion,
    safe.parse_time('%H:%M', nullif(horarealizacion, 'NULL')) as hora_realizacion_time,
    trim(estado)                           as estado,
    idaeroorigen                           as id_aeropuerto_origen,
    idaerodestino                          as id_aeropuerto_destino,
    nullif(trim(comentarios), 'N/A')       as comentarios,
    avionid                                as id_avion,
    tipovueloid                            as id_tipo_vuelo
from {{ source('dbt_raw', 'vuelo') }}
