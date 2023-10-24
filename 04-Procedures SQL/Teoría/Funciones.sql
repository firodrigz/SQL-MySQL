/* FUNCIONES */

SET GLOBAL log_bin_trust_function_creators = 1 ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `f_define_sabor`(vsabor VARCHAR(40)) RETURNS varchar(40) CHARSET utf8mb4
BEGIN
DECLARE vretorno VARCHAR(40) DEFAULT "";
CASE vsabor
WHEN "Maracuyá" THEN SET vretorno = "Muy Rico";
WHEN "Frutilla" THEN SET vretorno = "Rico";
WHEN "Limón" THEN SET vretorno = "Rico";
WHEN "Uva" THEN SET vretorno = "Rico";
WHEN "Sandía" THEN SET vretorno = "Normal";
WHEN "Mango" THEN SET vretorno = "Normal";
ELSE SET vretorno = "Jugos comunes";
END CASE;
RETURN vretorno;
END $$

SELECT f_define_sabor("Maracuyá");

SELECT NOMBRE_DEL_PRODUCTO, SABOR, f_define_sabor(SABOR) AS TIPO FROM tabla_de_productos;

SELECT NOMBRE_DEL_PRODUCTO, SABOR, f_define_sabor(SABOR) AS TIPO
FROM tabla_de_productos;