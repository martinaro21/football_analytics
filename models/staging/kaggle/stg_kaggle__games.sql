with game_source as (
    select * from {{source('kaggle','games')}}
),
casted as (
    select 
        game_id::number(38,0) AS game_id,
        competition_id::varchar(16777216) AS competition_id,
        season::number(38,0) AS season,
        round::varchar(16777216) AS round,
        date::date AS date,
        home_club_id::number(38,0) AS home_club_id,
        away_club_id::number(38,0) AS away_club_id,
        home_club_goals::number(38,0) AS home_club_goals,
        away_club_goals::number(38,0) AS away_club_goals,
        home_club_position::number(38,0) AS home_club_position,
        away_club_position::number(38,0) AS away_club_position,
        home_club_manager_name::varchar(16777216) AS home_club_manager_name,
        away_club_manager_name::varchar(16777216) AS away_club_manager_name,
        stadium::varchar(16777216) AS stadium,
        attendance::number(38,0) AS attendance,
        referee::varchar(16777216) AS referee,
        url::varchar(16777216) AS url,
        home_club_formation::varchar(16777216) AS home_club_formation,
        away_club_formation::varchar(16777216) AS away_club_formation,
        home_club_name::varchar(16777216) AS home_club_name,
        away_club_name::varchar(16777216) AS away_club_name,
        aggregate::time(9) AS aggregate,
        competition_type::varchar(16777216) AS competition_type
    from game_source

)
select 
    {{ dbt_utils.generate_surrogate_key(['game_id']) }} as game_id,  
    {{ dbt_utils.generate_surrogate_key(['competition_id']) }} as competition_id,  
    season,  
    round,  
    date,  
    {{ dbt_utils.generate_surrogate_key(['home_club_id']) }} as home_club_id,  
    {{ dbt_utils.generate_surrogate_key(['away_club_id']) }} as away_club_id,  
    home_club_goals,  
    away_club_goals,  
    home_club_position , 
    away_club_position,  
    home_club_manager_name , 
    away_club_manager_name,  
    stadium,  
    attendance,  
    referee,  
    url,  
    home_club_formation,  
    away_club_formation,  
    home_club_name,  
    away_club_name,  
    aggregate,  
    competition_type  

from casted