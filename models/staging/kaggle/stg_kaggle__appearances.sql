with source as (
    select * from {{source('kaggle','appearances')}}
)

select * from source