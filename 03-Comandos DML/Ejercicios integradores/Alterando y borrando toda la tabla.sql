
/*Creado con click derecho en tb_producto - Send to SQL Editor - Create Statement*/
CREATE TABLE `tb_producto2` (
  `CODIGO` varchar(10) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `SABOR` varchar(50) DEFAULT NULL,
  `TAMANO` varchar(50) DEFAULT NULL,
  `ENVASE` varchar(50) DEFAULT NULL,
  `PRECIO_LISTA` float DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
);

SELECT * FROM tb_producto2;

/*Copiamos todos los datos de una tabla a la otra*/
INSERT INTO tb_producto2 
SELECT * FROM tb_producto;

/*Aumentamos el valor de los precios en un 1.5*/
UPDATE tb_producto2 SET PRECIO_LISTA = PRECIO_LISTA*1.15;

