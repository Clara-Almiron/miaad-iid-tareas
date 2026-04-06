select distinct
  article_sk,
  url,
  title,
  airbyte_raw_id
from {{ ref('stg_newsapi_raw') }}
