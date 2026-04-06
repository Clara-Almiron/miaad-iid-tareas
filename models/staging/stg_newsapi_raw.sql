with source_data as (
    select
      source,
      author,
      title,
      url,
      "publishedAt" as published_at_raw,
      feed_type,
      _airbyte_raw_id,
      _airbyte_extracted_at,
      _airbyte_meta
    from {{ source('raw_news', 'newsapi') }}
)

select
  cast(hash(coalesce(url, _airbyte_raw_id)) as ubigint) as article_sk,
  cast(
    hash(
      coalesce(json_extract_string(source, '$.id'), '__null__'),
      coalesce(json_extract_string(source, '$.name'), '__null__')
    ) as ubigint
  ) as source_sk,
  cast(hash(coalesce(author, '__unknown__')) as ubigint) as author_sk,
  cast(hash(cast(published_at_raw as timestamp)) as ubigint) as published_datetime_sk,
  cast(hash(coalesce(feed_type, 'top_headlines')) as ubigint) as feed_type_sk,
  cast(hash(_airbyte_raw_id) as ubigint) as article_event_sk,
  url,
  title,
  _airbyte_raw_id as airbyte_raw_id,
  json_extract_string(source, '$.id') as source_api_id,
  json_extract_string(source, '$.name') as source_name,
  author as author_name,
  cast(published_at_raw as timestamp) as published_at,
  cast(cast(published_at_raw as timestamp) as date) as published_date,
  extract(year from cast(published_at_raw as timestamp)) as published_year,
  extract(month from cast(published_at_raw as timestamp)) as published_month,
  extract(day from cast(published_at_raw as timestamp)) as published_day,
  extract(hour from cast(published_at_raw as timestamp)) as published_hour,
  strftime(cast(published_at_raw as timestamp), '%A') as day_of_week,
  coalesce(feed_type, 'top_headlines') as feed_type,
  1 as article_count,
  _airbyte_raw_id,
  _airbyte_extracted_at as airbyte_extracted_at,
  _airbyte_meta
from source_data
