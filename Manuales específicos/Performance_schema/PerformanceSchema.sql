-- https://dev.mysql.com/doc/refman/8.0/en/performance-schema-quick-start.html
-- Ver Perfomance_schema
SHOW VARIABLES LIKE 'performance_%';
SHOW VARIABLES LIKE 'performance_schema';

-- Performance está implementada como un motor de almacenamiento, esto es debido a que porque opera en otras tablas del sistema, aunque para nosotros a simple vista el una base de datos 
select * from  INFORMATION_SCHEMA.ENGINES;

-- Tablas con el motor performance_schema
SELECT * FROM information_schema.TABLES WHERE table_schema LIKE 'performance_schema';


-- Activación para recoger datos: Inicialmente, no todos los instrumentos y consumidores están habilitados, por lo que el esquema de rendimiento no recopila todos los eventos. Para activar todo esto y habilitar la temporización de eventos, ejecute dos instrucciones (el número de filas puede diferir según la versión de MySQL):
select * FROM performance_schema.setup_instruments;
SET @@SQL_SAFE_UPDATES = 0;
UPDATE performance_schema.setup_instruments SET ENABLED = 'YES', TIMED = 'YES';
SET @@SQL_SAFE_UPDATES = 1;

select * FROM performance_schema.setup_consumers;
SET @@SQL_SAFE_UPDATES = 0;
UPDATE performance_schema.setup_consumers SET ENABLED = 'YES';
SET @@SQL_SAFE_UPDATES = 1;

-- Ver el historico de ventros ocurridos
SELECT * FROM performance_schema.events_waits_history;
SELECT * FROM performance_schema.events_waits_history_long;

-- Ver si la variable está activa

show variables like 'performance_schema';
