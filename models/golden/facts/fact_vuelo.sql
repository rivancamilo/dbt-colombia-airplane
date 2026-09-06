
with vuelo as (
    select * from {{ ref('stg_vuelo') }}
),

billetes_por_vuelo as (
    select
        id_vuelo,
        count(*) as total_billetes_vendidos
    from {{ ref('fact_billete') }}
    group by id_vuelo
),

avion as (
    select id_avion, capacidad_pasajeros from {{ ref('dim_avion') }}
)

select
    v.id_vuelo,
    v.fecha_realizacion as date_day,
    v.hora_realizacion,
    v.hora_realizacion_time,
    v.estado,
    v.id_aeropuerto_origen,
    v.id_aeropuerto_destino,
    v.id_avion,
    a.capacidad_pasajeros,
    v.id_tipo_vuelo,
    v.comentarios,
    coalesce(b.total_billetes_vendidos, 0) as total_billetes_vendidos,
    safe_divide(coalesce(b.total_billetes_vendidos, 0), a.capacidad_pasajeros) as factor_ocupacion
from vuelo v
left join billetes_por_vuelo b on b.id_vuelo = v.id_vuelo
left join avion a on a.id_avion = v.id_avion
