-- Pregunta de negocio: ¿Qué aviones han operado más vuelos en un periodo dado (ej. último mes)?

with limites as (
    select
        max(date_day) as fecha_max,
        date_sub(max(date_day), interval {{ var('dias_periodo') }} day) as fecha_min
    from {{ ref('fact_vuelo') }}
)

select
    a.id_avion,
    a.nombre_avion,
    count(*) as cantidad_vuelos
from {{ ref('fact_vuelo') }} f
join {{ ref('dim_avion') }} a on a.id_avion = f.id_avion
cross join limites l
where f.date_day between l.fecha_min and l.fecha_max
group by a.id_avion, a.nombre_avion
order by cantidad_vuelos desc
