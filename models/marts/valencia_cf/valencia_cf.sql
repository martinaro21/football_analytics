with source_player as (
    select * from {{ref('dim_players')}}
),
source_club as (
    select * from {{ref('dim_clubs')}}
),
source_appearances as (
    select * from {{ref('fct_appearance')}}
)