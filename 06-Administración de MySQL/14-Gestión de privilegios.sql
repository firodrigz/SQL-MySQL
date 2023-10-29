/* Designar privilegios */

-- Privilegios a todas las bases de datos y todas las tablas (*.*)
CREATE USER 'user01'@'localhost' IDENTIFIED BY 'user01';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE ON *.* TO 'user01'@'localhost';

-- Privilegios a toda la base de datos jugos_ventas/ todas las tablas (jugos_ventas.*)
CREATE USER 'user04'@'%' IDENTIFIED BY 'user04';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE ON jugos_ventas.* TO 'user04'@'%';

-- Privilegios solo a una tabla (jugos_ventas.facturas)
CREATE USER 'user05'@'%' IDENTIFIED BY 'user05';
GRANT SELECT, INSERT, UPDATE, DELETE ON jugos_ventas.facturas TO 'user05'@'%';
GRANT SELECT ON jugos_ventas.tabla_de_vendedores TO 'user05'@'%';

/* Ver que privilegios tiene un usuario */
SELECT * FROM mysql.user;
SHOW GRANTS FOR 'user02'@'localhost';

/* Revocar privilegios */

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user02'@'localhost';