with source as (
    select * from {{ref('stg_kaggle__clubs')}}
)

select * from source