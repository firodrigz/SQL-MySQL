/* View */

/* Es una tabla lógica que resulta de una consulta que puede ser usada posteriormente
en cualquier otra consulta */ /* Es para dar acceso a una parte de la base de datos */

SELECT X, SUM(Y) AS NEW_Y FROM tb1 GROUP BY X; /* Crea view VW_VIEW */

/*La visión tiene un costo de procesamiento, siempre que la invoquemos la misma tendrá que ejecutar
su consulta (Especie de subconsulta)*/

SELECT * FROM VW_VIEW;

SELECT VW_VIEW.X, TB3.W FROM VW_VIEW INNER JOIN TB3
ON VW_VIEW.NEW_Y = TB3.Y
WHERE TB3.Y = 16;


/*Seleccione envase, máximo precio de lista y agrupe por envase*/
SELECT ENVASE, MAX(PRECIO_DE_LISTA) 
AS PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE;

/*Seleccione envases donde el precio máximo esté por encima de 10*/
SELECT X.ENVASE, X.PRECIO_MAXIMO FROM
vw_envases_grandes X 
WHERE PRECIO_MAXIMO >= 10;

SELECT A.NOMBRE_DEL_PRODUCTO, A.ENVASE, A.PRECIO_DE_LISTA, B.PRECIO_MAXIMO FROM
tabla_de_productos A INNER JOIN vw_envases_grandes B
ON A.ENVASE = B.ENVASE;

