/* Funciones con FECHA */

SELECT CURDATE(); /*Devuelve fecha actual*/
SELECT CURRENT_TIMESTAMP(); /*Devuelve fecha y hora actual*/
SELECT DATEDIFF("2023-06-25", "2023-06-15"); /*Devuelve los días de diferencia entre primera y 2da fecha*/
SELECT DAY("2023-06-15"); /*Devuelve día de la fecha establecida*/
SELECT DAYNAME("2023-06-15"); /*Devuelve nombre del día de la fecha establecida */
SELECT LOCALTIMESTAMP(); /*Devuelve la fecha actual de donde esté alojada la base de datos*/
SELECT YEAR(CURRENT_TIMESTAMP());
SELECT MONTH(CURRENT_TIMESTAMP());
SELECT DATEDIFF(CURRENT_TIMESTAMP(), "2023-01-01") AS DIFERENCIA_DE_DIAS;
SELECT CURRENT_TIMESTAMP() AS DIA_HOY, DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 MONTH) AS RESULTADO; /*Devuelve fecha de hoy y el intervalo de 1 mes (mes pasado)*/


SELECT DISTINCT FECHA_VENTA, DAYNAME(FECHA_VENTA) AS DIA, MONTHNAME(FECHA_VENTA) AS MES,
YEAR(FECHA_VENTA) AS AÑO FROM facturas;