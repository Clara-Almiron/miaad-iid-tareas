select distinct
  datetime_id,
  forecast_datetime,
  forecast_date,
  forecast_hour,
  day_name,
  month_number,
  month_name,
  year,
  dt_txt
from {{ ref('stg_weather_forecast_raw') }}
