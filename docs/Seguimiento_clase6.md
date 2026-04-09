# Seguimiento clase 6

Proyecto evaluado: `mi_proyecto_dbt`

## Estado general

Avance actual: 5 de 6 puntos del entregable completos y validados con `dbt build`.
Segun la clase 6, el objetivo es agregar testing y documentacion completa al proyecto dbt, incluyendo tests nativos, `dbt-expectations`, singular tests y DAG documentado.

## Checklist del entregable

- [x] `dbt-expectations` instalado (`packages.yml` + `dbt deps`)
  Evidencia:
  `packages.yml`
  `package-lock.yml`
  `dbt_packages/dbt_expectations/`

- [x] Al menos 5 tests genéricos (`unique`, `not_null`, `relationships`, etc.)
  Evidencia: el proyecto ya tiene ampliamente mas de 5 tests genericos definidos en:
  `models/staging/schema.yml`
  `models/intermediate/schema.yml`
  `models/marts/schema.yml`

- [x] Al menos 3 tests de `dbt-expectations`
  Evidencia: hay al menos 5 tests definidos con `dbt_expectations` en:
  `models/staging/schema.yml`
  `models/marts/schema.yml`

- [x] Al menos 2 singular tests personalizados
  Evidencia:
  `tests/assert_newsapi_article_count_positive.sql`
  `tests/assert_newsapi_published_at_not_future.sql`

- [x] Documentación de todos los modelos y columnas clave
  Evidencia: se ampliaron descripciones de modelos y columnas clave en:
  `models/staging/schema.yml`
  `models/intermediate/schema.yml`
  `models/marts/schema.yml`

- [ ] Captura del DAG con documentación generada
  Estado: pendiente de actualización.
  Evidencia actual:
  `docs/Captura_DAG_generado_newsapi.PNG`
  `docs/Captura_DAG_generado_weather.png`
  Observacion: ya existen capturas previas y artefactos de docs en `target/`, pero se debe generar una nueva captura despues de agregar los tests de clase 6 para mostrar tambien el modulo de testing en el DAG/documentacion.

## Trabajo ya realizado

- El proyecto dbt ya esta inicializado y funcional.
- Se implementaron las 3 capas: `staging`, `intermediate` y `marts`.
- Se separaron los sources en `models/staging/_sources.yml`.
- Ya existen tests genericos y relaciones configuradas en YAML.
- Se instalo `dbt-expectations` mediante `packages.yml` y `dbt deps`.
- Se agregaron tests de `dbt-expectations` en `staging` y `marts`.
- Se crearon 2 singular tests personalizados en `tests/`.
- Se completo la documentacion de modelos y columnas clave.
- `dbt build` final corrio exitosamente con resultado: `PASS=76`, `WARN=0`, `ERROR=0`, `SKIP=0`.
- Ya se generaron docs y se guardaron capturas previas del DAG.

## Pendientes prioritarios

1. Generar una nueva captura del DAG con `dbt docs` despues de incorporar los tests de clase 6.
2. Guardar esa captura en `docs/` como evidencia final del entregable.

## Propuesta de implementación

1. Ejecutar:
   ```bash
   dbt build
   dbt docs generate
   dbt docs serve
   ```
2. Abrir el DAG actualizado y guardar una nueva captura que muestre tambien los tests incorporados.

## Nota

Este seguimiento se construyo a partir de `docs/Entregable_clase6.txt`, del PDF `docs/clase6.pdf` y del estado actual del repositorio. La clase 6 pide explicitamente tests nativos, `dbt-expectations`, singular tests, documentacion mas completa y validacion final con `dbt build`.
