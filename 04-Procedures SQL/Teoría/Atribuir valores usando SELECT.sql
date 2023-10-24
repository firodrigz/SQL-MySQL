/* Atribuir valores usando SELECT */

/*Queremos una rutina que mandandole el código del producto me devuelva en sabor*/
DELIMITER $$
CREATE PROCEDURE `mostrar_sabor`(vcodigo VARCHAR(10))
BEGIN
DECLARE vsabor VARCHAR(20);
SELECT SABOR INTO vsabor FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;
-- INTO SE USA PARA ATRIBUIR EL SABOR EN LA VARIABLE VSABOR
SELECT vsabor;
END $$

CALL mostrar_sabor("1000889");

SELECT * FROM tabla_de_productos;