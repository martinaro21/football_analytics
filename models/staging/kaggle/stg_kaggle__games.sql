with game_source as (
    select * from {{source('kaggle','games')}}
)
select * from game_source