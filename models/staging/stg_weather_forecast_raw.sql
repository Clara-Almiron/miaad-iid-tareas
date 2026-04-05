with source_data as (
    select
      dt,
      pop,
      sys,
      main,
      rain,
      wind,
      clouds,
      dt_txt,
      weather,
      visibility,
      _airbyte_raw_id,
      _airbyte_extracted_at,
      _airbyte_meta
    from {{ source('raw', 'weather') }}
),

normalized_data as (
    select
      cast(dt as bigint) as datetime_id,
      cast(dt_txt as timestamp) as forecast_datetime,
      cast(cast(dt_txt as timestamp) as date) as forecast_date,
      extract(hour from cast(dt_txt as timestamp)) as forecast_hour,
      strftime(cast(dt_txt as timestamp), '%A') as day_name,
      extract(month from cast(dt_txt as timestamp)) as month_number,
      strftime(cast(dt_txt as timestamp), '%B') as month_name,
      extract(year from cast(dt_txt as timestamp)) as year,
      dt_txt,
      cast(json_extract_string(weather, '$[0].id') as integer) as weather_api_id,
      json_extract_string(weather, '$[0].main') as weather_group,
      json_extract_string(weather, '$[0].description') as weather_description,
      json_extract_string(weather, '$[0].icon') as weather_icon,
      json_extract_string(sys, '$.pod') as pod_code,
      case json_extract_string(sys, '$.pod')
        when 'd' then 'day'
        when 'n' then 'night'
        else 'unknown'
      end as pod_description,
      cast(pop as double) as pop,
      cast(visibility as integer) as visibility_m,
      try_cast(json_extract_string(main, '$.temp') as double) as temp_c,
      try_cast(json_extract_string(main, '$.feels_like') as double) as feels_like_c,
      try_cast(json_extract_string(main, '$.temp_min') as double) as temp_min_c,
      try_cast(json_extract_string(main, '$.temp_max') as double) as temp_max_c,
      try_cast(json_extract_string(main, '$.temp_kf') as double) as temp_kf,
      try_cast(json_extract_string(main, '$.pressure') as integer) as pressure_hpa,
      try_cast(json_extract_string(main, '$.sea_level') as integer) as sea_level_hpa,
      try_cast(json_extract_string(main, '$.grnd_level') as integer) as ground_level_hpa,
      try_cast(json_extract_string(main, '$.humidity') as integer) as humidity_pct,
      try_cast(json_extract_string(wind, '$.speed') as double) as wind_speed_ms,
      try_cast(json_extract_string(wind, '$.deg') as integer) as wind_deg,
      try_cast(json_extract_string(wind, '$.gust') as double) as wind_gust_ms,
      try_cast(json_extract_string(clouds, '$.all') as integer) as cloudiness_pct,
      coalesce(try_cast(json_extract_string(rain, '$.\"3h\"') as double), 0) as rain_3h_mm,
      _airbyte_raw_id,
      _airbyte_extracted_at as airbyte_extracted_at,
      _airbyte_meta
    from source_data
)

select
  cast(hash(_airbyte_raw_id) as ubigint) as forecast_id,
  datetime_id,
  forecast_datetime,
  forecast_date,
  forecast_hour,
  day_name,
  month_number,
  month_name,
  year,
  dt_txt,
  weather_api_id,
  weather_group,
  weather_description,
  weather_icon,
  cast(
    hash(
      weather_api_id,
      weather_group,
      weather_description,
      weather_icon
    ) as ubigint
  ) as weather_condition_sk,
  pod_code,
  pod_description,
  pop,
  visibility_m,
  temp_c,
  feels_like_c,
  temp_min_c,
  temp_max_c,
  temp_kf,
  pressure_hpa,
  sea_level_hpa,
  ground_level_hpa,
  humidity_pct,
  wind_speed_ms,
  wind_deg,
  wind_gust_ms,
  cloudiness_pct,
  rain_3h_mm,
  _airbyte_raw_id,
  airbyte_extracted_at,
  _airbyte_meta
from normalized_data
