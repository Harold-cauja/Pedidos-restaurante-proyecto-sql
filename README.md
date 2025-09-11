# Analisis-de-pedidos-restaurante-proyecto-SQL_PowerBI

Descripción

Este proyecto tiene como objetivo practicar SQL (PostgreSQL) y Power BI aplicados a un dataset de pedidos en un restaurante.

Se realizó un proceso de carga, exploración, estandarizacion de datos y análisis de datos para responder preguntas de negocio y visualizar insights clave en Power BI.

📂 Estructura del Proyecto

01_menu_items.sql → Análisis de la tabla menu_items.

02_detalles_orden.sql → Análisis de la tabla detalles_orden.

03_analisis_comportamiento.sql → Consultas combinadas de ambas tablas

carga_datos.sql → Script de creación de tablas y carga de los CSV en PostgreSQL.

carga_datos.md → Documentación del proceso de carga y resolución de errores (NULL, formatos de fecha, etc.).

README.md → Este archivo con la documentación del proyecto.

                    <<--🔍 Análisis Realizado-->>
-->> Archivo 01: menu_items

Observar la tabla menu_items.

Contar número total de ítems en el menú.

Identificar elementos más costosos y menos costosos.

Calcular cuántos platos italianos hay.

Identificar los platos italianos más baratos y más caros.

Contar platos por categoría.

Calcular precio promedio por categoría.

-->> Archivo 02: detalles_orden

Visualizar la tabla detalles_orden.

Identificar el rango de fechas en los pedidos.

Calcular cuántos pedidos se realizaron en ese rango.

Contar cuántos artículos se ordenaron en total.

Identificar pedidos con mayor cantidad de artículos.

Determinar cuántos pedidos tuvieron más de 12 artículos.

-->> Archivo 03: analisis de comportamiento

Combinar menu_items y detalles_orden.

Identificar productos más y menos pedidos (y sus categorías).

Top 5 pedidos con mayor gasto total.

Detalle del pedido de mayor gasto (order_id = 440).

Análisis de los 5 pedidos de mayor gasto para entender patrones de consumo.

                      <<--🛠️ Proceso de Carga y Limpieza-->>
Creación de base de datos

CREATE DATABASE restaurante_db; \c restaurante_db

Creación de tablas (menu_items, detalles_orden).

Carga de CSVs con \copy.

Se manejaron valores NULL en item_id.

Se ajustó el formato de fechas (mm/dd/yy → yyyy-mm-dd).

Se cambio el nombre de las columnas con ALTER TABLE mi_tabla RENAME COLUMN columna to nuevo_nombre

📊 Visualización en Power BI

Se creó un dashboard interactivo con:

📈 Ventas por categoría y producto.

🕒 Evolución de pedidos en el tiempo.

🛒 Productos más vendidos.

💸 Análisis de pedidos de mayor gasto.

🚀 Tecnologías Usadas

SQL (PostgreSQL) → Limpieza y análisis de datos.

Power BI → Visualización e insights.

GitHub → Documentación y control de versiones.

👨‍💻 Autor

Harold Cauja Portilla

🌍 Guayaquil, Ecuador
