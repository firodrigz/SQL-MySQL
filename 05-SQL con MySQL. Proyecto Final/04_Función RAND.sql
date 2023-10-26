/* Función RAND */

/* Devuelve un número aleatorio entre 0 y 1. */
SELECT RAND();

-- MIN = 20 Y MAX = 250
-- (RAND() * (MAX-MIN+1)) + MIN;

SELECT (RAND() *  (250-20+1)) + 20 AS ALEATORIO;
SELECT FLOOR((RAND() *  (250-20+1)) + 20) AS ALEATORIO;

SELECT RAND() * 8; -- Devuelve un número en el intervalo [0;8]

/*Función aleatorio IMPORTANTE = SET GLOBAL log_bin_trust_function_creators = 1;*/
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `f_aleatorio`(min INT, max INT) RETURNS int
BEGIN
DECLARE vresultado INT;
SELECT FLOOR((RAND() * (max-min+1)) + min) INTO vresultado;
RETURN vresultado;
END $$

SELECT f_aleatorio(1,10) AS RESULTADO;

/*Función para seleccionar cliente aleatorio*/
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `f_cliente_aleatorio`() RETURNS varchar(11) CHARSET utf8mb4
BEGIN
DECLARE vresultado VARCHAR(11);
DECLARE vmax INT;
DECLARE valeatorio INT;
SELECT COUNT(*) INTO vmax FROM clientes; -- Cuenta el máximo de clientes
SET valeatorio = f_aleatorio(1,vmax); -- valeatorio es un número aleatorio entre 1 y el máximo de clientes
SET valeatorio = valeatorio -1;
SELECT DNI INTO vresultado FROM clientes LIMIT valeatorio,1;
RETURN vresultado;
END $$

SELECT f_cliente_aleatorio() AS CLIENTE;

/*Crea otra función para obtener el producto y también el vendedor usando como base la función aleatorio.*/
DELIMITER //
CREATE FUNCTION `f_producto_aleatorio`() 
RETURNS varchar(10) 
BEGIN
DECLARE vresultado VARCHAR(10);
DECLARE vmax INT;
DECLARE valeatorio INT;
SELECT COUNT(*) INTO vmax FROM productos;
SET valeatorio = f_aleatorio(1,vmax);
SET valeatorio = valeatorio-1;
SELECT CODIGO INTO vresultado FROM productos LIMIT valeatorio,1;
RETURN vresultado;
END //

DELIMITER //
CREATE FUNCTION `f_vendedor_aleatorio`() 
RETURNS varchar(5) 
BEGIN
DECLARE vresultado VARCHAR(5);
DECLARE vmax INT;
DECLARE valeatorio INT;
SELECT COUNT(*) INTO vmax FROM vendedores;
SET valeatorio = f_aleatorio(1,vmax);
SET valeatorio = valeatorio-1;
SELECT MATRICULA INTO vresultado FROM vendedores LIMIT valeatorio,1;
RETURN vresultado;
END //