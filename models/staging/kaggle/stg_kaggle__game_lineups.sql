with source_lineups as(
    select * from {{source('kaggle','game_lineups')}}
),
casted as (
    select 
        game_lineups_id::varchar(16777216) as game_lineups_id,
        date::date as date,
        game_id::number(38,0) as game_id,
        player_id::number(38,0) as player_id,
        club_id::number(38,0) as club_id,
        player_name::varchar(16777216) as player_name,
        type::varchar(16777216) as type,
        position::varchar(16777216) as position,
        number::varchar(16777216) as number,
        team_captain::number(38,0) as team_captain

    from source_lineups
)
select  
    {{ dbt_utils.generate_surrogate_key(['game_lineups_id']) }} as game_lineups_id,
    date,
    {{ dbt_utils.generate_surrogate_key(['game_id']) }} as game_id,
    {{ dbt_utils.generate_surrogate_key(['player_id']) }} as player_id,
    {{ dbt_utils.generate_surrogate_key(['club_id']) }} as club_id,
    player_name,
    type,
    position,
    number,
    team_captain

from casted