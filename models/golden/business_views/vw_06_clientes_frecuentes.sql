-- Pregunta de negocio: ¿Quiénes son los clientes más frecuentes (más billetes normales comprados)?
select
    c.id_cliente,
    c.nombre_completo,
    c.ciudad_residencia,
    count(*) as cantidad_billetes
from {{ ref('fact_billete') }} b
join {{ ref('dim_cliente') }} c on c.id_cliente = b.id_cliente
where b.tipo_billete = 'NORMAL' and b.id_cliente is not null
group by 1, 2, 3
order by cantidad_billetes desc
