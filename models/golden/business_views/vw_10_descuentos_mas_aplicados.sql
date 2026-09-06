-- Pregunta de negocio: ¿Qué descuentos son los más aplicados y qué valor total representan?
select
    ds.id_descuento,
    ds.nombre_descuento,
    count(*) as cantidad_billetes,
    round(sum(b.valor_descuento), 2) as valor_descuento_total
from {{ ref('fact_billete') }} b
join {{ ref('dim_descuento') }} ds on ds.id_descuento = b.id_descuento
group by 1, 2
order by cantidad_billetes desc
