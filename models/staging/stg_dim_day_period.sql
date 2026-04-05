select distinct
  pod_code,
  pod_description
from {{ ref('stg_weather_forecast_raw') }}
