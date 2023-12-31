/*INFORME DE VENTAS VÁLIDAS*/
SELECT * FROM facturas;
SELECT * FROM items_facturas;

SELECT F.DNI, DATE_FORMAT(F.FECHA_VENTA, "%m-%Y") AS MES_AÑO, IFa.CANTIDAD FROM facturas F
INNER JOIN items_facturas IFa 
ON F.NUMERO = IFa.NUMERO;

/*Cantidad de ventas por mes para cada clientes*/
SELECT F.DNI, DATE_FORMAT(F.FECHA_VENTA, "%m-%Y") AS MES_AÑO, SUM(IFa.CANTIDAD) CANTIDAD_VENDIDA FROM facturas F
INNER JOIN items_facturas IFa 
ON F.NUMERO = IFa.NUMERO
GROUP BY F.DNI, DATE_FORMAT(F.FECHA_VENTA, "%m-%Y");

/*Límite de ventas por cliente (VOLUMEN EN DECILITROS)*/
SELECT * FROM tabla_de_clientes TC;

SELECT DNI, NOMBRE, VOLUMEN_DE_COMPRA FROM tabla_de_clientes TC;


SELECT F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m-%Y") AS MES_AÑO, SUM(IFa.CANTIDAD) CANTIDAD_VENDIDA, MAX(VOLUMEN_DE_COMPRA)/10 AS CANTIDAD_MAXIMA 
FROM facturas F
INNER JOIN items_facturas IFa 
ON F.NUMERO = IFa.NUMERO
INNER JOIN tabla_de_clientes TC
ON TC.DNI = F.DNI
GROUP BY F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m-%Y");


/*Muestra de ventas inválidas y difertencia entre el límite de venta máximo y la cantidad vendida en porcentuales*/
SELECT A.DNI, A.NOMBRE, A.MES_AÑO, 
A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA AS DIFERENCIA,
CASE
   WHEN  (A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA) <= 0 THEN 'Venta Válida'
   ELSE 'Venta Inválida'
END AS STATUS_VENTA, ROUND((1 - (A.CANTIDAD_MAXIMA/A.CANTIDAD_VENDIDA)) * 100,2) AS PORCENTAJE
 FROM(
SELECT F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y") AS MES_AÑO, 
SUM(IFa.CANTIDAD) AS CANTIDAD_VENDIDA, 
MAX(VOLUMEN_DE_COMPRA)/10 AS CANTIDAD_MAXIMA  
FROM facturas F 
INNER JOIN 
items_facturas IFa
ON F.NUMERO = IFa.NUMERO
INNER JOIN 
tabla_de_clientes TC
ON TC.DNI = F.DNI
GROUP BY
F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y"))A
WHERE (A.CANTIDAD_MAXIMA - A.CANTIDAD_VENDIDA) < 0;


/*Lista los que tuvieron ventas inválidas en el año 2018 excediendo más del 50% de su límite permitido por mes*/
SELECT A.DNI, A.NOMBRE, A.MES_AÑO, 
A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA AS DIFERENCIA,
CASE
   WHEN  (A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA) <= 0 THEN 'Venta Válida'
   ELSE 'Venta Inválida'
END AS STATUS_VENTA, ROUND((1 - (A.CANTIDAD_MAXIMA/A.CANTIDAD_VENDIDA)) * 100,2) AS PORCENTAJE
 FROM(
SELECT F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y") AS MES_AÑO, 
SUM(IFa.CANTIDAD) AS CANTIDAD_VENDIDA, 
MAX(VOLUMEN_DE_COMPRA)/10 AS CANTIDAD_MAXIMA  
FROM facturas F 
INNER JOIN 
items_facturas IFa
ON F.NUMERO = IFa.NUMERO
INNER JOIN 
tabla_de_clientes TC
ON TC.DNI = F.DNI
GROUP BY
F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y"))A
WHERE (A.CANTIDAD_MAXIMA - A.CANTIDAD_VENDIDA) < 0 AND ROUND((1 - (A.CANTIDAD_MAXIMA/A.CANTIDAD_VENDIDA)) * 100,2) > 50
AND A.MES_AÑO LIKE "%2018";

