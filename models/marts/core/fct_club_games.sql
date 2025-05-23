with game_source as (
    select * from {{ref('dim_games')}}
),

unioned as (

    select
        game_id,
        home_club_id as club_id,
        home_club_goals as own_goals,
        home_club_position as own_position,
        home_club_manager_name as own_manager_name,
        away_club_id as opponent_id,
        away_club_goals as opponent_goals,
        away_club_position as opponent_position,
        away_club_manager_name as opponent_manager_name,
        'Home' as hosting

    from game_source

    union all

    select
        game_id,
        away_club_id as club_id,
        away_club_goals as own_goals,
        away_club_position as own_position,
        away_club_manager_name as own_manager_name,
        home_club_id as opponent_id,
        home_club_goals as opponent_goals,
        home_club_position as opponent_position,
        home_club_manager_name as opponent_manager_name,
        'Away' as hosting

    from game_source

)

select
    *,
    case
        when own_goals > opponent_goals then 1
        when opponent_goals > own_goals then 0
        else 0
    end as is_win -- 1 es que si 0 es que no
from unioned