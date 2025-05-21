with source as (
    select * from {{ref('stg_kaggle__games')}}
)
select * from source