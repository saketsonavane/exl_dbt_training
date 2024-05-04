{{
    config(
        materialized='table'
    )
}}

with tracks as (
    select * from {{ ref('int_tracks_joined_to_albums_artists_genre_mediatype') }}
),

dim_tracks as (
    select 
        track_id,
        album_id,
        mediatype_id,
        genre_id,
        track_name,
        track_composer,
        album_title,
        artist_name,
        mediatype_name,
        genre_name,
        track_length_ms,
        track_length_seconds,
        track_length_mins,
        bytes,
        unit_price
    from tracks
)

select * from dim_tracks