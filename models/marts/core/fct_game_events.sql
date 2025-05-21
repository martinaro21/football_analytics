with source as (
    select * from {{ref('stg_kaggle__game_events')}}
),
game_source as (
    select game_id as game_id_gs from {{ref('dim_games')}}
)
select s.* 
from source s 
    left join game_source gs
        on gs.game_id_gs=s.game_id