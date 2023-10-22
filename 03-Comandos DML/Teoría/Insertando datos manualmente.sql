USE venta_jugos;

/*Para insertar 1 registro*/
INSERT INTO tb_producto (CODIGO, DESCRIPCION, SABOR, TAMANO, ENVASE, PRECIO_LISTA)
VALUES ("1040107", "Light", "Sandía", "350 ml", "Lata", 4.56);

SELECT * FROM tb_producto;

/*Para insertar 2 o más registros se separan con , */
INSERT INTO tb_producto (CODIGO, DESCRIPCION, SABOR, TAMANO, ENVASE, PRECIO_LISTA)
VALUES ("1040109", "Light", "Asaí", "350 ml", "Lata", 5.60), 
("1040110", "Zero", "Manzana", "450 ml", "Lata", 6.00);