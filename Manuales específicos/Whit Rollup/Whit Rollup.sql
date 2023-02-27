/*
Cuando realizamos una consumta con la funciones de suma, contador... WHITH ROLLUP nos permite mostrar una fila final con la funcion agragada sobre la columna. Para ello, necesitaremos crear algún elemento agrupador con GROUP BY.

Si dentro de un GROUP BY realizamos un HAVING el WITH ROLLUP se ejecuta antes que el HAVING mostrando los datos como si el having no existiera, por lo cual nos llevará a un error quentemos que tener en cuenta.
*/
 
USE WORLD;
SELECT * FROM country;
 
-- Sumaremos la las poblaciones respecto a los continentes sin WHIT ROLLOUP
SELECT continent, SUM(population) poblacion FROM country GROUP BY Continent; 

-- Sumaremos la las poblaciones respecto a los continentes con WHIT ROLLOUP
SELECT continent, SUM(population) poblacion FROM country GROUP BY Continent WITH ROLLUP; 

-- Sumaremos la las poblaciones respecto a los continentes con WHIT ROLLOUP HAVING para provocar error
SELECT continent, SUM(population) poblacion FROM country GROUP BY Continent WITH ROLLUP HAVING poblacion > 730074600; 