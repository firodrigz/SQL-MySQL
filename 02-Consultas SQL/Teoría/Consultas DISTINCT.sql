/* Comando DISTINCT */

/*Solo devuelve registros con valores diferentes sin repetir*/
SELECT DISTINCT * FROM tb;

SELECT ENVASE, TAMANO FROM tabla_de_productos; /*Acá devuelve repetidos*/
SELECT DISTINCT ENVASE, TAMANO FROM tabla_de_productos; /*Acá devuelve sin repetir*/

SELECT DISTINCT ENVASE, TAMANO, SABOR FROM tabla_de_productos WHERE SABOR = 'Naranja'; 