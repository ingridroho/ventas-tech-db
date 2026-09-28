USE Ventas_Tech_DB;
GO

SELECT 
	v.fecha_venta, 
	c.id_cliente, 
	c.nombre AS nombre_cliente, 
	c.ciudad, 
	p.nombre_producto, 
	ca.nombre_categoria,
	ca.descripcion, 
	v.cantidad,
	v.precio_unitario, 
	v.precio_unitario * v.cantidad AS total_venta
FROM ventas v
INNER JOIN clientes c
	ON v.id_cliente = c.id_cliente
INNER JOIN productos p
	ON v.id_producto = p.id_producto
INNER JOIN categorias ca
	ON p.id_categoria = ca.id_categoria;


SELECT 
	c.nombre, 
	c.email, 
	c.fecha_registro 
FROM clientes c
LEFT JOIN ventas v
	ON v.id_cliente = c.id_cliente
WHERE v.id_venta IS NULL;


SELECT 
	p.nombre_producto,
	c.nombre_categoria, 
	p.precio
FROM productos p
LEFT JOIN ventas v
	ON p.id_producto = v.id_producto
INNER JOIN categorias c
	ON p.id_categoria = c.id_categoria
WHERE v.id_venta IS NULL;


/* Como el esquema no incluye una columna de canal, se crea CANAL como campo literal.
   Sus valores representan dos períodos de ventas, criterio permitido por la consigna.
*/
 
SELECT canal, SUM(venta_total) AS total
FROM (
		SELECT 
			fecha_venta, 
			cantidad * precio_unitario AS venta_total, 
			'Primer Semestre' AS canal
		FROM ventas
		WHERE fecha_venta BETWEEN '2026-01-01' AND '2026-06-30'
		 
		UNION ALL
		 
		SELECT 
			fecha_venta, 
			cantidad * precio_unitario AS venta_total, 
			'Segundo Semestre' AS canal
		FROM ventas
		WHERE fecha_venta BETWEEN '2026-07-01' AND '2026-12-31'
) AS ventas_por_periodo
GROUP BY canal;
