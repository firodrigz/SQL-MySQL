/* Usando mecanismos de almacenamiento */

CREATE TABLE db_table (
ID INT,
NOMBRE VARCHAR(100)
); -- Por defecto la tabla creada se crea con engine InnoDB

ALTER TABLE db_table ENGINE = MyISAM;

CREATE TABLE db_table1 (ID INT, NOMBRE VARCHAR(100)) ENGINE = MEMORY;

SHOW ENGINES; -- Consulta info sobre engines.