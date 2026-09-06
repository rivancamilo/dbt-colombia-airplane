-- Pregunta de negocio: ¿Cuáles son las rutas (aeropuerto origen -> destino) con más vuelos?
select
    o.nombre_aeropuerto as aeropuerto_origen,
    o.ciudad             as ciudad_origen,
    d.nombre_aeropuerto  as aeropuerto_destino,
    d.ciudad             as ciudad_destino,
    count(*)             as cantidad_vuelos
from {{ ref('fact_vuelo') }} f
join {{ ref('dim_aeropuerto') }} o on o.id_aeropuerto = f.id_aeropuerto_origen
join {{ ref('dim_aeropuerto') }} d on d.id_aeropuerto = f.id_aeropuerto_destino
group by 1, 2, 3, 4
order by cantidad_vuelos desc
