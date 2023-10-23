/*Comando AUTO_INCREMENT*/

CREATE TABLE tb_identificacion(
ID INT AUTO_INCREMENT NOT NULL,
DESCRIPCION VARCHAR(50) NULL,
PRIMARY KEY (ID)
);

INSERT INTO tb_identificacion (DESCRIPCION)
VALUES ("CLIENTE A"),
("CLIENTE B"),
("CLIENTE C"),
("CLIENTE D");

DELETE FROM tb_identificacion WHERE ID = 5;

INSERT INTO tb_identificacion (DESCRIPCION)
VALUES ("CLIENTE E");

/*Forzando ID*/
INSERT INTO tb_identificacion (ID, DESCRIPCION)
VALUES (100, "CLIENTE E");

/*Ahora va a arrancar desde 101*/
INSERT INTO tb_identificacion (DESCRIPCION)
VALUES ("CLIENTE F");

/*No importa si le pongo NULL, va a seguir autoincrementando*/
INSERT INTO tb_identificacion (ID, DESCRIPCION)
VALUES (NULL, "CLIENTE F");

SELECT * FROM tb_identificacion;
