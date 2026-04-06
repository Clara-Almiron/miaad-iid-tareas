select distinct
  published_datetime_sk,
  published_at,
  published_date,
  published_year,
  published_month,
  published_day,
  published_hour,
  day_of_week
from {{ ref('stg_newsapi_raw') }}
