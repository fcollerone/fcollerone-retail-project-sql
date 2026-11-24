---> CREACIÓN DE TABLAS
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(150) UNIQUE NOT NULL,
    edad_cliente INTEGER NOT NULL CHECK (edad_cliente >=18)
);
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio_producto DECIMAL(10,2) NOT NULL CHECK (precio_producto>0),
    stock_producto INTEGER NOT NULL CHECK (stock_producto>=0)
);
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL REFERENCES clientes(id_cliente),
    id_producto INTEGER NOT NULL REFERENCES productos(id_producto),
    fecha_venta DATE NOT NULL,
    cantidad INTEGER NOT NULL CHECK (cantidad>0)
);

---> INSERCIÓN DE DATA

BEGIN;

INSERT INTO clientes (nombre_cliente,email_cliente,edad_cliente)
VALUES
('Facundo Collerone','fcollerone@gmail.com', 36),
('Facundo Nicolas','cfacundo@gmail.com', 35),
('Thomas Gabriel','tgabriel@gmail.com', 30),
('Lucas Tobias','ltobias@gmail.com', 25),
('Juan Cruz','fcruz@gmail.com', 21);

INSERT INTO productos (nombre_producto,precio_producto,stock_producto)
VALUES
('Afeitadora',55000.00, 25),
('PS5',950000.00, 10),
('Horno electrico',75000.00, 5),
('Bicicleta',100000.00, 15),
('Pelota',15000.00, 50);

INSERT INTO ventas (id_cliente,id_producto,fecha_venta,cantidad)
VALUES
(1,2,'2026-11-19',1),
(1,1,'2026-11-20',2),
(1,3,'2026-11-21',3),
(2,4,'2026-11-22',2),
(5,5,'2026-11-23',1),
(2,4,'2026-11-24',3);

COMMIT;

-- ACTUALIZACIÓN MASIVA DE PRECIOS
SELECT*FROM productos
WHERE precio_producto <=100000.00;

UPDATE productos
SET precio_producto = precio_producto*1.10
WHERE precio_producto<=100000.00;

-- BORRADO DE REGISTRO
SELECT*FROM ventas
WHERE id_venta=5;

DELETE FROM ventas
WHERE id_venta = 5;

-- COMPROBACIONES
SELECT*FROM productos;
SELECT*FROM ventas;
SELECT*FROM productos;


