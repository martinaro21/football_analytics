with source as (
    select * from {{ref('stg_kaggle__appearances')}}
)

select * from source