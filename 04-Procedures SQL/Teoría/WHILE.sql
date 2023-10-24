/* WHILE */

CREATE TABLE tb_looping (ID INT);

SELECT * FROM tb_looping;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `looping`(vinicial INT, vfinal INT)
BEGIN
DECLARE vcontador INT;
DELETE FROM tb_looping; 
-- ELIMINA REGISTROS BASURA DE LA TABLA -- LA REINICIA EN VACÍA
SET vcontador = vinicial;
WHILE vcontador <= vfinal
DO
INSERT INTO tb_looping VALUES (vcontador);
SET vcontador = vcontador+1;
END WHILE;
SELECT * FROM tb_looping;
END $$

CALL looping(1,10);