/*COMMIT Y ROLLBACK*/

/*Permiten confirmar o cancelar una transacción*/
/* TRANSACCIÓN: Unidad lógica de procesamiento que busca preservar la integridad y consistencia de los datos.*/

START TRANSACTION
(...)
COMMIT | ROLLBACK

/*START TRANSACTION: Crea un punto de estado de la base de datos.*/
/*COMMIT: Confirma y graba la información entre el Start Transaction y Commit*/
/*ROLLBACK: Rechaza la información entre Start Transaction y Rollback*/

/*Hecho con click derecho en tb_vendedor - Send to SQL Editor - Insert Statement*/
INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
("256",
"Fernando Ruiz",
"Oblatos",
0.1,
"2015-06-14",
0);

SELECT * FROM tb_vendedor;

START TRANSACTION;

INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
("257",
"Fernando Rojas",
"Oblatos",
0.1,
"2015-06-14",
0);
INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
("258",
"David Rojas",
"Del Valle",
0.15,
"2015-06-14",
0);

UPDATE tb_vendedor SET COMISION = COMISION * 1.05;

ROLLBACK;

COMMIT;