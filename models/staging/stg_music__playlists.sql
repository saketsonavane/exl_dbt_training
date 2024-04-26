select
    playlistid as playlist_id,
    name as playlist_name
{{ source('music', 'playlist') }}