select
    idtipovuelo             as id_tipo_vuelo,
    trim(nombretipovuelo)   as nombre_tipo_vuelo
from {{ source('dbt_raw', 'tipovuelo') }}
