/* Estructura JOIN */

/* Permite unir 2 o m´ás tablas a través de un campo en común */

/*INNER JOIN: Devuelve únicamente los registros con llaves correspondientes*/
SELECT A.NOMBRE, B.HOBBY FROM TABLA_IZQ A
INNER JOIN TABLA_DER B
ON A.ID = B.ID

/*LEFT JOIN: Mantiene todos los registros de la tabla de la izquierda
y devuelve únicamente los correspondientes de la tabla de la derecha*/
SELECT A.NOMBRE, B.HOBBY FROM TABLA_IZQ A 
LEFT JOIN TABLA_DER B
ON A.ID = B.ID

/*RIGHT JOIN: Mantiene todos los registros de la tabla de la derecha y
devuelve únicamente los correspondientes de la tabla de la izquierda*/
SELECT A.NOMBRE, B.HOBBY FROM TABLA_IZQ A 
RIGHT JOIN TABLA_DER B
ON A.ID = B.ID

/*FULL JOIN: Mantiene y devuelve todos los registros de las tablas*/
SELECT A.NOMBRE, B.HOBBY FROM TABLA_IZQ A 
FULL JOIN TABLA_DER B
ON A.ID = B.ID

/*CROSS JOIN: Devuelve el producto cartesiano de los registros de las tablas*/
SELECT A.NOMBRE, B.HOBBY FROM TABLA_IZQ A, TABLA_DER B


/*Ejemplo de INNER JOIN*/
SELECT * FROM tabla_de_vendedores;

SELECT * FROM facturas;

SELECT A.NOMBRE, B.MATRICULA, COUNT(*) FROM tabla_de_vendedores A 
INNER JOIN facturas B
ON A.MATRICULA = B.MATRICULA
GROUP BY A.NOMBRE, B.MATRICULA;

/*Ejemplo de LEFT Y RIGHT JOIN*/
SELECT count(*) FROM tabla_de_clientes;

/*Necesito saber cuales de estos clientes compraron*/
SELECT DISTINCT A.DNI, A.NOMBRE, B.DNI FROM tabla_de_clientes A
INNER JOIN facturas B
ON A.DNI = B.DNI;

SELECT DISTINCT A.DNI, A.NOMBRE, B.DNI FROM tabla_de_clientes A
LEFT JOIN facturas B
ON A.DNI = B.DNI
WHERE B.DNI IS NULL;

SELECT DISTINCT B.DNI, B.NOMBRE, A.DNI FROM facturas A
RIGHT JOIN tabla_de_clientes B
ON A.DNI = B.DNI
WHERE A.DNI IS NULL;


/*Ejemplo de FULL Y CROSS JOIN*/
SELECT * FROM tabla_de_clientes;
SELECT * FROM tabla_de_vendedores;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO, 
tabla_de_vendedores.NOMBRE, tabla_de_vendedores.BARRIO
FROM tabla_de_clientes
INNER JOIN tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO, 
tabla_de_vendedores.NOMBRE, tabla_de_vendedores.BARRIO
FROM tabla_de_clientes
LEFT JOIN tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO, 
tabla_de_vendedores.NOMBRE, tabla_de_vendedores.BARRIO
FROM tabla_de_clientes
RIGHT JOIN tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO, 
tabla_de_vendedores.NOMBRE, tabla_de_vendedores.BARRIO
FROM tabla_de_clientes
FULL JOIN tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

/*el cross join es lo mismo que inner join*/
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO, 
tabla_de_vendedores.NOMBRE, tabla_de_vendedores.BARRIO
FROM tabla_de_clientes, tabla_de_vendedores
WHERE tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;



