CREATE DATABASE restaurante_db;
 
CREATE TABLE menu_items (
    menu_item_id INT PRIMARY KEY,
    item_name VARCHAR(255),
    category VARCHAR(100),
    price NUMERIC(10,2)
);

-- << Cargar Dataset (menu_item) desde la consola PSQL tool >> -- 
-- (Comando) --> \copy menu_items FROM 'C:\Users\User\Downloads\menu_items.csv' DELIMITER ',' CSV HEADER;

-- Se utiliza \copy porque este comando permite leer el archivo CSV directamente desde el cliente (mi PC), 
-- mientras que COPY estándar requiere que el archivo esté en el servidor.  
-- Por eso aquí solo se documenta el proceso, ya que el comando real se ejecutó en psql y no en Query Tool.  



CREATE TABLE detalles_orden (
order_details_id INT PRIMARY KEY,
order_id INT,
order_date DATE,
order_time TIME,
item_id INT );


-- << Cargar Dataset (detalles_orden) >> -- 
-- (Comando) --> \copy detalles_orden FROM 'C:/Users/User/Downloads/detalles_orden.csv' DELIMITER ',' CSV HEADER; 

-- El CSV contenía valores literales 'NULL' en la columna item_id, lo que causaba error al importarlo, 
-- ya que PostgreSQL intentaba leerlos como texto en una columna numérica.  

-- La solución fue usar la opción NULL 'NULL', que convierte automáticamente esas cadenas 
-- en valores nulos reconocidos por PostgreSQL:  

-->> \copy detalles_orden FROM 'C:/Users/User/Downloads/detalles_orden.csv' DELIMITER ',' CSV HEADER NULL 'NULL'; 

--NULL 'NULL' le dice a Postgres que cuando encuentre el texto "NULL" en el CSV lo guarde como valor nulo verdadero en la tabla



-- También la columna order_date venía en formato MM/DD/YY (ejemplo: 1/13/23), 
-- distinto al formato esperado por PostgreSQL (YYYY-MM-DD).  
-- Para solucionarlo se ajustó la configuración de fecha con:  
-- SET datestyle = 'MDY';  
--Esto le dice a Postgres: “lee las fechas como Mes/Día/Año”



 