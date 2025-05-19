with source_appearances as (

    select * from {{ source('kaggle','appearances') }}

),
appearances_cte as (
    select
        (game_id || '_' || player_id) as appearance_id,
        game_id::integer as game_id,
        player_id::integer as player_id,
        player_club_id::integer as player_club_id,
        player_current_club_id::string as player_current_club_id,
        "date"::date as "date",
        player_name::string as player_name,
        competition_id::string as competition_id,
        yellow_cards::integer as yellow_cards,
        red_cards::integer as red_cards,
        goals::integer as goals,
        assists::integer as assists,
        minutes_played::integer as minutes_played
    from source_appearances
),
games_cte as (

    select * from {{ source('kaggle','games') }}

),
players_cte as (

    select * from {{ source('kaggle','players') }}

)

select
    {{ dbt_utils.generate_surrogate_key(['ac.appearance_id']) }} as appearance_id,
    ac.game_id,
    ac.player_id,
    ac.player_club_id,
    coalesce(pc.current_club_id, -1) as player_current_club_id,
    gc.date,
    pc.name as player_name,
    ac.competition_id,
    ac.yellow_cards,
    ac.red_cards,
    ac.goals,
    ac.assists,
    ac.minutes_played
    
from appearances_cte ac
left join games_cte gc using(game_id)
left join players_cte pc using(player_id)

order by gc."date", ac.appearance_id 