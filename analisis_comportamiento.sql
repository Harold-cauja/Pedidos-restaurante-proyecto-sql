			-- << Analisis del comportamiento de los clientes >> -- 

--1. Combinar las tablas menú_items y detalles_orden en una sola tabla 
-- SQL para combinar las tablas menu y detalles con una union a la izquierda (left Join) de esta manera nos aseguramos de tener en nuestra tabla final todas las transacciones

SELECT *
FROM detalles_orden As pedido
 LEFT JOIN menu_items AS menu
	ON pedido.id_menu= menu.id_menu

--2.¿Cuáles fueron los productos menos y mas pedidos? ¿En Qué categorías estaban?
-- Agrupamos por item_name y categoria
--Contamos los item de la columna order_details_id para obtener el numero de pedidos

SELECT menu.nombre_articulo,menu.categoria, COUNT(pedido.id_detalles_pedido) AS num_pedidos
FROM detalles_orden As pedido
 LEFT JOIN menu_items AS menu
	ON pedido.id_menu = menu.id_menu
	GROUP BY menu.nombre_articulo, menu.categoria
	ORDER BY num_pedidos DESC;

--3. ¿Cuáles fueron los 5 pedidos que gastaron mas dinero?
-- Para responder a esta pregunta luego de hacer un Left Join, agrupamos los pedidos (order_id)
-- y hacemos uso de la clausula HAVING para filtar sobre los grupos creados (tambien condicionamos que nos filtre solo result)

SELECT id_pedido, SUM(precio) AS sum_por_pedidos
FROM detalles_orden As pedido
LEFT JOIN menu_items AS menu
	ON pedido.id_menu = menu.id_menu
GROUP BY id_pedido
HAVING SUM(precio) IS NOT NULL 
ORDER BY sum_por_pedidos DESC
LIMIT 5;

--4. Ver los detalles del pedido de mayor gasto. ¿Qué información puede obtener de esos resultados?
--Con los resultados de la consulta anterior observamos que El pedido con mayor gasto es de order_id 440 
-- Utilizamos la clausula Where para filtrar ese id de pedido y tener mas detalles

SELECT *
FROM detalles_orden As pedido
LEFT JOIN menu_items AS menu
ON pedido.id_menu = menu.id_menu
WHERE id_pedido = 440;

-- << Uso de operaciones numericas >> --
-- Se dio el alias precio unitario a la columna precio
-- Contamos los item para tener un dato numerico para nuestra proxima operacion
-- Creamos la columna subtotal_ventas como resultado de multiplicar (precio * COUNT(item_name))

SELECT categoria, nombre_articulo, 
		precio as precio_unitario,
		COUNT(nombre_articulo) AS cant_productos,
		precio * COUNT(nombre_articulo) as Subtotal_ventas	
FROM detalles_orden As pedido
LEFT JOIN menu_items AS menu
ON pedido.id_menu = menu.id_menu
WHERE id_pedido = 440
GROUP BY categoria, nombre_articulo, precio
ORDER BY cant_productos DESC; 


-- << USO DE FUNCION STRIN_AGG
-- SQL para mostrar cuales son el detalle de los productos que se vendieron dentro del pedido con mayor gasto
-- LA funcion STRIN_AGG concatena los valores de múltiples filas en una sola cadena, usando un separador especificado


SELECT categoria, 
		COUNT(nombre_articulo) AS cant_productos,
		STRING_AGG(nombre_articulo,' , ') AS nombre_productos
FROM detalles_orden As pedido
LEFT JOIN menu_items AS menu
ON pedido.id_menu = menu.id_menu
WHERE id_pedido = 440
GROUP BY categoria
ORDER BY cant_productos DESC; 


--5. Ver los detalles de los 5 pedidos de mayor gasto y que información puede recopilar de eso 
-- En la pregunta 3 se obtuvo los ID de los 5 pedidos,
--utilizamos esta informacion para profundizar en los detalles de cada pedido y obtener mas Insights

SELECT id_pedido,categoria, COUNT(id_pedido) AS cant_pedidos,
		SUM(precio) AS sum_pedidos
FROM detalles_orden As pedido
LEFT JOIN menu_items AS menu
ON pedido.id_menu = menu.id_menu
WHERE id_pedido IN (440,2075,1957,330,2675)
GROUP BY id_pedido,categoria;


--Creamos una Vista para conectar a POWER BI y presentar un Dashboard

DROP VIEW IF EXISTS analisis;
CREATE OR REPLACE VIEW analisis AS 
SELECT pedido.id_detalles_pedido,
		pedido.id_pedido,
		pedido.fecha_pedido,
		pedido.id_menu,
		menu.nombre_articulo,
		menu.categoria,
		menu.precio		
FROM detalles_orden As pedido
 LEFT JOIN menu_items AS menu
	ON pedido.id_menu= menu.id_menu

--Consultar la nueva Table view 

SELECT *
FROM analisis;



