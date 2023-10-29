/* Índices */

/* 
-Facilitan la búsqueda de datos dentro de la tabla.
-Sin estructura de índices => recorrer toda la tabla hasta encontrar el registro.

Consideraciones en su uso sobre MyISAM
-Modificación en la tabla original => Todos los índices se actualizan.
-Muchos índices => Más tiempo de ejecución.
-Crea una estructura separada para índices PK y no PK.
-La columna del índice es ordenada y toma como referencia la posición de la fila de la tabla original.
-Implementa índices HASH y B-TREE.

Consideraciones en su uso sobre InnoDB
-La clave primaria es el índice.
-La referencia es la clave primaria.
-Mejor desempeño en las consultas buscando a través de clave primaria.
-Solo trabaja con B-TREE.

En conclusión: 
Muchos índices harán que los comandos de INSERT, UPDATE y DELETE se vuelvan más lentos (Como los 
índices deben ser reconstruidos cada vez que se modifican los datos de las tablas, muchos índices 
sí afectan el desempeño).

/* Búsquedas */

/* Árbol binario B-TREE
-Valores a la izquierda del nodo son menores.
-Valores a la derecha del nodo son mayores.
*/

/* HASH
-Mapea datos generales de tamaños variables en un tamaño fijo.
Ejemplo:
ADSNFDJHDUHVMLRURJGKÇIRTJHNJG				101254102200
KJFDKK										035215658965
172666INHFJHDYJLPP9998U8UF					650002550055
DF											987545854580
-Cuando abrimos un libro, buscamos en el índice para encontrar la página que deseamos consultar.
-Criptografía, almacenar contraseñas, entre otros.
*/

-- cost 8850.35
SELECT * FROM FACTURAS WHERE FECHA_VENTA = "20170101";

-- Para crear un índice: 
ALTER TABLE FACTURAS ADD INDEX(FECHA_VENTA);

-- Después de crear el índice el costo de la consulta cambia
-- cost 25.90
SELECT * FROM FACTURAS WHERE FECHA_VENTA = "20170101";


-- Usamos índices para los campos que hacen parte de la igualdad de los JOIN y el que está en el criterio de filtro WHERE.

