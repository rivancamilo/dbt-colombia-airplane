with source as (
    select * from {{ source('dbt_raw', 'cliente') }}
),

cleaned as (
    select
        idnumero                          as id_cliente,
        tipoid                            as id_tipo_identificacion,
        nullif(trim(primernombre), '')    as primer_nombre,
        nullif(trim(segundonombre), '')   as segundo_nombre,
        nullif(trim(primerapellido), '')  as primer_apellido,
        nullif(trim(segundoapellido), '') as segundo_apellido,
        genero,
        fecharegistro                     as fecha_registro,
        ciudadresidencia                  as id_ciudad_residencia,
        telefonocontacto                  as telefono_contacto,
        lower(trim(email))                as email
    from source
)

select
    *,
    -- Reconstruye el nombre completo a partir de las 4 columnas ya
    -- separadas por Colombia Airplane, saltando las que son NULL.
    initcap(array_to_string(
        array(
            select p
            from unnest([primer_nombre, segundo_nombre, primer_apellido, segundo_apellido]) as p
            where p is not null
        ),
        ' '
    )) as nombre_completo
from cleaned
