/*IF THEN ELSE*/

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `edad_clientes`(vdni VARCHAR(20))
BEGIN
DECLARE vresultado VARCHAR(50);
DECLARE vfecha DATE ;
SELECT FECHA_DE_NACIMIENTO INTO vfecha FROM tabla_de_clientes WHERE DNI = vdni;
IF vfecha < "1995-01-01"
THEN 
SET vresultado = "Cliente viejo.";
ELSE 
SET vresultado = "Cliente joven.";
END IF;
SELECT vresultado;
END $$

CALL edad_clientes ("5648641702");

SELECT * FROM tabla_de_clientes;

