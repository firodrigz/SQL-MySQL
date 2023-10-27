/* Back-up*/

/* 
-Es una copia de seguridad de la base que se realiza periodicamente para recuperarla en caso de problemas
con la base de datos.

BACK-UP LÓGICO
-Exporta todas las estructuras, tablas, rutinas, (...) a un script sql que al ser ejecutado recrea
toda la base de datos.
-Permite la manipulación externa, antes de recuperar la información.
-Es más lento porque se ejecuta comando a comando.

mysqldump
Sintaxis: mysqldump [options]
-Usuario, contraseña, servidor
- --all-databases indica que el back-up será completo.
- ><nombre_archivo> muestra el archivo de salida del back-up.
- Si derea incluir stored procedures e eventos usar --routines y --events.
- https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html

BACK-UP FÍSICO
-Contiene todos los archivos binarios del sistema donde la información está almacenada, pero sin los
respectivos comandos.
-Es más rápido que el back-up lógico, pero es menos flexible. (No permite editar tablas y datos antes
de su restauración).
*/

-- Creando un back-up completo de una base con mysqldump
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -uroot -p --databases jugos_ventas > D:\Desarrollo\Web\OracleAlura\sql_dba\jugos_ventas_full.sql

-- Creando un back-up EXCEPTO una TABLA con mysqldump
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -uroot -p --databases jugos_ventas --ignore-table jugos_ventas.facturas  > D:\Desarrollo\Web\OracleAlura\sql_dba\jugos_ventas_sin_facturas.sql


/* Back-up con Workbench */
LOCK instance for backup; -- Detenemos para hacer back-up 
-- Administration - Data export
UNLOCK INSTANCE; -- Reanudamos una vez hecho el back-up

/*Back-up físico*/
LOCK instance for backup; -- Detenemos para hacer back-up 
-- Copiamos la carpeta Data junto a my.ini en un nuevo directorio
UNLOCK INSTANCE; -- Reanudamos una vez hecho el back-up