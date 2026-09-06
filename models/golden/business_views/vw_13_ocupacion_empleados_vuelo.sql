-- Pregunta de negocio: para cada vuelo, ¿cuántos empleados van como tripulantes vs. no tripulantes, y se respeta la regla de máximo 10 empleados por vuelo (máx. 5 tripulantes)?
select
    v.id_vuelo,
    v.date_day,
    countif(not e.es_tripulante) as num_empleados_no_tripulantes,
    countif(e.es_tripulante)     as num_empleados_tripulantes,
    count(*)                     as num_empleados_total,
    countif(e.es_tripulante) <= 5 and count(*) <= 10 as regla_cumplida
from {{ ref('fact_billete') }} b
join {{ ref('fact_vuelo') }} v on v.id_vuelo = b.id_vuelo
join {{ ref('dim_empleado') }} e on e.id_empleado = b.id_empleado
where b.tipo_billete = 'ESPECIAL'
group by 1, 2
order by num_empleados_total desc
