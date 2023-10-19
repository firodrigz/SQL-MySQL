/* Estructura UNION */

/* Permite unir 2 o más tablas (Implícitamente ejecuta DISTINCT) UNE SIN REPETIR
   El número de campos en las tablas debe ser igual (mismos campos y mismos tipos) */
<consulta 1>
UNION
<consulta 2>;

/* UNION ALL une repitiendo */
<consulta 1>
UNION ALL
<consulta 2>

/*Seleccionamos los distintos barrios de los clientes*/
SELECT DISTINCT BARRIO FROM tabla_de_clientes;
SELECT DISTINCT BARRIO FROM tabla_de_vendedores;

SELECT DISTINCT BARRIO FROM tabla_de_clientes
UNION
SELECT DISTINCT BARRIO FROM tabla_de_vendedores;

SELECT DISTINCT BARRIO FROM tabla_de_clientes
UNION ALL
SELECT DISTINCT BARRIO FROM tabla_de_vendedores;

SELECT DISTINCT BARRIO, NOMBRE, 'Cliente' AS TIPO FROM tabla_de_clientes
UNION
SELECT DISTINCT BARRIO, NOMBRE, 'Vendedor' AS TIPO FROM tabla_de_vendedores;

/*Toma el alias del primer select*/
SELECT DISTINCT BARRIO, NOMBRE, 'Cliente' AS TIPO_CLIENTE, DNI FROM tabla_de_clientes
UNION
SELECT DISTINCT BARRIO, NOMBRE, 'Vendedor' AS TIPO_VENDEDOR, MATRICULA FROM tabla_de_vendedores;

/*Creando un full JOIN*/
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO, 
tabla_de_vendedores.NOMBRE, tabla_de_vendedores.BARRIO
FROM tabla_de_clientes
LEFT JOIN tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO
UNION
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO, 
tabla_de_vendedores.NOMBRE, tabla_de_vendedores.BARRIO
FROM tabla_de_clientes
RIGHT JOIN tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;



