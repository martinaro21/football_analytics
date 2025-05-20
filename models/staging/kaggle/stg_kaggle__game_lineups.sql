with source_lineups as(
    select * from {{source('kaggle','game_lineups')}}
),
casted as (
    select 
        {{ dbt_utils.generate_surrogate_key([
        'game_id',
        'player_id',
        'type',
        'position',
        'number',
        'team_captain'
        ]) }} as game_lineups_id,
        "date"::date as "date",
        game_id::int as game_id,
        player_id::int as player_id,
        club_id::int as club_id,
        player_name::string as player_name,
        "type"::string as "type",
        "position"::string as "position",
        number::int as number,
        team_captain::int as team_captain
    from source_lineups
)
select * from casted