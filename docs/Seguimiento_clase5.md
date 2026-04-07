# Seguimiento clase 5

Proyecto evaluado: `mi_proyecto_dbt`

## Estado general

Avance actual: 4 de 6 puntos del entregable completos o resueltos de forma funcional.
Segun la clase 5, el objetivo es construir un proyecto dbt con las 3 capas `staging -> intermediate -> marts`, usar `source()` y `ref()`, y generar el DAG con `dbt docs`.

## Checklist del entregable

- [x] Proyecto dbt inicializado y configurado
  Evidencia: `mi_proyecto_dbt/dbt_project.yml`, repositorio Git inicializado y ejecucion exitosa de `dbt run`.

- [x] Al menos 2 modelos staging, uno por cada source
  Evidencia:
  `models/staging/stg_weather_forecast_raw.sql`
  `models/staging/stg_newsapi_raw.sql`
  Observacion: el proyecto incluso supera el minimo, porque ya tiene varios modelos staging derivados por cada source.

- [ ] Al menos 1 modelo intermediate
  Estado: pendiente.
  Observacion: existe `models/intermediate/`, pero no contiene modelos.

- [ ] Al menos 1 modelo mart (dimensional u OBT)
  Estado: pendiente.
  Observacion: existe `models/marts/`, pero no contiene modelos.

- [x] Archivo `_sources.yml` configurado
  Estado: resuelto funcionalmente, pero no con el nombre literal pedido.
  Evidencia: `models/staging/schema.yml` define los sources `weather.weather` y `newsapi.everything`.
  Ajuste recomendado: separar esos `sources` a `models/staging/_sources.yml`, ya que la clase muestra esa convencion de forma explicita.

- [ ] Captura del DAG generado por dbt docs
  Estado: pendiente.
  Observacion: existen artefactos de dbt en `target/`, pero no hay captura en `docs/`.

## Trabajo realizado

- Se inicializo y configuro el proyecto dbt.
- Se implemento staging para `weather`.
- Se implemento staging para `newsapi`.
- Se ajusto el modelo estrella de `newsapi` para alinearlo con `newsapi.everything`.
- Se ejecuto `dbt run` con exito para los modelos staging.
- El repositorio Git esta limpio y con cambios confirmados.
- Ya existen artefactos de documentacion en `target/`, lo que indica que dbt genero metadatos del proyecto.

## Pendientes prioritarios

1. Crear al menos un modelo `intermediate`.
2. Crear al menos un modelo `mart`.
3. Mover la definicion de `sources` a un archivo `_sources.yml`.
4. Generar `dbt docs`, abrir el DAG y guardar una captura en `docs/`.

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
