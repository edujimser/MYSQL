/*En MySQL 8.0, caching_sha2_passwordes el complemento de autenticación predeterminado en lugar de mysql_native_password.*/

/*El servidor asigna el sha256_password complemento a la cuenta y lo usa para encriptar la contraseña usando SHA-256, almacenando esos valores en las columnas pluginy de la tabla del sistema. authentication_stringmysql.user */

-- Creación 
CREATE USER 'prueba1'@'localhost' IDENTIFIED WITH sha256_password BY '1234';

-- Comprobación de prueba1
SELECT * FROM mysql.user WHERE User LIKE 'pru%';
	-- Valores de plugin 
		SELECT User, plugin, authentication_string FROM mysql.user WHERE User LIKE 'pru%' ;
			-- Valores SHA-256
            -- $5$arw RX=n0HOU``$291R9c5yrihBq8Ux5eqCs8tp3jJY3u/DLrvzzZj2u53
            
/* Para iniciar el servidor con el complemento de autenticación predeterminado establecido en sha256_password, coloque estas líneas en el archivo de opciones del servidor:*/
	 -- Ver variable 
		SHOW variables LIKE 'default_authentication_plugin'; -- caching_sha2_password
	-- 	Modificar a SHA-256
		/* Rutas del archivo de configuración: 
			En Windows
				%PROGRAMDATA%\MySQL\MySQL Server X.X\my.ini o my.cnf
				%PROGRAMDATA% es el directorio del sistema donde se almacenan los datos de aplicación para todos los usuarios (C:\ProgramData)
				%WINDIR%\my.ini o my.cnf
				%WINDIR% es el directorio donde está instalado Windows (C:\Windows)
				C:\my.ini o my.cnf
				INSTALLDIR\my.ini o my.cnf
				INSTALLDIR es el directorio donde está instalado Mysql. Por lo general es igual a PROGRAMDIR que es el directorio de programas (C:\Program Files)
				defaults-extra-file
				El archivo especificado con el parámetro –defaults-extra-file=path
				%APPDATA%\MySQL\.mylogin.cnf
				%APPDATA% es el directorio de datos de aplicación de Windows (C:\Users\USUARIO\AppData\Roaming)
			En Linux
				/etc/my.cnf
				/etc/mysql/my.cnf
				SYSCONFDIR/my.cnf
				SYSCONFDIR es directorio especificado con la opción SYSCONFDIR cuando se compliló Mysql (Directorio etc dentro del directorio de instalaciones compiladas)
				$MYSQL_HOME/my.cnf
				MYSQL_HOME es una variable de entorno que contiene la ruta al directorio donde el archivo my.cnf se encuentra. Si no está establecido y se inicia el servidor usando mysqld_safe program, mysqld_safe instenta establecerla:
				Siendo BASEDIR el directorio base de Mysql y DATADIR el directorio de datos de Myqsl (/usr/local/mysql/data o /usr/local/var)
				Si existe my.cnf en DATADIR, y no en BASEDIR, mysql_safe establece MYSQL_HOME = DATADIR
				De lo contrario, mysql_safe establece MYSQL_HOME = BASEDIR
				defaults-extra-file
				El archivo especificado con el parámetro –defaults-extra-file=path
				~/.my.cnf
				~ es el directorio home del usuario actual. Es igual al valor de $HOME
				~/.mylogin.cnf
	*/
    
-- Añadir al documento: 
	-- [mysqld] default_authentication_plugin=sha256_password 
    -- O
    -- [mysqld] default_authentication_plugin=mysql_native_password
    
    
-- Modificar para un usuario
ALTER USER 'prueba2'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234';
FLUSH PRIVILEGES;
SELECT User, plugin, authentication_string FROM mysql.user WHERE User LIKE 'pru%' ;

ALTER USER 'prueba2'@'localhost' IDENTIFIED WITH 'sha256_password' BY '1234';
FLUSH PRIVILEGES;
SELECT User, plugin, authentication_string FROM mysql.user WHERE User LIKE 'pru%' ;