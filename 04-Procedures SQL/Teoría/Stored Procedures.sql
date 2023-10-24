/*Stored Procedures*/

/*Programas estructurados que huyen del estandar ANSI*/
DELIMITER $$
CREATE PROCEDURE
nombre_del_procedimiento (parámetros VARCHAR(10))
BEGIN
/*DECLARE <declaración de variables>;
...
<ejecuciones del procedimiento>;
...*/
END $$

CALL hola_mundo;
CALL muestra_numero;
CALL concatenar;

/*Se usa DECLARE para declarar una variable tipada*/
CALL exhibir_variable;
CALL declaracion;

/*Redefinimos variable*/
CALL atribuir_valores;

/*Podemos colocar una serie de pasos*/
CALL manipulacion;

/*Insertando registro con uso de variables*/
CALL incluir_producto;
SELECT * FROM tabla_de_productos WHERE NOMBRE_DEL_PRODUCTO LIKE 'Sabor In%';


