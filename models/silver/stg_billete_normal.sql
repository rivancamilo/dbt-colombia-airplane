select
    idbillete             as id_billete_normal,
    valorimpuesto         as valor_impuesto,
    idcliente              as id_cliente,
    idempleado             as id_empleado,
    esparaempleado = '1'   as es_para_empleado,
    idvuelo                as id_vuelo,
    fecha_salida,
    duracion_vuelo,
    ida_y_vuelta = '1'     as ida_y_vuelta,
    fecha_regreso,
    trim(silla)            as silla
from {{ source('dbt_raw', 'billetenormal') }}
