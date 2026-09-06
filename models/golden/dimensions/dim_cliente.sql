select
    c.id_cliente,
    c.nombre_completo,
    c.primer_nombre,
    c.segundo_nombre,
    c.primer_apellido,
    c.segundo_apellido,
    c.genero,
    c.fecha_registro,
    c.id_ciudad_residencia,
    ciu.nombre_ciudad             as ciudad_residencia,
    ti.nombre_tipo_identificacion as tipo_identificacion,
    c.telefono_contacto,
    c.email
from {{ ref('stg_cliente') }} c
left join {{ ref('stg_ciudad') }} ciu on ciu.id_ciudad = c.id_ciudad_residencia
left join {{ ref('stg_tipoidentificacion') }} ti on ti.id_tipo_identificacion = c.id_tipo_identificacion
