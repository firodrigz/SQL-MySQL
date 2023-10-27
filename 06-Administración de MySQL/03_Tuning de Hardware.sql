/* Tuning - poner a punto nuestro hardware */

/* 4 formas de configurar el ambiente MySQL para hacer el tuning:
-Esquemas, índices, variables internas de MySQL(mysqld) y Hardware/Sistema Operativo.

HARDWARE:
-Trabajar con Sistemas Operativos de 64-bits (MySQL puede usar varios procesadores en paralelo
y puede llegar a consumir toda la capacidad de memoria de la máquina).
-Configuración de la RAM (Existe un parámetro interno que nos permite indicar el máximo de RAM
que nuestros procesos podrán consumir - Obs: No exceder el 50% de RAM disponible en máquina).
Ej: 1 BD de 1GB no va a consumir más de 8GB de RAM, pero en un ambiente real no habrá solo una
conexión ejecutando operaciones en la base. (Dependiento de la manera como se utilice la BD, 8GB
de RAM será poco).
-Tipo de lectura de disco: Está almacenado en HDD/SDD? Hoy existen SCSI, SATA, SAS, siendo el último
el más recomendado en cuanto a discos HDD ya que tienen mejor desempeño.
-Uso del controlador de disco RAID (0,1,5 y 10). Son empleados para la seguridad de los datos.
RAID 0:Divide los datos en dos HD diferentes, aunque observamos tan solo 1 drive y el sistema operativo
divide el dato en los discos.
RAID 1:Uno de los HD es copia del otro (lo que se haga en un disco automáticamente se reproduce en el otro).
RAID 5:Divide los datos en más de dos HD, aunque observamos tan solo 1 drive y el sist operativo
divide el dato en todos los discos.
RAID 10:Los HD tienen espejos(Lo que se haga disco automáticamente se reproduce).
Aunque RAID 1 Y 10 gastan más espacio físico con redundancia, son más seguros porque hay BACK-UP disp. 
*/