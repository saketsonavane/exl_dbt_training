select
    customerid as customer_id,
    firstname as first_name,
    lastname as last_name,
    company as work_company,
    address as customer_mailing_address,
    city as customer_mailing_city,
    state as customer_mailing_state,
    country as customer_mailing_country,
    postalcode as customer_mailing_zipcode,
    phone as customer_phone_number,
    fax as customer_fax_number,
    email as customer_email_address,
    supportrepid as representative_employee_id
from {{ source('music', 'customer') }}