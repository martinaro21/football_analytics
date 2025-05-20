with source_players as (
    select * from {{source('kaggle','players')}}
)
select * from source_players