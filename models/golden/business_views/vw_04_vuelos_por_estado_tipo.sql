-- Pregunta de negocio: ¿Cómo se distribuyen los vuelos por estado
-- (Finalizado, En Vuelo, Desembarcando, Pendiente) y por tipo
-- (programado/no programado), mes a mes?
select
    fd.anio_mes,
    f.estado,
    tv.nombre_tipo_vuelo,
    count(*) as cantidad_vuelos
from {{ ref('fact_vuelo') }} f
join {{ ref('dim_tipo_vuelo') }} tv on tv.id_tipo_vuelo = f.id_tipo_vuelo
join {{ ref('dim_fecha') }} fd on fd.date_day = f.date_day
group by 1, 2, 3
order by anio_mes, estado, nombre_tipo_vuelo
