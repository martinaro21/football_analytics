with source_clubs as (

    select * from {{ source('kaggle','clubs') }}

),
casted as (
    select 
        club_id::number(38,0) as club_id,
        club_code::varchar(16777216) as club_code,
        name::varchar(16777216) as name,
        domestic_competition_id::varchar(16777216) as domestic_competition_id,
        total_market_value::varchar(16777216) as total_market_value,
        squad_size::number(38,0) as squad_size,
        average_age::number(38,1) as average_age,
        foreigners_number::number(38,0) as foreigners_number,
        foreigners_percentage::number(38,1) as foreigners_percentage,
        national_team_players::number(38,0) as national_team_players,
        stadium_name::varchar(16777216) as stadium_name,
        stadium_seats::number(38,0) as stadium_seats,
        net_transfer_record::varchar(16777216) as net_transfer_record,
        coach_name::varchar(16777216) as coach_name,
        last_season::number(38,0) as last_season,
        filename::varchar(16777216) as filename,
        url::varchar(16777216) as url
    from source_clubs
)

select 
    {{ dbt_utils.generate_surrogate_key(['club_id']) }} as club_id,  
    club_code,  
    name,  
    {{ dbt_utils.generate_surrogate_key(['domestic_competition_id']) }} as domestic_competition_id,  
    total_market_value,  
    squad_size,  
    average_age,  
    foreigners_number,  
    foreigners_percentage,  
    national_team_players,  
    stadium_name,  
    stadium_seats,  
    net_transfer_record,  
    coach_name,  
    last_season,  
    filename,  
    url  
from casted