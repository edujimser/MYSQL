-- https://dev.mysql.com/doc/refman/8.0/en/table-maintenance-statements.htmlhttps://dev.mysql.com/doc/refman/8.0/en/table-maintenance-statements.html

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ANALYZE TABLE Statement

/*
ANALYZE [NO_WRITE_TO_BINLOG | LOCAL]
    TABLE tbl_name [, tbl_name] ...

ANALYZE [NO_WRITE_TO_BINLOG | LOCAL]
    TABLE tbl_name
    UPDATE HISTOGRAM ON col_name [, col_name] ...
        [WITH N BUCKETS]

ANALYZE [NO_WRITE_TO_BINLOG | LOCAL]
    TABLE tbl_name
    DROP HISTOGRAM ON col_name [, col_name] ...

*/


/*
ANALYZE [NO_WRITE_TO_BINLOG | LOCAL]
    TABLE tbl_name [, tbl_name] ...

ANALYZE TABLEsin ninguna HISTOGRAMcláusula realiza un análisis de distribución clave y almacena la distribución para la tabla o tablas nombradas. Para MyISAMtablas, ANALYZE TABLEel análisis de distribución de claves es equivalente a usar myisamchk --analyze .
ANALYZE TABLE colegio4.alumnos;
*/
Analyze table colegio4.alumnos;


/*
ANALYZE [NO_WRITE_TO_BINLOG | LOCAL]
    TABLE tbl_name
    UPDATE HISTOGRAM ON col_name [, col_name] ...
        [WITH N BUCKETS]
        
ANALYZE TABLEcon la UPDATE HISTOGRAMcláusula genera estadísticas de histograma para las columnas de la tabla nombradas y las almacena en el diccionario de datos. Solo se permite un nombre de tabla para esta sintaxis.
*/

analyze table colegio4.alumnos update histogram on Cod_Alumno, nombre;
show index from colegio4.alumnos;

use information_schema;
SELECT  * FROM  INFORMATION_SCHEMA.COLUMN_STATISTICS;

show tables;
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECK TABLE


/* 
The CHECK TABLE statement performs an integrity check on table structure and contents. It
works for MyISAM and InnoDB tables. For MyISAM tables, it also updates the index statistics. If
the table is a view, CHECK TABLE verifies the view definition. If the output from CHECK TABLE
indicates that a table has problems, the table should be repaired.

Estructura
CHECK TABLE tbl_name [, tbl_name] ... [option] ...

option: {
    FOR UPGRADE
  | QUICK
  | FAST
  | MEDIUM
  | EXTENDED
  | CHANGED
}

Escribe	Sentido
QUICK	No escanee las filas para comprobar si hay enlaces incorrectos. Se aplica a tablas y vistas InnoDB.MyISAM
FAST	Revisa solo las mesas que no hayan sido cerradas correctamente. Ignorado por InnoDB; solo se aplica a MyISAMtablas y vistas.
CHANGED	Verifique solo las tablas que se hayan cambiado desde la última verificación o que no se hayan cerrado correctamente. Ignorado por InnoDB; solo se aplica a MyISAMtablas y vistas.
MEDIUM	Escanee las filas para verificar que los enlaces eliminados sean válidos. Esto también calcula una suma de verificación clave para las filas y lo verifica con una suma de verificación calculada para las claves. Ignorado por InnoDB; solo se aplica a MyISAMtablas y vistas.
EXTENDED	Realice una búsqueda de clave completa para todas las claves de cada fila. Esto asegura que la tabla sea 100% consistente, pero lleva mucho tiempo. Ignorado por InnoDB; solo se aplica a MyISAMtablas y vistas.

Si una tabla está dañada, lo más probable es que el problema esté en los índices y no en la parte de datos. Todos los tipos de verificación anteriores verifican los índices a fondo y, por lo tanto, deberían encontrar la mayoría de los errores.

Para verificar una tabla que usted supone que está bien, no use opciones de verificación o la QUICKopción. Este último debe usarse cuando tiene prisa y puede correr el pequeño riesgo QUICKde no encontrar un error en el archivo de datos. (En la mayoría de los casos, bajo un uso normal, MySQL debería encontrar algún error en el archivo de datos. Si esto sucede, la tabla se marca como " dañada " y no se puede usar hasta que se repare).

FASTy CHANGEDen su mayoría están destinados a usarse desde un script (por ejemplo, para ejecutarse desde cron ) para verificar las tablas periódicamente. En la mayoría de los casos, FASTes preferible a CHANGED. (El único caso en el que no se prefiere es cuando sospecha que ha encontrado un error en el MyISAMcódigo).
*/

check table pruebas_tablas.vista1 EXTENDED;



-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  CHECKSUM TABLE

/*
CHECKSUM TABLE tbl_name [, tbl_name] ... [QUICK | EXTENDED]

CHECKSUM TABLEinforma una suma de comprobación para el contenido de una tabla. Puede usar esta declaración para verificar que el contenido sea el mismo antes y después de una copia de seguridad, reversión u otra operación que tiene como objetivo devolver los datos a un estado conocido.

Esta instrucción requiere el SELECTprivilegio para la tabla.

Esta declaración no es compatible con las vistas. Si ejecuta CHECKSUM TABLEcontra una vista, el Checksumvalor siempre es NULLy se devuelve una advertencia.

Para una tabla inexistente, CHECKSUM TABLEdevuelve NULLy genera una advertencia.

*/

checksum table colegio4.alumnos;