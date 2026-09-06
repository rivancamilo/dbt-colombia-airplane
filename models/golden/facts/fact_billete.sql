
with especial as (
    select
        concat('ESPECIAL-', cast(id_billete_especial as string)) as id_billete,
        'ESPECIAL'                                                as tipo_billete,
        id_vuelo,
        cast(null as int64)                                       as id_cliente,
        id_empleado,
        true                                                       as es_para_empleado,
        fecha_salida,
        fecha_regreso,
        ida_y_vuelta,
        duracion_vuelo,
        silla,
        -- Regla de negocio: el billete especial de servicio no lleva tarifa.
        cast(null as float64)                                     as valor_impuesto,
        cast(null as int64)                                       as id_descuento,
        cast(null as float64)                                     as valor_descuento
    from {{ ref('stg_billete_especial') }}
),

normal as (
    select
        concat('NORMAL-', cast(b.id_billete_normal as string)) as id_billete,
        'NORMAL'                                                 as tipo_billete,
        b.id_vuelo,
        b.id_cliente,
        b.id_empleado,
        b.es_para_empleado,
        b.fecha_salida,
        b.fecha_regreso,
        b.ida_y_vuelta,
        b.duracion_vuelo,
        b.silla,
        b.valor_impuesto,
        ad.id_descuento,
        round(b.valor_impuesto * (dsc.valor_porcentaje / 100), 2) as valor_descuento
    from {{ ref('stg_billete_normal') }} b
    left join {{ ref('stg_aplicaciondescuento_billete') }} ad on ad.id_billete_normal = b.id_billete_normal
    left join {{ ref('stg_descuento') }} dsc on dsc.id_descuento = ad.id_descuento
),

unido as (
    select * from especial
    union all
    select * from normal
)

select
    *,
    coalesce(valor_impuesto, 0) - coalesce(valor_descuento, 0) as valor_final
from unido
