/*Comando LIKE*/

/* % representa cualquier registro genérico ANTES de la condición */
SELECT * FROM tb WHERE CAMPO LIKE '%<condición>';

/*Selecciona cada campo donde aparece la condición*/
SELECT * FROM tb WHERE CAMPO LIKE '%condición%';

/*Selecciona registros que terminan con la condición*/
SELECT * FROM tb WHERE CAMPO LIKE '%condición';


SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%manzana';
SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%manzana' AND ENVASE = 'Botella PET';

