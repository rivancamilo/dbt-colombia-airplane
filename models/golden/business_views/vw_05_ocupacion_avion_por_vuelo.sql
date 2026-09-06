-- Pregunta de negocio: ¿Cuál es la ocupación de cada avión por vuelo
-- (billetes vendidos vs. capacidad de pasajeros)?
select
    f.id_vuelo,
    f.date_day,
    a.nombre_avion,
    a.capacidad_pasajeros,
    f.total_billetes_vendidos,
    f.factor_ocupacion
from {{ ref('fact_vuelo') }} f
join {{ ref('dim_avion') }} a on a.id_avion = f.id_avion
order by f.factor_ocupacion desc
