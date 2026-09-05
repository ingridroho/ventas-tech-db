/* =========================================================
   VENTAS_TECH_DB
   ========================================================= */


/* =========================================================
   1. CREACIÓN DE LA BASE DE DATOS
   ========================================================= */

IF DB_ID('Ventas_Tech_DB') IS NULL
BEGIN
    CREATE DATABASE Ventas_Tech_DB;
END;
GO

USE Ventas_Tech_DB;
GO


/* =========================================================
   2. DROP TABLES
   Se eliminan en orden inverso a las dependencias
   ========================================================= */

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
GO


/* =========================================================
   3. CREATE TABLES
   ========================================================= */


/* ---------- CATEGORIAS ---------- */

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);


/* ---------- CLIENTES ---------- */

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    ciudad VARCHAR(50),
    fecha_registro DATE NOT NULL
);


/* ---------- PRODUCTOS ---------- */

CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    activo BIT NOT NULL,

    CONSTRAINT FK_productos_categorias
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
);


/* ---------- VENTAS ---------- */

CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_venta DATE NOT NULL,

    CONSTRAINT FK_ventas_clientes
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT FK_ventas_productos
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
);

GO


/* =========================================================
   4. INSERT DATA
   ========================================================= */


/* ---------- CATEGORIAS: 4 REGISTROS ---------- */

INSERT INTO categorias
    (id_categoria, nombre_categoria, descripcion)
VALUES
    (1, 'Notebooks', 'Computadoras portatiles'),
    (2, 'Monitores', 'Monitores para computadora'),
    (3, 'Perifericos', 'Dispositivos de entrada'),
    (4, 'Accesorios', 'Accesorios tecnologicos');


/* ---------- CLIENTES: 5 REGISTROS ---------- */

INSERT INTO clientes
    (id_cliente, nombre, email, ciudad, fecha_registro)
VALUES
    (1, 'Laura Gomez', 'laura.gomez@email.com', 'Buenos Aires', '2026-01-15'),
    (2, 'Martin Perez', 'martin.perez@email.com', 'Cordoba', '2026-02-03'),
    (3, 'Sofia Ramirez', 'sofia.ramirez@email.com', 'Rosario', '2026-02-20'),
    (4, 'Diego Fernandez', 'diego.fernandez@email.com', 'Posadas', '2026-03-08'),
    (5, 'Camila Torres', 'camila.torres@email.com', 'Santa Fe', '2026-03-22');


/* ---------- PRODUCTOS: 6 REGISTROS ---------- */

INSERT INTO productos
    (id_producto, nombre_producto, id_categoria, precio, stock, activo)
VALUES
    (1, 'Notebook Lenovo IdeaPad', 1, 850000.00, 10, 1),
    (2, 'Notebook HP 15', 1, 920000.00, 8, 1),
    (3, 'Monitor Samsung 24', 2, 245000.00, 15, 1),
    (4, 'Mouse Logitech M185', 3, 32000.00, 30, 1),
    (5, 'Teclado Logitech K120', 3, 28000.00, 25, 1),
    (6, 'Auriculares JBL', 4, 78000.00, 20, 1);


/* ---------- VENTAS: 10 REGISTROS ---------- */

INSERT INTO ventas
    (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta)
VALUES
    (1, 1, 1, 1, 850000.00, '2026-04-05'),
    (2, 2, 3, 2, 245000.00, '2026-04-12'),
    (3, 3, 4, 1, 32000.00, '2026-04-20'),
    (4, 4, 2, 1, 920000.00, '2026-05-03'),
    (5, 5, 5, 2, 28000.00, '2026-05-15'),
    (6, 1, 6, 1, 78000.00, '2026-05-27'),
    (7, 2, 4, 3, 32000.00, '2026-06-08'),
    (8, 3, 1, 1, 850000.00, '2026-06-19'),
    (9, 4, 3, 1, 245000.00, '2026-07-02'),
    (10, 5, 2, 1, 920000.00, '2026-07-14');

GO


/* =========================================================
   5. VALIDACIÓN
   ========================================================= */

SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;