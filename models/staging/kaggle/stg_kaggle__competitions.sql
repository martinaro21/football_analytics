with source_competitions as (
    select * from {{ source('kaggle','competitions') }}
),
casted as (
    select 
        competition_id::integer as competition_id,
        competition_code::string as competition_code,
        competition_code::string as name,
        sub_type::string as sub_type,
        case
            when sub_type = 'first_tier' then 'domestic_league'
            when sub_type = 'domestic_cup' then 'domestic_cup'
            when sub_type in (
                'uefa_champions_league', 'europa_league', 'uefa_europa_conference_league_qualifiers',
                'uefa_champions_league_qualifying', 'europa_league_qualifying', 'uefa_europa_conference_league',
                'uefa_super_cup'
            ) then 'international_cup'
            else 'other'
        end as "type",
        country_id::int as country_id,
        country_name::string as country_name,
        domestic_league_code::string as domestic_league_code,
        confederation::string as confederation,
        url::string as url
 from source_competitions   
)

select 
    *,
    case when competition_id in (
        'ES1', 'GB1', 'IT1', 'FR1', 'L1'
    ) then true
    else false
    end as is_major_national_league
from casted