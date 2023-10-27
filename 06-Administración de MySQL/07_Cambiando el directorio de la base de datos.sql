/* Cambiando el directorio de la base de datos */

-- Para ver donde se encuentra almacenada la base de datos
SHOW VARIABLES WHERE Variable_Name LIKE "%dir";  -- buscamos datadir

-- Luego vamos a my.ini y editamos la dirección en la línea de datadir a la nueva ubicación
-- Guardamos el my.ini
-- Copiamos la carpeta Data a la nueva ubicación
-- Reiniciamos el servicio y listo.
