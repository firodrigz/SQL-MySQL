/* Comando ORDER BY */

/* Ordena alfabéticamente ascendente */
SELECT * FROM tb ORDER BY campo;

/* Ordena descendente */
SELECT * FROM tb ORDER BY campo DESC;

/* Se pueden seleccionar varios campos a la vez (HAY Q ESPECIFICAR LA FORMA ASC/DESC) */
SELECT * FROM tb ORDER BY campo_1 DESC, campo_2 ASC; 

SELECT * FROM tabla_de_productos ORDER BY PRECIO_DE_LISTA;
SELECT * FROM tabla_de_productos ORDER BY PRECIO_DE_LISTA DESC;

SELECT * FROM tabla_de_productos ORDER BY NOMBRE_DEL_PRODUCTO;
SELECT * FROM tabla_de_productos ORDER BY NOMBRE_DEL_PRODUCTO DESC;

SELECT * FROM tabla_de_productos ORDER BY ENVASE DESC, NOMBRE_DEL_PRODUCTO ASC;
