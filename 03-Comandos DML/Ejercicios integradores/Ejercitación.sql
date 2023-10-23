USE ventas_jugos;

/*Incluye los siguientes registros en la tabla de clientes:
DNI: 9283760794, NOMBRE: Edson Calisaya, DIRECCION: Sta Úrsula Xitla, BARRIO: Barrio del Niño Jesús, CIUDAD: Ciudad de México, ESTADO: EM, CP: 22002002, FECHA DE NACIMIENTO: 1995-01-07, EDAD: 25, SEXO: M, LIMITE DE CREDITO: 150000, VOLUMEN DE COMPRA: 250000, PRIMERA COMPRA: Sí.
DNI: 7771579779, NOMBRE: Marcelo Perez, DIRECCION: F.C. de Cuernavaca 13, BARRIO: Carola, CIUDAD: Ciudad de México, ESTADO: EM, CP: 88202912, FECHA DE NACIMIENTO: 1992-01-25, EDAD: 29, SEXO: M, LIMITE DE CREDITO: 70000, VOLUMEN DE COMPRA: 160000, PRIMERA COMPRA: Sí.
DNI: 5576228758, NOMBRE: Patricia Olivera, DIRECCION: Pachuca 75, BARRIO: Condesa, CIUDAD: Ciudad de México, ESTADO: EM, CP: 88192029, FECHA DE NACIMIENTO: 1995-01-14 , EDAD: 25, SEXO: F, LIMITE DE CREDITO: 70000, VOLUMEN DE COMPRA: 160000, PRIMERA COMPRA: Sí.*/
INSERT INTO tb_cliente (DNI, NOMBRE, DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA) VALUES ('9283760794', 'Edson Calisaya', 'Sta Úrsula Xitla', 'Barrio del Niño Jesús', 'Ciudad de México', 'EM', '22002002', '1995-01-07', 25, 'M', 150000, 250000, 1);
INSERT INTO tb_cliente (DNI, NOMBRE, DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA) VALUES ('7771579779', 'Marcelo Perez', 'F.C. de Cuernavaca 13', 'Carola', 'Ciudad de México', 'EM', '88202912', '1992-01-25', 29, 'M', 120000, 200000, 1);
INSERT INTO tb_cliente (DNI, NOMBRE, DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA) VALUES ('5576228758', 'Patricia Olivera', 'Pachuca 75',  'Condesa', 'Ciudad de México', 'EM', '88192029', '1995-01-14', 25, 'F', 70000, 160000, 1);

/*Incluye todos los clientes en la tabla tb_clientes basado en los registros de la tabla tabla_de_clientes de la base jugos_ventas.*/
INSERT INTO tb_cliente
SELECT DNI, NOMBRE, DIRECCION_1 AS DIRECCION,
BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO 
AS FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO
AS LIMITE_CREDITO, VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA,
PRIMERA_COMPRA FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN (SELECT DNI FROM tb_cliente);

/*Actualiza la dirección del cliente con el DNI 5840119709 Colocando como nueva dirección Jorge Emilio 23, barrio San Antonio, ciudad Guadalajara, Estado de Jalisco y el CP 44700000.*/
UPDATE tb_cliente SET DIRECCION = "Jorge Emilio 23", BARRIO = "San Antonio", CIUDAD = "Guadalajara", ESTADO = "Jalisco",
CP = "44700000" WHERE DNI = "5840119709";
SELECT * FROM tb_cliente WHERE  DNI = "5840119709";

/*Podemos observar que los vendedores se encuentran en barrios asociados a ellos. Vamos a aumentar en 30% el volumen de compra de los clientes que tienen, en sus direcciones, barrios donde los vendedores cuentan con oficinas.*/
UPDATE tb_cliente A 
INNER JOIN 
tb_vendedor B
ON A.BARRIO = B.BARRIO
SET A.VOLUMEN_COMPRA = A.VOLUMEN_COMPRA * 1.3;

/*Vamos a excluir las facturas (Apenas el encabezado) cuyos clientes tengan menos de 18 años.*/
DELETE A FROM tb_factura A
INNER JOIN 
tb_cliente B 
ON A.DNI = B.DNI
WHERE B.EDAD < 18;

/*Construye un TRIGGER (Lo llamaremos TG_EDAD_CLIENTES_INSERT) que actualiza las edades de los clientes, en la tabla de clientes, siempre que la tabla sufra una inclusión.*/
DELIMITER //
CREATE TRIGGER TG_EDAD_CLIENTES_INSERT 
BEFORE INSERT ON tb_cliente
FOR EACH ROW BEGIN
SET NEW.EDAD = timestampdiff(YEAR, NEW.FECHA_NACIMIENTO, NOW());
END//

SELECT DNI, EDAD, FECHA_NACIMIENTO, timestampdiff(YEAR, FECHA_NACIMIENTO, NOW()) AS ANOS FROM tb_cliente;