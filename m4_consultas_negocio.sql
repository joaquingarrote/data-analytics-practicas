
USE Ventas_Tech_DB;

-----------Consulta 1 — Resumen ejecutivo mensual ------------

SELECT MONTH(fecha_venta) AS mes,
       COUNT(*) AS cantidad_pedidos,
       SUM (cantidad*precio_unitario) AS total_facturado,
       AVG (cantidad*precio_unitario) AS ticket_promedio 
FROM Ventas
GROUP BY MONTH(fecha_venta);

-----------Consulta 2 — Ranking de productos------------

SELECT TOP 5 id_producto,
       SUM(cantidad*precio_unitario) AS total_facturado,
       SUM(cantidad) as unidades_vendidas 
FROM Ventas
GROUP BY id_producto
ORDER BY SUM(cantidad*precio_unitario) desc;

-----------Consulta 3 — Clientes recurrentes------------

SELECT id_cliente,
       COUNT(*) AS cantidad_pedidos, 
       SUM(cantidad*precio_unitario) AS total_facturado
FROM Ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY SUM(cantidad*precio_unitario) desc;


-----------Consulta 4 — Meses por encima/por debajo del promedio-----------

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,

    CASE
        WHEN SUM(cantidad * precio_unitario) >
            (SELECT AVG(total_mes)
             FROM (
                 SELECT SUM(cantidad * precio_unitario) AS total_mes
                 FROM Ventas
                 GROUP BY MONTH(fecha_venta)
             ) AS promedio)
        THEN 'Por encima'

        WHEN SUM(cantidad * precio_unitario) <
            (SELECT AVG(total_mes)
             FROM (
                 SELECT SUM(cantidad * precio_unitario) AS total_mes
                 FROM Ventas
                 GROUP BY MONTH(fecha_venta)
             ) AS promedio)
        THEN 'Por debajo'

        ELSE 'Igual al promedio'
    END AS comparacion

FROM Ventas
GROUP BY MONTH(fecha_venta);


--HALLAZGOS DEL ANÁLISIS:
--1. En el mes 3 se registraron 10 pedidos, con una facturación total de $6.444 y un ticket promedio de $644,40 por pedido.
--2. El producto con ID 1 lidera el ranking de facturación, con $3.600 generados por la venta de 3 unidades.
--3. El cliente con ID 1 es el que más gastó entre los clientes recurrentes, con un total de $2.640 en 2 pedidos.

