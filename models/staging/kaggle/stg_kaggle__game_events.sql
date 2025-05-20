with source_game_events as(
    select * from {{ source('kaggle','game_events') }}
),

casted as(
    {{ dbt_utils.generate_surrogate_key([
        'game_id',
        'player_id',
        'club_id',
        'type',
        'minute',
        'description',
        'player_in_id',
        'player_assist_id'
    ]) }} as game_event_id,
    "date"::date as "date",
    game_id::int as game_id,
    "minute"::int as "minute",
    "type"::string as "type",
    club_id::string as club_id,
    player_id::string as player_id,
    description::string as description,
    player_in_id::int as player_in_id,
    player_assist_id::int as player_assist_id
)

select * from casted