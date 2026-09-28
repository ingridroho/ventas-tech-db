# M6 - Pipeline ETL en Power BI

Checkpoint del curso de Data Analytics orientado a la construcción de un pipeline ETL en Power BI utilizando Power Query y lenguaje M.

## Objetivo

Preparar y transformar los datos de TechStore para obtener un modelo limpio y confiable, listo para utilizar en análisis posteriores.

## Trabajo realizado

- Importación de las tablas `clientes`, `productos`, `ventas` y `categorias`.
- Perfilado y limpieza de datos.
- Eliminación de registros duplicados por ID.
- Tratamiento de valores nulos con criterio según el tipo de dato.
- Corrección de tipos de datos.
- Aplicación de nomenclatura `Dim_` y `Fact_`.
- Merge entre ventas y productos para incorporar `nombre_producto` y `categoria`.
- Documentación de transformaciones mediante lenguaje M.
- Validación final de filas y calidad de datos.

## Modelo resultante

- `Dim_Clientes`
- `Dim_Productos`
- `Dim_Categorias`
- `Fact_Ventas`

## Archivo

`Pipeline_ETL_RojasHolzer_Ingrid.pbix`
