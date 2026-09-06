
select
    idbillete    as id_billete_normal,
    iddescuento  as id_descuento,
    idvuelo      as id_vuelo
from {{ source('dbt_raw', 'aplicaciondescuento_billete') }}
