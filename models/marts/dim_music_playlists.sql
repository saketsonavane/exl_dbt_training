{{
    config(
        materialized='table'
    )
}}

with playlists as (
    select * from {{ ref('stg_music__playlists') }}
),

playlist_tracks as (
    select * from {{ ref('stg_music__playlist_tracks') }}
),

tracks as (
    select * from {{ ref('int_tracks_joined_to_albums_artists_genre_mediatype') }}
),

joined as (
    select
        -- All IDs
        playlists.playlist_id,
        playlist_tracks.track_id,
        tracks.album_id,
        tracks.mediatype_id,
        tracks.genre_id,
        -- Playlist and track information
        playlists.playlist_name,
        tracks.track_name,
        tracks.track_composer,
        tracks.album_title,
        tracks.artist_name,
        tracks.mediatype_name,
        tracks.genre_name,
        tracks.track_length_ms,
        tracks.track_length_seconds,
        tracks.track_length_mins,
        tracks.bytes,
        tracks.unit_price
    from playlists
    left join playlist_tracks
        on playlists.playlist_id = playlist_tracks.playlist_id
    left join tracks
        on playlist_tracks.track_id = tracks.track_id
)

select * from joined