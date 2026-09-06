
select
    e.id_empleado,
    e.nombre_completo,
    e.primer_nombre,
    e.segundo_nombre,
    e.primer_apellido,
    e.segundo_apellido,
    e.genero,
    e.cargo,
    e.es_tripulante,
    e.fecha_vinculacion,
    e.antiguedad_dias,
    e.id_ciudad_residencia,
    ciu.nombre_ciudad             as ciudad_residencia,
    ti.nombre_tipo_identificacion as tipo_identificacion,
    e.telefono_contacto
from {{ ref('stg_empleado') }} e
left join {{ ref('stg_ciudad') }} ciu on ciu.id_ciudad = e.id_ciudad_residencia
left join {{ ref('stg_tipoidentificacion') }} ti on ti.id_tipo_identificacion = e.id_tipo_identificacion
