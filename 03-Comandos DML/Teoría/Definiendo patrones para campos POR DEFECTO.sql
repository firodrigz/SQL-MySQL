/*Definiendo patrones para campos*/

CREATE TABLE tb_default(
ID INT AUTO_INCREMENT,
DESCRIPCION VARCHAR (50) NOT NULL,
DIRECCION VARCHAR (100) NULL,
CIUDAD VARCHAR (50) DEFAULT "Buenos Aires",
FECHA_CREACION TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
PRIMARY KEY(ID)
);

INSERT INTO tb_default (DESCRIPCION, DIRECCION, CIUDAD, FECHA_CREACION)
VALUES ("Cliente X", "Calle falsa, 123", "Springfield", "2023-10-22");

SELECT * FROM tb_default;

/*Si insertamos un registro sin todos los campos, se autocompletan los por defecto y los demás quedan null*/
INSERT INTO tb_default (DESCRIPCION)
VALUES ("Cliente Y");
