/* Si queremos hacer mantenimiento a la base o necesitamos alterar alguna de las variables de entorno
para optimizar el uso del servidor debemos desactivar el servidor para esto tenemos 2 formas:

1 - Desde la interfaz "Servicios", buscar MySQL80 y detener la ejecución.
2 - Desde la consola ejecutándola como administrador. Colocamos el sig comando: net stop mysql80.

Para reactivar el servidor tenemos las 2 alternamivas mencionadas anteriormente:

1 - Interfaz "Servicios".
2 - Consola pero ahora con el sig comando: net start mysql80.
*/