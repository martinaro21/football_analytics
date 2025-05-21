with source_competitions as (
    select * from {{ source('kaggle','competitions') }}
),
casted as (
    select 
        competition_id::varchar(16777216) AS competition_id,
        competition_code::varchar(16777216) AS competition_code,
        name::varchar(16777216) AS name,
        sub_type::varchar(16777216) AS sub_type,
        type::varchar(16777216) AS type,
        country_id::number(38,0) AS country_id,
        country_name::varchar(16777216) AS country_name,
        domestic_league_code::varchar(16777216) AS domestic_league_code,
        confederation::varchar(16777216) AS confederation,
        url::varchar(16777216) AS url,
        is_major_national_league::boolean AS is_major_national_league
 from source_competitions   
)

select 
    {{ dbt_utils.generate_surrogate_key(['competition_id']) }} as competition_id,  
    competition_code,  
    name,  
    sub_type,  
    type,  
    {{ dbt_utils.generate_surrogate_key(['country_id']) }} as country_id,  
    country_name,  
    domestic_league_code,  
    confederation,  
    url,  
    is_major_national_league  

from casted