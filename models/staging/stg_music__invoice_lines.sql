select
    invoicelineid sd invoice_lineid,
    invoiceid as invoice_id,
    trackid as track_id,
    unitprice as invoice_lineitem_revenue_usd,
    quantity as quatity_purchased
from {{ source('music', 'invoiceline') }}