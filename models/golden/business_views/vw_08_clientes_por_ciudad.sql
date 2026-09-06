-- Pregunta de negocio: ¿Qué ciudades de residencia concentran más clientes?
select
    ciudad_residencia,
    count(*) as cantidad_clientes
from {{ ref('dim_cliente') }}
group by ciudad_residencia
order by cantidad_clientes desc
