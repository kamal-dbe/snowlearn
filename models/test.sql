select 
*
from {{ source('learn', 'bike') }}
limit 10