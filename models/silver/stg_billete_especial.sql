select
    idbillete_esp        as id_billete_especial,
    numeroid              as id_empleado,
    vueloid               as id_vuelo,
    fecha_salida,
    duracion_vuelo,
    ida_y_vuelta = '1'    as ida_y_vuelta,
    fecha_regreso,
    trim(silla)           as silla
from {{ source('dbt_raw', 'billeteespecial') }}
