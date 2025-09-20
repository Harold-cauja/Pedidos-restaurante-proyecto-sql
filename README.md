# Analisis-de-pedidos-restaurante-proyecto-SQL_PowerBI

Descripción

Este proyecto tiene como objetivo practicar SQL (PostgreSQL) y Power BI aplicados a un dataset de pedidos en un restaurante.

Se realizó un proceso de carga, exploración, estandarizacion de datos y análisis de datos para responder preguntas de negocio y visualizar insights clave en Power BI.

📂 Estructura del Proyecto

01_menu_items.sql → Análisis de la tabla menu_items.

02_detalles_orden.sql → Análisis de la tabla detalles_orden.

03_analisis_comportamiento.sql → Consultas combinadas de ambas tablas

carga_datos.sql → Script de creación de tablas y carga de los CSV en PostgreSQL.

README.md → Este archivo con la documentación del proyecto.

                    <<--🔍 Análisis Realizado-->>
Archivo 01: menu_items

1.- Observar la tabla menu_items.

2.- Contar número total de ítems en el menú.

3.- Identificar elementos más costosos y menos costosos.

4.- Calcular cuántos platos italianos hay.

5.- Identificar los platos italianos más baratos y más caros.

6.- Contar platos por categoría.

7.- Calcular precio promedio por categoría.

Archivo 02: detalles_orden

Visualizar la tabla detalles_orden
1.- Identificar el rango de fechas en los pedidos.

2.- Calcular cuántos pedidos se realizaron en ese rango.

3.- Contar cuántos artículos se ordenaron en total.

4.- Identificar pedidos con mayor cantidad de artículos.

5.- Determinar cuántos pedidos tuvieron más de 12 artículos.


 Archivo 03: analisis de comportamiento

1.- Combinar menu_items y detalles_orden.

2.- Identificar productos más y menos pedidos (y sus categorías).

3.- Top 5 pedidos con mayor gasto total.

4.- Detalle del pedido de mayor gasto (order_id = 440).

5.- Análisis de los 5 pedidos de mayor gasto para entender patrones de consumo.


📊 Visualización en Power BI

Se creó un dashboard interactivo con:

📈 Ventas por categoría y producto.

🛒 Productos más vendidos.

💸 Análisis de pedidos de mayor gasto.


Tecnologías Usadas <---

SQL (PostgreSQL) → Limpieza y análisis de datos.

Power BI → Visualización e insights.

GitHub → Documentación y control de versiones.

👨‍💻 Autor

Harold Cauja Portilla

🌍 Guayaquil, Ecuador
