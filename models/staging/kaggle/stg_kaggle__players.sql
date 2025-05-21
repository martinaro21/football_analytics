with source_players as (
    select * from {{source('kaggle','players')}}
),
casted as (
    select 
        player_id::number(38,0) as player_id,
        first_name::varchar(16777216) as first_name,
        last_name::varchar(16777216) as last_name,
        name::varchar(16777216) as name,
        last_season::number(38,0) as last_season,
        current_club_id::number(38,0) as current_club_id,
        player_code::varchar(16777216) as player_code,
        country_of_birth::varchar(16777216) as country_of_birth,
        city_of_birth::varchar(16777216) as city_of_birth,
        country_of_citizenship::varchar(16777216) as country_of_citizenship,
        date_of_birth::timestamp_ntz(9) as date_of_birth,
        sub_position::varchar(16777216) as sub_position,
        position::varchar(16777216) as position,
        foot::varchar(16777216) as foot,
        height_in_cm::number(38,0) as height_in_cm,
        contract_expiration_date::timestamp_ntz(9) as contract_expiration_date,
        agent_name::varchar(16777216) as agent_name,
        image_url::varchar(16777216) as image_url,
        url::varchar(16777216) as url,
        current_club_domestic_competition_id::varchar(16777216) as current_club_domestic_competition_id,
        current_club_name::varchar(16777216) as current_club_name,
        market_value_in_eur::number(38,0) as market_value_in_eur,
        highest_market_value_in_eur::number(38,0) as highest_market_value_in_eur

    from source_players
)

select 
    {{ dbt_utils.generate_surrogate_key(['player_id']) }} as player_id,
    first_name,
    last_name,
    name,
    last_season,
    {{ dbt_utils.generate_surrogate_key(['current_club_id']) }} as current_club_id,
    player_code,
    country_of_birth,
    city_of_birth,
    country_of_citizenship,
    date_of_birth,
    sub_position,
    position,
    foot,
    height_in_cm,
    contract_expiration_date,
    agent_name,
    image_url,
    url,
    {{ dbt_utils.generate_surrogate_key(['current_club_domestic_competition_id']) }} as current_club_domestic_competition_id,
    current_club_name,
    market_value_in_eur,
    highest_market_value_in_eur

from casted
