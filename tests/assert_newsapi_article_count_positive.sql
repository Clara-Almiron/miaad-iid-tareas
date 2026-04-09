select
  article_event_sk,
  article_count
from {{ ref('obt_newsapi_articles') }}
where article_count <= 0
