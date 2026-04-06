select distinct
  source_sk,
  source_api_id,
  source_name
from {{ ref('stg_newsapi_raw') }}
