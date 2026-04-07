with enriched_articles as (
    select * from {{ ref('int_newsapi_articles_enriched') }}
)

select
  article_event_sk,
  article_sk,
  title,
  url,
  source_name,
  author_name,
  published_at,
  published_date,
  day_of_week,
  case
    when published_hour between 6 and 11 then 'morning'
    when published_hour between 12 and 17 then 'afternoon'
    when published_hour between 18 and 22 then 'evening'
    else 'night'
  end as publication_period,
  article_count,
  airbyte_extracted_at
from enriched_articles
