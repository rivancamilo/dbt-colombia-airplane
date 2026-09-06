with source as (
    select * from {{ source('dbt_raw', 'empleado') }}
),

cleaned as (
    select
        idnumero                                        as id_empleado,
        tipoid                                           as id_tipo_identificacion,
        nullif(trim(primernombre), '')                   as primer_nombre,
        -- El dato fuente usa el string literal 'NULL' en vez de NULL real
        -- en varias filas de segundonombre/primerapellido/segundoapellido;
        -- se corrige aquí (defecto del origen, no de Cliente).
        nullif(trim(nullif(segundonombre, 'NULL')), '')  as segundo_nombre,
        nullif(trim(nullif(primerapellido, 'NULL')), '') as primer_apellido,
        nullif(trim(nullif(segundoapellido, 'NULL')), '') as segundo_apellido,
        genero,
        upper(trim(cargo))                               as cargo,
        ciudadresidencia                                 as id_ciudad_residencia,
        telefonocontacto                                 as telefono_contacto,
        fechavinculacion                                 as fecha_vinculacion
    from source
)

select
    *,
    initcap(array_to_string(
        array(
            select p
            from unnest([primer_nombre, segundo_nombre, primer_apellido, segundo_apellido]) as p
            where p is not null
        ),
        ' '
    )) as nombre_completo,
    cargo = 'TRIPULANTE' as es_tripulante,
    date_diff(current_date(), fecha_vinculacion, day) as antiguedad_dias
from cleaned
