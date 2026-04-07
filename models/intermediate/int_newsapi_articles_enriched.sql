with articles as (
    select * from {{ ref('stg_newsapi_fct_news_articles') }}
),
dim_article as (
    select * from {{ ref('stg_newsapi_dim_article') }}
),
dim_source as (
    select * from {{ ref('stg_newsapi_dim_source') }}
),
dim_author as (
    select * from {{ ref('stg_newsapi_dim_author') }}
),
dim_published_datetime as (
    select * from {{ ref('stg_newsapi_dim_published_datetime') }}
)

select
  articles.article_event_sk,
  articles.article_sk,
  dim_article.url,
  dim_article.title,
  articles.source_sk,
  dim_source.source_api_id,
  dim_source.source_name,
  articles.author_sk,
  dim_author.author_name,
  articles.published_datetime_sk,
  dim_published_datetime.published_at,
  dim_published_datetime.published_date,
  dim_published_datetime.published_year,
  dim_published_datetime.published_month,
  dim_published_datetime.published_day,
  dim_published_datetime.published_hour,
  dim_published_datetime.day_of_week,
  articles.article_count,
  articles.airbyte_extracted_at
from articles
left join dim_article
  on articles.article_sk = dim_article.article_sk
left join dim_source
  on articles.source_sk = dim_source.source_sk
left join dim_author
  on articles.author_sk = dim_author.author_sk
left join dim_published_datetime
  on articles.published_datetime_sk = dim_published_datetime.published_datetime_sk
