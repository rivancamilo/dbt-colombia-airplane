select
    iddescuento             as id_descuento,
    trim(nombredescuento)   as nombre_descuento,
    valor                   as valor_porcentaje,
    fechainicio             as fecha_inicio,
    fechafin                as fecha_fin
from {{ source('dbt_raw', 'descuento') }}
