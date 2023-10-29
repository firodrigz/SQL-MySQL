/* Visualizando costos de las consultas*/

-- Primero debemos iniciar la DB desde consola.. para esto seguimos la sig ruta:
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -uroot -p
-- Para ver el costo de la consulta
EXPLAIN FORMAT = JSON SELECT CODIGO_DEL_PRODUCTO FROM tabla_de_productos A \G;

-- cost 3.75
SELECT A.CODIGO_DEL_PRODUCTO FROM tabla_de_productos A;

-- cost 60654.92
SELECT A.CODIGO_DEL_PRODUCTO, C.CANTIDAD FROM tabla_de_productos A
INNER JOIN items_facturas C
ON A.CODIGO_DEL_PRODUCTO = C.CODIGO_DEL_PRODUCTO;

-- cost 138645.17
SELECT A.CODIGO_DEL_PRODUCTO, YEAR(FECHA_VENTA) AS AÑO, C.CANTIDAD FROM tabla_de_productos A 
INNER JOIN items_facturas C 
ON A.CODIGO_DEL_PRODUCTO = C.CODIGO_DEL_PRODUCTO 
INNER JOIN facturas B 
ON C.NUMERO = B.NUMERO;

-- cost 138645.17
SELECT A.CODIGO_DEL_PRODUCTO, YEAR(FECHA_VENTA) AS AÑO, SUM(C.CANTIDAD) AS CANTIDAD FROM tabla_de_productos A 
INNER JOIN items_facturas C 
ON A.CODIGO_DEL_PRODUCTO = C.CODIGO_DEL_PRODUCTO 
INNER JOIN facturas B 
ON C.NUMERO = B.NUMERO 
GROUP BY A.CODIGO_DEL_PRODUCTO, YEAR(FECHA_VENTA) 
ORDER BY A.CODIGO_DEL_PRODUCTO, YEAR(FECHA_VENTA);