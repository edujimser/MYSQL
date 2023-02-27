/*
Table es una sentencia para acceder a todos los campos de una tabla. Presenta una estructura base TABLE nom_table; Este comando no permite:
	- Clasula WHERE
    - Limitar columnas

La sentencia TABLE permite
	 - limit
     - Union
*/

USE WORLD;

-- Sentencia TABLE
TABLE country;  

-- Sentencia TABLE con LIMIT
TABLE country LIMIT 4;

-- Sentencia TABLE con UNION
TABLE country UNION ALL TABLE country;

-- Sentencia TABLE con UNION LIMIT
TABLE country UNION ALL TABLE country LIMIT 4;


