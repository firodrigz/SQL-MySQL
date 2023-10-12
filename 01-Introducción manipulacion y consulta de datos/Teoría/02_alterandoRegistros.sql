USE jugos;

INSERT INTO tbproductos(
producto, nombre, envase, volumen, sabor,
precio) VALUES ('695594', 'Festival de Sabores', 'Botella PET',
'1.5 Litros', 'Asaí', 18.51);

INSERT INTO tbproductos(
producto, nombre, envase, volumen, sabor,
precio) VALUES ('1041119', 'Línea Citrus', 'Botella de Vidrio',
'700 ml', 'Lima', 4.90);

/*Actualización de registro*/
UPDATE tbproductos SET precio = 28.51 WHERE producto = '695594';

UPDATE tbproductos SET sabor = 'Lima/Limón', precio = 4.90 WHERE producto = '1041119';

/*Elimino elementos-registro de la tabla
NUNCA PONER DELETE FROM nombreTabla SOLO PORQUE ELIMINA TODO EL CONTENIDO DE LA TABLA*/
DELETE FROM tbproductos WHERE producto = '773912';

INSERT INTO tbproductos(
producto, nombre, envase, volumen, sabor,
precio) VALUES ('773912', 'clean', 'botella pet',
'1 litro', 'naranja', 8.01);

ALTER TABLE tbproductos ADD PRIMARY KEY (PRODUCTO);

SELECT * FROM tbproductos;