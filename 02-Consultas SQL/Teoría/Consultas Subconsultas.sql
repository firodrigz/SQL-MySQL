/* SUBCONSULTA */

/* Permite realizar una consulta al interior de otra */

SELECT X,Y FROM tb1 WHERE Y IN(1,2); /*Donde los valores de Y sean 1 o 2*/

SELECT X,Y FROM tb1 WHERE Y IN (SELECT Y FROM tb2); /*Es lo mismo que arriba*/

SELECT X,SUM(Y) AS NEW_Y FROM tb1 GROUP BY X;

SELECT Z.X,Z.NEW_Y FROM (SELECT X,SUM(Y) AS NEW_Y FROM tb1 GROUP BY X)Z
WHERE Z.NEW_Y = 4;


SELECT DISTINCT BARRIO FROM tabla_de_vendedores;
SELECT * FROM tabla_de_clientes WHERE BARRIO IN('Condesa','Del Valle','Contadero','Oblatos');
/*Devuelve los clientes que vivan en alguno de esos barrios*/
SELECT * FROM tabla_de_clientes WHERE BARRIO IN(SELECT DISTINCT BARRIO FROM tabla_de_vendedores);

/*Busco precio máximo*/
SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE;

SELECT X.ENVASE, X.PRECIO_MAXIMO FROM (SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE) X
WHERE X.PRECIO_MAXIMO >=10;
