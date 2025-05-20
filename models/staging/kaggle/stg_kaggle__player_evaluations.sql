with source_player_evaluations as (
    select * from {{source('kaggle','player_valuations')}}
)

select * from source_player_evaluations