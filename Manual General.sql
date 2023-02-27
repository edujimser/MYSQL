-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EXPORTACIONES

/* TABLA + DATOS
1. Entramos en administracion
2. Para exportar datos vamos a data export
3. Seleccionamos la base de datos
4. Dump Structure and Date (Datos y estructura, tambien por separaado)
5. Exportat
5.1 Opcion primera tablas separadas --Esta según Paqui
5.2 Opcion segunda tabla junta
6. Inclue Create Shema
*/

/* DATOS
1. Entramos en administracion
2. Para exportar datos vamos a data export
3. Seleccionamos la base de datos
4.  Date (Datos y estructura, tambien por separaado)
5. Exportat
5.1 Opcion primera tablas separadas
5.2 Opcion segunda tabla junta -- Esta según Paqui
*/

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SHOW
/*
SHOW CREATE TABLE nombre_tabla; NOTA: VER EN EDITOR
*/

select * from  alumnos;
select * from asignaturas;
select codigo_alumno, nombre, apellidos from alumnos;

-- CLASULA LIMIT (Limita el numero filas)
select codigo_alumno, nombre, apellidos from alumnos limit 2;

-- CLASULA LIMIT (intervalo)
select codigo_alumno, nombre, apellidos from alumnos limit 2,4;
select codigo_alumno, nombre, apellidos from alumnos limit 2,6;
select codigo_alumno, nombre, apellidos from alumnos limit 3,60;

-- CLASULA DISTINC (Eliminar los elemento repetidos) -- NOTA: Hay que indicar el objeto a restringir
select distinct provincia from alumnos;
select distinct nombre from alumnos;

-- CLASULA ORDER BY (Ordenaer los elementos) --NOTA: por defecto si no ponemos ASC/DESC se forma automaticamente con ASC
select codigo_alumno, nombre, apellidos from alumnos order by codigo_alumno DESC;
select codigo_alumno, nombre, apellidos from alumnos order by nombre;
select codigo_alumno, nombre, apellidos from alumnos order by nombre DESC;
select codigo_alumno, nombre, apellidos from alumnos order by nombre, apellidos;
select codigo_alumno, nombre, apellidos from alumnos order by nombre ASC, apellidos DESC;

-- CLASULA ORDER BY + LIMIT
select codigo_alumno, nombre, apellidos from alumnos order by nombre ASC, apellidos DESC limit 3;

-- CLASULA AS (Alias) --NOTA: para utilizar espacio usar ' '
select codigo_alumno as codigo, nombre as'Nombre del Alumno', apellidos as apellido_alumno from alumnos order by nombre ASC, apellidos DESC limit 3;
select codigo_alumno, nombre, apellidos from alumnos as alu;
select alu.codigo_alumno, alu.nombre, alu.apellidos from alumnos as alu; -- Nominando
select alumnos.Codigo_alumno, alumnos.nombre, alumnos.apellidos from alumnos; -- Nominando


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OPERADORES DE COMPARACION
/*
	<, >, (<>, != (Distinto))
    <=, >=, (= Utuk
    BETWEEN (Para intervalo de valores)
    LIKE (Para texto)
    IN ()
*/

-- OPERADOR DE COMPARACION "="
SELECT codigo_alumno, dni, nombre, apellidos FROM alumnos WHERE Codigo_alumno = 104;
SELECT codigo_alumno, dni, nombre, apellidos FROM alumnos WHERE dni = '36456632G'; -- NOTA: al ser un VARCHAR va con LIKE "Mas recomendable"

-- OPERADOR DE COMPARACION "LIKE"
SELECT codigo_alumno, dni, nombre, apellidos FROM alumnos WHERE dni LIKE '36456632G'; -- NOTA: para datos Alfanumericos más recomendable LIKE

-- OPERADOR DE COMPARACION "NOT LIKE"
SELECT codigo_alumno, dni, nombre, apellidos FROM alumnos WHERE dni LIKE '36456632G'; -- NOTA: para datos Alfanumericos más recomendable LIKE
SELECT codigo_alumno, dni, nombre, apellidos FROM alumnos WHERE nombre LIKE 'Pepe';
SELECT codigo_alumno, dni, nombre, apellidos FROM alumnos WHERE nombre NOT LIKE 'Pepe';

-- OPERADOR DE COMPARACION "<, <=, >, <="
SELECT codigo_alumno, dni, nombre, apellidos FROM alumnos WHERE Codigo_alumno < 105;
SELECT codigo_alumno, dni, nombre, apellidos FROM alumnos WHERE Codigo_alumno <= 105;
SELECT codigo_alumno, dni, nombre, apellidos FROM alumnos WHERE Codigo_alumno > 105;

-- OPERADOR DE COMPARACION DISTINTO "<>, =!"
SELECT codigo_alumno, dni, nombre, apellidos FROM alumnos WHERE Codigo_alumno <> 105;
SELECT codigo_alumno, dni, nombre, apellidos FROM alumnos WHERE Codigo_alumno != 105;

-- OPERADOR DE COMPARACION "BETWEEN" (Para establecer un rango "Los valores de inicio o de fin son tomados por el BETWEEN")
SELECT codigo_alumno, dni, nombre, apellidos, cp, provincia FROM alumnos WHERE CP BETWEEN 28000 AND 28999;
SELECT codigo_alumno, dni, nombre, apellidos, cp, provincia FROM alumnos WHERE CP NOT BETWEEN 28000 AND 28999;


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OPERADORES LOGICOS 
/*
	NOT 
    OR 
    AND
*/
-- OPERADOR LOGICO "AND" (Intervalo)
SELECT codigo_alumno, dni, nombre, apellidos FROM alumnos WHERE Codigo_alumno > 105 AND Codigo_alumno < 108;
SELECT codigo_alumno, dni, nombre, apellidos FROM alumnos WHERE Codigo_alumno >= 105 AND Codigo_alumno <= 108;
SELECT codigo_alumno, dni, nombre, apellidos FROM alumnos WHERE (Codigo_alumno >= 105) AND (Codigo_alumno <= 108);
SELECT codigo_alumno, dni, nombre, apellidos, cp, provincia FROM alumnos WHERE cp >= 28000 AND cp <= 28999;
SELECT codigo_alumno, dni, nombre, apellidos, cp, provincia FROM alumnos WHERE NOT (cp >= 28000 AND cp <= 28999);

-- OPERADOR LOGICO "OR"
SELECT codigo_alumno, dni, nombre, apellidos, cp, provincia FROM alumnos WHERE cp >= 28000 OR cp <= 28999;

-- OPERADOR LOGICO "OR" + "AND"
SELECT codigo_alumno, dni, nombre, apellidos, cp, provincia FROM alumnos WHERE (cp >= 28000 AND cp <= 28999) OR cp = 14001;
SELECT codigo_alumno, dni, nombre, apellidos, cp, provincia FROM alumnos WHERE (cp >= 28000 AND cp <= 28999) OR cp = 14001;


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OPERADOR LIKE
/*
	% Sustituye uno o mas caracteres. Ej M% = Madrid, Macerena, Montreal...
    _ Sustituye un solo cartacter. Ej: Pep_ = Pepe, Pepa, Pepo
*/

-- OPERADOR LIKE %
SELECT codigo_alumno, nombre, apellidos FROM alumnos WHERE nombre LIKE 'P%';
SELECT codigo_alumno, nombre, apellidos FROM alumnos WHERE nombre NOT LIKE 'P%';
SELECT codigo_alumno, nombre, apellidos FROM alumnos WHERE nombre LIKE '%lo%';

-- OPERADOR LIKE _
SELECT codigo_alumno, nombre, apellidos FROM alumnos WHERE nombre LIKE 'Pep_';

-- OPERADOR LIKE _ + %
SELECT codigo_alumno, nombre, apellidos FROM alumnos WHERE nombre LIKE '_ar%';


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OPERADOR IN (datos, datos)
/*
	IN (Datos, 'Datos'...) Este operador es igual a un OR incluyendo lo datos metidos NOTA: al ser una funcion lleva parentesis ()
*/

SELECT codigo_alumno, nombre, apellidos, provincia FROM alumnos WHERE provincia IN ('Córdoba', 'Alicante', 'Murcia');
SELECT codigo_alumno, nombre, apellidos, provincia FROM alumnos WHERE provincia NOT IN ('Córdoba', 'Alicante', 'Murcia');
SELECT codigo_alumno, nombre, apellidos, provincia FROM alumnos WHERE provincia LIKE 'Alicante' OR provincia LIKE 'Córdoba' OR provincia LIKE 'Murcia';
SELECT codigo_alumno, nombre, apellidos, provincia FROM alumnos WHERE provincia NOT LIKE 'Alicante' OR provincia NOT LIKE 'Córdoba' OR provincia NOT LIKE 'Murcia';


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OPERADOR TERNARIO IF - ELSE
/*
	IF (EXPRESION, valor_verdadero, valor_falso)
    VA DENTRO DEL SELECT 
    RECOIMENDA PONER UN AS
*/

SELECT nombre, apellidos, cp, if(cp >= 28000 AND cp <= 28999, 'Son de Madrid', 'No Son Madrileños') AS 'De donde son', provincia FROM alumnos;
SELECT nombre, apellidos, cp, if(cp BETWEEN 28000 AND 28999, 'Son de Madrid', 'No Son Madrileños') AS 'De donde son', provincia FROM alumnos;


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ENLAZAR TABLA CON WHERE

SELECT codigo_alumno, alumnos.nombre AS 'Nombre alumno', apellidos, codigo, asignaturas.nombre AS 'Nombre asignatura' FROM alumnos, asignaturas WHERE alumnos.codigo_asignatura = asignaturas.codigo ORDER BY codigo_alumno;

SELECT codigo_alumno, alumnos.nombre AS 'Nombre alumno', apellidos, provincia, codigo, asignaturas.nombre AS 'Nombre asignatura' FROM alumnos, asignaturas WHERE alumnos.codigo_asignatura = asignaturas.codigo AND provincia LIKE 'Madrid' ORDER BY codigo_alumno;

SELECT codigo, asignaturas.nombre AS 'Nombre asignatura', codigo_alumno, alumnos.nombre AS 'Nombre alumno', apellidos FROM alumnos, asignaturas WHERE asignaturas.codigo = alumnos.codigo_asignatura;

SELECT codigo, a.nombre AS 'Nombre asignatura', codigo_alumno, b.nombre AS 'Nombre alumno', apellidos FROM alumnos AS a, asignaturas AS b WHERE b.codigo = a.codigo_asignatura; -- Nominando tablas

SELECT codigo, asignaturas.nombre AS 'Nombre asignatura', codigo_alumno, alumnos.nombre AS 'Nombre alumno', apellidos FROM alumnos, asignaturas; -- Producto cartesiano

SELECT alu.codigo_alumno, alu.dni, alu.nombre AS 'Nombre alumno', alu.apellidos, asig.codigo, asig.nombre FROM alumnos AS 'alu', asignaturas AS 'asig' WHERE alu.codigo_asignatura = asig.codigo; -- ERROR EN ' ' NO SE PERMITE


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- IS NULL / IS NOT NULL
/*
IS NULL DEVUELVE LOS CAMPO NULL
IS NOT NULL DEVUELVE LOS CAMPO QUE NO SON NULL
*/

SELECT * FROM alumnos WHERE telefono_fijo IS NULL;
SELECT * FROM alumnos WHERE telefono_fijo IS NOT NULL;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OPERACIONES MATEMATICAS BASICAS

SELECT 25+9 AS SUMA;
SELECT (23*5)+4 + (33/3) AS op;
SELECT *, (creditos + 2) AS 'Credito + 2' FROM asignaturas;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCIONES DE AGREGADO
/*
COUNT: UTILIZADA PARA DEVOLVER EL NUMERO DE REGISTROS DE LA SELECCION
	COUNT(*) O UNA COLUMNA ESPECIFICA COUNT(nombre)
    NO CUENTA LOS NULL
    
SUM: UTILIZADA PARA DEVUELVE LA SUMA DE TODOS LOS VALORES
	SUM(ALL[DISTINC]nombre_columna)

MAX: DEVUELVE EL VALOR MAXIMO DE LA EPXPRESION
	SE PUEDE UTILIZAR CON CARACTERES, DATE.. EXEPTO CON BIT
    NO SE PERMITE EN SUBCONSULTAS
    
MIN: DEVUELVE EL VALOR MINIMO DE LA EPXPRESION
	SE PUEDE UTILIZAR CON CARACTERES, DATE.. EXEPTO CON BIT
    NO SE PERMITE EN SUBCONSULTAS

AVG: UTILIZADA PARA LA MEDIA ARITMETICA 
*/
SELECT COUNT(*) AS Num_alum FROM alumnos;
SELECT COUNT(nombre) AS Num_alum FROM alumnos;
SELECT DISTINCT COUNT(nombre) AS Num_alum FROM alumnos; -- SIGUE SIENDO 11 PORQUE NO CUENTA LOS NOMBRES SINO LOS REGISTROS 
SELECT COUNT(telefono_fijo) AS Num_alum FROM alumnos; -- DA 8 DE 11 TUPLAS PORQUE HAY 3 NULL Y NO LOS CUENTA

SELECT SUM(creditos) AS 'Sumatorio creditos' FROM asignaturas; -- 87
SELECT SUM(DISTINCT creditos) AS 'Sumatorio creditos' FROM asignaturas; -- 75
SELECT (SUM(creditos)/count(nombre)) AS 'Media' FROM asignaturas; -- AVG

SELECT AVG(creditos) AS 'Media' FROM asignaturas;
SELECT ROUND(AVG(creditos),2) AS 'Media' FROM asignaturas;

SELECT MAX(creditos) as 'Maximo_credito' FROM asignaturas;
SELECT MIN(creditos) as 'Maximo_credito' FROM asignaturas;

SELECT count(*) AS 'Num_asig', SUM(creditos) AS 'Total credito', MAX(creditos) AS 'Credito_max', MIN(creditos) AS 'Credito_min', AVG(creditos) AS 'Media_credito' FROM asignaturas;



-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCIONES ROUND
/*
ROUND: ROUND(parametro1, parametro2) 
	parametro1: valor, columna o dato a redondear
    parametro2: numero de decimales
*/

SELECT ROUND(12.35423543, 3) AS 'redondeo';
SELECT ROUND(12.35423543, 0) AS 'redondeo'; -- 12
SELECT ROUND(12.35423543) AS 'redondeo'; -- 12
SELECT ROUND(AVG(creditos),2) AS 'Media' FROM asignaturas;
SELECT ROUND(((3+24)/2.5), 2) AS 'redondeo';


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- GROUP BY 

/*
	ESTRUCTURA: SELECT campos FROM tablas WHERE criterio GROUP BY campos contenido HAVING
*/

-- A) Cuantos alumnos tengo por cada provincia
SELECT COUNT(nombre) AS 'Num_alum', provincia FROM alumnos GROUP BY provincia;
-- B) Muestra los 4 departamentos que existen y cuenta las asignaturas que tiene cada departamento
SELECT departamento, COUNT(nombre) AS 'Asignatura' FROM asignaturas GROUP BY departamento;
-- C) Muestra las asignaturas que existen y cuenta el número de alumnos matriculados en cada una de ellas
SELECT asignaturas.nombre, COUNT(alumnos.codigo_asignatura) AS 'Alumno matriculado' FROM alumnos, asignaturas WHERE alumnos.codigo_asignatura = asignaturas.codigo GROUP BY codigo_asignatura;



-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT
/*
	INSERT INTO tabla [(columna...)] {VALUES (valor1,) | SELECT consulta} ES DECIR:
		- INSERT INTO tabla [( * )] VALUES (valor1,...)
		- INSERT INTO tabla [(columna...)] VALUES (valor1,...)
        - INSERT INTO tabla [(columna...)] VALUES ((valor1,...),  (valor1,...),  (valor1,...)) VARIAS TABLAS
        - INSERT INTO tabla [(columna...)]  SELECT consulta FROM tabla - PARA INSERTAR DESDE OTRA TABLA
        
        SI TENEMOS QUE INTRODUCIR CAPOS NULOS TENEMOS QUE DECLARAR LOS CAMPOS EN EL INSERT;
        ENTRE COMILLA:
			- CADENA DE TEXTO
            - FECHAS
            - NUMERO (OPCIONAL)
*/

INSERT INTO asignaturas VALUES ('10', 'Ingeniería de Software II', 14, 'Base de Datos');
INSERT INTO asignaturas(codigo, nombre, creditos, departamento) VALUES (9, 'Ingeniería de Software I', 15, 'Base de Datos');
INSERT INTO asignaturas(codigo, nombre, creditos, departamento) VALUES (11, 'Programación Orientada a Objeto', 10, 'Programación de Sistemas');
INSERT INTO asignaturas VALUES ('12', 'Oracle 12c', 10, 'Base de Datos'), (13, 'Oracle 11g', 12, 'Base de Datos'), (14, 'MySQL', 12, 'Base de Datos');

INSERT INTO alumnos(codigo_alumno, dni, nombre, apellidos, direccion, localidad, provincia, cp, telefono_movil, codigo_asignatura) VALUES (111, '301452132K', 'Ana', 'Torres García', 'C/ Tendillas 3', 'Córdoba', 'Córdoba', 14002,'600123123', 4);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FECHAS
/*
	FORMATO ORIGEN: ('YYYY-MM-DD')
    FORMATO ADMISIBLES: ('03-05-21'), ('04.05.21'), ('05/05/21'), ('06@05@21'), (NOW())
*/
CREATE DATABASE pruebas;
USE pruebas;

CREATE TABLE tablaFechas (
	id INT NOT NULL AUTO_INCREMENT,
    fecha DATE DEFAULT NULL, 
    PRIMARY KEY(id)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_spanish_ci;

INSERT INTO tablafechas VALUES ('2022-05-24'); -- DA PROBLEMA PORQUE AL NO PONER TODOS LOS DATOS EN EL VALUE DEBIDO AL AUTOINCREMENT ME DA ERROR !!EL AUTOIMCREMENT NUNCA SE PONER POR ESO MISMO HAY QUE DECLARAR LA COLUMNA¡¡
INSERT INTO tablafechas(fecha) VALUES ('2022-05-24');
INSERT INTO tablafechas(fecha) VALUES ('03-05-21'), ('04.05.21'), ('05/05/21'), ('06@05@21'), (NOW());
INSERT INTO tablafechas(fecha) VALUES ('2022-50-24'); -- NO NOS LO PERMITE

SELECT * FROM tablafechas;



-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COPIAS DE TABLAS // EXAMEN!

/*
	EXISTEN DOS FORMATOS:
    1. CREATE TABLE nombre_tabla_nueva SELECT * FROM nombre_tabla_original (NOTA: la tabla se ha creado con todos los parametros de la otra tabla, EXEPTO!!)
		1.1 CREATE TABLE nombre_tabla_nueva SELECT campo1, campo2.. FROM nombre_tabla_original;
        1.2 CREATE TABLE nombre_tabla_nueva SELECT campo1, campo2.. FROM nombre_tabla_original WHERE ..LIKE..AND..OR;
		- NO TRASPASA:
			1. NO TRASPASA FK Y PK
			2. NO TRASPASA AUTOINCREMENT 
			3. NO TRASPASA INDICE
			4. NO TRASPASA EL MOTOR
        
	2. CREATE TABLE nombre_tabla_nueva LIKE nombre_tabla_original; (LA CREA CON TODOS LOS PARAMETROS EXEPTO LA FK Y VACÍA DE DATOS)
	- NO TRASPASA:
		1. NO TRASPASA FK 
        2. NO TE PERMITE ALGUNOS CAMPOS, TIENE QUE SER CON TODOS
        
        NOTA: CUIDADO CON LA INTEGRIDAD REFERENCIAL DE LA TABLAS AL PODER PONERSE EN MODO CASCADA
        
	3. INSERTAR VALORES EN UNA TABLA 
		- INSERT INTO nombre_tabla_nueva SELECT campos FROM nombre_tabla_antigua;
        - INSERT INTO nombre_tabla_nueva SELECT campos FROM nombre_tabla_antigua WHERE ...; ''CON MODIFICADORES''
*/

CREATE TABLE alum_copia1 SELECT * FROM alumnos;
SELECT * from alum_copia1;

CREATE TABLE alum_copia2 SELECT codigo_alumno, nombre, apellidos FROM alumnos;
SELECT * from alum_copia2;

CREATE TABLE alum_copia3 SELECT * FROM alumnos WHERE provincia LIKE 'Córdoba';
SELECT * from alum_copia3;

CREATE TABLE libros_copia1 LIKE libros;
SELECT * FROM libros_copia1;
INSERT INTO libros_copia1 SELECT * FROM libros;
SHOW CREATE TABLE libros_copia1;

CREATE TABLE libros_copia2 LIKE libros;
SELECT * FROM libros_copia2;
TRUNCATE libros_copia2;
INSERT INTO libros_copia2 SELECT * FROM libros WHERE autor LIKE 'Lewis Carroll';


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DELETE

/*
	EXISTE UNA VARIABLE DE ENTORNO QUE NO TE PERMITE BORRAR LA TABLA COMPLETA, PARA ELLO DEBEMOS CAMBIARLA:
		1) REALIZAR SELECT DE COMPROBACION
		2) DESACTIVAR MODO SEGURO: SET SQL_SAFE_UPDATES = 0;
        3) DELETE FROM nombre_tabla WHERE codicion 	
        4) ACTIVAR EL MODO SEGUDO: SET SQL_SAFE_UPDATES = 1;
*/

CREATE TABLE alum_copia2 SELECT * FROM alumnos;
SELECT * FROM alum_copia2;

SELECT * FROM alum_copia2 WHERE codigo_alumno = 105;
DELETE FROM alum_copia2 WHERE codigo_alumno = 105; -- ERROR: ESTÁ ACTIVADO EL MODO SEGURO
SET SQL_SAFE_UPDATES = 0; -- QUITAR EL MODO SEGURO
DELETE FROM alum_copia2 WHERE codigo_alumno = 105;
SET SQL_SAFE_UPDATES = 1; -- ACTIVAR EL MODO SEGURO

SELECT * FROM alum_copia2 WHERE DNI LIKE '636796749h';
SET SQL_SAFE_UPDATES = 0;
DELETE FROM alum_copia2 WHERE DNI LIKE '636796749h';
SET SQL_SAFE_UPDATES = 1;



-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INTEGRIDAD

/*
LA INTEGRIDAD REFERENCIAL ES LA RELACION DE LAS TABLAS EN RELACION A SU ELIMINACIÓN POR ELLO SE PONER EN NO ACTION, SI SE PONE EN CASCADA ELIMINANOS LOS ELEMENTO RELACIONADOS
*/

SELECT * FROM asignaturas;
SELECT * FROM alumnos;
-- ELIMINACION EN CASCADA
INSERT INTO `colegio`.`alumnos` (`Codigo_alumno`, `DNI`, `Nombre`, `Apellidos`, `Direccion`, `Localidad`, `Provincia`, `CP`, `Telefono_fijo`, `Telefono_movil`, `Codigo_asignatura`, `Fecha_nacimiento`) 
VALUES ('123', '22222222A', 'Luisa', 'Perezperez', 'C/loro, 4', 'Alcorcon', 'Madrid', '28540', '9111111', '655344111', '13', '1981-10-22');
-- ELIMINACION EN CASCADA
SELECT * FROM alumnos WHERE codigo_alumno = 123;
DELETE FROM alumnos WHERE codigo_alumno = 123;
-- ELIMINACION EN CASCADA
SELECT * FROM asignaturas WHERE codigo = 13;
DELETE FROM asignaturas WHERE codigo = 13;



-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UDATE

/*
1) PROBAR CON UN SELECT
2) SET SQL_SAFE_UPDATE = 0; CUANDO SE NECESARIOS
3) UPDATE nombre_tabla SET columa = valor WHERE columna_referencia = valor [AND | OR CONDICION];
	3.1) UPDATE nombre_tabla SET columa1 = columna1 + 3 WHERE columna_referencia = valor [AND | OR CONDICION];----- FUNCION EN EL UPDATE
	3.2) UPDATE nombre_tabla SET columa1 = valor, columna2 = valor.... WHERE columna_referencia = valor [AND | OR CONDICION];-----VARIAS ACTUALIZACIONES EN UNA MISMA TUPLA
    3.3) UPDATE nombre_tabla SET columa = valor; -----PARA TODA LA TABLA
    3.4) INTEGRIDAD REFERENCIAL CON LA ACTUALIZACIÓN EN CASCADA
4) SET SQL_SAFE_UPDATE = 1;
*/

SELECT * FROM asignaturas WHERE codigo = 3;
UPDATE asignaturas SET creditos = 13 WHERE codigo = 3;

SELECT * FROM asignaturas WHERE creditos < 17;
SET SQL_SAFE_UPDATES = 0;
UPDATE asignaturas SET creditos = creditos + 2 WHERE creditos < 15;
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM alumnos WHERE Codigo_alumno = 107; 
UPDATE alumnos SET nombre = 'Carlos', apellidos = 'Lora Lora' WHERE Codigo_alumno = 107 ;

CREATE TABLE alum_cp2 SELECT * FROM alumnos;
SELECT * FROM alum_cp2; 
SET SQL_SAFE_UPDATES = 0;
UPDATE alum_cp2 SET codigo_alumno = codigo_alumno + 200;
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM asignaturas, alumnos WHERE codigo = codigo_asignatura AND codigo_asignatura = 2 ;
UPDATE asignaturas SET codigo = 2 WHERE codigo = 19; 



-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONCAT

/*
	TEXTO: SELECT CONCAT ('Hola ', 'a ', 'todos') AS saludo;
    TEXTO: SELECT CONCAT ('Hola ', 'a ', 'todos') saludo; -- EL ALIAS ES OPCIONAL
    COLUMNAS Y TEXTO:  SELECT columna1, columna2, CONCAT ('Hola amigo: ', nombre , apellidos) AS saludo FROM tabla;
*/

SELECT CONCAT ('Hola ', 'a ', 'todos') AS saludo;
SELECT CONCAT ('Hola ', 'a ', 'todos') saludo; -- EL ALIAS ES OPCIONAL
SELECT codigo_alumno, dni, CONCAT ('Hola amigo: ', nombre, ' ' , apellidos) AS saludo FROM alumnos;
 


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DDL

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE DATABASE
/*
CREATE {CREATE | SCHEMA} [IF NOT EXISTS] nombre_basededatos(
	----
	----
) CHARACTER SET = nombre_caracter COLLATION = nombre_collation ENGINE nombre;

 - SI NO SE ESPECIFICA NULL NI NOT NULL, EL CAMPO ES NULL
 - PRIMARY KEY DEBE DEFINIRSE COMO NOT NULL
 - LAS COLUMNAS BLOB Y TEXT NO PUEDEN TENER UN VALOR POR DEFECTO
*/

CREATE DATABASE prueba2; -- SI VOLVEMOS A EJECUTAR UNA VEZ EJECUTADA NOS DA UN ERROR Y NOS PARA EL PROGRAMA O LA EJECUCION
CREATE DATABASE IF NOT EXISTS prueba2; -- SOLO NOS DA UN WARNING PERO NO PARA EL PROGRAMA
CREATE SCHEMA IF NOT EXISTS prueba2; -- SINONIMO DE DATABASE

CREATE DATABASE IF NOT EXISTS prueba1 CHARACTER SET latin1 COLLATE latin1_spanish_ci;
USE prueba1;

CREATE TABLE IF NOT EXISTS tabla1(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    campo1 VARCHAR(10) CHARACTER SET latin1 COLLATE latin1_german1_ci 
) CHARACTER SET latin1 COLLATE latin1_danish_ci COMMENT = 'Comentario';

SHOW CREATE TABLE tabla1;

CREATE TABLE IF NOT EXISTS cliente(
	nif VARCHAR(9) NOT NULL COMMENT 'Clave principal',
    nombre VARCHAR(50) NOT NULL, 
    apellidos VARCHAR(100) NOT NULL,
    telefono INT UNSIGNED NOT NULL, 
    codigo_postal MEDIUMINT UNSIGNED NOT NULL,
    edad TINYINT UNSIGNED ZEROFILL NULL DEFAULT NULL,
    sexo CHAR(1) NOT NULL DEFAULT 'M',
    profesion TEXT NOT NULL, 
	PRIMARY KEY(nif)
) ENGINE = InnoDB;



-- CREATE DATABASE TEMPORARY 

/*
ESTA TABLA ES UNA TABLA TEMPORAL QUE SOLO VA A GUARDAR LOS DATOS DURANTE EL INICIO DE SECCIÓN DEL USUARIO, ESTA TABLA TAMBIEN PUEDE COPIAR A LA TABLA ORIGINA DE LA BASE. DURANTE ESTE TIEMPO LA COPIA FUNCIONARA HASTA 
EL FIN DE LA SECCIÓN. ES UNA COPIA DE LA TABLA EN MEMORIA. SE PUEDE PONER UN NOMBRE A LA TABLA TEMPORAL, PERO SIEMPRE ES MEJOR EL MISMO NOMBRE DE LA TABLA COPIADA

CREATE TEMPORARY {CREATE | SCHEMA} [IF NOT EXISTS] nombre_basededatos(
	----
	----
) CHARACTER SET = nombre_caracter COLLATION = nombre_collation ENGINE = nombre;
*/


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DROP
/*
DROP DATABASE nombre_base; -- SI NO EXISTE NOS DA UN FALLO PARANDO LA EJECUCION
DROP DATABASE IF EXISTS nombre_base; -- SI UTILIZAMOS ESTE FORMATO NO EVITAMOS PROBLEMA DE PARADA DE LA EJECIÓN
*/

DROP DATABASE prueba2;
DROP DATABASE IF EXISTS prueba2;



-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CARACTER SET & COLLATION

/*
VISUALIZACION CARACTERES (NOTA ADMITE LIKE)
	- SHOW CHARACTER SET; (CUANDO MOSTRAMOS LOS CHASET EL COLLATION QUE NOS APARECE ES UNO DE DEFAULT QUE NOSOTROS PODEMOS ASIGNAR O CAMBIAR CON EL COLLATE)
    - SHOW CHARACTER SET LIKE 'utf%';
    
EL JUEGO DE CARACTERES POR DEFAULT = utf8mb4 Y EL COLLATE = utf8mb4_0900_ai_ci

VISUALIZACION COLLATE
	- SHOW COLLATION;
    - SHOW COLLATION WHERE CHARSET LIKE 'nombre_character';

CS: CASE SENSITIVE
CI: CASE INSESITIVE

ESTO SE PUEDE ASIGNAR A LA BASE DATOS, A LAS TABLAS Y A LOS CAMPOS TODO POR SEPARADO
*/

SHOW CHARACTER SET;
SHOW CHARACTER SET LIKE 'utf%';
SHOW COLLATION;
SHOW COLLATION WHERE CHARSET LIKE 'latin1';

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECK

/*
	UN CHECK ES UN CONSTRAINT ES DECIR UNA RESTRICCIÓN 
	POSICION:
		1. AL LADO DE CAMPO "COLUMNA"
        2. ABAJO
	FORMATO:
		1. CHECK(EXPRESION) A LADO DEL CAMPO
        2. CONSTRAINT nombre CHECK(EXPRESION) NOT ENFORCED -- ENFORCED SIGNIFICA QUE SE FUERZE A QUE SE CUMPLA EL CHECK POR DEFAULT VA ENFORCED. TAMBIÉN SE PUEDE PONER NOT ENFORCED PARA NO INTRODUCIR LOS DATOS
	EJEMPLO:
		CREATE TABLE tabla_ejm1(
		CHECK( c1 <> c2),
		c1 INT CHECK (c1 > 10),
		c2 INT CONSTRAINT c2_positive CHECK(c2 > 0),
		c3 INT CHECK (c3 < 100),
		CONSTRAINT c1_nonzero CHECK(c1 <> 0), CHECK(c1 > c3),
		CHECK(c1 <> c2 AND c2 <> c3));

*/

USE prueba1;

CREATE TABLE libros(
 id VARCHAR(15) NOT NULL,
 name VARCHAR(50),
 num_page INT CHECK(num_page > 0),
 PRIMARY KEY (id)
 );

CREATE TABLE libros2(
 id VARCHAR(15) NOT NULL,
 name VARCHAR(50),
 num_page INT CHECK(num_page > 0) NOT ENFORCED,
 PRIMARY KEY (id)
 );
 
 CREATE TABLE libros2(
 id VARCHAR(15) NOT NULL,
 name VARCHAR(50),
 num_page INT CHECK(num_page > 0) NOT ENFORCED,
 PRIMARY KEY (id)
 );

INSERT INTO libros VALUES (1, 'Libro1',0);-- Error Code: 3819. Check constraint 'libros_chk_1' is violated
INSERT INTO libros2 VALUES (1, 'Libro1',0);-- Al ser NOT ENFORCED te deja introducirlo

CREATE TABLE IF NOT EXISTS ciudad(
	aut_id VARCHAR(8) NOT NULL, 
    home_city VARCHAR(25) NOT NULL, 
	country VARCHAR(25) NOT NULL, 
    PRIMARY KEY(aut_id,home_city),
    CONSTRAINT CHK_UNA CHECK(country IN('USA', 'UK', 'India')),
    CONSTRAINT CHK_DOS CHECK(aut_id > 0)
);

INSERT INTO ciudad VALUES(0, 'SEVILLA', 'USA');-- Error Code: 3819. Check constraint 'CHK_DOS' is violated.
INSERT INTO ciudad VALUES(1, 'SEVILLA', 'ESPAÑA'); -- Error Code: 3819. Check constraint 'CHK_UNA' is violated.

CREATE TABLE tabla_ejm1(
	CHECK( c1 <> c2),
    c1 INT CHECK (c1 > 10),
    c2 INT CONSTRAINT c2_positive CHECK(c2 > 0),
    c3 INT CHECK (c3 < 100),
    CONSTRAINT c1_nonzero CHECK(c1 <> 0), CHECK(c1 > c3),
    CHECK(c1 <> c2 AND c2 <> c3)
);


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TABLAS TEMPORALES

/*
CREATE TEMPORARY TABLE IF NOT EXISTS nombre_tabla_temporal SELECT campos FROM tabla;

FROMAS:
	1. COM EL MISMO NOMBRE, POR LO CUAL OCULTAMOS LA TABLA COPIADA
    2. CON UN NOMBRE DIFERENTE, PAQUI DICE PONER TMP_NOMBRE_TABLA PERO QUE A ELEGIR POR ELLA PARA QUE NO EXISTA FALLO HACERLO CON EL MISMO NOMBRE

BORRADO:
	1. CERRAR EL WORKBENCH
	2. DROP TEMPORARY TABLE asignata;
    3. BORRANDO LA TABLA TEMPORAL, PERO SI LE DAMOS DOS VECE AL (DELETE FROM tabla;)
ERROR 
	CREATE TEMPORARY TABLE IF NOT EXISTS nombre_tabla_temporal LIKE tabla;
    
INFO
	SI CREAMOS UNA TABLA TEMPORAL LAS RELACIONES DE FK NO FUNCIONA SI BORRAMOS EN UNA TABLA NO SE PRODUCE EL EFECTO EN CASCADA
*/
USE colegio;

-- TABLA TEMPORAL CON EL MISMO NOMBRE
CREATE TEMPORARY TABLE IF NOT EXISTS asignaturas SELECT * FROM asignaturas;

-- TABLA TEMPORAL CON EL MISMO NOMBRE CON LIKE !ERROR!
CREATE TEMPORARY TABLE IF NOT EXISTS alumnos LIKE alumnos;

-- ESTRUCTURA DE LA TABLA TEMPORAL CON EL MISMO NOMBRE
SHOW CREATE TABLE asignaturas;

-- BORRADO PRUEBA DE UN DATO DE LA TABLA TEMPORAL
SET SQL_SAFE_UPDATES=0;
DELETE FROM asignaturas WHERE codigo=201;
SET SQL_SAFE_UPDATES=1;

SELECT * FROM asignaturas;
SELECT * FROM alumnos;

-- BORRADO TABLA TEMPORAL
DROP TEMPORARY TABLE asignaturas;

-- TABLA TEMPORAL CON DIFERENTE  NOMBRE !!NO OCULTA A LA TEMPORAL¡¡
CREATE TEMPORARY TABLE IF NOT EXISTS TMP_asignaturas SELECT * FROM asignaturas;
SHOW CREATE TABLE TMP_asignaturas;
SELECT * FROM TMP_asignaturas;

SHOW databases;


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  INDEX

/*
	UN INDICE SE PUEDE CREAR EN LA CREACION DE LA TABLA O A FUERA UNA VEZ CREADA LA TABLA
    
    CREATE [UNIQUE][FULLTEXT][SPATIAL] INDEX -- TIPOS
    LOS INDICES PUEDE SER COMPUESTO
    PUEDE SER ASC O DESC PERO POR DEFAULT ES ASC
    NO PUEDE SER NULL
    CONTRA MENOS CAMPOS INTERVENGA EN EL INDEX MEJOR  
    NO RECONOCE MENOS DE TRES CARACTERES
    
    FORMATO: 
		1. FORMA BÁSICA: CREATE INDEX nombre_indice ON nombretabla(campos)
        2. FORMA BÁSICA MULTIPLE O COMPUESTO: CREATE INDEX nombre_indice ON nombretabla(campos1, campos2, campos3)
        3. FORMA BÁSICA CON TAMAÑO: CREATE INDEX nombre_indice ON nombretabla(campos(leght))
			LEGHT SE PONE CON UN NUMERO EJEMPLO = (nombre(10), apellido1(5), apellido2(10))
		
        
	TIPOS:
		1. EL PRIMARY KEY
        2. KEY E INDEX: SON SINONIMOS Y SON POR DEFECTO
        3. UNIQUE: ESTA ES PARA LA CLAVE CANDIDATA EJEMPLO DNI, NO PERMITE EL ALMACENAMIENTO DUPLICADO
			CREATE UNIQUE INDEX nombre_index ON nombre_tabla(columna)
            SOLO UNA COLUMNA!!!!
        4. FULLTEXT: PERMITE BUSCAR PALABRAS Y SOLO SE PUEDE USAR EM COLUMNAS CHAR, VARCHAR, Y TEX
			CREATE FULLTEXT INDEX nombre_index ON nombre_tabla(columna) 
            PUEDE SER DE VARIOS CAMPOS
        5. SPATIAL SOLO PARA DATA ESPACIALES 
        
	ELMINAR:
        DROP INDEX nombre_indice ON tabla;
        SI NO DECLARA EL NOMBRE DEL INDICE CON SHOW CREATE TABLES;
*/

-- FULLTEXT
/* 
SURGE PARA BUSCAS VARIAS PALABRAS DENTRO DE UNA CADENA alter
ES CI

ESTRUCTURA SELECT id, titulo, contenido FROM articulos WHERE MATCH(titulo, contenido) AGAIST ('JAVA');
EL CONTENIDO DE MATCH 'TITULO Y CONTENIDO' DEBE ESTAR DECLARO EN EL INDEX FULLTEXT
*/

USE prueba1;

CREATE TABLE coches(
	idprod INT NOT NULL AUTO_INCREMENT, 
    nombre VARCHAR(120),
    descripcion VARCHAR(255),
    PRIMARY KEY(idprod)
);

INSERT INTO coches VALUES 
(1,'Audi A3 TDI','El Audi A3 es un compacto premium, cuyos rivales principales son los BMW Serie 1, Mercedes Clase A e Infiniti Q30.'),
(2,'Audi A4 TDI','El Audi A4 es la berlina de referencia de Audi, el rival de BMW Serie 3 y Mercedes Clase C'),
(3,'Audi A8 TDI','El Audi A8 es la gran berlina de Audi, rivaliza con el BMW Serie 7, el Mercedes Clase S y el Lexus LS'),
(4,'Audi 100','El modelo en sus variantes deportivas y de lujo se comercializó En 1995'),
(5,'Audi 100 CV','un cinco cilindros en línea de 2,3 litros y 133 CV,'),
(6,'coche con Equipo de Audio 100 Wats',NULL),
(7,'coche para audiencias',NULL);

SELECT * FROM coches;

-- 1. BUSCAR AUDI CON LIKE
SELECT * FROM coches WHERE nombre LIKE '%Audi%';

SELECT * FROM coches WHERE nombre LIKE '%AUDI%' AND nombre LIKE '%TDI%';

-- 2 Si quiero buscar Audi o TDI, con LIKE no es posible. Añadimos el indice fulltext
CREATE FULLTEXT INDEX id_full_nombre
ON coches(nombre);

SHOW CREATE TABLE coches;
SHOW INDEX FROM coches; -- MUESTRA LOS INDICES

-- BUSQUEDAD
-- BUSQUEDAD
SELECT * FROM coches WHERE MATCH(nombre) AGAINST('audi');
SELECT * FROM coches WHERE MATCH(nombre) AGAINST('audi tdi'); -- ES COMO UN OR
SELECT * FROM coches WHERE MATCH(nombre) AGAINST('TDI EQUIPO'); -- ES COMO UN OR
SELECT * FROM coches WHERE MATCH(nombre) AGAINST('TD'); -- NECESITA ALMENOS CON TRES CARACTERES
SELECT * FROM coches WHERE MATCH(nombre) AGAINST('TDI');

-- ELIMINAR 
DROP INDEX id_full_nombre ON coches;

-- CREA UN NUEVO INDICE FULLTEXT nombre y descripcion
CREATE FULLTEXT INDEX idx_nombre_drecri ON coches(nombre, descripcion);
SHOW INDEX FROM coches;




-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  JOIN

/*
INNER JOIN  (INNER ES OPCIONAL)

	- ES EL FORMATO SIMPLE EQUIVALENTE A LA IGUALDAD DE WHERE
	
    ESTRUCTURA 1:
		- SELECT campo1, campo2, FROM tabla1 INNER JOIN tabla2 ON tabla1.cod = tabla2.cod WEHERE...ORDER BY....LIMIT;  (LA TABLA PRIMERA EN LA IGUALADA ES LA PRIMERA EN PONER !!!)
	
    ESTRUCTURA 2 USING: CUANDO EL CAMPO DE IGUALDA ES EL MISMO NOMBRE
		- SELECT campo1, campo2, FROM tabla1 INNER JOIN tabla2 USING(CodigoComun) WEHERE...ORDER BY....LIMIT;
        
        
LEFT JOIN (IZQUIERDA)
	
	- COGE TODOS LOS CAMPOS DE LA IZQUIERDA Y TAMBIÉN LOS COMUNES
    
    ESTRUCTURA 1: 
		- SELECT campo1, campo2, FROM tabla1 LEFT JOIN tabla2 ON tabla1.cod = tabla2.cod WEHERE...ORDER BY....LIMIT;
	ESTRUCTURA 2 USING: CUANDO EL CAMPO DE IGUALDA ES EL MISMO NOMBRE
		- SELECT campo1, campo2, FROM tabla1 LEFT JOIN tabla2 USING(CodigoComun) WEHERE...ORDER BY....LIMIT;


RIGHT JOIN (DERECHA)
	
	- COGE TODOS LOS CAMPOS DE LA IZQUIERDA Y TAMBIÉN LOS COMUNES
    
    ESTRUCTURA 1: 
		- SELECT campo1, campo2, FROM tabla1 RIGHT JOIN tabla2 ON tabla1.cod = tabla2.cod WEHERE...ORDER BY....LIMIT;
	ESTRUCTURA 2 USING: CUANDO EL CAMPO DE IGUALDA ES EL MISMO NOMBRE
		- SELECT campo1, campo2, FROM tabla1 RIGHT JOIN tabla2 USING(CodigoComun) WEHERE...ORDER BY....LIMIT;


INNER JOIN (ANIDADOS)
	
    ESTRUCTURA:
		- SELECT * 
        FROM tabla1 
        INNER JOIN tabla2 ON tabla1.id = tabla2.id
        INNER JOIN tabla3 ON tabla.2id = tabla3.id
        INNER JOIN tabla4 ON tabla3.id = tabla4.id
        [WHERE....GROUP BY... ORDER BY...]
*/

USE coelgio4;
SELECT * FROM asignaturas;  -- 11
SELECT * FROM departamento; -- 6
SELECT * FROM alumnos; -- 11
SELECT * FROM alum_asig; -- 23 

-- INNER JOIN  (INNER ES OPCIONAL)
-- ESTRUCTURA 1:
SELECT codigo, nombre, nombre_dep FROM asignaturas INNER JOIN departamento ON asignaturas.cod_departamento = departamento.cod_departamento ORDER BY codigo;
-- ESTRUCTURA 2 USING:
SELECT codigo, nombre, nombre_dep FROM asignaturas INNER JOIN departamento USING(cod_departamento) ORDER BY codigo;

-- EJ1. MOSTRAR LAS NOTAS MEDIA DE ALUMNOS
SELECT alumnos.Cod_Alumno, nombre, apellido1, apellido2, NotaMedia FROM alumnos INNER JOIN alum_asig ON alumnos.Cod_Alumno = alum_asig.Cod_Alumno;
SELECT alumnos.Cod_Alumno, nombre, apellido1, apellido2, NotaMedia FROM alumnos INNER JOIN alum_asig ON alumnos.Cod_Alumno = alum_asig.Cod_Alumno WHERE alumnos.Cod_Alumno = 3 ORDER BY NotaMedia;
SELECT alumnos.Cod_Alumno, nombre, apellido1, apellido2, NotaMedia FROM alumnos INNER JOIN alum_asig USING(Cod_alumno);
SELECT alumnos.Cod_Alumno, nombre, apellido1, apellido2, NotaMedia FROM alumnos INNER JOIN alum_asig USING(Cod_alumno) WHERE alumnos.Cod_Alumno = 3 ORDER BY NotaMedia; 


-- LEFT JOIN  (INNER ES OPCIONAL)
-- ESTRUCTURA :
SELECT departamento.*, asignaturas.* FROM departamento LEFT JOIN asignaturas ON departamento.Cod_Departamento = asignaturas.Cod_Departamento;
SELECT departamento.*, asignaturas.* FROM departamento LEFT JOIN asignaturas USING(cod_departamento);

-- LEFT JOIN  (INNER ES OPCIONAL)
-- ESTRUCTURA :
SELECT departamento.*, asignaturas.* FROM asignaturas RIGHT JOIN  departamento ON asignaturas.Cod_Departamento = departamento.Cod_Departamento; -- INVERSION DE ORDEN


-- INNER JOIN (ANIDADOS)
-- ESTRUCTURA 
SELECT * FROM alumnos 
INNER JOIN alum_asig ON alumnos.Cod_Alumno = alum_asig.Cod_Alumno
INNER JOIN asignaturas ON alum_asig.Cod_Asignatura = asignaturas.Codigo
INNER JOIN departamento ON asignaturas.Cod_Departamento = departamento.Cod_Departamento;


-- MOSTRAR TODOS LOS ALUMNOS Y LA MEDIAS DE LOS CREDITOS DE SUS ASIGNATURAS
SELECT alumnos.nombre, Apellido1, Apellido2, DNI, ROUND(AVG(creditos), 2) 'Media credito' FROM alumnos 
INNER JOIN alum_asig USING (Cod_Alumno)
INNER JOIN asignaturas ON alum_asig.Cod_Asignatura = asignaturas.Codigo 
GROUP BY Cod_Alumno;


-- MOSTRAR TODOS LOS ALUMNOS Y LA MEDIAS DE LOS CREDITOS DE SUS ASIGNATURAS DE SEVILLA 
SELECT alumnos.nombre, Apellido1, Apellido2, DNI, ROUND(AVG(creditos), 2) 'Media credito' FROM alumnos 
INNER JOIN alum_asig USING (Cod_Alumno)
INNER JOIN asignaturas ON alum_asig.Cod_Asignatura = asignaturas.Codigo 
WHERE alumnos.Provincia LIKE 'Sevilla' GROUP BY alumnos.Cod_Alumno;


-- MOSTRAR TODOS LOS ALUMNOS Y LA MEDIAS DE LOS CREDITOS DE SUS ASIGNATURAS COD 3
SELECT alumnos.nombre, Apellido1, Apellido2, DNI, ROUND(AVG(creditos), 2) 'Media credito' FROM alumnos 
INNER JOIN alum_asig USING (Cod_Alumno)
INNER JOIN asignaturas ON alum_asig.Cod_Asignatura = asignaturas.Codigo 
WHERE alumnos.Cod_Alumno = 3 GROUP BY alumnos.Cod_Alumno;


-- MOSTRAR TODOS LOS ALUMNOS Y LA MEDIAS DE LOS CREDITOS DE SUS ASIGNATURAS. ADEMAS DE MADRID Y QUE LA MEDIA DE CREDITO SEA > 17
SELECT alumnos.nombre, Apellido1, Apellido2, DNI, ROUND(AVG(creditos), 2) AS Media_credito FROM alumnos 
INNER JOIN alum_asig USING (Cod_Alumno)
INNER JOIN asignaturas ON alum_asig.Cod_Asignatura = asignaturas.Codigo 
WHERE alumnos.Provincia LIKE 'Madrid' GROUP BY alumnos.Cod_Alumno HAVING Media_credito > 17;




-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  UNION

/*
	SE USA PARA COMBINAR UN NUMERO DE RESULTADOS DE COMANDO SELECT, NO DEVUELVE LOS RESULTADO REPETIDOS DEBEMOS USAR UNION ALL.
    
    SINTAXIS: SELECT... UNION [ALL | DISTINCT] SELECT ....
    
    SINTAXIS EJEMPLO: (SELECT a FROM tb_nombre WHERE a=10 AND b=1) UNION (SELECT a FROM tb_nombre WHERE a=11 AND b=2) ORDER BY colum;
*/

USE libreria;
CREATE TABLE libros2 LIKE libros;
INSERT INTO libros2 SELECT * FROM libros WHERE codigo IN(1,2,3);
SELECT * FROM libros2;

-- UNION DOS TABLAS (SOLO SE VE LOS REGISTRO DE LA TABLA1 PORQUE ESTA REPETIDOS)
SELECT * FROM libros
UNION
SELECT * FROM libros2;

-- INSERTO REGISTROS EN LA TABLA LIBROS2
INSERT INTO libros2 VALUES (4, 'M.Asensi', 'El último catón'), (5,'Perez Reverte', 'El capitán Alatriste');

-- AL EXISTIR REGISTROS DIFERENTE ENTRE LA TABLAS SE MUESTRA TODOS LOS DIFERENTES
SELECT * FROM libros 
UNION
SELECT * FROM libros2;

-- LA OPCION ALL PONE TODOS LOS ELEMENTOS DE LAS DOS TABLAS EN LA MEMORIA 
SELECT * FROM libros 
UNION ALL
SELECT * FROM libros2;

-- UNION DE CAMPOS ESPECIFICOS IGUALES
SELECT autor, titulo FROM libros 
UNION 
SELECT autor, titulo FROM libros2;

-- UNION DE CAMPOS ESPECIFICOS DIFERENTES "EROR 1222 NO SE PUEDE UNIR DIFERENTE NUMERO DE COLUMNA"
SELECT * FROM libros 
UNION 
SELECT autor, titulo FROM libros2;

-- UNION DE CAMPOS ESPECIFICOS DIFERENTES SIN "ERROR" AL TENER EL MISMO NUMERO DE COLUMNA
SELECT codigo, titulo FROM libros 
UNION 
SELECT autor, titulo FROM libros2;

-- CREACION DE LIBROS3 CON LIBROS Y LIBROS2
CREATE TABLE libros3 
(SELECT * FROM libros 
UNION 
SELECT * FROM libros2);

SELECT * FROM libros3;

-- UNION DE LA TRES TABLAS
SELECT * FROM libros 
UNION 
SELECT * FROM libros2
UNION 
SELECT * FROM libros3;

SELECT * FROM libros 
UNION ALL
SELECT * FROM libros2
UNION ALL
SELECT * FROM libros3;



-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  VARIABLES

/*
 COSAS:
	- NO SE PUEDEN UTILIZAR EN SUBCOSULTAS
    - SE PUEDE UTILIZAR EN SUBCONSULTAS
    
HAY DOS TIPOS DEL SISTEMA Y DEL USUARIO:
	- DEL SISTEMA, PERTENCEN A MYSQL
    - DEL USUARIO SE ELIMINAN CUANDO CERRAMOS
    
VER VARIABLES:
	- SHOW VARIABLES;
    - SHOW VARIABLES LIKE 'nom_variable'
    
VARIABLE USUARIO: (SON ESPECIFICAS PARA EL USUARIO // NO DISTINGUE ENTRE MAY Y MIN // MAX 64 CARACTERES DE NOMBRE)
	- SET @nombre_variable := valor;
    - SET @nombre_variable = valor;
*/

-- VER VARIABLES DEL SISTEMA
SHOW VARIABLES;
SHOW VARIABLES LIKE '%SQL_SAFE%';

-- MODIFICAR UNA VARIABLE DEL SISTEMA
SHOW VARIABLES LIKE '%SQL_SAFE%';
SET SQL_SAFE_UPDATES = 1;

-- DECLARACION DE VARIABLE DE USUARIOS
SET @MIVAR1 ='Pepe';
SELECT @MIVAR1;

SET @num1 := 25, @num2 := 2;

-- OPERACIONES
SELECT (@num1 + @num2) AS suma, (@num1 * @num2) AS multi ;

SET @result := @num1 / @num2;
SELECT ROUND(@result, 2);

SELECT ROUND(@result, 2), (@result + 100) AS resul2;

SET @result := Round(((@num1/@num2)+ 45), 2);
 
-- MAS EJEMPLOS
-- 
USE colegio4;

SET @creditoMax = (SELECT MAX(creditos) FROM asignaturas);
SELECT @creditoMax; 

-- UTILIZAR LA VARIABLE
SELECT * FROM asignaturas WHERE creditos LIKE @creditoMax; 
SELECT * FROM asignaturas WHERE creditos = (select max(creditos) FROM asignaturas);

-- UTILIZAR LA VARIABLE EN UN WHERE
set @buscar = 'Maria';
SELECT nombre, apellido1, apellido2 FROM alumnos WhERE nombre LIKE @buscar;

set @buscar = (SELECT nombre FROM alumnos WhERE cod_alumno = 3);
SELECT @buscar;

-- UTILIZAR VARIABLE CON UN INTO
SET @varNom = '';
SELECT nombre INTO @varNom FROM alumnos WhERE cod_alumno = 3;
SELECT @varNom;

SET @varApel = '', @varApel2 = '';
SELECT nombre, apellido1, apellido2 INTO @varNom, @varApel, @varApel2 FROM alumnos WHERE cod_alumno = 5;
SELECT @varNom, @varApel, @varApel2;




-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  ALTER

/*
CAMNIAR LA ESTRUCTURA DE UNA TABLA EXISTENTE 
	ESTRUCTURA:
		- ALTER TABLE nom_tabla MODIFICACION, MODICACION. (NOTA: SE PUEDE AÑADIR VARIAS ACCIONES EN ACCIONES -->)
			- ALTER TABLE t2 DROP COLUMN c, ADD COLUMN VARCHAR(50);
        
*/

USE prueba1;

CREATE TABLE t1(
	a INTEGER, 
    b CHAR(10),
    c INT, 
    d INT
);

-- COMANDO DESCRIBE: (DESCRIBE nom_tabla)
DESCRIBE t1;

-- COMANDO SHOW CREATE TABLE:
SHOW CREATE TABLE t1;

-- MAS COMANDO SHOW
SHOW TABLES;
SHOW DATABASES;
SHOW INDEX FROM t1;

-- RENOMBRAR UNA TABLA 'RENAME'
ALTER TABLE t1 RENAME nuevaT1;
ALTER TABLE nuevaT1 RENAME t1;

-- CAMBIAR EL NOMBRE DE UN CAMPO CHANGE
ALTER TABLE t1 CHANGE a campoA INT; -- HAY QUE DEFINIR EL RENOMBRADO DEL CAMPO
describe t1;

-- CAMBIAR EL VALOR DE UN DE UN CAMPO CON CHANGE
ALTER TABLE t1 CHANGE b b BIGINT NOT NULL;
DESCRIBE t1;

-- CAMBIAR EL VALOR DE UN DE UN CAMPO CON MODIFY
ALTER TABLE t1 MODIFY b INT;

-- AÑADIMOS UN CAMPO AL FINAL DE LA TABLA (POR DEFECTO), ADD
ALTER TABLE t1 ADD nombre VARCHAR(20) NOT NULL;

-- AÑADIMOS UN CAMPO AL PRINCIPIO DE LA TABLA, ADD
ALTER TABLE t1 ADD dni VARCHAR(50) FIRST;

-- AÑADIMOS UN CAMPO EN UNA POSICIÓN DETERMINADA DE LA TABLA, ADD
ALTER TABLE t1 ADD apellido VARCHAR(30) AFTER d; 

-- ELIMINAR CAMPO DE UNA TABLA, DROP
ALTER TABLE t1 DROP apellido;

-- ELIMINAR DOS CAMPOS EN LA MISMA SENTENCIA
ALTER TABLE t1 DROP c, DROP d;

-- AÑADIR UNA CLAVE PRINCIPAL
ALTER TABLE t1 ADD PRIMARY KEY (dni);

-- AÑADIR INDICES
ALTER TABLE t1 ADD index(b), ADD index(nombre);
SHOW CREATE TABLE t1;
SHOW INDEX FROM t1;

-- ELIMINAR UN INDICE !!SIN PARENTESIS
ALTER TABLE t1 DROP INDEX b;


-- ELIMINAR CLAVE PRIMARIA
ALTER TABLE t1 DROP PRIMARY KEY; -- AL SOLO EXISTIR UNA TABLA PRIMARIA AUNQUE SEA COMPUESTA
SHOW INDEX FROM t1;

-- ELIMINAR EL CAMPO NOMBRE
ALTER TABLE t1 DROP nombre; -- AL ELIMINAR EL CAMPO TAMBIEN SE ELIMINA SU INDICE

-- AÑADIMOS UN CAMPO LLAMADO CODIGO COMO CLAVE PRINCIPAL
ALTER TABLE t1 ADD codigo INT UNSIGNED NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY(codigo); -- FROMA 1
ALTER TABLE t1 ADD codigo INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST; -- FORMA 2




-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  FUNCIONES DE MYSQL

-- FUNCIONES DEL SISTEMA
/*
	UNA FUNCION VA A DEVOLVER UN VALOR SIEMPRE. LOS ARGUMENTOS PUEDE IR DE UNO A NINGUNO.
    
    ESTRUCTURA: nombre_fuction([argumento1, argumento2, argumento3,...])
*/

-- VERSION DE MYSQL
SELECT version();

-- SABER LA BASE DE DATOS ACTIVA QUE ESTAMOS UTILIZANDO
SELECT database();

-- SABER LA BASE DE DATOS ACTIVA Y LA VERSION
SELECT database(), version();

-- SABER EL USUARIO CONECTADO
SELECT user();

-- CUAL ES EL IDENTIFICADOR DE LA CONEXION
SELECT connection_id();

-- FECHA Y HORA DEL SISTEMA
SELECT now();

-- FUNCIONES MATEMATICAS
/*
	- SELECT ABS(-10); DEVUELVE 10 
    - REDONDEO
		-- SELECT FLOOR (1.28) REDONDEA HACIA ARRIBA
        -- SELECT CEILING (1.28) REDONDEA HACIA ABAJO
        -- SELECT ROUND() EL DE TODA LA VIDA
	- DIVISIONES
    - CONSTANTE PI
    - RAIZ CUADRADA SQRT
    - ELEVACION POW
		
*/

-- VALOR ABSOLUTO
SELECT ABS(-10);

-- REDONDEO DE NUMERO
SELECT FLOOR(1.234); -- 1
SELECT FLOOR(1.934); -- 1
SELECT CEILING(1.234); -- 2
SELECT CEILING(1.934); -- 2
SELECT ROUND(12.34); /*SI NO PONGO , 2 TE DA SIN DECIMALES : 12 */ SELECT ROUND(12.34,0); -- ES LO MISMO TE DEVUELVE 12
SELECT ROUND(12.54); -- SI NO PONGO , 2 TE DA SIN DECIMALES : 13
SELECT ROUND(12.3567, 1); -- 12.34
SELECT ROUND(12.3567, 2); -- 12.35

-- DIVISIONES
SELECT 7/3; -- 2.3333
SELECT 7 div 3; -- PARTE ENTERA CONSCIENTE = 2
SELECT MOD(7,3); -- RESTO  = 1 ES IGUAL A %

-- CONSTANTE PI
SELECT PI();
SELECT 2 * PI() * (3 * 3) AS area;

-- RAIZ CUADRADA
SELECT SQRT(9);

-- POW
SELECT 2 * PI() * POW(3,2)  AS area;

-- FUNCIONES CADENAS
/*
	- LA CUENTA DE CARACTERES EN MYSQL EMPIEZA EN 1, EJEMPLO "PEPE" 1 = P, 2 = E, 3 = P , 4 = E
    
    - LENGHT NOS LA DA EN BYTE
    
    -- STR ES STRING
		-- SELECT INSTR('cadena1', 'Cadena2') Nos devuelve la posición de la cadena2 en la cadena1  
		-- SELECT STRCMP('cadena1', 'Cadena2') COMPARA CADENAS
			DEVUELVE
				-- Si la cadena1 es mas grande devuelve: -1
                -- Si la cadena son iguales: 0
                -- Si la cadena2 es mas grande devuelve: 1
	-- CONCAT
    -- RIGHT & LEFT: TE DEVUELVE POR LA IZQUIERDA O POR LA DERECHA EL NÚMERO DE CARACTERES DESEADO
    -- REVERSE: DAR LA VUELTA A UNA CADENA
    -- LOWER & UPPER
    -- TRIM : QUITA LOS ESPACIOS DE UNA CADENA TANTO IZQUIEDA COMO DERECHA
    -- LTRIM: QUITA LOS ESPACIOS A LA IZQUIERDA
    -- RTRIM: QUITA LOS ESPACIOS A LA DERECHA
    -- SUBSTRING: DA LOS ELEMENTO DE LA POSICIÓN INDICADA
    -- MID: LO MISMO QUE SUBSTRING
    -- SUBSTRING_INDEX('cadena', 'delimitador', 'left o right') NUMERO POSITIVO IQUIERDA Y SI ES NEGATIVO POR LA DERECHA
    -- REPLACE('cadena', 'cadena_a_buscar', sustituye);
    -- GROUP_CONCAT([DISTINC] expresion [ORDER BY expresion] [SEPARATOR])
*/

-- LENGTH
SELECT LENGTH('cadena'); -- 6
SELECT CHAR_LENGTH('cadena'); -- 6

SELECT LENGTH('año'); -- 4 el pinganillo de la ñ lo cuenta
SELECT CHAR_LENGTH('año'); -- 3


SELECT LENGTH(_utf8 '€'); -- 3 CONVERSION A UTF8
SELECT CHAR_LENGTH(_utf8 '€'); -- 1 CONVERSION A UTF8

USE colegio;
SELECT nombre, CHAR_LENGTH(nombre) AS caracteres FROM alumnos;
SELECT apellidos, CHAR_LENGTH(apellidos) AS caracteres , LENGTH(apellidos) AS caracteres FROM alumnos;


-- STR 
	-- INSTR
    SELECT INSTR('Mysql', 'sql'); -- En la tercera posición
    -- STRCMP
	SELECT STRCMP('abc', 'def'); -- Devuelve -1 por que los caracteres ACII son más grande en ABC
    SELECT STRCMP('DEF', 'def'); -- Devuelve 0
	SELECT STRCMP('def', 'abc'); -- Devuelve 1
    
    SET @clave = 1234;
    SELECT if(STRCMP('1234' , @clave) = 0, 'clave ok', 'clave no ok');
    
-- CONCAT
SELECT concat('Hola', '----------------------', 'tu clave es: ', @clave);

-- RIGHT & LEFT
SELECT RIGHT('MySQL', 3); -- SQL
SELECT LEFT('MySQL', 3); -- MyS

-- REVERSE 
SELECT REVERSE ('HOLA');

-- LOWER & UPPER
SELECT LOWER('HOLA');
SELECT UPPER('hola');

-- TRIM
SELECT TRIM('     hola    ') AS A;

-- LTRIM
SELECT LTRIM('     hola    ') AS A;

-- RTRIM
SELECT RTRIM('     hola    ') AS A;

-- SUBSTRING
SELECT SUBSTRING('Perico', 3, 2); -- posicionate en la tercera letra y devuelveme dos valores (ri)
SELECT SUBSTRING('Perico', 3); -- rico
SELECT SUBSTRING('Perico', -2); -- co, empiezan desde el final hacia adelante
SELECT SUBSTRING('Perico', 0); -- No devuelve nada

-- MID
SELECT MID('Perico', 3, 2); -- ri igual que substring

-- SUBSTRING_INDEX
SELECT SUBSTRING_INDEX('gato-perro', '-', 1); -- gato
SELECT SUBSTRING_INDEX('gato-perro', '-', -1); -- perro
SELECT SUBSTRING_INDEX('gato-perro-loro-pez-pajaro', '-', 3); -- 'gato-perro-loro
SELECT SUBSTRING_INDEX('gato-perro-loro-pez-pajaro', '-', -3);
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX('gato-perro-loro-pez-pajaro', '-', -3), '-',1); -- loro

-- REPLACE
SELECT REPLACE('Mysql.com', '.com', '.es'); -- Mysql.es

-- GROUP_CONCAT([DISTINC] expresion [ORDER BY expresion] [SEPARATOR])
select *, GROUP_CONCAT(departamento) FROM asignaturas; -- Esta forma no es efectiva

select count(departamento), GROUP_CONCAT(departamento) FROM asignaturas; -- Esta forma no es efectiva se repite 13 veces todos el listado de departamento
select count(DISTINCT departamento), GROUP_CONCAT(DISTINCT departamento) FROM asignaturas;
select count(DISTINCT departamento) as N_departamento, GROUP_CONCAT(DISTINCT departamento ORDER BY departamento SEPARATOR '---') FROM asignaturas; -- La forma correcta es con DISTINC + ORDER BY + SEPARATOR

-- EJEPLOS
USE COLEGIO;
SELECT * FROM alumnos;
SET SQL_SAFE_UPDATES = 0;
UPDATE alumnos SET correoPersonal = LOWER(REPLACE(correoPersonal, '.com', '.es'));
UPDATE alumnos SET provincia = UPPER(provincia);
SELECT CONCAT(SUBSTRING_INDEX('vamos-al-cerveceo', '-', 2), CONCAT(RTRIM(' cafecito'), ' en el bar'));
SELECT REPLACE(UPPER(REPLACE('el.decanso.importa','.importa','.es.muy.importante')),'.',' ');




-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  CARACTER ESCAPE
-- SELECT 'HOLA ESTO ES UNA 'UNA PRUEBA' DE ESCAPES'; -- ERROR
SELECT 'HOLA ESTO ES UNA "UNA PRUEBA" DE ESCAPES'; -- EJEMPLO CON COMILLAS DOBLES PERO NO ES LO MÁS CORRECTO PORQUE NO PODEMOS PONER COMILLAS SIMPLE
SELECT 'HOLA ESTO ES UNA \'UNA PRUEBA\' DE ESCAPES'; -- ESCAPANDO CON COMILLAS SIMPLES
SELECT 'direcotiro C:\\pruebas'; -- ESCAPANDO CON COMILLAS SIMPLES


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  FUNCIONES DE FECHA Y HORA

/*
	SELECT now() -- fecha y hora del sistema
	SELECT curdate() -- fecha actual del sistema
    SELECT time() -- hora del sistema
    SELECT year(); -- Extrae el Año de una fecha
    SELECT month(); -- Extrae el mes de una fecha
    SELECT day(); -- Extrae el dia de una fecha
    SELET dayofmonth()
	
    SELECT DATEDIFF(CURDATE(), '1980-07-18'); -- LA FECHA MAS RECIENTE LA PRIMERA Y LA FECHA MAS VIEJA AL FINAL
    -- DA EN DÍA LA DIFERENCIA
    
    SELECT TIMESTAMDIFF(([DAY, MONTH, YEAR]), 1998-12-03,  CURDATE()); LA FECHA MÁS VIEJA AL FINAL DEL TODO
    
    ----------------------------------
    PARA TABLAS.
    
	DATE, TIPO DE DATOS DE FECHA
    DATETIME, TIPO DE DATOS DE FECHA Y DIA
    TIMESTAMP, TIPO DE DATO DE FECHA Y HORA
    
    VALORES POR DEFECTO EN LA CREACIÓN DE TABLAS:
    - Podemos utiliza la funcion now(), pero la convierte en CURRENT_TIMESTAMP
    - CURRENT_TIMESTAMP, fecha y hora actual del sistema
    
    FUNCIONES
	curdate() - fecha y hora actual
    now() - Fecha y hora actual
*/

-- SELECT NOW()
SELECT NOW();
SELECT NOW() - INTERVAL 8 SECOND fecha;
SELECT NOW() - INTERVAL 8 MINUTE fecha;
SELECT NOW() - INTERVAL 8 HOUR fecha;
SELECT NOW() - INTERVAL 8 HOUR - INTERVAL 30 MINUTE AS hora;
SELECT NOW() + INTERVAL 5 DAY AS fecha;
SELECT NOW() - INTERVAL 5 DAY AS fecha;
SELECT NOW() + INTERVAL 5 MONTH AS fecha;
SELECT NOW() + INTERVAL 5 WEEK AS fecha;
SELECT NOW() + INTERVAL 5 YEAR AS fecha;


-- SELECT CURDATE()
SELECT CURDATE();
SELECT CURDATE() + INTERVAL 5 DAY AS fecha;
SELECT CURDATE() - INTERVAL 5 DAY AS fecha;
SELECT CURDATE() + INTERVAL 5 MONTH AS fecha;
SELECT CURDATE() + INTERVAL 5 WEEK AS fecha;
SELECT CURDATE() + INTERVAL 5 YEAR AS fecha;

-- SELECT CURTIME()
SELECT CURTIME();
SELECT CURTIME() + INTERVAL 8 MICROSECOND fecha;
SELECT CURTIME() + INTERVAL 8 SECOND fecha;
SELECT CURTIME() - INTERVAL 8 MINUTE fecha;
SELECT CURTIME() - INTERVAL 8 HOUR fecha;
SELECT CURTIME() - INTERVAL 8 HOUR - INTERVAL 30 MINUTE AS hora;

-- SELECT YEAR();
SELECT YEAR(curdate()) AS anio;
SELECT YEAR('1989-09-12');

-- SELECT MONTH();
SELECT MONTH(curdate()) AS anio;
SELECT MONTH('1989-09-12');

-- SELECT DAY();
SELECT DAY(curdate()) AS anio;
SELECT DAY('1989-09-12');

-- SELECT DAYOFMONTH(); -- DIA DE MES
SELECT DAYOFMONTH(curdate());

-- SELECT DAYOFYEAR(); -- DIA DE AÑO
SELECT DAYOFYEAR(curdate());

-- SELECT DAYNAME() -- DIA DEL ANIO
SELECT DAYNAME(curdate());

-- SELECT HOUR
SELECT HOUR(CURTIME());
SELECT HOUR(NOW());

-- SELECT MINUTE
SELECT MINUTE(CURTIME());
SELECT MINUTE(NOW());

-- SELECT SECOND
SELECT SECOND(CURTIME());
SELECT SECOND(NOW());

-- SELECT DATEFIFF
SELECT DATEDIFF(CURDATE(), '1998-12-03') AS diferencia; -- DIFERENCIA EN DIAS

-- SELECT TIMESTAMPDIFF()
SELECT TIMESTAMPDIFF(DAY, '1998-12-03', CURDATE()) AS diferencia; -- DIFERENCIA EN DIAS
SELECT TIMESTAMPDIFF(MONTH, '1998-12-03', CURDATE()) AS diferencia; -- DIFERENCIA EN MESES
SELECT TIMESTAMPDIFF(YEAR, '1998-12-03', CURDATE()) AS diferencia; -- DIFERENCIA EN ANIOS

-- COMPROBAMOS LA EXACTITUD
SELECT DATEDIFF(CURDATE(), '2000-06-13')/365 AS diferencia;
SELECT TIMESTAMPDIFF(YEAR, '2000-06-13', CURDATE()) AS diferencia; -- MAS PRECISA


-- SELECT DATE_ADD
SELECT DATE_ADD(CURDATE(),INTERVAL 1 DAY);
SELECT DATE_ADD(CURDATE(),INTERVAL 1 MONTH);
SELECT DATE_ADD(CURDATE(),INTERVAL 1 YEAR);

SELECT DATE_SUB(CURDATE(),INTERVAL 1 DAY);
SELECT DATE_SUB(CURDATE(),INTERVAL 1 MONTH);
SELECT DATE_SUB(CURDATE(),INTERVAL 1 YEAR);


-- SELECT DATE_FORMAT
SELECT DATE_FORMAT(now(), '%a de %d de %M de %Y');
SET SESSION lc_time_names = es_ES;

-- EJEMPLOS
USE colegio;
SELECT nombre, apellidos, fecha_nacimiento, YEAR(fecha_nacimiento) anio, MONTH(fecha_nacimiento) mes, DAY(fecha_nacimiento) dia FROM alumnos;
SELECT monthname(CURDATE());
SELECT nombre, apellidos, TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) EDAD FROM ALUMNOS;
SELECT DATE_FORMAT(NOW(), 'En sevilla, a %a del día %d de %M de %Y');

-- EJEMPLO CON TABLA
USE prueba1;
CREATE TABLE contactos(
	codigo INT(3) NOT NULL AUTO_INCREMENT, 
    nombre VARCHAR(20),
    apellidos VARCHAR(30),
    fecha_nacimiento DATE,
    fecha_contratacion DATE,
    fecha_DNI DATETIME,
    fecha_registro TIMESTAMP DEFAULT now(), -- Now la convierte en CURRENT_TIMESTAMP, no admite curdate()
    fecha_alta TIMESTAMP, 
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(codigo)
);

SELECT * FROM contactos;
INSERT INTO contactos(nombre, apellidos, fecha_nacimiento, fecha_contratacion, fecha_DNI) VALUES ('juan', 'lopex', '1975-03-12', '2000-10-22', '1999-12-22');
INSERT INTO contactos(nombre, apellidos, fecha_nacimiento, fecha_contratacion, fecha_DNI) VALUES ('Carmen', 'lopex', '1975-03-12', Curdate(), '1999-12-22');
INSERT INTO contactos(nombre, apellidos, fecha_nacimiento, fecha_contratacion, fecha_DNI) VALUES ('Carmen', 'lopex', '1975-03-12', Curdate(), now());


CREATE TABLE contactos2(
	fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    nombre VARCHAR(50),
    PRIMARY KEY(fecha)
);

SELECT * FROM contactos2;
INSERT INTO contactos2(nombre) VALUES('Carmen');
INSERT INTO contactos2(nombre) VALUES('Ana');


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  VISTAS
/*
	- SON CONSULTAS A LAS CUALES SE LE PONEN UN NOMBRE Y SE QUEDAN GUARDADAS
    - SE PUEDEN UTILIZAR VISTAS SOBRE VISTAS
    - SI LA VISTA EXISTE TENEMOS QUE USAR REPLACE SI NO PETA
    - NECESITAMOS PERMISO CREATE VIEW
    - NO SE PUEDE USER VARIABLES DE USUARIO
    - NO SE PUEDE USAR TABLAS TEMPORALES
    
    - PARA LA ACTUALIZACIÓN DE LAS VISTA TIENE QUE EXISTIR UNA RELACIÓN 1 A 1 ENTRE LAS FILAS TABLA BLASE Y LOS RESGRISTRO BASES
    CREATE [OR REPLACE] VIEW nombre_vista [columnas(NUEVO NOMBRE DE COLUMNA)] AS sentencia_SELECT


*/
CREATE DATABASE pruebas_tablas;
USE pruebas_tablas;

CREATE TABLE TABLA1(
	cantidad int,
    precio int
);

INSERT INTO tabla1 VALUES(3,50);
INSERT INTO tabla1 VALUES(4,20);

-- CREACIÓN DE UNA VISTA
CREATE OR REPLACE VIEW vista1 AS SELECT cantidad, precio, (cantidad * precio) AS total FROM tabla1;
SELECT * FROM vista1;

SHOW CREATE VIEW vista1;


-- LAS COLUMNAS DE LA VISTA DEBEN TENER EL MISMO NUMERO DE CAMPOS QUE EL SELECT EN LA QUE SE BASA
CREATE OR REPLACE VIEW vista2(micantidad, miprecio, totalcalculado) AS SELECT cantidad, precio, (cantidad*precio) total FROM tabla1;
CREATE OR REPLACE VIEW vista2(micantidad, miprecio) AS SELECT cantidad, precio, (cantidad*precio) total FROM tabla1; --  Error Code: 1353. In definition of view, derived table or common table expression, SELECT list and column names list have different column counts	0.000 sec

SELECT * FROM vista2;


-- EL ORDEN DE LOS CAMPOS ES MUY IMPORTANTE
CREATE OR REPLACE VIEW vista3(TOTAL, CANTIDAD, PRECIO) AS SELECT cantidad, precio, (cantidad*precio) total FROM tabla1;
SELECT * FROM vista3;

-- -----------------------------CAMBIAMOS A LA BASE DE DATOS WORD2 -------------------------------------
USE world2;
CREATE OR REPLACE VIEW vista_ciudades 
AS SELECT id, name FROM city;

SELECT * FROM vista_ciudades;

-- FALLO
-- CREAMOS UNA VISTA CON UN JOIN
CREATE OR REPLACE VIEW vistas_ciudades_paises 
AS SELECT country.name, city.Name 
FROM country
INNER JOIN  city ON code = countrycode;

-- SOLUCION
-- SOLUCION 1 NOMBRES A LOS CAMPO DE LA VISTA
CREATE OR REPLACE VIEW vistas_ciudades_paises(PAIS, CIUDADES) 
AS SELECT country.name, city.Name 
FROM country
INNER JOIN  city ON code = countrycode;

SELECT * FROM vistas_ciudades_paises;

-- SOLUCION 2 NOMBRE EN LOS CAMPOS DEL SELECT
CREATE OR REPLACE VIEW vistas_ciudades_paises 
AS SELECT country.name AS PAIS, city.Name AS CIUDAD
FROM country
INNER JOIN  city ON code = countrycode;

SELECT * FROM vistas_ciudades_paises;

-- -----------------------------CAMBIAMOS A LA BASE DE DATOS prueba1 -------------------------------------
USE prueba1;
SELECT * FROM coches; -- 7 REGISTROS

-- CREO OTRA TABLA
CREATE TABLE coches2 SELECT * FROM coches WHERE idprod IN(1,2,3);
SELECT * FROM coches2; -- 3 REGISTROS

-- VISTAS CON UNION
CREATE OR REPLACE VIEW vista_coches
AS SELECT * FROM coches UNION ALL SELECT * FROM coches2;
SELECT * FROM vista_coches;

-- CREAMOS UNA VISTA DE LA VISTA ANTERIOR "VISTA_COCHES" SOLO CON LOS AUDI
CREATE OR REPLACE VIEW vista_audi 
AS SELECT * FROM vista_coches WHERE nombre LIKE 'AUDI%';

select * from vista_audi;

-- ELIMINAMOS LA TABLA COCHES2
DROP TABLE coches2;
SELECT * FROM vista_coches; -- FALLAN 	Error Code: 1356. View 'prueba1.vista_coches' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them	
select * from vista_audi; -- FALLAN 

-- ELIMINAMOS LAS VISTAS
DROP VIEW vista_coches;
DROP VIEW vista_audi;

-- TRABAJAMOS CON WORLD2 SIN CAMBIAR LA BASE DE DATOS PERO EN pruebas_tablas
USE pruebas_tablas;
-- A) CREAMOS UNA TABLA PARA CREAR PRUEBAS
CREATE TABLE paisesEuropa LIKE world2.country;
INSERT INTO paisesEuropa SELECT * FROM world2.country WHERE Continent LIKE 'europe';
SELECT * FROM paisesEuropa;

-- CREAMOS UNA VISTA BASADA EN LA TABLA
CREATE OR REPLACE VIEW v_paisesEuropa AS
SELECT * FROM paisesEuropa WHERE region LIKE 'Southern Europe';

SELECT * FROM v_paisesEuropa;

-- ELIMINAMOS ANDORRA // AL ELIMINAR ANDORRA DE LA VISTA TAMBIEN SE BORRA DE LA TABLA DE DONDE HEMOS REALIZADO LA VISTA
SET SQL_SAFE_UPDATES = 0;
DELETE FROM v_paisesEuropa WHERE name LIKE 'Andorra';
SET SQL_SAFE_UPDATES = 1;



-- B) CREAMOS UNA VISTA NO ACTUALIZABLE ((TEMPTABLE))
-- ELIMINO LA VISTA Y LA TABLA CREADA ANTERIOR
DROP VIEW v_paisesEuropa;
DROP TABLE paisesEuropa;

-- CREAMOS DE NUEVO LA TABLA
CREATE TABLE paisesEuropa LIKE world2.country;
INSERT INTO paisesEuropa SELECT * FROM world2.country WHERE Continent LIKE 'europe';
SELECT * FROM paisesEuropa;

-- CREAMOS UNA VISTA NO ACTUALIZABLE DE LOS PAISES SUR DE EUROPA
CREATE OR REPLACE ALGORITHM=TEMPTABLE VIEW  v_paisesEuropa AS
SELECT * FROM paisesEuropa WHERE region LIKE 'Southern Europe';

SELECT * FROM v_paisesEuropa;

-- ELIMINAMOS ANDORRA // NOS NO DEJA POR ALGORITHM=TEMPTABLE
SET SQL_SAFE_UPDATES = 0;
DELETE FROM v_paisesEuropa WHERE name LIKE 'Andorra'; -- Error Code: 1288. The target table v_paisesEuropa of the DELETE is not updatable	0.000 sec
SET SQL_SAFE_UPDATES = 1;



-- C) CREAR UNA TABLA SOLO CON LAS CIUDADES Y LOS PAISES, ES DECIR QUE LLEVA JOIN
CREATE TABLE paises_ciudades 
SELECT country.code, country.name PAISES, city.id, city.name CIUDADES 
FROM world2.country INNER JOIN world2.city 
ON country.code = city.countrycode;

SELECT * FROM paises_ciudades;

-- VAMOS A CREAR UNA VISTA BASADA EN LA TABLA PAISES_CIUDADES
CREATE OR REPLACE VIEW v_paises_ciudades 
AS SELECT * FROM paises_ciudades;

SELECT * FROM v_paises_ciudades;

-- ¿ES ACTUALIZABLE? SI ES ACTUALIZABLE EN EL BORRADO PERO NO INSERTAR 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM v_paises_ciudades WHERE paises LIKE 'Andorra';
SELECT * FROM v_paises_ciudades;



-- D) CREAMOS DIRECTAMENTE LA VISTA USANDO JOINS 
CREATE OR REPLACE VIEW v_paises_ciudades2 AS
SELECT country.code, country.name PAISES, city.id, city.name CIUDADES
FROM world2.country INNER JOIN world2.city 
ON country.code = city.countrycode;

SELECT * FROM v_paises_ciudades2;

-- ES ACTUALIZABLE? -- NO SE PUEDE BORRAR PORQUE LA VISTA LLEVA JOINS 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM v_paises_ciudades2 WHERE paises LIKE 'Andorra';
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM v_paises_ciudades2;



-- E)CREAMOS LA VISTA PERO CASANDO LAS TABLAS EN LA CLASULA WHERE (TRADICIONAL)
CREATE OR REPLACE VIEW v_paises_ciudades2 AS
SELECT country.code, country.name PAISES, city.id, city.name CIUDADES
FROM world2.country, world2.city 
WHERE country.code = city.countrycode;

SELECT * FROM v_paises_ciudades2;

-- ES ACTUALIZABLE? -- NO SE PUEDE BORRAR PORQUE LA VISTA LLEVA JOINS 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM v_paises_ciudades2 WHERE paises LIKE 'Andorra';
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM v_paises_ciudades2;



-- G) CREAMOS UNA TABLA CON TODOS LOS PAISES DE EUROPA
CREATE TABLE misPaises SELECT * FROM world2.country WHERE continent LIKE 'EUROPE';
SELECT * FROM mispaises;  -- 46

-- creo una vista con los paises de sur de europa
CREATE OR REPLACE VIEW paisessur AS
SELECT * FROM misPaises
WHERE region LIKE'Southern Europe';

SELECT * FROM paisessur; -- 15

-- PROBAMOS INSERTAR EN LA VISTA
INSERT INTO paisessur(code, name) VALUE ('ZZZ','NO SIRVE');
SELECT * FROM paisessur; -- 15
SELECT * FROM mispaises;  -- 47 -- EL REGISTRO NO ESTA EN LA VISTA PORQUE NO CUMPLE EL CAMPO DE REGIO SUR DE EUROPA PERO SI ES INSERTADO EN LA TABLA

-- PROBAMOS A ACTUALIZA EN LA VISTA
SELECT * FROM paisessur; -- 15
UPDATE paisessur SET Population = Population + 1 WHERE code LIKE'ALB'; -- SE ACTUALIZA EN LA VISTA Y EN LA TABLA PORQUE ALBANIA PERTENECE AL SUR DE EUROPA SI NO FUERA ASI SE ACTUAILIZARIA EN LA TABLA SOLO



-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  NUEVAS SENTENCIA
DROP VIEW V1, V2;
DROP VIEW IF EXISTS V1,V2;
SHOW WARNINGS;
SHOW ERRORS;









-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  ADMINISTRACIÓN DE BASES DE DATOS - UNIDAD 3
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  SUBCONSULTAS
/*
UNA SUBCONSULTA ES UNA ANIDACIÓN DE SELECTS, DESDE LA VERSIÓN 5 SOPORTA LAS OPERACIÓNES QUE REQUIERE EL ESTANDAR SQL

ESTRUCTURA:
	- SELECT column FROM tabla WHERE columna_name OPERATOR (SELECT column FROM tabla WHERE columna_name)
    - SIEMPRE TIENE QUE TENER PARENTESIS 

DONDE PUEDE IR:
	- En las columnas 
    - En el FROM 
    - En el WHERE

OPERATOR:
	- = > < >< 
    - IN
    - ANY
    - SOME
    - ALL
    - EXIST / NOT EXISTS
    - DISTINCT
    
TIPOS DE SUBCONSULTAS:
 - SUBCONSULTAS ESCALARES: devuelve un solo valore, es decir, una fila con una columa de datos
 - SUBCONSULTAS DE COLUMNAS: devuelve una sola columna con una o  más filas de datos
 - SUBCONSULTAS DE REGISTRO: devuelve una unica fila con una o más columnas
 - TABLA DE SUBCONSULTAS: 
 
 SUBCONSULTAS CON EXPRESIONES ESCALARES
	- SELECT (SELECT SUM(population) FROM City) / (SELECT SUM(population) FROM country); 
*/

-- EJEMPLO DE UNA SUBCONSULTA ESCALAR (DEVUELVE UN ÚNICO VALOR)
-- 1) DEVUELVE EL NOMBRE DEL PAIS CON LA CIUDAD MAS POBLADA DEL MUNDO
USE world2;
SELECT max(population) FROM city; -- población máxima
SELECT name, CountryCode, max(population) FROM city; -- Esta mal da kabul ERROR
SELECT name, CountryCode  FROM city WHERE Population = 10500000; -- Es Mumbai de la india

SELECT name, CountryCode, Population  FROM city WHERE Population = (SELECT max(population) FROM city);

SELECT country.code, country.name, CountryCode, city.Population  FROM city 
INNER JOIN country ON city.countrycode = country.code
WHERE city.Population = (SELECT max(population) FROM city) ;


-- 2) EJEMPLO DE SUBCONSULTAS CON EXPRESIONES ESCALARES
-- RATIO DE LA POBLACION EN CIUDADES CON LA POBLACIÓN EN LOS PAISES EN SU TOTATOLIDAD
SELECT SUM(population) FROM city;
SELECT SUM(population) FROM country;

SELECT (SELECT SUM(population) FROM city) / (SELECT SUM(population) FROM country) AS ratio;

-- 3) CALCULAMOS LA SUPERFICIE POR CADA HABITANTE DE ESPAÑA
SELECT SurfaceArea FROM country WHERE code LIKE 'ESP';
SELECT population FROM country WHERE code LIKE 'ESP';

SELECT (SELECT SurfaceArea FROM country WHERE code LIKE 'ESP') / (SELECT population FROM country WHERE code LIKE 'ESP') as KM2;

-- 4) UTILIZAR CONSULTAS ESCALARES CON VARIABLES 
SET @superficie := (SELECT SurfaceArea FROM country WHERE code LIKE 'ESP');
SET @poblacion_esp := (SELECT population FROM country WHERE code LIKE 'ESP');

SELECT ROUND( @superficie/@poblacion_esp,7) AS KM2;




-- EJEMPLOS DE SUBONSULTAS DE COLUMNA
-- 5) MUESTRA LAS LENGUAS QUE SE HABLAN EN FILANDIA
-- Esto sale sín subconsultas 
SELECT Language FROM countrylanguage WHERE CountryCode LIKE 'FIN';
-- Ahora imaginamos que desconocemos el código
SELECT code, name FROM country WHERE name LIKE 'Finland';
-- SUBCONSULTA
SELECT Language FROM countrylanguage WHERE CountryCode LIKE (SELECT code FROM country WHERE name LIKE 'Finland');


-- EJEMPLOS DE SUBONSULTAS DE FILA
-- 6) BUSCAR LA CAPITAL DE ESPAÑA
SELECT capital, code FROM country where NAME LIKE 'SPAIN';

SELECT name FROM city WHERE (id, CountryCode) = (SELECT capital, code FROM country where NAME LIKE 'SPAIN'); 


-- EJEMPLOS DE SUBONSULTAS DE FILA EN UN CAMPO SELECT
-- 7) NUMERO DE IDIOMAS QUE SE HABLAN EN CADA PAIS, HAY QUE MOSTRAR EL NOMBRE DEL PAIS
SELECT  CountryCode, COUNT(Language) FROM countrylanguage GROUP BY CountryCode;

SELECT name FROM country 
INNER JOIN countrylanguage ON code = CountryCode
WHERE Language = (SELECT COUNT(Language) FROM countrylanguage GROUP BY CountryCode); -- Error


-- CORRECTA TIPO DE CONSULTA CORRELACIONADA
SELECT name, (SELECT COUNT(Language) FROM countrylanguage WHERE countrylanguage.CountryCode = country.Code) as numlenguas from country;


-- EJEMPLO DE CONSULTA CORRELACIONADA
-- 8) PAIS MÁS POBLADO DE CADA CONTINENTE 
SELECT continent, MAX(population) FROM country GROUP BY continent;

SELECT continent, name as pais, population 
FROM country as c1 
WHERE population = (select MAX(population) FROM country as c2 WHERE c1.Continent = c2.Continent AND population > 0);


-- EJEMPLO DE CONSULTA NO CORRELACIONADA
-- 9) PAIS DE POABLACIÓN MÁXIMA EN EL MUNDO Y EL CONTINENTE AL QUE PERTENECE
SELECT continent, name as pais, population FROM country  WHERE population = 
(select MAX(population) FROM country );


-- SUBCONSULTAS DEL TIPO TABLA -- 
-- CLAÚSULA FROM 

-- Obten el nombre, la region, el continent y el presidente del gobierno de los países del mundo que todavía no se han independizado

select name, region, continent, headofstate from country where indepyear is null; -- manera de hacerlo sin subconsultas (47 registros)

select * from country where indepyear is null;

select name, region, continent, headofstate from (select * from country where indepyear is null) noindependientes;



-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  ALL, ANY Y SOME

/*
- ALL TODOS LOS PARAMETRO DE LA CONSULTA QUE SON VERDADERO

- SOME & ANY: DEVUELVE LA COMPACIÓN SI ES VERDADERA APRA ALGUNO DE LOS VALORES DE CONSULTA, SI PONEMOS SOME EN MARIA DB DA PROBLEMAS POR ESO EL ACOSTUMBRENOS A UTILIZAR ANY
*/

-- USO DE ALL

-- MUESTRA LA POBLACIÓN  Y LOS PAISES DONDE LA POBLACIÓN SEA MAYOR QUE LA MEDIA DE POBLACIONES DE TODOS LOS CONTINENTE
-- MEDIA DE POBLACIÓN DE LOS CONTINENTES 
SELECT AVG(population) FROM country GROUP BY continent; -- SUBCONSUTAL
-- CONSULTA
SELECT name, population FROM country 
WHERE population > ALL (SELECT AVG(population) FROM country GROUP BY continent);


-- USO DE ANY
-- SELECCIONA LOS PAISES DEL CONTIENENT EUROPEO DONDE SE HABLA ESPAÑOL
SELECT countryCode FROM countrylanguage WHERE language LIKE 'Spanish';
SELECT name FROM country WHERE Continent LIKE 'Europe';

-- SUBCONSULTA
SELECT name FROM country WHERE Continent LIKE 'Europe' 
AND country.code = ANY (SELECT countryCode FROM countrylanguage WHERE language LIKE 'Spanish');

SELECT name FROM country WHERE Continent LIKE 'Europe' 
AND country.code = (SELECT countryCode FROM countrylanguage WHERE language LIKE 'Spanish');

SELECT name FROM country WHERE Continent LIKE 'Europe' 
AND country.code = SOME (SELECT countryCode FROM countrylanguage WHERE language LIKE 'Spanish');

SELECT name FROM country WHERE Continent LIKE 'Europe' 
AND country.code = ALL (SELECT countryCode FROM countrylanguage WHERE language LIKE 'Spanish'); -- SOLO SE HABLE ESPAÑOL

SELECT name FROM country WHERE Continent LIKE 'Europe' 
AND country.code != ALL (SELECT countryCode FROM countrylanguage WHERE language LIKE 'Spanish');




-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  IN Y NOT IN

/*
- EL IN DEVUELVE UN VALOR DE TRUE SI LA SUBCONSULTA TIENE UN DATO
- EL IN ES EQUIVALETE a = ANY

*/

-- USO DE IN
-- MUESTRA TODOS LOS DATOS DE LAS CIUDADES DEL CONTINENTE ASIATICO
SELECT code FROM country WHERE Continent LIKE 'Asia'; -- 51
SELECT * FROM city WHERE CountryCode IN(SELECT code FROM country WHERE Continent LIKE 'Asia');
SELECT * FROM city WHERE CountryCode NOT IN(SELECT code FROM country WHERE Continent LIKE 'Asia');

SELECT * FROM city WHERE CountryCode = ANY (SELECT code FROM country WHERE Continent LIKE 'Asia'); -- ES COMO IN

SELECT * FROM city WHERE CountryCode <> ALL (SELECT code FROM country WHERE Continent LIKE 'Asia'); -- ES COMO NOT IN



-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  EXISTS Y NO EXISTS

/*
- EL IN DEVUELVE UN VALOR DE TRUE SI LA SUBCONSULTA TIENE UN DATO
- EL IN ES EQUIVALETE a = ANY

*/
-- SELECCIONA LOS PAISES DEL CONTIENENT EUROPEO DONDE SE HABLA ESPAÑOL
SELECT countryCode, language 
FROM countrylanguage WHERE Language LIKE '%SPA%';

SELECT name, code FROM country
WHERE continent LIKE 'europe' AND EXISTS
(SELECT * FROM countrylanguage
WHERE country.Code = CountryCode and language
 LIKE '%spa%') ;
 
 SELECT name, code FROM country
WHERE continent LIKE 'europe' AND NOT EXISTS
(SELECT * FROM countrylanguage
WHERE country.Code = CountryCode and language
 LIKE '%spa%');
 
 
 
 
 -- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  PROCEDIMIENTOS ALMACENADOS

/*
-- Una función normalmente devuelve un valor
-- Un procedimiento normalmente no hace falta devolver, que se puede guardar y se puede volver a utilizar
-- Hace falta ser superusuario

-- Crear un proceso
CREATE PROCEDURE nombre_procedimiento ([parametros])
[COMMENT 'Comentario']
BEGIN

END

-- BORRAR
DROP PROCEDURE nombre_procedimiento;


-- Visualizar
SHOW

-- Listar un procedimiento
SHOW PROCEDURE STATUS WHERE DB = 'nombreBD';

-- Modificar no lo utiliza

-- PATAMETROS
	-- IN PARAMETROS DE ENTRADA
    -- OUT PARAMETROS DE SALIDA
    -- INOUT PARAMETRO SALIDA
*/

-- ejemplo 

CREATE DATABASE IF NOT EXISTS prueba_procedimientos;
USE prueba_procedimientos;

DROP PROCEDURE IF EXISTS procedimiento1;
DELIMITER //
CREATE PROCEDURE procedimiento1()
BEGIN
	SELECT 'Hola mundo';
	SELECT 	'Adios'; -- Solo se ejecuta el ultimo
END
// 
DELIMITER ;

CALL procedimiento1();

-- -----------------------------------------------
SHOW CREATE procedure procedimiento1;
SHOW PROCEDURE STATUS WHERE DB = 'prueba_procedimientos';
-- ------------------------------------------

CREATE TABLE productos (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'disponible',
    precio FLOAT NOT NULL DEFAULT 0.0,
    PRIMARY KEY(id)
);
INSERT INTO productos (nombre, estado, precio) VALUES 
('Producto A','disponible', 8), 
('Producto B', 'disponible', 1.5),
('Producto C', 'agotado', 80),
('Producto D', 'agotado', 25.8),
('Producto E', 'disponible', 5.5);

-- EJEMPLO 2
DROP PROCEDURE IF EXISTS listarproducto;

DELIMITER //
CREATE PROCEDURE listarproducto()
BEGIN
	SELECT id, nombre, precio FROM productos;
END //

DELIMITER ;

CALL listarproducto();

-- EJEMPLO 3 CON PARAMETRO DE ENTRADA (SABER LOS PRODUCTOS QUE MUESTRA LOS PRODUCTOS DISPONIBLES O LOS AGOTADOS)
DROP PROCEDURE IF EXISTS estadoProductos;

DELIMITER //
CREATE PROCEDURE estadoProductos(IN existencia VARCHAR(10))
BEGIN
	SELECT * FROM productos WHERE estado LIKE existencia;
END //
DELIMITER ;

CALL estadoProductos('disponible');

SET @dato := 'Agotado';

CALL estadoProductos(@dato);


-- EJEMPLO 4 CON PARAMETRO DE ENTRADA Y SALIDA (cueanto tiene dispnible o agotado)
DROP PROCEDURE IF EXISTS contar_productos_estado;

DELIMITER //
CREATE PROCEDURE contar_productos_estado(IN v_estado VARCHAR(10), OUT num INT)
BEGIN
	SELECT COUNT(id) INTO num FROM productos WHERE estado LIKE v_estado;
END //
DELIMITER ;

SET @estado_pro := 'Agotado';
CALL contar_productos_estado(@estado_pro, @numero);
SELECT @numero;
SELECT @estado_pro, @numero;


-- EJEMPLO 4 CON 3 PARAMETROS - mostramos la superficie y poblacion de un pais enviado como parametros
USE world2;

DROP PROCEDURE IF EXISTS superficie_poblacion ;
DELIMITER //
CREATE PROCEDURE superficie_poblacion (IN set_pais CHAR(3), OUT set_superficie FLOAT(10,2), OUT set_poblacion INT)
BEGIN
	SELECT SurfaceArea, population INTO set_superficie, set_poblacion FROM country WHERE code = set_pais ;
END //
DELIMITER ;

SET @pais:= 'ESP';
CALL superficie_poblacion(@pais, @get_superficie, @get_poblacion);
SELECT @pais, @get_superficie, @get_poblacion;


-- EJEMPLO 5 CON 3 PARAMETROS - ejemplo con tres parametros
USE prueba_procedimientos;
DROP PROCEDURE IF EXISTS param_test;

DELIMITER //
CREATE PROCEDURE param_test (IN var_in INT, OUT var_out INT, INOUT var_inout INT)
BEGIN
	DECLARE v1 INT; -- Variable local y es visible solo en el procedimiento declarado
    SET v1 = 45230;

	SET var_in = 125, var_out = 3000, var_inout= 5000;
	SELECT "valores", var_in, var_out, var_inout;
END //
DELIMITER ;

SET @var_in = 0, @var_out = 0, @var_inout = 0;
SELECT @var_in, @var_out, @var_inout;

CALL param_test(@var_in, @var_out, @var_inout);



-- EJEMPLO 5 - Variables locales
USE world2;
DROP PROCEDURE IF EXISTS poblacionESP;

DELIMITER //
CREATE PROCEDURE poblacionESP (out cadena VARCHAR(120))
BEGIN
	
    DECLARE nombre CHAR(52); -- VARIABLES LOCALES
    DECLARE poblacion INT;
    
    SELECT name, population INTO nombre, poblacion FROM country WHERE code LIKE 'ESP';
    SELECT nombre, poblacion;
    
    SET cadena = CONCAT(nombre,": ",poblacion);
    
END //
DELIMITER ;

CALL poblacionESP(@cadena);
SELECT @cadena;



 -- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  SENTENCIA DE CONTROL DE FUJO

/*
-- SENTENCIA IF - ELSE

IF condicion THEN statement_list
ELSEIF codicion THEN statement_list
ELSE statement_lis
END IF




*/
-- EJEMPLO SI UNA PERSONA ES MAYOR DE EDAD
DROP PROCEDURE IF EXISTS mayorEdad;

DELIMITER //
CREATE PROCEDURE mayorEdad(IN nombre VARCHAR(50), IN edad INT)
BEGIN

	IF edad >= 18 THEN
		SELECT CONCAT(nombre, ' es mayor de edad');
	ELSE
		SELECT CONCAT(nombre, ' es menor de edad');
	END IF;
END //
DELIMITER ;

CALL mayorEdad('Pepe Ruiz',17);

-- SEGUNDA VERSION

DROP PROCEDURE IF EXISTS mayorEdad2;

DELIMITER //
CREATE PROCEDURE mayorEdad2(IN nombre VARCHAR(50), IN edad INT, OUT result VARCHAR(100))
BEGIN
	
	IF edad >= 18 AND edad <= 100 THEN
		SET result = CONCAT(nombre, ' es mayor de edad') ;
	ELSEIF edad >= 1 AND edad <= 17 THEN
		Set result = CONCAT(nombre, ' es menor de edad');
	ELSE
		Set result = CONCAT(nombre, ' ERROR');
	END IF;
END //
DELIMITER ;

CALL mayorEdad2('Pepe Ruiz',120, @mensaje);
SELECT @mensaje;


-- EJEMPLO 9 -Evaluar notas
DROP PROCEDURE IF EXISTS evaluarNotas1;

DELIMITER //
CREATE PROCEDURE evaluarNotas1(IN nota INT, OUT calificacion VARCHAR(50))
BEGIN
	IF nota >= 0 AND nota < 5 THEN
		SET calificacion = "Suspenso";
	ELSEIF nota >= 5 AND nota < 7 THEN
		SET calificacion = "Aprobado";
	ELSEIF nota >= 7 AND nota < 9 THEN
		SET calificacion = "Notable";
	ELSEIF nota >= 9 AND nota <= 10 THEN
		SET calificacion = "Sobresaliente";
	ELSE 
		SET calificacion = "Error";
	END IF;
END //
DELIMITER ;

CALL evaluarNotas1(9, @calificacion);
SELECT @calificacion;


DROP PROCEDURE IF EXISTS evaluarNotas2;

DELIMITER //
CREATE PROCEDURE evaluarNotas2(IN nota INT, OUT calificacion VARCHAR(50))
BEGIN
	IF nota > 10 OR nota < 0 THEN
		SET calificacion = 'Error';
	ELSE
		IF nota >= 0 AND nota < 5 THEN
			SET calificacion = "Suspenso";
		ELSEIF nota >= 5 AND nota < 7 THEN
			SET calificacion = "Aprobado";
		ELSEIF nota >= 7 AND nota < 9 THEN
			SET calificacion = "Notable";
		ELSEIF nota >= 9 AND nota <= 10 THEN
			SET calificacion = "Sobresaliente";
		END IF;
	END IF;
END //
DELIMITER ;

CALL evaluarNotas2(11, @calificacion2);
SELECT @calificacion2;




 -- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  CASE AND WHILE

/*
1-- SENTENCIA 1
CASE (case_expr (EVALUADO)
	WHEN  when_expre THEN satement
    WHERE when_expre THEN statement
    ELSE SELE

2-- SENTENCIA 2
CASE 
	WHEN val IS NULL THEN SELECT....
    WHEN val < 0 THEN SELECT....
    WHEN val < 0 THEN SELECT.... 
    ELSE SELECT .....
END CASE

3-- SENCTIA EN EL SELECT 
SELECT CASE WHEN val < 0 THEN ...... WHERE val > 0 THEN..... END CASE;
*/


SET @numero = 'a';
-- SENCTIA EN EL SELECT  Comprobar si la variable es un número positivo, negativo o cero
SELECT 'Valido numero', (CASE 
	WHEN @numero < 0 THEN 'Es negativo'
    WHEN @numero > 0 THEN 'Es positivo'
    WHEN @numero = 0 THEN 'Es cero'
    ELSE 'HAY un error'
    END) AS tipo_numero;  -- SI ESTUVIERA EN UN PROCEDIMIENTO ACABARÍA EN UN END CASE
    
    
-- SENTENCIA CASE EN UN PROCEDIMIENTO. SUSTITUYE A IF... ELSEIF    
DROP PROCEDURE IF EXISTS diaSemanaCase

DELIMITER //
CREATE PROCEDURE diaSemanaCase (IN dia INT, OUT dev VARCHAR(100))
BEGIN
	CASE 
		WHEN dia = 1 THEN SET dev = 'Lunes';
        WHEN dia = 2 THEN SET dev = 'Martes';
        WHEN dia = 3 THEN SET dev = 'Miercoles';
        WHEN dia = 4 THEN SET dev = 'Jueves';
        WHEN dia = 5 THEN SET dev = 'Viernes';
        WHEN dia = 6 THEN SET dev = 'Sábado';
        WHEN dia = 7 THEN SET dev = 'Domingo';
		ELSE SET dev = 'Error';
	END CASE;

END //
DELIMITER ;

CALL diaSemanaCase(2, @dev);
SELECT @dev;




 -- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  CASE AND WHILE

/*
WHILE condicion DO
	sentencias
END WHILE;

EXISTEN LOOP Y REPEAT

*/

-- CREAMOS UN PROCEDIMIENTO QUE SUME LOS X PRIMERO NUMERO NATURALES
DELIMITER //
CREATE PROCEDURE ejemplo_bucle_while(IN X INT, OUT suma INT)
BEGIN
	
    DECLARE contador INT;
    SET contador = 1; -- VARIABLE LOCAL
    SET suma = 0;
    
    WHILE contador <= x DO
		SET suma = (suma + contador);
		SET contador = contador + 1;
    END WHILE;
    
END //
DELIMITER ;

SET @fin = 10;
CALL ejemplo_bucle_while(@fin, @result);
SELECT @fin, @result;



-- TABLA DE MUTIPLICAR DE UN NUMERO COMO PARAMETRO HASTA OTRO NUMERO DADO COMO POR PARAMETRO
DROP PROCEDURE IF EXISTS tabla_multiplicar;

DELIMITER //
CREATE PROCEDURE tabla_multiplicar(IN numero INT, IN hasta_N INT, OUT result TEXT)
BEGIN
	DECLARE contador INT;
    SET contador = 1;
    SET result = '';

	WHILE contador <= hasta_N DO
		SELECT CONCAT(numero, ' * ', contador,  '  = ', (numero*contador));
        SET contador = contador + 1;
    END WHILE;
    
END //
DELIMITER ;

CALL tabla_multiplicar(25, 10, @result);
SELECT @result;


-- MEJORADA TABLA DE MUTIPLICAR DE UN NUMERO COMO PARAMETRO HASTA OTRO NUMERO DADO COMO POR PARAMETRO DENTRO DE UNA TABLA
CREATE TABLE tabla(
	multiplicando INT UNSIGNED, 
    multiplicador INT UNSIGNED, 
    producto INT UNSIGNED
);

DROP PROCEDURE IF EXISTS tabla_multiplicar2;

DELIMITER //
CREATE PROCEDURE tabla_multiplicar2(IN numero INT, IN hasta_N INT)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
	
    -- llamamos al procedimiento de borrado de contanido tabla
	CALL borrar_tabla_multiplicar ();
    
	WHILE contador <= hasta_N DO
		INSERT INTO tabla VALUES (numero, contador, (numero * contador));
        SET contador = contador + 1;
    END WHILE;
    
END //
DELIMITER ;

CALL tabla_multiplicar2(25, 10);
SELECT * FROM tabla;



DROP PROCEDURE IF EXISTS borrar_tabla_multiplicar;

DELIMITER //
CREATE PROCEDURE borrar_tabla_multiplicar ()
BEGIN
	
    SET SQL_SAFE_UPDATES = 0;
    DELETE FROM prueba_procedimientos.tabla;
    SET SQL_SAFE_UPDATES = 1;

END //
DELIMITER ;
call borrar_tabla_multiplicar();



-- MULTIPLIAR 3 MEJORADA - UTILIZO UNA TABLA DENTRO DEL PROCEDIMIENTO;

DROP PROCEDURE IF EXISTS tabla_multiplicar3;

DELIMITER //
CREATE PROCEDURE tabla_multiplicar3(IN numero INT, IN hasta_N INT)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
	
    DROP TABLE IF EXISTS tablaM3;
    
    CREATE TABLE tablaM3(
	multiplicando INT UNSIGNED, 
    multiplicador INT UNSIGNED, 
    producto INT UNSIGNED
	);

	WHILE contador <= hasta_N DO
		INSERT INTO tablaM3 VALUES (numero, contador, (numero * contador));
        SET contador = contador + 1;
    END WHILE;
    
END //
DELIMITER ;

CALL tabla_multiplicar3(25, 999);
SELECT * FROM tablaM3;



 -- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  FUNCIONES

/*
CREATE FUNCTION new_fuction() RETURNS INT
BEGIN
	FUNCION
    
    RETURN 1;
END


*/

-- 1) Ejercicio Hola Mundo
DROP FUNCTION IF EXISTS saludo;

DELIMITER //
CREATE FUNCTION saludo() RETURNS VARCHAR(20)
BEGIN

	RETURN 'Hola Mundo';    
END //
DELIMITER ;

SELECT saludo();
SET GLOBAL log_bin_trust_function_creators  = 1;


-- 2) Enviamos un parametro
DROP FUNCTION IF EXISTS saludoPersona;

DELIMITER //
CREATE FUNCTION saludoPersona(nom VARCHAR(30)) RETURNS VARCHAR(35)
BEGIN

	RETURN CONCAT ('Hola ', nom);    
END //
DELIMITER ;

SELECT saludoPersona('Juan');


-- 3) Enviamos dos parametros
DROP FUNCTION IF EXISTS sumarDos;

DELIMITER //
CREATE FUNCTION sumarDos(n1 INT, n2 INT) RETURNS INT
BEGIN

	RETURN n1 + n2;  
END //
DELIMITER ;

SELECT sumarDos(2,2);

-- ----------------------------------
CREATE TABLE PRODUCTOS2 (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    coste FLOAT NOT NULL DEFAULT 0.0,
    precio FLOAT NOT NULL DEFAULT 0.0,
    PRIMARY KEY(id)
);

INSERT INTO PRODUCTOS2 (nombre, coste, precio) VALUES 
('Producto A', 4, 8),
 ('Producto B', 1, 1.5),
 ('Producto C', 50, 80);
INSERT INTO PRODUCTOS2 (nombre, coste, precio) VALUES 
('Producto D', 30, 8), 
('Producto E', 1.6, 15),
('Producto F',10, 80);

SELECT * FROM productos2;

DELIMITER //
CREATE FUNCTION calcularBeneficio(precioCoste FLOAT, precioVenta FLOAT)RETURNS DECIMAL(9,2)
BEGIN	
	DECLARE beneficio DECIMAL(9,2);
    SET beneficio = precioVenta - precioCoste;
	return beneficio;
END //
DELIMITER ;

SELECT *, calcularBeneficio(coste, precio) Beneficio FROM productos2;



 -- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  TRIGGERS

use world2;
show triggers;
-- creamos una tabla llamada capital con los paises, las capitales y la poblacion de la capital.

create table capital
select country.name country, city.name capital, city.population population
from country, city
where country.capital = city.id;
select * from capital;


-- 1) Creamos un TRIGGER:
# El trigger comprueba el valor de la poblacion antes de la insercion y sus 'filtros': valores por debajo de cero se convierten en cero, y los demas valores se truncan  hasta el múltiplo más cercano de 1.000. El resultado es que el valor filtrado se inserta, no el valor dado en la declaracion insert.
### Como solo tengo una sentencia no hace falta begin/end ni delimiter

Create trigger  capital_bi BEFORE INSERT
on capital for each row
	set new.population = IF(new.population < 0, 0, TRUNCATE(new.population, -3));

-- Inserto en la tabla capital

insert into capital
values
('countryA','CityA', -39),
(' ','CityB', 123456);

# comprobamos
select * from capital where country in ('countryA','countryB');

## ELIMINAMOS TRIGGER 
drop trigger if exists capital_bi;

## Vuelta a la rueda (sin truncamiento)

Create trigger  capital_bi
BEFORE INSERT
on capital for each row
	set new.population = IF(new.population < 0, 0, new.population );

insert into capital
values
('countryC','CityC', -39), 
('countryD','CityD', 123456); # He metido las capitales mal

select * from capital where country in ('countryC','countryD');



 ####### EJEMPLO 2 ###########
-- ESTE TRIGGER SE EJECUTA ANTES DE ACTUALIZAR
-- GUarda en unas variables los datos antiguos y los nuevos datos que vamos a actualizar

delimiter //
create trigger capital_bu
before UPDATE
on capital for each row
begin
	set @pais= old.country;
	set @capital_vieja= old.capital;
	set @new.capital = new.capital;

end;
//
delimiter ;

# Vamos a modificar el nombre de la capital de ESTADOS UNIDOS:de 'Washington' a 'Washington D.C.'
select * from capital where country like 'united states';
set sql_safe_updates=0;
update capital set capital = 'Washington D.C.' where country = 'United States';
set sql_safe_updates =1;

select * from capital where country like 'united states';
select @capital_vieja, @capital_nueva, @pais;


show triggers;

############ EJEMPLO 3
# creo una tabla en la que voy metiendo las ciudades que  elimino de la tabla city.

create table ciudades_eliminadas(
id int,
name char(35),
fecha timestamp default current_timestamp);

## Creo un trigger que guarde en la tabla las ciudades que se vayan eliminando


delimiter //
create trigger ciudades_borradas
AFTER DELETE
on city for each row
begin
	
    Insert into ciudades_eliminadas (id,name) values (OLD.ID, OLD.NAME);

end;
//
delimiter ;

select * from city where name like 'chicago';
set sql_safe_updates=0;
delete from city where name like 'Chicago';
set sql_safe_updates=1;

select * from ciudades_eliminadas;


### creamos un trigger para controlar la insercion y actulizacion de datos

create database prueba_triggers;
use prueba_triggers;
-- creamos la tabla alumnos;
create table alumnos (
	id int unsigned auto_increment primary key,
    nombre varchar (50) not null,
    apellido1 varchar (50) not null,
	apellido2 varchar (50) not null,
    nota float
);

###### Creamos un trigger que actúe ANTES DE LA INSERCIÓN de registros. Si la nota del alumno es menor de 0 se inserta un 0, y si la nota es mayor de 10 se insera un 10.

delimiter //
Create trigger insertar_notas
BEFORE INSERT
on alumnos for each row
begin
	IF new.nota >10 then
		set new.nota = 10;
	elseif new.nota < 0 then
		set new.nota = 0;
	end if;

end;
//
delimiter ;

## COMRPOBAMOS EL TRIGGER
insert into alumnos values (1, 'pepe', 'Ruiz', 'Ruiz', -1);
insert into alumnos values (2, 'Maria', 'Ruiz', 'Sanchez', 11);
insert into alumnos values (3, 'JUAN', 'Perez', 'Perez', 8.5);

-- DEL MISMO MODO DEBEMOS CONTROLAR LA ACTUALIZACION DE notas, PARA QUE NO SE COMETAN ERRORES. EL MISMO CRITERIO.
set sql_safe_updates=0;
update alumnos set nota= 13 where nombre like 'Maria';
set sql_safe_updates=1;


delimiter //
Create trigger modificar_notas
BEFORE UPDATE
on alumnos for each row
begin
	IF new.nota >10 then
		set new.nota = 10;
	elseif new.nota < 0 then
		set new.nota = 0;
	end if;

end;
//
delimiter ;

###

set sql_safe_updates=0;
update alumnos set nota= 13 where nombre like 'Maria';
set sql_safe_updates=1;

set sql_safe_updates=0;
update alumnos set nota= -3 where nombre like 'Juan';
set sql_safe_updates=1;

set sql_safe_updates=0;
update alumnos set nota= 9.99 where nombre like 'Pepe';
set sql_safe_updates=1;


-- -----------------------------------------------------------------------------------------------------------------------------------------------------
-- CURSORES DE PROCEDIMIENTOS

 -- SOLO SE PUEDE UTILZIAR EN PROCEDIMIENTOS
USE world2;

DROP PROCEDURE pruebaCursor;

DELIMITER //
CREATE PROCEDURE pruebaCursosr()
BEGIN
	DECLARE cuenta_registros INT DEFAULT 0;
    DECLARE code_var CHAR(3);
    DECLARE name_var CHAR(52);
    
    -- DECLARAMOS EL CURSOR
		DECLARE miCursor CURSOR FOR SELECT code, name FROM country WHERE continent = 'Africa';
        
	-- LO ABRIMOS
		OPEN miCursor;
			BEGIN
				DECLARE EXIT HANDLER FOR SQLSTATE '02000' BEGIN END;
                LOOP
					FETCH miCursor INTO code_var, name_var;
                    SET cuenta_registros = cuenta_registros + 1;
                END LOOP;
            END;
        CLOSE miCursor;
	
    -- MUESTRA POR PANTALLA
    SELECT 'NUMBER OF ROWS OF ROWS FECTCHED =', cuenta_registros;
END //
DELIMITER ;

CALL  pruebaCursosr();






-- -----------------------------------------------------------------------------------------------------------------------------------------------------
-- TRANSACIONES

-- Activar // Desactiva
SET AUTOCOMMIT = 1;
SET AUTOCIMMIT = 0;


USE colegio;
DROP TABLE IF EXISTS alumnos_segunda;
CREATE TABLE IF NOT EXISTS alumnos_segundo SELECT * FROM alumnos;
SELECT * FROM alumnos_segundo;

-- PARA SABER EL VALOR DE AUTOCOMIT 
SELECT @@autocommit;

-- PARA SABER EL MODO SEGURO
SELECT @@sql_safe_updates; -- EL modo seguro tiene que estar activa, es decir a 1


-- EJEMPLO A) COMO EL MODO AUTOCOMMIT ESTA ACTIVADO, SI ELIMINO UN REGISTRO ESTE SE ELIMINA DEFINITIVAMENTE;
SELECT * FROM alumnos_segundo;
SET @@sql_safe_updates = 0;
DELETE FROM alumnos_segundo WHERE codigo_alumno = 102;
SET @@sql_safe_updates = 1;
ROLLBACK; -- Intentamos volver atras pero como el autocommit lo tenia activado es decir a 1 no funciona y lo elmina



-- COMENZAMOS UNA TRANSCCIÓN
-- Descativamos el autocommit, ahura puedo usa COMMIT Y ROLBACK;
SET @@autocommit = 0;
SELECT @@autocommit;

SELECT * FROM alumnos_segundo;
SET @@sql_safe_updates = 0;
DELETE FROM alumnos_segundo WHERE codigo_alumno = 103;
SET @@sql_safe_updates = 1;

ROLLBACK; -- Recuperar el registro borrado
SELECT * FROM alumnos_segundo;

-- Volvemos a borrar el mismo registro
SELECT * FROM alumnos_segundo;
SET @@sql_safe_updates = 0;
DELETE FROM alumnos_segundo WHERE codigo_alumno = 103;
SET @@sql_safe_updates = 1;

-- Elminamos el registro definitivamente y para ello hacemos un COMMIT;
COMMIT;
SELECT * FROM alumnos_segundo;
ROLLBACK; -- AUNQUE hagamos un ROLLBACK EL COMMIT ES EL QUE BORRA

-- Activamos el MODO AUTOCOMIT, esto significa que todo lo que hagamos se ejecuta
SET @@autocommit = 1;
SELECT @@autocommit ;


-- START TRANSACTION : ES LA MEJOR OPCIÓN PORQUE NO TENEMOS QUE ACTIVA O DESACTIVA EL @@AUTOCOMMIT
START TRANSACTION; -- Ejecutamos;

SELECT * FROM alumnos_segundo;
SELECT * FROM alumnos_segundo WHERE Codigo_alumno IN(109,110) ;

SET @@sql_safe_updates = 0;
UPDATE alumnos_segundo SET nombre = 'MARI PEPA' WHERE codigo_alumno = 109;
UPDATE alumnos_segundo SET nombre = 'CARMENCITA' WHERE codigo_alumno = 110;
SET @@sql_safe_updates = 1;

ROLLBACK;
SELECT * FROM alumnos_segundo WHERE Codigo_alumno IN(109,110) ;


-- Volvaemos a repetir cambio, pero se cambia a pepita porque las transciones se cierran en el primer ROLLBACK O COMIT que hay a continuación de ella y se vuelva a activa el autocommit a 1
SET @@sql_safe_updates = 0;
UPDATE alumnos_segundo SET nombre = 'PEPITA' WHERE codigo_alumno = 109;
SET @@sql_safe_updates = 1;

ROLLBACK; -- No funciona transaccion se cerro mas atrás del codigo
SELECT * FROM alumnos_segundo WHERE Codigo_alumno IN(109,110) ;


-- START TRANSACTION SEGUNDO EJEMPLO: ES LA MEJOR OPCIÓN PORQUE NO TENEMOS QUE ACTIVA O DESACTIVA EL @@AUTOCOMMIT
START TRANSACTION;

SET @@sql_safe_updates = 0;
UPDATE alumnos_segundo SET nombre = 'PEPITA' WHERE provincia LIKE 'Madrid';
SET @@sql_safe_updates = 1;

COMMIT; -- Confirmamos que los madrileños son borrados


-- SAVEPOINT Y ROLLBACK TO SAVEPOINT
-- Solo podemos hacer una vez COMMIT O ROLLBACK
DROP TABLE IF EXISTS copia_asignaturas;

CREATE TABLE copia_asignaturas SELECT * FROM asignaturas;
SELECT * FROM asignaturas;

-- INICIAMOS LA TRANSACCION
START TRANSACTION;

SAVEPOINT punto1;
	INSERT INTO copia_asignaturas VALUES(15, 'JAVA', 20, 'PROGRAMACION');
    SELECT * FROM copia_asignaturas WHERE codigo = 15;
    
    -- tenemos 2 opciones : commit o rolback
    -- hacemos commit
    COMMIT; -- Grabamos permanentemente el registo en la base de datos y cerramos la trascion y el punto desaparece 
    
-- INICIAMO LA TRANSACCION
START TRANSACTION;

SAVEPOINT punto1;
INSERT INTO copia_asignaturas VALUES(16, 'C++', 15, 'PROGRAMACION');
    SELECT * FROM copia_asignaturas WHERE codigo = 16;

SAVEPOINT punto2;
INSERT INTO copia_asignaturas VALUES(17, 'C', 10, 'PROGRAMACION');
    SELECT * FROM copia_asignaturas WHERE codigo = 17;
	
    -- tenemos 2 opciones : commit o rolback
    -- hacemos rollback
	ROLLBACK TO punto2;

-- QUE PASA SI LA BASE DE DATOS NO INNODB O DBD
CREATE TABLE  alum_myIsan SELECT * FROM alumnos;
ALTER TABLE alum_myisan ENGINE = MyISAM;
SHOW CREATE TABLE alum_myisan;

-- INICIAMOS UNA TRANSACCION EN UNA TABLA NO TRANSACCIONAL
START TRANSACTION;

SET @@sql_safe_updates = 0;
UPDATE alum_myisan SET nombre = 'PEPITA' WHERE codigo_alumno = 100;
SET @@sql_safe_updates = 1;

SELECT * FROM alum_myisan WHERE codigo_alumno = 100;

ROLLBACK;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COMANDO BASICOS, CONEXIÓN Y CLIENTES
/* CONEXIÓN CON EL SERVIDOR MYSQL

Hay dos modos: 
A través de linea de comandos propia de mysql (solo admins)

Por el cmd:
 -Buscamos la ruta de donde este el programa: C:\Program Files\MySQL\MySQL Server 8.0\bin
 -Buscamos 'variables de entorno del sistema' y metemos en path abajo la dirección de arriba y reiniciamos el cmd

Ya en cmd:

Conexión cliente en mysql
mysql -h (nombreservidor o IP - localhost o 127.0.0.1) -P (puerto) -u (usuario) -p
versión corta: mysql -u root -p

Comandos

tee c:/BD_ejercicios/ejemplo.txt --  todo lo que vamos escribiendo automaticamente se guarda en la ruta que ejecutemos, creando en el archivo que especificamos
notee para cerrarlo

source c:/BD_ejercicios/creartabla.sql -- carga un fichero que nosotros le enviemos

C:\>mysql -u root -p --execute "select * from colegio.alumnos" > c:/bd_ejercicios/salida_alumnos.txt -- sirve para dar salida a un fichero si estamos fuera de mysql -- es con fichero mysql por defecto

C:\>mysql -u root -p --execute "select * from colegio.alumnos" -B > c:/bd_ejercicios/salida_alumnosB.txt -- cambiamos de formato a batch
C:\>mysql -u root -p --execute "select * from colegio.alumnos" -H > c:/bd_ejercicios/salida_alumnosH.html -- cambiamos de formato a html (incluido la extensión del fichero)
C:\>mysql -u root -p --execute "select * from colegio.alumnos" -X > c:/bd_ejercicios/salida_alumnosX.xml -- cambiamos de formato a xml (incluido la extensión del fichero)

C:\>mysql -u root --html -p -- le indicamos cómo queremos que nos haga los archivos
 */


-- mysql -u root -p --execute "SELECT world2.city.* FROM world2.city INNER JOIN world2.country ON world2.city.countryCode = world2.country.code WHERE world2.country.name = 'Spain'" > C:\Users\Edu\Desktop\Ejercicios_BD\EJERCICIOS_CON_COMANDOS_MySQL\ejercicio3.txt

-- mysql -u root -p --execute "SELECT world2.city.* FROM world2.city INNER JOIN world2.country ON world2.city.countryCode = world2.country.code WHERE world2.country.name = 'Spain'" -B > C:\Users\Edu\Desktop\Ejercicios_BD\EJERCICIOS_CON_COMANDOS_MySQL\ejercicio4.txt

-- mysql -u root -p --execute "SELECT world2.city.* FROM world2.city INNER JOIN world2.country ON world2.city.countryCode = world2.country.code WHERE world2.country.name = 'Spain'" -H > C:\Users\Edu\Desktop\Ejercicios_BD\EJERCICIOS_CON_COMANDOS_MySQL\ejercicio4.html

-- mysql -u root -p --execute "SELECT world2.city.* FROM world2.city INNER JOIN world2.country ON world2.city.countryCode = world2.country.code WHERE world2.country.name = 'Spain'" -H > C:\Users\Edu\Desktop\Ejercicios_BD\EJERCICIOS_CON_COMANDOS_MySQL\ejercicio5.xml



-- -----------------------------------------------------------------------------------------------------------------------------------------------------
-- METADATOS
/*

Base de datos:
	1. information_schema
		- Son vistas que almacena: la información del la base de datos como triggres, tablas, procedure
		- Para activalo para que podemos verlo en el workbench: edit/preferenes/SQL editor/ sidebar / show metadata and internal schemas
    2. Mysql
		- El diccionario de datos
        - Es donde se almacena los parametros del SGBD y los usuarios que tienen acceso al SGBD
	
    3. Sys
		
	
    4. performance_schema
		-  Nos permite analizar el rendimiento sobre el servidor.
        -  Son vtablas base

*/
-- -----------------------------------------------------------------------------------------------------------------------------------------------------
-- information_schema

USE information_schema;
SHOW TABLES;

-- information_schema.schemata (shemata = esquemas)
	-- Todas las base de datos nuestra
    -- Character de cada base de datos
    -- Collation de cada base de datos
SELECT * FROM schemata; 

-- information_schema.tables
	-- la información de todas las tablas de la base de datos
		-- motor, tamño. tamaño indice, el valor de auto_increment
SELECT * FROM tables;
SELECT * FROM tables WHERE TABLE_SCHEMA = 'COLEGIO';
DESCRIBE TABLES;

-- information_schema.columns
	-- la información de todas las columnas, podemos limitar por la tabla 
SELECT * FROM columns WHERE table_schema = 'world2';
DESCRIBE COLUMNS;

-- information_schema.views
	-- la información de todas las columnas, podemos limitar por la tabla 
SELECT * FROM views;
DESCRIBE COLUMNS;

-- information_schema.key_column_suage
	-- Constraint, indices, estadisticas(indice), foreign key, references
SELECT * FROM key_column_usage;
SELECT * FROM key_column_usage WHERE CONSTRAINT_SCHEMA LIKE 'colegio';

-- information_schema.table_constraints
	-- Constraint
SELECT * FROM table_constraints;
SELECT * FROM table_constraints WHERE constraint_schema = 'colegio';

-- information_schema.statistics
	-- 
SELECT * FROM statistics;
SELECT * FROM statistics WHERE table_schema = 'colegio';

-- information_schema.character_sets // information_schema.collations
	-- todos los juegos de caracteres y el collation por defecto
SELECT * FROM character_sets;
SELECT * FROM collations;

-- EJEMPLO
	-- ¿Cuanto espacio ocupan cada una de nuestra base de datos=
    -- La información esta Byte para pasarlo a MB tenemos que dividir a MB (1024*1024) = 1048576
    SELECT table_schema BD, SUM(data_length + index_length) / 1048576 AS MB FROM tables GROUP BY table_schema;
	SELECT table_schema BD, (SUM(data_length + index_length) /1024)/1024 MB FROM tables GROUP BY table_schema;
    
    
    -- -----------------------------------------------------------------------------------------------------------------------------------------------------
-- COPIA DE SEGURIDAD MYSQL DUMPS

/*
https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html

-- Ejemplo 1 tablas y vista. Simple, no tiene el create database:
C:\>mysqldump -u root -p colegio > C:/Users/Edu/Desktop/Ejercicios_BD/backupmysql/BackupColegio1.sql

-- Ejemplo 2 base de datos, tablas y vistas. Simple, tiene el create database:
C:\>mysqldump -u root -p --databases colegio >C:/Users/Edu/Desktop/Ejercicios_BD/backupmysql/BackupColegio2.sql

-- Ejemplo 3 base de datos, tablas, vistas, funciones, triggers. Es la forma completa.
C:\>mysqldump -u root -p --databases --routines --triggers sakila > C:/Users/Edu/Desktop/Ejercicios_BD/backupmysql/Backup_sakila_completa.sql

-- Ejemplo 4 copiar varias base de datos
C:\>mysqldump -u root -p --databases world2 colegio > C:/Users/Edu/Desktop/Ejercicios_BD/backupmysql/backup_world_colegio_20220722.sql

-- Ejemplo 5 copiar todas las bases de datos
C:\>mysqldump -u root -p --all-databases > C:\Users\Edu\Desktop\Ejercicios_BD\backupmysql\bk_todasBD_20220727.sql

-- Ejemplo 6 copia de seguridad de sakila solo su estructura
C:\>mysqldump -u root -p --no-data sakila > C:\Users\Edu\Desktop\Ejercicios_BD\backupmysql\bk_sakila_estructura_20220727.sql

-- Ejemplo 7 copia de seguridad de sakila solo su datos
C:\>mysqldump -u root -p --no-create-info sakila > C:\Users\Edu\Desktop\Ejercicios_BD\backupmysql\bd_sakila_datos_20220727.sql

-- Ejemplo 8 copia de seguridad de las tablas actor y payment de la base de datos sakila
C:\>mysqldump -u root -p sakila actor payment >  C:\Users\Edu\Desktop\Ejercicios_BD\backupmysql\bd_sakila_tablas_20220727.sql

-- Ejemplo 9 copia de seguridad base de datos colegio omitiendo una tabla
C:\>mysqldump -u root -p --ignore-table=colegio.alumnos_segundo colegio >C:\Users\Edu\Desktop\Ejercicios_BD\backupmysql\bd_colegio_ignore1.sqldsfdf

-- Ejemplo 10 copia de seguridad base de datos colegio omitiendo varias tablas
C:\>mysqldump -u root -p --databases --ignore-table=colegio.alumnos_segundo --ignore-table=colegio.asignaturas_segunda colegio > C:\Users\Edu\Desktop\Ejercicios_BD\backupmysql\bd_cole_ignore2.sql
*/


    -- -----------------------------------------------------------------------------------------------------------------------------------------------------
-- RESTAURACION DE COPIA DE SEGURIDAD MYSQL DUMPS
/*
-- Usamo colegio uno porque no tiene el create table para crear una base de datos colegio2022
mysql -u root -p colegio2022 < C:\Users\Edu\Desktop\Ejercicios_BD\backupmysql\BackupColegio1.sql

-- Restaura la base de datos colegio
	1. Eliminamos colegio
C:\>mysql -u root -p < C:\Users\Edu\Desktop\Ejercicios_BD\backupmysql\BackupColegio2.sql

-- Cargar una copia en la base de datos libreria una copia de seguridad creada anteriormente de alguna tablas de la base de datos sakila
C:\>mysql -u root -p libreria< C:\Users\Edu\Desktop\Ejercicios_BD\backupmysql\bd_sakila_tablas_20220727.sql
*/



-- -----------------------------------------------------------------------------------------------------------------------------------------------------
-- METADATOS - GESTION DE USUARIOS

-- Ver con cual usuario estoy conectado
select current_user();

-- Privilegios de suarios
SELECT * FROM information_schema.user_privileges; 



-- mysql
-- información de los usuarios y privilegios
SELECT * FROM mysql.user;

-- Privilegios globales de cada uno de los usuario
SELECT * FROM mysql.global_grants;

-- Roles 
SELECT * FROM mysql.default_roles;
show tables from mysql;

-- Otras tablas
SELECT * FROM mysql.db;
SELECT * FROM mysql.tables_priv;
SELECT * FROM mysql.columns_priv;




-- -----------------------------------------------------------------------------------------------------------------------------------------------------
-- USUARIOS
/* 01/09
creación de usuarios por codigo
create user 'nombre'@'host o ip o %' identified by 'password'; crea una nueva cuenta de usuario
%  con esto, el usuario puede conectarse desde cualquier usuario
*/

use mysql;
select * from user;

select * from mysql.db; 	-- permisos de usuarios a bd

select * from mysql.tables_priv;	-- permisos de los usuarios a ciertas tablas

select * from mysql.columns_priv;	-- permisos de usuarios a ciertas columnas de una tabla

show privileges;	-- muestra los distintos privilegios

-- Ver los privilegios que tiene asignado un usuario
use information_schema;
select * from USER_PRIVILEGES;

select * from USER_PRIVILEGES where grantee like 'root&';	-- no funciona porque el nombre del usuario tiene comillas ''
select * from USER_PRIVILEGES where grantee like '\'root\'@\'localhost\'';
select * from USER_PRIVILEGES where grantee like "'root'@'localhost'";
select * from USER_PRIVILEGES where grantee like "'root%";

-- CREACION DE USUARIOS--

create user 'pepe'@'%' identified by 'paspepe';

select * from mysql.user;

create user 'juan'@'localhost' identified by 'pasjuan';

create user 'ana'@'localhost';

/* para asignar permisos hay que crear un rol (conjunto de permisos), al usuario le puedes asignar roles y permisos

grant type_permission on database_name.table_name to 'nombre'@'localhost';*/

-- asignar privilegios a usuarios--

grant all on *.* to 'pepe'@'%';	-- asigno todo los privilegios

flush privileges;	-- para que se activen los privilegios, tiene que cerrar sesión si la tiene abierta, y volver a entrar

show grants for 'pepe'@'%';
select * from information_schema.USER_PRIVILEGES where grantee like "'pepe%'";
select * from mysql.tables_priv;	-- no aparece

grant all privileges on *.* to 'juan'@'localhost';	-- asigno todo los privilegios
select * from mysql.user;

grant select, insert, update on colegio.* to 'ana'@'localhost'; 	-- asigno privilegios de select,insert y update en la bd colegio
select * from mysql.db;
show grants for 'ana'@'localhost';

-- creamos nuevo usuario, asignamos permisos, hacemos pruebas y lo eliminamos-- 
create user 'usub'@'localhost' identified by '123';

grant select, insert, update, delete on colegio.asignatura to 'usub'@'localhost';

select * from mysql.user;
select * from mysql.db;	-- no aparece porque le hemos dado permisos dolo para una tabla de una bd
show grants for 'usub'@'localhost';
select * from mysql.tables_priv; 	-- aqui si aparece

grant select (cod_alumno, dni, nombre) on colegio.alumnos to 'usub'@'localhost'; 	-- le damos más permisos al usuario para algunos campos de una tabla de una bd
select * from mysql.columns_priv; 	-- aqui si aparece

drop user if exists 'usub'@'localhost';		-- eliminamos al usuario

-- visualizamos las conexiones de los usuarios
show processlist;

kill 17; 	-- para matar el proceso

/* ejer 1
creo el usuario usern, le doy permisos select e insert a colegio, conecto con linea de comandos, hago pruebas con las bd, el admin elimina el usuario, hago pruebas para saber si puede seguir haciendo cosas, el admin elimina la sesión del usuario*/

create user 'userns'@'localhost' identified by '123';
select * from mysql.user;

grant select, insert on colegio.* to 'userns'@'localhost';
select * from mysql.db;	-- no aparece porque le hemos dado permisos dolo para una tabla de una bd
show grants for 'userns'@'localhost';

drop user if exists 'userns'@'localhost';

show processlist;
kill 19;



-- -----------------------------------------------------------------------------------------------------------------------------------------------------
-- RORLES
	 SELECT * FROM mysql.role_edges; -- Ver roles
     SELECT current_role(); -- Ver rol corriendo
     
-- EJERCICIO PRUEBA
	-- 1) CREACION ROLES
		CREATE ROLE 'rol_desarrollo', 'rol_lectura', 'rol_escritura'; -- Crear uno o más roles
			-- VER ROLES
			SELECT * FROM mysql.user;
    -- 2) ASIGNAR PRIVILEGIOS
		GRANT CREATE, ALTER, DROP, REFERENCES, SELECT, INSERT, UPDATE, DELETE ON *.* TO 'rol_desarrollo';
			-- VER ROL 
			SELECT * FROM mysql.user WHERE user LIKE 'rol_desarrollo';
            -- VACIO
			SELECT * FROM mysql.role_edges;
            -- VER GRANTS;
            SHOW GRANTS FOR  'rol_desarrollo';
            
            GRANT select ON *.* TO 'rol_lectura';
            -- VER ROL 
			SELECT * FROM mysql.user WHERE user LIKE 'rol_lectura';
            -- VACIO
			SELECT * FROM mysql.role_edges;
            -- VER GRANTS;
            SHOW GRANTS FOR  'rol_lectura';
            
            GRANT INSERT, UPDATE, DELETE ON *.* TO 'rol_escritura';
            -- VER ROL 
			SELECT * FROM mysql.user WHERE user LIKE 'rol_escritura';
            -- VACIO
			SELECT * FROM mysql.role_edges;
            -- VER GRANTS;
            SHOW GRANTS FOR  'rol_escritura';
            
	-- 3) CREACIÓN DE USUARIOS
		CREATE USER 'desUsu1'@'localhost' IDENTIFIED BY '123';
        CREATE USER 'lecUsu1'@'localhost' IDENTIFIED BY '123';
        CREATE USER 'lecUsu2'@'localhost' IDENTIFIED BY '123';
        CREATE USER 'lecEsUsu1'@'localhost' IDENTIFIED BY '123';
        
	-- 4) ASIGNAR ROLES
		-- ASIGNAR ROL desUsu1
		GRANT 'rol_desarrollo' TO 'desUsu1'@'localhost';
        -- ASGINAR ROL lecUsu1 y lecUsu2
		GRANT 'rol_lectura' TO 'lecUsu1'@'localhost', 'lecUsu2'@'localhost';
        -- ASIGNAR DOS ROLES A UN USUARIO lecEsUsu1
        GRANT 'rol_lectura', 'rol_escritura' TO 'lecEsUsu1'@'localhost';
        
	-- 5) ACTIVAR LOS ROLES DE LOS USUARIOS
		SET DEFAULT ROLE ALL TO 'desUsu1'@'localhost', 'lecUsu1'@'localhost', 'lecUsu2'@'localhost', 'lecEsUsu1'@'localhost';
    
    -- 6)VER COSAS    
	-- VEMOS LOS ROLES Y LOS USUARIOS ASIGNADOS
		SELECT * FROM mysql.role_edges;
	-- PERMISO DE ROLES
		SHOW GRANTS FOR 'rol_desarrollo';
	-- ROLES ASIGNADOS AL USUARIO
		SHOW GRANTS FOR 'lecEsUsu1'@'localhost';
        
	-- 7) ELIMINAR LOS ROLES Y LOS USUARIOS
		-- ELIMINAR ROPÑES
			DROP ROLE 'rol_desarrollo', 'rol_lectura', 'rol_escritura';
			SELECT * FROM mysql.user;
		-- ELIMINAR LOS USUARIOS
			DROP USER 'desUsu1'@'localhost', 'lecUsu1'@'localhost', 'lecUsu2'@'localhost', 'lecEsUsu1'@'localhost';
            SELECT * FROM mysql.user;
            
            
            
-- -----------------------------------------------------------------------------------------------------------------------------------------------------
-- REVOCAR PRIVILEGIOS
	-- 1) CREAMOS USUARIO Y PRIVILEGIOS 
    CREATE USER 'ana'@'localhost' IDENTIFIED BY '1234';
    GRANT SELECT, INSERT, UPDATE ON colegio.* TO 'ana'@'localhost';
    FLUSH PRIVILEGES;
    SELECT * FROM mysql.user WHERE user LIKE 'ana';
    SELECT * FROM mysql.db WHERE user LIKE 'ana';
    
    -- 2) REVOCA PERMISOS INSERT ANA
		-- ERROR PROVOCADO NO FUNCIONA EL *.*
        REVOKE INSERT ON *.* FROM 'ana'@'localhost';
        
        -- RECOVOCO EL PERMISO INSERT PARA UNA TABLA EN CONCRETO
        REVOKE INSERT ON colegio.* FROM 'ana'@'localhost';
        
	-- 3 CREACION DE USUARIO Y ROL
		CREATE ROLE 'rol_lectura';
        GRANT select ON *.* TO 'rol_lectura';
        CREATE USER 'lecUsu1'@'localhost' IDENTIFIED BY '123';
        GRANT 'rol_lectura' TO 'lecUsu1'@'localhost';
		SET DEFAULT ROLE ALL TO 'lecUsu1'@'localhost';
		SELECT * FROM mysql.user WHERE user LIKE 'lecUsu1';
        SHOW GRANTS FOR 'lecUsu1'@'localhost';
        SHOW GRANTS FOR 'rol_lectura';
        
	-- 4) REVOCAMOS EL PERMISO INSER AL ROL_LECTURA
		REVOKE 'rol_lectura' ON *.* FROM 'lecUsu1'@'localhost';
        
	-- 5) ELIMINAMOS USUARIO Y ROL
		DROP USER 'lecUsu1'@'localhost';
        DROP ROLE 'rol_lectura';
	
    
-- -----------------------------------------------------------------------------------------------------------------------------------------------------
-- RENOMBRAR UN USUARIO
	-- 1) CREAMOS USUARIO ANA 
	DROP USER 'ana'@'localhost';
	CREATE USER 'ana'@'localhost';
    
    -- 2) RENOMBRAR
	RENAME USER 'ana'@'localhost' to 'anita'@'localhost';
    SELECT * FROM mysql.user;
    
    -- 3) PARA ASIGNAR UNA CLAVE SI NO TIENE O PARA MODIFICAR
    ALTER USER IF EXISTS 'anita'@'localhost' IDENTIFIED BY '1234';
    
    -- 4) ECHARLA DEL SISTEMA
		-- ) BUSCAMO EL IDENTIFICAMOS IS ID
        SHOW processlist;
        -- ) La matamos
		KILL 13;
        
	-- 5) BLOQUEAR UNA CUENTA
    ALTER USER IF EXISTS 'anita'@'localhost' ACCOUNT LOCK;
		-- LA ECHAMOS
        SHOW PROCESSLIST;
        KILL 14;
	
    -- 6) DESBLOQUEARLA
    ALTER USER IF EXISTS 'anita'@'localhost' ACCOUNT UNLOCK;
    