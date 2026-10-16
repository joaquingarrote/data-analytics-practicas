----DROP----

DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Categorias;


----CREATE----

--Creación DB
CREATE database Ventas_Tech_DB;

USE Ventas_Tech_DB;

--Creación tablas
CREATE TABLE Categorias(
id_categoria INT IDENTITY(1,1) PRIMARY KEY,
nombre_categoria VARCHAR(50) NOT NULL,
descripcion VARCHAR(250)
);

CREATE TABLE Clientes(
id_cliente INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
ciudad VARCHAR(50),
fecha_registro DATE NOT NULL
);

CREATE TABLE Productos(
id_producto INT IDENTITY(1,1) PRIMARY KEY,
nombre_producto VARCHAR(100) NOT NULL,
id_categoria INT, FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
precio DECIMAL(10,2) NOT NULL,
stock INT DEFAULT 0,
activo BIT DEFAULT 1
);

CREATE TABLE Ventas(
id_venta INT IDENTITY(1,1) PRIMARY KEY,
id_cliente INT, FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
id_producto INT, FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
cantidad INT NOT NULL,
precio_unitario DECIMAL(10,2) NOT NULL,
fecha_venta DATE NOT NULL
);


----INSERT----

INSERT INTO Categorias (nombre_categoria, descripcion) VALUES
  ('Computación',    'Laptops, PCs y monitores'),
  ('Accesorios',     'Periféricos y complementos'),
  ('Audio',          'Auriculares y parlantes'),
  ('Almacenamiento', 'Discos y memorias');


INSERT INTO Clientes (nombre, email, ciudad, fecha_registro) VALUES
  ('María López',  'maria@mail.com',  'Buenos Aires', '2024-01-05'),
  ('Carlos Ruiz',  'carlos@mail.com', 'Córdoba',      '2024-01-10'),
  ('Ana Gómez',    'ana@mail.com',    'Rosario',      '2024-02-01'),
  ('Pedro Sanz',   'pedro@mail.com',  'Mendoza',      '2024-02-15'),
  ('Laura Torres', 'laura@mail.com',  'Tucumán',      '2024-03-01');


INSERT INTO Productos (nombre_producto, id_categoria, precio, stock, activo) VALUES
  ('Laptop Pro 15',      1, 1200.00, 15, 1),
  ('Mouse Inalámbrico',  2,   28.00, 80, 1),
  ('Monitor 4K 27',      1,  450.00, 12, 1),
  ('Auriculares BT Pro', 3,  120.00, 35, 1),
  ('SSD Externo 1TB',    4,  130.00, 18, 1),
  ('Teclado Mecánico',   2,   95.00, 40, 1);


INSERT INTO Ventas (id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES
  (1, 1, 2, 1200.00, '2024-03-05'),
  (2, 2, 5,   28.00, '2024-03-06'),
  (3, 3, 1,  450.00, '2024-03-07'),
  (1, 4, 2,  120.00, '2024-03-08'),
  (4, 5, 3,  130.00, '2024-03-10'),
  (2, 6, 4,   95.00, '2024-03-11'),
  (5, 1, 1, 1200.00, '2024-03-12'),
  (3, 2, 8,   28.00, '2024-03-13'),
  (4, 4, 1,  120.00, '2024-03-14'),
  (5, 3, 2,  450.00, '2024-03-15');


----VALIDACION----

SELECT * FROM Categorias;
SELECT * FROM Clientes;
SELECT * FROM Productos;
SELECT * FROM Ventas;
