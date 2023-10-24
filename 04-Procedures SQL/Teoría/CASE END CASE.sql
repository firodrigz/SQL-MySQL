/* CASE END CASE */

SELECT DISTINCT SABOR FROM tabla_de_productos
/*
Maracuyá Rico
Limón Rico
Frutilla Rico
Uva Rico
Sandía Normal
Mango Normal
Los demás Comunes
*/

DELIMITER $$
CREATE PROCEDURE `define_sabor`(vcodigo VARCHAR(20))
BEGIN
DECLARE vsabor VARCHAR(20);
SELECT SABOR INTO vsabor FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;
CASE vsabor
WHEN "Maracuyá" THEN SELECT "Muy Rico";
WHEN "Frutilla" THEN SELECT "Rico";
WHEN "Limón" THEN SELECT "Rico";
WHEN "Uva" THEN SELECT "Rico";
WHEN "Sandía" THEN SELECT "Normal";
WHEN "Mango" THEN SELECT "Normal";
ELSE SELECT "Jugos comunes";
END CASE;
END $$

CALL define_sabor("544931");