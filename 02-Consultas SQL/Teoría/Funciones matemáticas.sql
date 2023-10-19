/* Funciones matemáticas */

SELECT CEILING(25.75); /*Devuelve el siguiente entero - redondea siempre para arriba (26)*/
SELECT FLOOR(25.75); /*Redondea para abajo (25)*/
SELECT RAND(); /*Da número random entre 0 y 1*/


SELECT (34+346-67)/15 * 29 AS RESULTADO;

SELECT ROUND(254.545,2); /*Redondea usando la cantidad de decimales que se le indica*/

SELECT NUMERO, CANTIDAD, PRECIO, ROUND(CANTIDAD*PRECIO,2) AS FACTURACIÓN FROM items_facturas;


