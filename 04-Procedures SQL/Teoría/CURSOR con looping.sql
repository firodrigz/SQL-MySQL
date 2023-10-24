/* CURSOR con looping */

DELIMITER $$
CREATE PROCEDURE `cursor_looping` ()
BEGIN
DECLARE fin_c INT DEFAULT 0;
DECLARE vnombre VARCHAR(50);
DECLARE c CURSOR FOR SELECT NOMBRE FROM tabla_de_clientes;
DECLARE CONTINUE HANDLER FOR NOT FOUND 
SET fin_c = 1; /*Derefine el valor cuando no encuentra ningun registro asociado a los nombres*/
OPEN c;
WHILE fin_c = 0
DO
FETCH c INTO vnombre;
IF fin_c = 0
THEN
SELECT vnombre;
END IF;
END WHILE;
CLOSE c;
END $$

CALL cursor_looping;
SELECT NOMBRE FROM tabla_de_clientes;

/* ACCEDIENDO A MÁS DE UN CAMPO */

DELIMITER $$
CREATE PROCEDURE `cursor_looping_con_varios_campos` ()
BEGIN
DECLARE fin_c INT DEFAULT 0;
DECLARE vbarrio, vciudad, vestado, vcp VARCHAR(50);
DECLARE vnombre, vdireccion VARCHAR(150);
DECLARE c CURSOR FOR SELECT NOMBRE, DIRECCION_1, BARRIO, CIUDAD, ESTADO, CP FROM tabla_de_clientes;
DECLARE CONTINUE HANDLER FOR NOT FOUND 
SET fin_c = 1; /*Derefine el valor cuando no encuentra ningun registro asociado a los nombres*/
OPEN c;
WHILE fin_c = 0
DO
FETCH c INTO vnombre, vdireccion, vbarrio, vciudad, vestado, vcp;
IF fin_c = 0
THEN
SELECT CONCAT(vnombre," Dirección: " , vdireccion, " Barrio: ", vbarrio, " Ciudad: ", vciudad, " Estado: ", vestado, " Código Postal: ", vcp) AS RESULTADO;
END IF;
END WHILE;
CLOSE c;
END $$

CALL cursor_looping_con_varios_campos;

