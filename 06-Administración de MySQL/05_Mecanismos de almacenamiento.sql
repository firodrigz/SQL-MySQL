/* Mecanismos de almacenamiento */

/*
-Son la forma de almacenar información en las tablas.
-Una misma BD puede usar diversos mecanismos en sus tablas.
-ENGINE: Es el parámetro que indica el mecanismo de almacenamiento empleado en la tabla.
Los 3 principales engines son: MyISAM, InnoDB y MEMORY.

MyISAM
-No es transaccional (No está diseñado para que varios usuarios realicen operaciones
en las tablas simultáneamente).
-Solamente permite el bloqueo a nivel de tabla. (Lectura más rápida).
-Recomendable para tablas que no están cambiando continuamente.
-La clave externa no soporta Full Text.
-Almacena datos de manera más compacta. (Optimiza espacio de almacenamiento).
-Implementa índices HASH y BTREE. (Ventaja).

Variables de ambiente
-key_buffer_size: Determina el tamaño de cache para almacenar los índices de MyISAM. Varía
de 8MB ~ 4GB de acuerdo con el OS.
-concurrent_insert: Comportamiento de inserciones concurrentes dentro de una table MyISAM.
	0 = inserciones simultáneas desactivadas.
    1 = inserciones simultáneas sin intervalo de datos (al mismo tiempo).
    2 = inserciones simultáneas con intervalo de datos.
-delay_key_write:Atraso entre la actualización de índices y el momento en que se crea una tabla.
-max_write_lock_count: Determina el número de grabaciones en las tablas que tendrán precedencia
a las lecturas. (Priorizar la cantidad de grabaciones que se realizarán antes de las lecturas en
varias conexiones).
-preload_buffer_size: Tamaño del buffer a ser usado antes de cargar los índices de caches
de claves de las tablas: 32KB.

Aplicaciones MyISAM
-myisamchk: Analiza, optimiza y repara tablas MyISAM. (reconstruye)
-myisampack: Crea tablas MyISAM compactas que serán usadas solo para lectura. No es posible hacer
inserciones a las tablas. (Mejor desempeño para lectura).
-myisam_ftdump: Exhibe información más completa de los campos de tipo texto.

En conclusión: MyISAM lo podremos utilizar las tablas no tienen muchas transacciones,
no sufren muchas modificaciones (es más bien fija, que es solo de lectura).

InnoDB
-Mecanismo de almacenamiento transaccional más utilizado en MySQL.
-Está diseñado para que varios usuarios realicen operaciones en las tablas simultáneamente.
-Soporte transaccional completo / Soporte a claves externas.
-Cache de buffer configurado de forma separada tanto para la base como para el índice.
-Bloqueo de tabla a nivel de línea.
-Indexación BTREE.
-Back-up de BD online - Sin bloqueo.

Variables de ambiente
Tablas
-innodb_data_file_path: Determina camino y tamaño máximo del archivo dentro del sistema donde
se almacenará la información.
-innodb_data_home_dir: Camino común del directorio de todos los archivos innodb; 
cuando se especifica, graba todo dentro de ese directorio. *Default=/mysqldata
-innodb_file_per_table: Separa el almacenamiento de los datos por sus índices. Por defecto
almacena datos e índices de forma compartida.
Desempeño
-innodb_buffer_pool_size: Determina tamaño de almacenamiento que innodb va a usar para almacenar
índices y datos en cache.
-innodb_flush_log_at_trx_commit: Determina la frecuencia con que el buffer de log-in es habilitado
para el disco. Crece con el uso y después de un lapso es descargado al HD.
-innobd_log_file_size: Tamaño en Bytes con el cual se crearán los archivos de log-in.
Por defecto es de 5MB.

MEMORY
-Mecanismo de almacenamiento que crea tablas en memoria RAM. No en disco.
-No soporta clave externa.
-Acceso muy rápido a la información.
-Los datos necesitan ser reinicializados junto con el servidor.
-Bloqueo a nivel de tabla.
-Índice utiliza HASH por defecto y BTREE.
-Formato de línea de longitud fija.(No soporta BLOB/TEXT)
*/