USE Ventas_Tech_DB;
GO

SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(id_venta) AS cantidad_pedidos,
    AVG(precio_unitario * cantidad) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);

SELECT TOP 5 
    id_producto AS producto,  
    SUM(cantidad) AS unidades_vendidas,  
    SUM(cantidad * precio_unitario) AS total_facturado 
FROM ventas 
GROUP BY id_producto 
ORDER BY total_facturado DESC;

SELECT 
    id_cliente AS cliente,
    COUNT(id_venta) AS cantidad_pedidos,
    SUM(precio_unitario * cantidad) AS total_gastado
FROM ventas
GROUP BY id_cliente 
HAVING COUNT(id_venta) > 1;

SELECT
    mes,
    facturacion_mensual,
    CASE
        WHEN facturacion_mensual > (
            SELECT AVG(facturacion_mensual)
            FROM (
                SELECT
                    MONTH(fecha_venta) AS mes,
                    SUM(precio_unitario * cantidad) AS facturacion_mensual
                FROM ventas
                GROUP BY MONTH(fecha_venta)
            ) AS base_promedio
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion
FROM (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(precio_unitario * cantidad) AS facturacion_mensual
    FROM ventas
    GROUP BY MONTH(fecha_venta)
) AS resumen_mensual
ORDER BY mes;


-- Hallazgo 1: Abril fue el mes de mayor facturación, con $1.372.000.
-- Julio tuvo el ticket promedio más alto ($582.500), aunque no fue el mes con mayor facturación.

-- Hallazgo 2: El producto 2 fue el de mayor facturación ($1.840.000),
-- mientras que el producto 4 fue el más vendido en unidades (4), pero facturó solo $128.000.

-- Hallazgo 3: Los 5 clientes son recurrentes, con 2 pedidos cada uno.
-- El cliente 4 registró el mayor gasto total, con $1.165.000.

-- Hallazgo 4: Abril y julio tuvieron una facturación por encima del promedio mensual,
-- mientras que mayo y junio quedaron por debajo.
