DROP  DATABASE IF EXISTS prueba_cargar_datos_txt;
CREATE DATABASE IF NOT EXISTS prueba_cargar_datos_txt;
USE prueba_cargar_datos_txt;

CREATE TABLE animales(
	nombre VARCHAR(100),
    dueno VARCHAR(100),
    especie VARCHAR(100),
    sexo VARCHAR(100), 
    nacimiento DATE, 
    muerte DATE, 
    PRIMARY KEY(nombre)
);

-- https://dev.mysql.com/doc/refman/8.0/en/load-data.html
-- -------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------
-- INSERCCIÓN
SET GLOBAL local_infile = 'ON';
-- https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_local_infile

-- EXIT;
-- mysql --local-infile=1 -u root -p; entrar
-- cambiar \ por /
LOAD DATA LOCAL INFILE 'C:/Users/Edu/Desktop/Mysql/Insertar_dsde_txt/datos/animales.txt' INTO TABLE animales  FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

-- Replace (Los registros que tienen el mismo valor que la id replaza lo que se encuentre en la tabla) // archivo animales_replace.txt
LOAD DATA LOCAL INFILE 'C:/Users/Edu/Desktop/Mysql/Insertar_dsde_txt/datos/animales_replace.txt' REPLACE INTO TABLE animales  FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

-- Ignore (Con IGNORE, se descartan las filas nuevas que duplican una fila existente en un valor de clave único) // archivo: animales_ignore.txt
LOAD DATA LOCAL INFILE 'C:/Users/Edu/Desktop/Mysql/Insertar_dsde_txt/datos/animales_ignore.txt' IGNORE INTO TABLE animales  FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
 
 -- -------------------------------------------------------------------------------------------------------------------------------------------
 -- GLOSARIO
 /*
	-\n: salto de línea
    - \t: tabulacion
	- \r: Return
    
\n = CR (Retorno de carro) // Se utiliza como carácter de nueva línea en Unix
\r = LF (Salto de línea) // Se utiliza como carácter de nueva línea en Mac OS
\n\r = CR + LF // Se utiliza como carácter carácter de nueva línea en Windows
(char)13 = \n = CR // Igual que \n

Environment.NewLine = cualquiera de los códigos anteriores basados ​​en el sistema operativo
// .Net proporciona la clase Environment que proporciona muchos datos basados ​​en los sistemas operativos , por lo que si la aplicación está integrada en Windows y usa CR + LF ("\n\r" en lugar de Environment.NewLine) como carácter de nueva línea en sus cadenas, y luego MS crea una VM para ejecutar aplicaciones .Net en Unix , entonces habrá problema. Por lo tanto, siempre debe usar Environment.NewLine cuando desee un carácter de nueva línea.

Nota
Para un archivo de texto generado en un sistema Windows, es posible que se requiera una lectura adecuada del archivo LINES TERMINATED BY '\r\n'porque los programas de Windows suelen utilizar dos caracteres como terminador de línea. Algunos programas, como WordPad , pueden usarse \rcomo un terminador de línea al escribir archivos. Para leer dichos archivos, utilice LINES TERMINATED BY '\r'.


Personaje	Secuencia de escape
\0	Un carácter ASCII NUL ( X'00')
\b	Un carácter de retroceso
\n	Un carácter de nueva línea (salto de línea)
\r	Un carácter de retorno de carro
\t	Un carácter de tabulación.
\Z	ASCII 26 (Control+Z)
\N	NULO
 */
 
-- -------------------------------------------------------------------------------------------------------------------------------------------
-- EJEMPLOS DE FORMATOS
-- ESPACIO EN BLANCO CON SALTO DE LÍNEA archivo: animales_espacio.txt
TRUNCATE animales;
LOAD DATA LOCAL INFILE 'C:/Users/Edu/Desktop/Mysql/Insertar_dsde_txt/datos/animales_espacio.txt' INTO TABLE animales  FIELDS TERMINATED BY ' ' LINES TERMINATED BY '\n';

-- COLUMNAS SEPARADAS POR "," Y SALTOS DE LINEAS POR ";"
TRUNCATE animales;
LOAD DATA LOCAL INFILE 'C:/Users/Edu/Desktop/Mysql/Insertar_dsde_txt/datos/animales_comas_puntocoma.txt' INTO TABLE animales  FIELDS TERMINATED BY ',' LINES TERMINATED BY ';';

-- COLUMNAS SEPARADAS POR ";" Y SALTOS DE LINEAS POR SALTO DE LINEA 
TRUNCATE animales;
LOAD DATA LOCAL INFILE 'C:/Users/Edu/Desktop/Mysql/Insertar_dsde_txt/datos/animales_comas_puntocoma.txt' INTO TABLE animales  FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n';

-- COLUMNAS SEPARADAS POR ";" Y LINEAS QUE EMPIEZAN EN -
TRUNCATE animales;
LOAD DATA LOCAL INFILE 'C:/Users/Edu/Desktop/Mysql/Insertar_dsde_txt/datos/animales_empiezan_-_puntocoma copia.txt' INTO TABLE animales  FIELDS TERMINATED BY ';' LINES STARTING BY '-';

-- COLUMNAS SEPARADAS POR ";", LINEAS QUE EMPIEZAN EN "-" Y LINEAS QUE TERMINA CON SALTO DE LINEA
TRUNCATE animales;
LOAD DATA LOCAL INFILE 'C:/Users/Edu/Desktop/Mysql/Insertar_dsde_txt/datos/animales_empiezan_-_puntocoma copia_2.txt' INTO TABLE animales  FIELDS TERMINATED BY ';' LINES STARTING BY '-' TERMINATED BY '/n'; -- FALLO SOLO COGE UNA LINEA

-- IGNORAR PRIMERA LÍNEA
TRUNCATE animales;
LOAD DATA LOCAL INFILE 'C:/Users/Edu/Desktop/Mysql/Insertar_dsde_txt/datos/animales_irgnorar_linea.txt' INTO TABLE animales  FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- CARGAR UN CSV
TRUNCATE animales;
LOAD DATA LOCAL INFILE 'C:/Users/Edu/Desktop/Mysql/Insertar_dsde_txt/datos/animales_csv.csv' INTO TABLE animales  FIELDS TERMINATED BY ';'  LINES TERMINATED BY '\n'; -- unix

TRUNCATE animales;
LOAD DATA LOCAL INFILE 'C:/Users/Edu/Desktop/Mysql/Insertar_dsde_txt/datos/animales_csv.csv' INTO TABLE animales  FIELDS TERMINATED BY ';'  LINES TERMINATED BY '\r\n'; -- Universal


-- -------------------------------------------------------------------------------------------------------------------------------------------
-- PROCESAMIENTO ENTRADA

DROP TABLE IF EXISTS calculo;
CREATE TABLE calculo(
	id INT NOT NULL AUTO_INCREMENT,
    dato INT NOT NULL,
	PRIMARY KEY (id)
);

TRUNCATE calculo;
LOAD DATA LOCAL INFILE 'C:/Users/Edu/Desktop/Mysql/Insertar_dsde_txt/datos/calculo_1.txt' INTO TABLE calculo (id, @var_dato) SET dato = @var_dato/2 ; -- LA SEPARACION DE LOS DATOS ES CON TABULACIÓN 

-- Exportando la base de datos
SELECT * FROM prueba_cargar_datos_txt.calculo INTO OUTFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads/calculo_2.txt'FIELDS TERMINATED BY '/t' LINES TERMINATED BY '\r\n';
SET GLOBAL local_infile = true;
SHOW VARIABLES LIKE "secure_file_priv";
