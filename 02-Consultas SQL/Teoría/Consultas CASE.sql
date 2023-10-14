/* Comando CASE */

/* Realiza un test en uno o más campos y dependiendo el resultado se obtiene un valor específico */

CASE 
	WHEN <condicion_1> THEN <value_1>
    WHEN <condicion_2> THEN <value_2>
    ...
    WHEN <condicion_n> THEN <value_n>
    ELSE <valor_ELSE>
END;

SELECT * FROM tabla_de_productos;

SELECT NOMBRE_DEL_PRODUCTO, MAX(PRECIO_DE_LISTA) FROM tabla_de_productos GROUP BY NOMBRE_DEL_PRODUCTO;

SELECT NOMBRE_DEL_PRODUCTO, PRECIO_DE_LISTA,
CASE
	WHEN PRECIO_DE_LISTA >= 12 THEN 'Costoso'
    WHEN PRECIO_DE_LISTA >= 5 AND PRECIO_DE_LISTA < 12 THEN 'Accesible'
    ELSE 'Barato'
END AS PRECIO
FROM tabla_de_productos;

SELECT ENVASE, SABOR,
CASE
	WHEN PRECIO_DE_LISTA >= 12 THEN 'Costoso'
    WHEN PRECIO_DE_LISTA >= 5 AND PRECIO_DE_LISTA < 12 THEN 'Accesible'
    ELSE 'Barato'
END AS PRECIO, MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO
FROM tabla_de_productos
WHERE TAMANO = '700 ml'
GROUP BY ENVASE,
CASE
	WHEN PRECIO_DE_LISTA >= 12 THEN 'Costoso'
    WHEN PRECIO_DE_LISTA >= 5 AND PRECIO_DE_LISTA < 12 THEN 'Accesible'
    ELSE 'Barato'
END
ORDER BY ENVASE;