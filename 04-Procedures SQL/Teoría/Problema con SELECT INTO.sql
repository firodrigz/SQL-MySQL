/* Problema Select INTO */

DELIMITER $$
CREATE PROCEDURE `problema_select_into` ()
BEGIN
DECLARE vnombre VARCHAR(50);
SELECT NOMBRE INTO vnombre FROM tabla_de_clientes;
SELECT vnombre;
END $$

/* No puedo poner un array en una variable */ 
-- SELECT INTO es funcional SOLAMENTE si queremos atribuir UN SOLO VALOR a una variable

