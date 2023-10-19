/* Funciones con STRINGS */

SELECT LTRIM("	MySQL es fácil");
SELECT RTRIM("MySQL es fácil	");
SELECT TRIM("	MySQL es fácil	");
SELECT CONCAT("MySQL es fácil ", "MySQL no es fácil");
SELECT UPPER("convierte en mayúsculas");
SELECT LOWER("CONVIERTE EN MINÚSCULAS");
SELECT SUBSTRING("selecciona la palabra quiera.",23,6);
SELECT CONCAT(NOMBRE," ",DNI) FROM tabla_de_clientes;