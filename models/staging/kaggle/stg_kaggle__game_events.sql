with source_game_events as(
    select * from {{ source('kaggle','game_events') }}
),

casted as(
    select
        game_event_id::varchar(16777216) as game_event_id,
        date::date as date,
        game_id::number(38,0) as game_id,
        minute::number(38,0) as minute,
        type::varchar(16777216) as type,
        club_id::number(38,0) as club_id,
        player_id::number(38,0) as player_id,
        description::varchar(16777216) as description,
        player_in_id::number(38,0) as player_in_id,
        player_assist_id::number(38,0) as player_assist_id

    from source_game_events
)

select 
    {{ dbt_utils.generate_surrogate_key(['game_event_id']) }} as game_event_id,
    date,
    {{ dbt_utils.generate_surrogate_key(['game_id']) }} as game_id,
    minute,
    type,
    {{ dbt_utils.generate_surrogate_key(['club_id']) }} as club_id,
    {{ dbt_utils.generate_surrogate_key(['player_id']) }} as player_id,
    description,
    {{ dbt_utils.generate_surrogate_key(['player_in_id']) }} as player_in_id,
    {{ dbt_utils.generate_surrogate_key(['player_assist_id']) }} as player_assist_id

from casted