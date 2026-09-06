-- Pregunta de negocio: ¿Qué porcentaje de billetes normales tiene algún descuento aplicado?
select
    countif(id_descuento is not null) as billetes_con_descuento,
    count(*)                           as total_billetes_normales,
    round(safe_divide(countif(id_descuento is not null), count(*)) * 100, 2) as porcentaje_con_descuento
from {{ ref('fact_billete') }}
where tipo_billete = 'NORMAL'
