with source as (
    select * from {{ref('stg_kaggle__transfers')}}
),
player_source as (
    select player_id as player_id_ps from {{ref('dim_players')}}
)
select s.* 
from source s
    left join player_source ps 
        on s.player_id=ps.player_id_ps