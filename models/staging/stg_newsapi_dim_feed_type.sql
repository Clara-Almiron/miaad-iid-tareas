select distinct
  feed_type_sk,
  feed_type
from {{ ref('stg_newsapi_raw') }}
