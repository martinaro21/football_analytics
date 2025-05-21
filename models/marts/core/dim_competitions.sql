with source as (
    select * from {{ref('stg_kaggle__competitions')}}
)
select * from source