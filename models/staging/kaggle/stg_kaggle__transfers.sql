with source_transfer as(
    select * from {{source('kaggle','transfers')}}
)
select * from source_transfer