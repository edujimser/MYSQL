/*
Explain nos muestra:
 - Los indices por los cuales se han ejecutado
 - Extras de ordenamiento
*/

EXPLAIN SELECT * FROM city; 


/*
Explain con Order by:
 - Si el campo para ordenación tiene un indice order by se ejecutará mas correctamente
 - Si no se tiene un indice en el campo a ordenar el sistema creará un archivo temporal tipo sort, lo podemos ver en Extra: Using FileSort. Este archivo es un archivo temporal que debe crearse y para consultas con muchos registros empeora la respuesta de la base de datos, un indice nos ayudaría a solucionar esto, pero la creación de multiple indice tambíen puede ser perjudicial
*/

EXPLAIN SELECT * FROM city ORDER BY name;

/*
SHOW STATUS: son un conjunto de variables que nos permite saber el estado del servidor

SHOW STATUS LIKE 'last_quety_cost': nos permite saber el costo de la ultima consulta, esto nos muestras estadisticas pero no es un valor real, contra más pequeño mejor

Url: https://dev.mysql.com/doc/refman/8.0/en/server-status-variables.html
*/
EXPLAIN SELECT * FROM city ORDER BY id;
SHOW STATUS LIKE 'last_query_cost';
