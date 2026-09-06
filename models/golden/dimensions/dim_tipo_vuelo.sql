select
    id_tipo_vuelo,
    nombre_tipo_vuelo
from {{ ref('stg_tipovuelo') }}
