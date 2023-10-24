/*Control de errores*/

CALL incluir_producto_parametros("1000800", "Sabor del Mar", "700 ml", "Naranja", "Botella de Vidrio", 2.25);

SELECT * FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = "1000800";

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `incluir_producto_parametros`(vcodigo VARCHAR(20), vnombre VARCHAR(20), 
vsabor VARCHAR(20), vtamano VARCHAR(20), venvase VARCHAR(20), vprecio DECIMAL(4,2))
BEGIN
DECLARE mensaje VARCHAR(40);
DECLARE EXIT HANDLER FOR 1062 -- 1062 ES EL NÚMERO DE ERROR CUANDO QUEREMOS INGRESAR UN VALOR DUPLICADO
BEGIN
	SET mensaje = "Producto duplicado!";
	SELECT mensaje;
END;
INSERT INTO tabla_de_productos (CODIGO_DEL_PRODUCTO,NOMBRE_DEL_PRODUCTO,SABOR,TAMANO,ENVASE,PRECIO_DE_LISTA)
     VALUES (vcodigo, vnombre, vsabor, vtamano, venvase, vprecio);
SET mensaje = "Producto incluído con éxito!";
SELECT mensaje;
END $$

CALL incluir_producto_parametros("1000801", "Sabor del Mar", "700 ml", "Naranja", "Botella de Vidrio", 3.25);

SELECT * FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = "1000800";