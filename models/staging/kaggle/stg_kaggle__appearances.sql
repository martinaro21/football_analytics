{{ config(
    materialized='incremental'
    ) 
    }}

with source_appearances as (

    select * from {{ source('kaggle','appearances') }}

),
casted as (
    select
        appearance_id::varchar(16777216) as appearance_id,
        game_id::number(38,0) as game_id,
        player_id::number(38,0) as player_id,
        player_club_id::number(38,0) as player_club_id,
        player_current_club_id::number(38,0) as player_current_club_id,
        date::date as date,
        player_name::varchar(16777216) as player_name,
        competition_id::varchar(16777216) as competition_id,
        yellow_cards::number(38,0) as yellow_cards,
        red_cards::number(38,0) as red_cards,
        goals::number(38,0) as goals,
        assists::number(38,0) as assists,
        minutes_played::number(38,0) as minutes_played,
        date_ingest::date as date_ingest

    from source_appearances
)

select
    {{ dbt_utils.generate_surrogate_key(['appearance_id']) }} as appearance_id,
    {{ dbt_utils.generate_surrogate_key(['game_id']) }} as game_id,
    {{ dbt_utils.generate_surrogate_key(['player_id']) }} as player_id,
    {{ dbt_utils.generate_surrogate_key(['player_club_id']) }} as player_club_id,
    {{ dbt_utils.generate_surrogate_key(['player_current_club_id']) }} as player_current_club_id,
    date,
    player_name,
    {{ dbt_utils.generate_surrogate_key(['competition_id']) }} as competition_id,
    yellow_cards,
    red_cards,
    goals,
    assists,
    minutes_played,
    date_ingest
    
from casted

{% if is_incremental() %}

  where date_ingest >= (select max(date_ingest) from {{ this }})

{% endif %}