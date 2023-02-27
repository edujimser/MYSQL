/*
Los datos o campos tipos JSON pueden guargar arrays y objetos, al igual que anidación de ellos:
	- Arrays: [1,2,"Pepe", null, trie, "2021-03-01"]
    - Objetos: Este tipo de objeto funciona con una relación clave valor
		- {"clave1":"valor1", "clave2":"valor2", "clave3": [1,3,4,5,6,"Pepe"]}
*/

-- Para ver el tipo JSON_TIPY(); Hay tres tipos
	-- Object
    -- Array 
    -- String
SELECT JSON_TYPE('[1,2,"Pepe",null,true,"2021-08-15"]');
SELECT JSON_TYPE('{"clave1":10, "clave2":"valor2"}');

-- -------------------------------------------------------------------------------------------
-- Crear una tabla
USE sakila;

CREATE TABLE IF NOT EXISTS temp1(
	jdoc JSON
);

-- -------------------------------------------------------------------------------------------
-- Insertar en una tabla
INSERT INTO temp1 VALUES('{"clave1":5, "clave2":"valor2"}');

-- Ver datos
SELECT * FROM temp1;

-- -------------------------------------------------------------------------------------------
-- Actualizar
 -- Forma 1
	SET @@sql_safe_updates = 0;
	UPDATE temp1 SET jdoc = '{
    "clave1": 8,
    "clave2" : [2,3,4]
    }';
	SET @@sql_safe_updates = 1;

    SELECT * FROM temp1;
    
-- Forma 2
	SET @@sql_safe_updates = 0;
	UPDATE temp1 SET jdoc = JSON_OBJECT(
	'clave1',10,
    'clave2', JSON_ARRAY(6,5,7),
    'clave3', JSON_OBJECT('clave4', 'valor4')
    );
	SET @@sql_safe_updates = 1;
    
        SELECT * FROM temp1;


-- Con el objeto JSON_SET
/*
Con este modelo podemos modificar valores epecificos del campo
*/

SET @@sql_safe_updates = 0;

UPDATE temp1 
SET jdoc = JSON_SET( jdoc,
'$.clave1', 50,
'$.clave3', 500
);

SELECT * FROM temp1;

-- -------------------------------------------------------------------------------------------
-- Acceder a un valor de un objeto
-- Forma 1
SELECT JSON_EXTRACT(jdoc,'$.clave2') as VALOR_CLAVE2 FROM temp1;

-- Forma 2
SELECT jdoc -> '$.clave2' AS VALOR_CLAVE2 FROM temp1;


-- -------------------------------------------------------------------------------------------
-- Acceder a un valor de un Array
-- Forma 1
SELECT JSON_EXTRACT(jdoc, '$.clave2[2]') FROM temp1;

-- Forma 2
SELECT jdoc -> '$.clave2[2]' FROM temp1;


-- --------------------------------------------------------------------------------------------
-- Entrar en un objeto anidado
SELECT jdoc FROM temp1;

-- Forma 1
SELECT JSON_EXTRACT(Jdoc, '$.clave3.clave4') FROM temp1;

-- Forma 2
SELECT jdoc -> '$.clave3.clave4' FROM temp1;


-- --------------------------------------------------------------------------------------------
-- Entrar en un objeto anidado formado por un array principal
-- Creamos otra columna
ALTER TABLE temp1 ADD COLUMN jdoc2 JSON;
SELECT * FROM temp1;

INSERT INTO temp1(jdoc2)  VALUES(
JSON_ARRAY( 5,6,12,12,JSON_OBJECT("clave1", 2, "clav2", JSON_ARRAY(8,9,10))));

SELECT 
jdoc2 -> '$[0]',
jdoc2 -> '$[1]',
jdoc2 -> '$[2]',
jdoc2 -> '$[3]',
jdoc2 -> '$[4].clave1',
jdoc2 -> '$[4].clav2[0]',
jdoc2 -> '$[4].clav2[1]'
FROM temp1;

