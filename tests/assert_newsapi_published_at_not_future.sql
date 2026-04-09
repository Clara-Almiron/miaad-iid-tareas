select
  article_event_sk,
  published_at
from {{ ref('obt_newsapi_articles') }}
where published_at > current_timestamp
