/* CASE NOT FOUND */

SELECT SABOR, CODIGO_DEL_PRODUCTO FROM tabla_de_productos;

DELIMITER $$
CREATE PROCEDURE `define_sabor_con_error`(vcodigo VARCHAR(20))
BEGIN
DECLARE vsabor VARCHAR(20);  -- SIEMPRE ARRIBA DEL TODO
DECLARE mensajeerror VARCHAR(40);
DECLARE CONTINUE HANDLER FOR 1339 SET mensajeerror = "Sabor no definido."; -- DEFINIMOS UN MENSAJE PARA EL ERROR
SELECT SABOR INTO vsabor FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;
CASE vsabor
WHEN "Maracuyá" THEN SELECT "Muy Rico";
WHEN "Frutilla" THEN SELECT "Rico";
WHEN "Limón" THEN SELECT "Rico";
WHEN "Uva" THEN SELECT "Rico";
WHEN "Sandía" THEN SELECT "Normal";
WHEN "Mango" THEN SELECT "Normal";
END CASE;
SELECT mensajeerror;
END $$

CALL define_sabor_con_error("1000800");