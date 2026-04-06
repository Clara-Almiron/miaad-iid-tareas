select distinct
  author_sk,
  author_name
from {{ ref('stg_newsapi_raw') }}
