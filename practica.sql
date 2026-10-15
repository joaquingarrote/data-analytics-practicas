--══════════════════════════════════════════
-- BodegaTech — Script de Inventario
-- Autor: [joaquin garrote]
-- Fecha: [15/10]
-- ════════════════════════════════════════

-- ── SECCIÓN DDL ──────────────────────────
-- DROP TABLE
DROP TABLE IF EXISTS inventario;

--creacion database
create database BodegaTech;

-- creacion tabla
create table inventario(
id_producto int NOT NULL identity (1,1) primary key,
nombre_producto varchar(100) not null,
categoria varchar(50) not null, 
precio_unitario	DECIMAL(10,2) not null,
stock_actual	INT not null,
stock_minimo	INT not null, 
fecha_ingreso	DATE not null,
activo	bit not null default 1
);
 
-- se uso (activo bit) para que devuelva true o false si esta activo o no
-- se uso (nombre_producto varchar(100)) para que se pueda poner un nombre de hasta 100 caracteres
-- se uso INT en ambas columnas de stock para que sea un dato numerico entero y no decimal

select * from inventario;

-- carga de datos

INSERT INTO inventario (nombre_producto,categoria,precio_unitario,stock_actual,stock_minimo,fecha_ingreso,activo)
VALUES ('Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
    ('Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
    ('Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
    ('Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
    ('Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
    ('Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
    ('Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
    ('Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
    ('SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
    ('Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

-- UPDATE con unidades vendidas

update inventario SET stock_actual = stock_actual + 1
where id_producto = 1;
update inventario SET stock_actual = stock_actual - 2
where id_producto = 2;
update inventario SET stock_actual = stock_actual - 6
where id_producto = 6;

--UPDATE adicional descontinuada por el proveedor.

update inventario set activo = 0    
where id_producto = 8;

-- validacion
select * from inventario;