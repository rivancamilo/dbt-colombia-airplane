-- Pregunta de negocio: ¿Cuál es el valor promedio de billete por ruta?
select
    o.ciudad as ciudad_origen,
    d.ciudad as ciudad_destino,
    round(avg(b.valor_final), 2) as valor_promedio,
    count(*) as cantidad_billetes
from {{ ref('fact_billete') }} b
join {{ ref('fact_vuelo') }} v on v.id_vuelo = b.id_vuelo
join {{ ref('dim_aeropuerto') }} o on o.id_aeropuerto = v.id_aeropuerto_origen
join {{ ref('dim_aeropuerto') }} d on d.id_aeropuerto = v.id_aeropuerto_destino
where b.tipo_billete = 'NORMAL'
group by 1, 2
order by valor_promedio desc
