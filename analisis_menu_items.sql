			-- << Analisis tabla de menu >> -- 
--1. Observar la tabla menu_items

SELECT *
FROM menu_items;

--Estandarizar nombres columnas ingles a español

ALTER TABLE menu_items
RENAME COLUMN menu_item_id to id_menu

ALTER TABLE menu_items
RENAME COLUMN item_name to nombre_articulo

ALTER TABLE menu_items
RENAME COLUMN category to categoria

ALTER TABLE menu_items
RENAME COLUMN price to precio


--2. Buscar el numero de items del menu
-- Uso de Funcion de agregacion COUNT 

SELECT COUNT(*)
FROM menu_items;

--3. Cuales son los elementos menos y mas costosos del menu?
-- Uso de clausula Order By para encontrar el menor y mayor precio 

SELECT item_name, price
FROM menu_items
ORDER BY price;

SELECT item_name, price
FROM menu_items
ORDER BY price DESC;

--4. Cantidad de platos italianos en el menu
-- Agrupar por categorias y filtrar por clausula where platos 'Italianos'

SELECT category,COUNT(*) as cantidad_platos
FROM menu_items
WHERE category = 'Italian'
GROUP BY  category;

--5. Platos Italianos menos y mas costosos
-- Filtrar platos Italianos y ordenar por precio menos y mas costosos
SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY  price;


SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY  price DESC;

--6. ¿Cuantos platos hay por categoria?
-- Filtrar por categorias y contar por filas 
--(finalmente usamos un alias para identificar nuestra funcion de agregacion)

SELECT category, COUNT (*) AS cantidad_platos
FROM menu_items
GROUP BY category; 

--7. ¿CUal es el precio promedio de plato por categoria?
-- Agrupar por categoria y calcular el promedio de precio
--Se utilizo la funcion round para redondear a 2 digitos los decimales

SELECT category, ROUND((AVG(price) ),2) AS precio_promedio_categ
FROM menu_items
GROUP BY category;