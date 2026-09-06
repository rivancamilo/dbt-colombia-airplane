-- Pregunta de negocio: ¿Qué ciudades concentran más tráfico (como origen o destino de vuelos)?
with origen as (
    select f.id_vuelo, o.ciudad
    from {{ ref('fact_vuelo') }} f
    join {{ ref('dim_aeropuerto') }} o on o.id_aeropuerto = f.id_aeropuerto_origen
),

destino as (
    select f.id_vuelo, d.ciudad
    from {{ ref('fact_vuelo') }} f
    join {{ ref('dim_aeropuerto') }} d on d.id_aeropuerto = f.id_aeropuerto_destino
),

trafico as (
    select ciudad from origen
    union all
    select ciudad from destino
)

select
    ciudad,
    count(*) as cantidad_vuelos
from trafico
group by ciudad
order by cantidad_vuelos desc
