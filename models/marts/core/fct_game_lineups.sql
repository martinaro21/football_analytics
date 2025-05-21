with source as (
    select * from {{ref('stg_kaggle__game_lineups')}}
),
game_source as (
    select game_id as game_id_gs from {{ref('dim_games')}}
),
player_source as (
    select player_id as player_id_ps from {{ref('dim_players')}}
)

select s.* 
from source s 
    left join game_source gs 
        on gs.game_id_gs=s.game_id
    left join player_source ps 
        on ps.player_id_ps=s.player_id