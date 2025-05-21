with source as (
    select * from {{ref('stg_kaggle__players')}}
)
select * from source