select distinct
  weather_condition_sk,
  weather_api_id,
  weather_group,
  weather_description,
  weather_icon
from {{ ref('stg_weather_forecast_raw') }}
