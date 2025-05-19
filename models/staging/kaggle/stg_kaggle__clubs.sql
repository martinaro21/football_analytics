with clubs_cte as (

    select * from {{ source('kaggle','clubs') }}

),
casted as (
    club_id::string as club_id,
    club_code::string as club_code,
    name::string as name,
    domestic_competition_id::string as domestic_competition_id,
    total_market_value::float as total_market_value, -- Es todo null
    squad_size::integer as squad_size,
    average_age::float as average_age,
    foreigners_number::integer as foreigners_number,
    foreigners_percentage::float as foreigners_percentage,
    national_team_players::integer as national_team_players,
    stadium_name::string as stadium_name,
    stadium_seats::integer as stadium_seats,
    net_transfer_record::string as net_transfer_record,
    coach_name::string as coach_name, -- Son todos los valores null
    last_season::string as last_season,
    filename::varchar(150) as filename,
    url::varchar(150) as url
)

select 
    {{generate_surrogate_key(['club_id'])}} as club_id,
    club_id,
    club_code,
    name,
    domestic_competition_id,
    total_market_value, -- Es todo null
    squad_size,
    average_age,
    foreigners_number,
    foreigners_percentage,
    national_team_players,
    stadium_name,
    stadium_seats,
    net_transfer_record,
    coach_name, -- Son todos los valores null
    last_season
from renamed