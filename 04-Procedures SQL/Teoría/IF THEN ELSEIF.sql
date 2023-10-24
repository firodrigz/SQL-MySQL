/* IF THEN ELSEIF */

/* 
Precio >= 12 = Caro.
Precio >= 7 && Precio < 12 = Accesible.
Precio < 7 = Barato.
*/

DELIMITER $$
CREATE PROCEDURE `precio_producto`(vcodigo VARCHAR(20))
BEGIN
DECLARE vresultado VARCHAR(40);
DECLARE vprecio FLOAT;
SELECT PRECIO_DE_LISTA INTO vprecio FROM tabla_de_productos 
WHERE CODIGO_DEL_PRODUCTO = vcodigo;
IF vprecio >= 12
THEN SET vresultado = "Producto costoso";
ELSEIF vprecio >= 7 AND vprecio < 12
THEN SET vresultado = "Producto accesible";
ELSE
SET vresultado = "Producto barato";
END IF;
SELECT vresultado;
END $$

CALL precio_producto("1004327");
CALL precio_producto("1040107");
CALL precio_producto("1000800");

SELECT * FROM tabla_de_productos;