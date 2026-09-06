select
    id_descuento,
    nombre_descuento,
    valor_porcentaje,
    fecha_inicio,
    fecha_fin,
    current_date() between fecha_inicio and fecha_fin as vigente_actualmente
from {{ ref('stg_descuento') }}
