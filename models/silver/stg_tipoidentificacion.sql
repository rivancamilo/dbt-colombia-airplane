select
    idtipo         as id_tipo_identificacion,
    trim(nombreid) as nombre_tipo_identificacion
from {{ source('dbt_raw', 'tipoidentificacion') }}
