USE ventas_jugos;

SELECT * FROM jugos_ventas.tabla_de_productos;

/*Renombramos las columnas de jugos_ventas para que sean iguales a ventas_jugos*/
SELECT CODIGO_DEL_PRODUCTO AS CODIGO, NOMBRE_DEL_PRODUCTO AS DESCRIPCION,
SABOR, TAMANO, ENVASE, PRECIO_DE_LISTA AS PRECIO_LISTA FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto);

/*Copiar todos los registros de jugos_ventas a ventas_jugos siempre en cuanto el código de producto
no esté repetido*/
INSERT INTO tb_producto (
SELECT CODIGO_DEL_PRODUCTO AS CODIGO, NOMBRE_DEL_PRODUCTO AS DESCRIPCION,
SABOR, TAMANO, ENVASE, PRECIO_DE_LISTA AS PRECIO_LISTA FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto)
);

SELECT * FROM tb_producto;

