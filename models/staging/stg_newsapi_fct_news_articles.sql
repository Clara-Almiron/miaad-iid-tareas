select
  article_event_sk,
  article_sk,
  source_sk,
  author_sk,
  published_datetime_sk,
  article_count,
  airbyte_extracted_at
from {{ ref('stg_newsapi_raw') }}
