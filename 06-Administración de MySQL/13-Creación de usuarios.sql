-- Usuario administrador
CREATE USER 'admin02'@'localhost' IDENTIFIED BY 'admin02';
GRANT ALL PRIVILEGES ON *.* TO 'admin02'@'localhost' WITH GRANT OPTION;

-- Usuario normal
CREATE USER 'user01'@'localhost' IDENTIFIED BY 'user01';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE ON *.* TO 'user01'@'localhost';

-- Usuario solo lectura
CREATE USER 'read01'@'localhost' IDENTIFIED BY 'read01';
GRANT SELECT, EXECUTE ON *.* TO 'read01'@'localhost';

-- Usuario back-up
CREATE USER 'back01'@'localhost' IDENTIFIED BY 'back01';
GRANT SELECT, RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'back01'@'localhost';

-- Usuario genérico
/* En Workbench dejar la parte de limit to host matchin el % */
CREATE USER 'admingeneric02'@'%' IDENTIFIED BY 'admingeneric02';
GRANT ALL PRIVILEGES ON *.* TO 'admingeneric02'@'%' WITH GRANT OPTION;