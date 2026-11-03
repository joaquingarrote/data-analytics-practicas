USE Ventas_Tech_DB;

-- Consulta 1: Vista base del proyecto (INNER JOIN)
-- Propósito: reunir información de ventas, clientes, productos y categorías para alimentar Power BI.

SELECT v.id_venta,
       v.fecha_venta,
       c.id_cliente,
       c.nombre AS nombre_cliente,
       c.ciudad,
       p.id_producto,
       p.nombre_producto,
       cat.nombre_categoria AS categoria,
       v.cantidad,
       v.precio_unitario,
       v.cantidad * v.precio_unitario AS total_venta
FROM Ventas v
INNER JOIN Clientes c ON v.id_cliente = c.id_cliente
INNER JOIN Productos p ON v.id_producto = p.id_producto
INNER JOIN Categorias cat ON p.id_categoria = cat.id_categoria;
-- Hallazgo:la consulta integra los datos, permitiendo visualizar el detalle de cada operación.



-- Consulta 2 — Clientes sin ventas (LEFT JOIN)
-- Propósito: detectar clientes que no tengan registro en la tabla 'ventas'

SELECT *
FROM Clientes c
LEFT JOIN Ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;
-- Hallazgo: la consulta devuelve 0 registros. No se identifican clientes sin compras en la muestra analizada.




--Consulta 3 — Productos sin ventas (LEFT JOIN)
-- Propósito: detectar productos que no tengan registro en la tabla 'ventas'

SELECT p.nombre_producto, cat.nombre_categoria AS categoria, p.precio
FROM Productos p
INNER JOIN Categorias cat ON p.id_categoria = cat.id_categoria
LEFT JOIN Ventas v        ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;
-- Hallazgo:la consulta devuelve 0 registros. No se identifican productos sin ventas en la muestra analizada.



--Consulta 4 — Consolidado por semestre (UNION ALL)
-- Propósito: clasificar las ventas en periodos semanales y calcular el total facturado en cada uno

SELECT periodo, SUM(total) AS total_periodo
FROM (
      SELECT fecha_venta, cantidad * precio_unitario AS total, 'Semana 1 (1 al 7 Mar)' AS periodo
      FROM ventas 
      WHERE fecha_venta >= '2024-03-01' 
      AND fecha_venta < '2024-03-08'
      UNION ALL
      SELECT fecha_venta, cantidad * precio_unitario AS total, 'Semana 2 (8 al 15 Mar)' AS periodo
      FROM ventas 
      WHERE fecha_venta >= '2024-03-08' 
      AND fecha_venta < '2024-03-16'
      ) AS consolidado 
GROUP BY periodo;

-- Hallazgo: la facturacion de la primer semana es de $2.990, mientras que en la segunda semana facturo un total de $3.454.
-- la segunda semana facturó $464 más que la primera.