select
    mediatypeid as mediatype_id,
    mediatypename as mediatype_name
from {{ source('music', 'mediatype') }}