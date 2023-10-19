USE jugos_ventas;

/* ¿Cuántos clientes tienen apellidos que acaban con “ez”? */
SELECT * FROM tabla_de_clientes WHERE NOMBRE LIKE '%ez';

/* ¿Cuáles son los barrios en Ciudad de México que tienen clientes? */
SELECT DISTINCT BARRIO FROM tabla_de_clientes WHERE CIUDAD = 'Ciudad de México';

/* Queremos obtener las 10 primeras ventas del día 01/01/2017. ¿Cuál sería el comando SQL para obtener este resultado? */
SELECT * FROM facturas  WHERE FECHA_VENTA = '2017-01-01' LIMIT 10;

/* ¿Cuál (o cuáles) fue (fueron) la(s) mayor(es) venta(s) del producto “Refrescante, 1 Litro, Frutilla/Limón”, en cantidad? (Obtenga este resultado utilizando 2 comandos SQL). */
SELECT CODIGO_DEL_PRODUCTO FROM tabla_de_productos 
WHERE NOMBRE_DEL_PRODUCTO = "Refrescante" AND TAMANO = "1 Litro" 
AND SABOR = "Frutilla/Limón";

SELECT * FROM items_facturas WHERE CODIGO_DEL_PRODUCTO = "1101035" ORDER BY CANTIDAD DESC;

/*¿Cuántos ítems vendidos cuentan con la mayor cantidad del producto '1101035'? */ 
SELECT MAX(CANTIDAD) AS CANTIDAD_MAXIMA FROM items_facturas WHERE CODIGO_DEL_PRODUCTO = "1101035";

SELECT COUNT(*) FROM items_facturas WHERE CODIGO_DEL_PRODUCTO = "1101035" AND CANTIDAD = 99;

/* ¿Quiénes fueron los clientes que realizaron más de 2000 compras en 2016? */
SELECT DNI, COUNT(*) AS COMPRAS FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI
HAVING COUNT(*) > 2000;

/* Registre el año de nacimiento de los clientes y clasifíquelos de la siguiente manera:
Nacidos antes de 1990= Viejos, nacidos entre 1990 y 1995= Jóvenes y nacidos
después de 1995= Niños. Liste el nombre del cliente y esta clasificación.*/

SELECT NOMBRE, FECHA_DE_NACIMIENTO,
CASE
	WHEN YEAR(FECHA_DE_NACIMIENTO) < 1990 THEN 'Viejos'
    WHEN YEAR(FECHA_DE_NACIMIENTO) >= 1990 AND YEAR(FECHA_DE_NACIMIENTO) <=1995 THEN 'Jóvenes'
    WHEN YEAR(FECHA_DE_NACIMIENTO) > 1995 THEN 'Niños'
END AS CONDICION_EDAD
FROM tabla_de_clientes;

/*Obtén la facturación anual de la empresa. Ten en cuenta que el valor financiero de las 
ventas consiste en multiplicar la cantidad por el precio.*/
SELECT YEAR(FECHA_VENTA), SUM(CANTIDAD * PRECIO) AS FACTURACION
FROM facturas F 
INNER JOIN 
items_facturas IFa 
ON F.NUMERO = IFa.NUMERO
GROUP BY YEAR(FECHA_VENTA);


/*FUNCIONES*/
/*Consulta listando el nombre del cliente y la dirección completa (Con calle, barrio, ciudad y estado).*/
SELECT NOMBRE, CONCAT(DIRECCION_1," ",BARRIO," ",CIUDAD," ",ESTADO) AS DIRECCION_COMPLETA FROM tabla_de_clientes;

/*Haz una consulta que muestre el nombre y la edad actual del cliente*/
SELECT NOMBRE, TIMESTAMPDIFF(YEAR, FECHA_DE_NACIMIENTO, CURDATE()) AS EDAD
FROM  tabla_de_clientes;

/*En la tabla de facturas tenemos el valor del impuesto. En la tabla de ítems tenemos la cantidad y la facturación. 
Calcula el valor del impuesto pago en el año de 2016 redondeando al menor entero.*/
SELECT YEAR(FECHA_VENTA), FLOOR(SUM(IMPUESTO * (CANTIDAD * PRECIO))) 
AS RESULTADO
FROM facturas F
INNER JOIN items_facturas IFa ON F.NUMERO = IFa.NUMERO
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY YEAR(FECHA_VENTA);

/*Queremos construir un SQL cuyo resultado sea, para cada cliente:
“El cliente Pepito Pérez facturó 120000 en el año 2016”.
Solamente para el año 2016.*/
SELECT CONCAT('El cliente ', TC.NOMBRE, ' facturó ', 
CONVERT(SUM(IFa.CANTIDAD * IFa.precio), CHAR(20))
 , ' en el año ', CONVERT(YEAR(F.FECHA_VENTA), CHAR(20))) AS FRASE FROM facturas F
INNER JOIN items_facturas IFa ON F.NUMERO = IFa.NUMERO
INNER JOIN tabla_de_clientes TC ON F.DNI = TC.DNI
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY TC.NOMBRE, YEAR(FECHA_VENTA);