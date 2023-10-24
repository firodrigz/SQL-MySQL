/*Crea un SP con las siguientes 4 variables y que al utilizar el comando CALL, las mismas puedan ser visualizadas.
Nombre: Cliente  - Tipo: Caracteres con 10 posiciones - Valor: Juan.
Nombre: Edad - Tipo: Entero - Valor: 10.
Nombre: Fecha_Nacimiento - Tipo: Fecha - Valor: 10/01/2007.
Nombre: Costo - Tipo: Número con casillas decimales - Valor: 10.23 .*/

DELIMITER $$
CREATE PROCEDURE `ejercitacion_1` ()
BEGIN
DECLARE Cliente VARCHAR(10);
DECLARE Edad INTEGER;
DECLARE Fecha_Nacimiento DATE;
DECLARE Costo FLOAT;

SET Cliente = "Juan";
SET Edad = 10;
SET Fecha_Nacimiento = "2007-01-10";
SET Costo = 10.23;

SELECT Cliente;
SELECT Edad;
SELECT Fecha_Nacimiento;
SELECT Costo;
END $$

CALL ejercitacion_1;


/*Crea un SP que actualice la edad de los clientes. Recuerda que el comando para calcular la edad, en la tabla tabla_de_clientes es:
TIMESTAMPDIFF(YEAR, FECHA_DE_NACIMIENTO, CURDATE()) as EDAD*/

DELIMITER $$
CREATE PROCEDURE `calcula_edad` ()
BEGIN
UPDATE tabla_de_clientes SET EDAD =  TIMESTAMPDIFF(YEAR, FECHA_DE_NACIMIENTO, CURDATE());
END $$

CALL calcula_edad;

/*Crea un SP para reajustar el % de comisión de los vendedores. Incluye como parámetro del SP el %, expresado en valor (Ex: 0,90).
Nombre del Stored Procedure: reajuste_comision.*/
SELECT * FROM tabla_de_vendedores;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `reajuste_comision`(ajuste decimal (5,2))
BEGIN
UPDATE tabla_de_vendedores SET PORCENTAJE_COMISION = ajuste;
END $$

CALL reajuste_comision (0.90);

/*Crea una variable llamada N_FACTURAS y atribuye a ella el número de facturas del día 01/01/2017. 
Muestra en el output del script el valor de la variable. (Nombra este Stored Procedure como cantidad_facturas).*/
DELIMITER $$
CREATE PROCEDURE `cantidad_facturas`(fecha_elegido DATE)
BEGIN
DECLARE N_FACTURAS INTEGER;
SELECT COUNT(*) AS CONTAR_FACTURAS INTO N_FACTURAS FROM facturas WHERE FECHA_VENTA = fecha_elegida;
SELECT N_FACTURAS;
END $$

CALL cantidad_facturas("2017-01-01");

SELECT * FROM facturas;

/*Crea un Stored Procedure que, basado en una fecha, calcule el número de facturas. 
Si aparecen más de 70 facturas exhibimos el mensaje: ‘Muchas facturas’. En otro caso, exhibimos el mensaje ‘Pocas facturas’. 
También, debe exhibir el número de facturas. Llamaremos este Stored Procedure como: evaluacion_facturas.
La fecha empleada para evaluar la cantidad de facturas será un parámetro del Stored Procedure.*/

DELIMITER $$
CREATE PROCEDURE `evaluacion_facturas`(vfecha DATE)
BEGIN
DECLARE mensaje VARCHAR(50);
DECLARE N_FACTURAS INTEGER;
SELECT COUNT(*) INTO N_FACTURAS FROM facturas WHERE
FECHA_VENTA = vfecha;
IF N_FACTURAS > 70
THEN SET mensaje = 'Muchas facturas' ;
ELSE SET mensaje = 'Pocas facturas' ;
END IF;
SELECT mensaje;
END $$

CALL evaluacion_facturas("2015-01-01");

/*Construye un Stored Procedure llamado comparacion_ventas que compare las ventas en dos fechas distintas (Estas fechas serán los parámetros de la SP). 
Si la variación porcentual de estas ventas es mayor al 10% la respuesta debe ser ‘Verde’. 
Si está entre -10% y 10% debe retornar ‘Amarillo’. Si la variación es menor al -10% debe retornar ‘Rojo’.*/

SELECT SUM(B.CANTIDAD * B.PRECIO) AS TOTAL_VENTA FROM 
facturas A INNER JOIN items_facturas B
ON A.NUMERO = B.NUMERO
WHERE A.FECHA_VENTA = '20170301';

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `comparacion_ventas`(vfecha1 DATE, vfecha2 DATE)
BEGIN
DECLARE facturacion_inicial FLOAT;
DECLARE facturacion_final FLOAT;
DECLARE variacion float;
SELECT SUM(B.CANTIDAD * B.PRECIO) INTO facturacion_inicial  FROM 
facturas A INNER JOIN items_facturas B
ON A.NUMERO = B.NUMERO
WHERE A.FECHA_VENTA = vfecha1;
SELECT SUM(B.CANTIDAD * B.PRECIO) INTO facturacion_final  FROM 
facturas A INNER JOIN items_facturas B
ON A.NUMERO = B.NUMERO
WHERE A.FECHA_VENTA = vfecha2;
SET variacion = ((facturacion_final / facturacion_inicial) -1) * 100;
IF variacion > 10 THEN
SELECT 'Verde';
ELSEIF variacion >= -10 AND variacion <= 10 THEN
SELECT 'Amarillo';
ELSE
SELECT 'Rojo';
END IF;
END $$

/*USANDO CASE...*/

DELIMITER $$
CREATE PROCEDURE `comparacion_ventas_case`(vfecha1 DATE, vfecha2 DATE)
BEGIN
DECLARE facturacion_inicial FLOAT;
DECLARE facturacion_final FLOAT;
DECLARE variacion float;
DECLARE mensaje VARCHAR(20);
SELECT SUM(B.CANTIDAD * B.PRECIO) INTO facturacion_inicial  FROM 
facturas A INNER JOIN items_facturas B
ON A.NUMERO = B.NUMERO
WHERE A.FECHA_VENTA = vfecha1;
SELECT SUM(B.CANTIDAD * B.PRECIO) INTO facturacion_final  FROM 
facturas A INNER JOIN items_facturas B
ON A.NUMERO = B.NUMERO
WHERE A.FECHA_VENTA = vfecha2;
SET variacion = ((facturacion_final / facturacion_inicial) -1) * 100;
CASE
WHEN variacion > 10 THEN SET mensaje = 'Verde';
WHEN variacion >= -10 AND variacion <= 10 THEN SET mensaje = 'Amarillo';
WHEN varacion < -10 THEN SET mensaje = 'Rojo';
END CASE;
SELECT mensaje;
END $$


/*Crea un Stored Procedure que, a partir del día 01/01/2017, cuente el número de facturas hasta el día 10/01/2017. 
Debemos mostrar la fecha y el número de facturas día tras día. Llamaremos este SP como: suma_dias_facturas.*/
DELIMITER $$
CREATE PROCEDURE `suma_dias_facturas`()
BEGIN
DECLARE fecha_inicial DATE;
DECLARE fecha_final DATE;
DECLARE n_facturas INT;
SET fecha_inicial = '20170101';
SET fecha_final = '20170110';
WHILE fecha_inicial <= fecha_final
DO
SELECT COUNT(*) INTO n_facturas  FROM facturas WHERE FECHA_VENTA = fecha_inicial;
SELECT concat(DATE_FORMAT(fecha_inicial, '%d/%m/%Y'), '-' , CAST(n_facturas AS CHAR(50))) AS RESULTADO;
SELECT ADDDATE(fecha_inicial, INTERVAL 1 DAY) INTO fecha_inicial;
END WHILE;
END $$

/* Crea un Stored Procedure usando un cursor para hallar el valor total de todos los créditos de todos los clientes. Llamaremos este SP como: limite_creditos. */
DELIMITER $$
CREATE PROCEDURE `limite_creditos`()
BEGIN
DECLARE limite_credito FLOAT;
DECLARE limite_credito_acumulado FLOAT;
DECLARE fin_cursor INT;
DECLARE c CURSOR FOR SELECT LIMITE_DE_CREDITO FROM tabla_de_clientes;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_cursor = 1;
SET fin_cursor = 0;
SET limite_credito_acumulado = 0;
SET limite_credito = 0;
OPEN c;
WHILE fin_cursor = 0
DO
FETCH c INTO limite_credito;
IF fin_cursor = 0 
THEN SET limite_credito_acumulado = limite_credito_acumulado + limite_credito;
END IF;
END WHILE;
SELECT limite_credito_acumulado;
CLOSE c;
END $$

/*Crea un Stored Procedure usando un cursor para hallar el valor total de la facturación para un determinado mes y año.*/
DELIMITER $$
CREATE PROCEDURE `campo_adicional`()
BEGIN
DECLARE cantidad INT;
DECLARE precio FLOAT;
DECLARE facturacion_acumulada FLOAT;
DECLARE fin_cursor INT;
DECLARE c CURSOR FOR
SELECT IFa.CANTIDAD, IFa.PRECIO FROM items_facturas IFa
INNER JOIN facturas  F ON F.NUMERO = IFa.NUMERO
WHERE MONTH(F.FECHA_VENTA) = 1 AND YEAR(F.FECHA_VENTA) = 2017;
DECLARE CONTINUE HANDLER FOR NOT FOUND 
SET fin_cursor = 1;
OPEN c;
SET fin_cursor = 0;
SET facturacion_acumulada = 0;
WHILE fin_cursor = 0
DO
FETCH c INTO cantidad, precio;
IF fin_cursor = 0 THEN
SET facturacion_acumulada = facturacion_acumulada + (cantidad * precio);
END IF;
END WHILE;
CLOSE c;
SELECT facturacion_acumulada;
END $$


/*EJERCICIO FUNCIONES*/

DELIMITER $$
CREATE PROCEDURE `sp_numero_facturas` ()
BEGIN
DECLARE n_facturas INT;
SELECT COUNT(*) INTO n_facturas FROM facturas WHERE FECHA_VENTA = '20170101';
SELECT n_facturas;
END $$

/*Transforma este SP en una función donde ingresamos como parámetro la fecha y retornamos el número de facturas. 
Llamaremos esta función f_numero_facturas. Luego de crear la función, ejecútalo utilizando el comando SELECT.*/

DELIMITER $$
CREATE FUNCTION `f_numero_facturas`(fecha DATE) 
RETURNS INTEGER
BEGIN
DECLARE n_facturas INT;
SELECT COUNT(*) INTO n_facturas FROM facturas WHERE FECHA_VENTA = fecha;
RETURN n_facturas;
END $$

SELECT f_numero_facturas() AS RESULTADO;
