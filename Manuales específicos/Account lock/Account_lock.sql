-- Ver usuarios
SELECT * FROM mysql.user;

-- Crear usuario
CREATE USER prueba_1@localhost IDENTIFIED BY '1234';

-- Bloquear cuenta (account_locked)
	-- Ver las cuenta locked
    SELECT user, account_locked FROM mysql.user;
	-- Bloquear
    ALTER USER IF EXISTS prueba_1@localhost ACCOUNT LOCK;
    -- Desbloquear
    ALTER USER IF EXISTS prueba_1@localhost ACCOUNT UNLOCK;
    
-- Páginas
-- https://dev.mysql.com/doc/refman/8.0/en/account-locking.html