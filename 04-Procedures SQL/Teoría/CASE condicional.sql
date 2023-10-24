/* CASE condicional - ES MÁS EFICIENTE USAR CASE ANTES QUE ELIF */

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `precio_producto_case`(vcodigo VARCHAR(20))
BEGIN
DECLARE vresultado VARCHAR(40);
DECLARE vprecio FLOAT;
SELECT PRECIO_DE_LISTA INTO vprecio FROM tabla_de_productos 
WHERE CODIGO_DEL_PRODUCTO = vcodigo;
CASE
WHEN vprecio >=12 THEN SET vresultado = "Producto costoso";
WHEN vprecio >= 7 AND vprecio < 12 THEN SET vresultado = "Producto accesible";
WHEN vprecio < 7 THEN SET vresultado = "Producto barato";
END CASE;
SELECT vresultado;
END $$

CALL precio_producto_case("1004327");
CALL precio_producto_case("1040107");
CALL precio_producto_case("1000800");