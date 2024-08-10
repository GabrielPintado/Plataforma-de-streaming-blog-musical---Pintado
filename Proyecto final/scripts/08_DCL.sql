-- Creacion de un rol
CREATE ROLE lectura;

-- Creacion de un usuario y asignacion de rol
CREATE USER user_lectura IDENTIFIED BY 'contraseña123';
GRANT lectura TO user_lectura;

-- Asignacion de permisos
GRANT SELECT ON Albumes TO lectura;
GRANT INSERT, UPDATE ON Canciones TO user_lectura;
