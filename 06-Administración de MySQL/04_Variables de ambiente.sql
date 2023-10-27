/* Variables de ambiente de MySQL */

/* 
-Son variables que se declaran fuera del programa para que al momento de su inicialización queden
predefinidos diversos parámetros de funcionamiento.
-Existen más de 250 variables de ambiente en MySQL. Sufre modificaciones con cada nueva versión.
-SHOW STATUS muestra los valores actuales de las variables de ambiente.
-2 tipos: GLOBAL y SESSION. La primera vale para todo el entorno de MySQL. La última, solo para
la conexión actual.
-my.ini(Linex my.cnf). Dos directivas: [mysqlD] y [client]
https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html
*/

SHOW GLOBAL STATUS LIKE "Created_tmp_disk_tables"; -- Para saber si se está sobreescribiendo el disco
SHOW GLOBAL STATUS LIKE "Created_tmp_tables";

SHOW GLOBAL VARIABLES LIKE "tmp_table_size"; -- Tamaño definido para almacenar consultas en ram

SET GLOBAL tmp_table_size = 136700160; -- Una vez que reinicie el valor vuelve al mismo definido en el my.ini