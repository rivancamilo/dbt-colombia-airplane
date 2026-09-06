with spine as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2022-01-01' as date)",
        end_date="cast('2024-04-01' as date)"
    ) }}
)

select
    date_day,
    extract(year from date_day)                  as anio,
    extract(quarter from date_day)                as trimestre,
    extract(month from date_day)                  as mes,
    format_date('%B', date_day)                   as nombre_mes,
    extract(day from date_day)                    as dia,
    format_date('%A', date_day)                   as nombre_dia,
    extract(dayofweek from date_day) in (1, 7)     as es_fin_de_semana,
    format_date('%Y-%m', date_day)                as anio_mes
from spine
