with source_transfer as(
    select * from {{source('kaggle','transfers')}}
),
casted as (
    select
        player_id::number(38,0) as player_id,
        transfer_date::date as transfer_date,
        transfer_season::varchar(16777216) as transfer_season,
        from_club_id::number(38,0) as from_club_id,
        to_club_id::number(38,0) as to_club_id,
        from_club_name::varchar(16777216) as from_club_name,
        to_club_name::varchar(16777216) as to_club_name,
        transfer_fee::number(38,3) as transfer_fee,
        market_value_in_eur::number(38,3) as market_value_in_eur,
        player_name::varchar(16777216) as player_name

    from source_transfer
)
select 
    {{ dbt_utils.generate_surrogate_key(['player_id']) }} as player_id,
    transfer_date,
    transfer_season,
    {{ dbt_utils.generate_surrogate_key(['from_club_id']) }} as from_club_id,
    {{ dbt_utils.generate_surrogate_key(['to_club_id']) }} as to_club_id,
    from_club_name,
    to_club_name,
    transfer_fee,
    market_value_in_eur,
    player_name

from source_transfer