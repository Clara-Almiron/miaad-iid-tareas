# Seguimiento clase 5

Proyecto evaluado: `mi_proyecto_dbt`

## Estado general

Avance actual: 6 de 6 puntos del entregable completos.
Segun la clase 5, el objetivo es construir un proyecto dbt con las 3 capas `staging -> intermediate -> marts`, usar `source()` y `ref()`, y generar el DAG con `dbt docs`.

## Checklist del entregable

- [x] Proyecto dbt inicializado y configurado
  Evidencia: `mi_proyecto_dbt/dbt_project.yml`, repositorio Git inicializado y ejecucion exitosa de `dbt run`.

- [x] Al menos 2 modelos staging, uno por cada source
  Evidencia:
  `models/staging/stg_weather_forecast_raw.sql`
  `models/staging/stg_newsapi_raw.sql`
  Observacion: el proyecto incluso supera el minimo, porque ya tiene varios modelos staging derivados por cada source.

- [x] Al menos 1 modelo intermediate
  Evidencia:
  `models/intermediate/int_newsapi_articles_enriched.sql`
  `models/intermediate/schema.yml`

- [x] Al menos 1 modelo mart (dimensional u OBT)
  Evidencia:
  `models/marts/obt_newsapi_articles.sql`
  `models/marts/schema.yml`

- [x] Archivo `_sources.yml` configurado
  Evidencia: `models/staging/_sources.yml` define los sources `weather.weather` y `newsapi.everything`.

- [x] Captura del DAG generado por dbt docs
  Evidencia:
  `docs/Captura_DAG_generado_newsapi.PNG`
  `docs/Captura_DAG_generado_weather.png`

## Trabajo realizado

- Se inicializo y configuro el proyecto dbt.
- Se implemento staging para `weather`.
- Se implemento staging para `newsapi`.
- Se ajusto el modelo estrella de `newsapi` para alinearlo con `newsapi.everything`.
- Se ejecuto `dbt run` con exito para los modelos staging.
- Se separaron los sources en `models/staging/_sources.yml`.
- Se implemento el modelo intermediate `int_newsapi_articles_enriched`.
- Se implemento el mart final `obt_newsapi_articles`.
- Se generaron y guardaron capturas del DAG en `docs/`.
- Se ejecuto `dbt build` con resultado exitoso: `PASS=68`, `WARN=0`, `ERROR=0`, `SKIP=0`.
- El repositorio Git esta limpio y con cambios confirmados.
- Ya existen artefactos de documentacion en `target/`, lo que indica que dbt genero metadatos del proyecto.

## Comandos sugeridos

```bash
source /home/clara/dbt_duckdb/motherduck_env.sh
source /home/clara/dbt_duckdb/dbt-env/bin/activate
cd /home/clara/dbt_duckdb/mi_proyecto_dbt
dbt run
dbt test
dbt docs generate
dbt docs serve
```

## Nota

El seguimiento se construyo a partir de `docs/Entregable_clase5.txt`, del PDF `docs/clase5.pdf` y del estado actual del repositorio. La clase remarca como estructura esperada: `models/staging`, `models/intermediate`, `models/marts`, un archivo `_sources.yml`, y al menos un modelo en cada capa transformacional.
