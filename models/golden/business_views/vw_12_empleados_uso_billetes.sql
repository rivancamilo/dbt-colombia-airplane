-- Pregunta de negocio: ¿Qué empleados usan más billete especial, y cuáles compran billete normal como particulares (es_para_empleado)?
select
    e.id_empleado,
    e.nombre_completo,
    e.cargo,
    countif(b.tipo_billete = 'ESPECIAL') as billetes_especiales,
    countif(b.tipo_billete = 'NORMAL')   as billetes_normales_como_particular,
    count(*)                              as total_billetes
from {{ ref('fact_billete') }} b
join {{ ref('dim_empleado') }} e on e.id_empleado = b.id_empleado
group by 1, 2, 3
order by total_billetes desc
