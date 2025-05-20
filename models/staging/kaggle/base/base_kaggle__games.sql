with source_game as (
    select * from {{source('kaggle','games')}}
),
casted as(
    select 
        game_id::int as game_id,
        competition_id::int as competition_id,
        season::int as season,
        "round"::string as "round",
        "date"::date as "date",
        home_club_id::int as home_club_id,
        away_club_id::int as away_club_id,
        home_club_goals::int as home_club_goals,
        away_club_goals::int as away_club_goals,
        home_club_position::int as home_club_position,
        away_club_position::int as away_club_position,
        home_club_manager_name::string as home_club_manager_name,
        away_club_manager::string as away_club_manager,
        stadium::string as stadium,
        attendance::int as attendance,
        referee::string as referee,
        url::string as url,
        home_club_formation::string as home_club_formation,
        away_club_formation::string as away_club_formation,
        home_club_name::string as home_club_name,
        away_club_name::string as away_club_name,
        aggregate,
        competition_type::string as competition_type
    from source_game
)