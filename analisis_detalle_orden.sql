			-- << Analisis tabla de transacciones>> -- 
			
-- 1. Ver la tabla detalles_orden 

SELECT *
FROM detalles_orden
WHERE item_id IS NULL;

--Estandarizar nombre columna Ingles a Español
--Con esto buscamos construir modelos e informes claros

ALTER TABLE detalles_orden
RENAME COLUMN orden_id to id_detalles_pedido

ALTER TABLE detalles_orden
RENAME COLUMN order_id to id_pedido

ALTER TABLE detalles_orden
RENAME COLUMN order_date to fecha_pedido

ALTER TABLE detalles_orden
RENAME COLUMN order_time to hora_pedido

ALTER TABLE detalles_orden
RENAME COLUMN item_id to id_menu




--2. ¿Cual es el rango de fechas en la tabla?
-- (SQL para buscar el rango minimo y maximo de las fechas)

SELECT MIN(order_date) AS fecha_minima, MAX(order_date) AS fecha_maxima
FROM detalles_orden;

--3. ¿Cuantos pedidos se realizaron dentro de este rango de fecha?
-- Contamos solo los pedidos unicos con DISTINCT 

SELECT COUNT (DISTINCT order_id)
FROM detalles_orden;

--4. ¿Cuantos articulos se ordenaron dentro de este rango de fechas?
-- Contamos el total de filas de la tabla detalles_orden para tener un total de ordenes

SELECT COUNT (*)
FROM detalles_orden


--5. ¿Que pedidos tuvieron la mayor cantidad de articulos? 
-- SQL para agrupar por order_id y contar cantidad de articulos (obtenemos los mayores con la clausula ORDER BY)

SELECT order_id, COUNT (item_id) AS cantidad_articulos
FROM detalles_orden
GROUP BY order_id
ORDER BY cantidad_articulos DESC

--6. ¿Cuantos pedidos tenian mas de 12 articulos? 
-- >>>>  USO DE CLAUSULA HAVING 	<<<<- 
-- Se usa en conjunto con GROUP BY para filtrar los resultados de una consulta que utiliza la cláusula GROUP BY
-- Mientras que la cláusula WHERE filtra las filas de la tabla de origen antes de que se agrupen y se apliquen las funciones de agregación,
-- la cláusula HAVING filtra sobre los grupos creados en GROUP BY aplicando condiciones a los resultados agregados (como sumas o promedios)

SELECT COUNT(*) 
FROM 
(SELECT order_id, COUNT (item_id) AS cantidad_articulos
FROM detalles_orden
GROUP BY order_id
HAVING COUNT (item_id) >12
ORDER BY cantidad_articulos) AS num_pedidos


