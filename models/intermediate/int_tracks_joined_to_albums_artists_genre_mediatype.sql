with tracks as (
    select * from {{ ref('stg_music__tracks') }}
),

albums as (
    select * from {{ ref('stg_music__album') }}
),

artists as (
    select * from {{ ref('stg_music__artists') }}
),

genres as (
    select * from {{ ref('stg_music__genres') }}
),

mediatypes as (
    select * from {{ ref('stg_music__media_types') }}
),

joined as (
    select
        tracks.track_id,
        tracks.album_id,
        tracks.mediatype_id,
        tracks.genre_id,
        tracks.track_name,
        tracks.track_composer,
        albums.album_title,
        artists.artist_name,
        mediatypes.mediatype_name,
        genres.genre_name,
        tracks.track_length_ms,
        tracks.track_length_seconds,
        tracks.track_length_mins,
        tracks.bytes,
        tracks.unit_price
    from tracks
    left join genres
        on tracks.genre_id = genres.genre_id
    left join mediatypes
        on tracks.mediatype_id = mediatypes.mediatype_id
    left join albums
        on tracks.album_id = albums.album_id
    left join artists
        on albums.artist_id = artists.artist_id
)

select * from joined