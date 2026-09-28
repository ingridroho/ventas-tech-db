# Ventas Tech DB

Proyecto de práctica de Data Analytics orientado al diseño, construcción y análisis de una base de datos relacional en SQL Server.

El proyecto se desarrolla progresivamente a través de distintos módulos del curso, utilizando una base de datos de ventas de productos tecnológicos.

## Base de datos

La base `Ventas_Tech_DB` contiene cuatro tablas relacionadas:

- `categorias`
- `clientes`
- `productos`
- `ventas`

Las tablas utilizan claves primarias y foráneas para mantener la integridad de las relaciones entre los datos.

## Estructura del repositorio

ventas-tech-db/

- README.md
- RetailPro/
  - ventas_tech_db.sql
  - m4_consultas_negocio.sql
  - m5_consultas_joins.sql

## Scripts

### `ventas_tech_db.sql` — Módulo 3

Script de creación y carga de la base de datos.

Incluye:

- Creación de `Ventas_Tech_DB`.
- Creación de tablas.
- Primary Keys y Foreign Keys.
- Restricciones `NOT NULL`, `UNIQUE` y `DEFAULT`.
- Inserción de datos de ejemplo.
- Relaciones entre clientes, productos, categorías y ventas.

### `m4_consultas_negocio.sql` — Módulo 4

Consultas orientadas al análisis de negocio utilizando:

- `SUM`
- `AVG`
- `COUNT`
- `GROUP BY`
- `HAVING`
- `CASE WHEN`
- Subconsultas

Incluye análisis de facturación mensual, productos con mayor facturación, clientes recurrentes y comparación de períodos respecto del promedio.

### `m5_consultas_joins.sql` — Módulo 5

Consultas para combinar y enriquecer información de distintas tablas utilizando:

- `INNER JOIN`
- `LEFT JOIN`
- `WHERE ... IS NULL`
- `UNION ALL`
- Subconsultas
- `GROUP BY`

Incluye:

- Vista enriquecida de ventas con información de clientes, productos y categorías.
- Identificación de clientes sin ventas.
- Identificación de productos sin ventas.
- Consolidación de ventas mediante `UNION ALL`, utilizando períodos como criterio de origen.

## Ejecución

Los scripts fueron desarrollados para Microsoft SQL Server y pueden ejecutarse desde SQL Server Management Studio (SSMS).

Orden recomendado:

1. Ejecutar `ventas_tech_db.sql` para crear y cargar la base de datos.
2. Ejecutar `m4_consultas_negocio.sql`.
3. Ejecutar `m5_consultas_joins.sql`.

Los scripts de consultas trabajan sobre la base `Ventas_Tech_DB`.
