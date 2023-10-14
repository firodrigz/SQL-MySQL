/* Comando GROUP BY */

/* Presenta el resultado agrupando valores numéricos empleando una clave de criterio */ 
SELECT <campos> FROM tb GROUP BY campo;

SELECT X, SUM(Y) FROM tb GROUP BY X;

/* Podemos utilizar:
SUM() --> Suma
MAX() --> Máximo
MIN() --> Mínimo
AVG() --> Promedio
COUNT() --> Contador */

/* También se puede aplicar para afectuar en toda la tabla.. ejemplo queremos sumar todos los valores*/
SELECT SUM(Y) FROM tb;

SELECT ESTADO, LIMITE_DE_CREDITO FROM tabla_de_clientes;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabla_de_clientes GROUP BY ESTADO;

SELECT ENVASE, PRECIO_DE_LISTA FROM tabla_de_productos;

/*Precio máximo por envase*/
SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE;

/* Cuenta la cantidad de envases */
SELECT ENVASE, COUNT(*) AS CANTIDAD_TOTAL_POR_TIPO_ENVASE FROM tabla_de_productos GROUP BY ENVASE;

SELECT BARRIO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabla_de_clientes GROUP BY BARRIO;

SELECT CIUDAD, BARRIO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabla_de_clientes WHERE CIUDAD='CIUDAD DE MEXICO' GROUP BY BARRIO;

SELECT ESTADO, BARRIO, MAX(LIMITE_DE_CREDITO) AS LIMITE, EDAD FROM tabla_de_clientes WHERE EDAD >=20 
GROUP BY ESTADO, BARRIO 
ORDER BY EDAD;







