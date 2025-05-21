with source as (
    select * from {{ref('dim_games')}}
)
select 
    player_id,  
    current_club_id,  
    current_club_domestic_competition_id as player_club_domestic_competition_id,  
    market_value_in_eur,  
    highest_market_value_in_eur  

from source

