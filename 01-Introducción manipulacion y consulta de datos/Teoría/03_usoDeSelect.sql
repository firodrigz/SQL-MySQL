/*Consulta todos los elementos*/
SELECT * FROM tbcliente;

/*Consulta renombrando columnas*/
SELECT NOMBRE AS NOMBRE_COMPLETO, DNI FROM tbcliente;

/*Establece un límite de consulta*/
SELECT NOMBRE, DNI FROM tbcliente LIMIT 6;

/*Filtros*/
/*Filtro específico*/
SELECT * FROM tbproducto WHERE SABOR = 'Maracuyá';
UPDATE tbproducto SET SABOR = 'Cítrico' WHERE SABOR = 'Limón';

/*Filtro por condición*/
SELECT * FROM tbcliente WHERE EDAD > 27;
SELECT * FROM tbcliente WHERE NOMBRE > 'Erica Carvajo';

/*Filtro por fecha*/
SELECT * FROM tbcliente WHERE FECHA_NACIMIENTO < '1995-01-13';
SELECT * FROM tbcliente WHERE DAY(FECHA_NACIMIENTO) = 20;

/*Filtro de selección compuesta*/
SELECT * FROM tbproducto WHERE PRECIO_LISTA BETWEEN 28.49 AND 28.52;
SELECT * FROM tbproducto WHERE PRECIO_LISTA >= 28.49 AND PRECIO_LISTA <= 28.52;
SELECT * FROM tbproducto WHERE ENVASE = 'Lata' OR ENVASE = 'Botella PET';
SELECT * FROM tbproducto WHERE (PRECIO_LISTA >= 15 AND TAMANO = '1 Litro') OR (ENVASE = 'Lata' OR ENVASE = 'Botella PET');

/*Filtro IN*/
/*Devuelve los productos que su sabor sea 'MANGO' O 'UVA'*/
SELECT * FROM tabla_de_productos WHERE SABOR IN ('MANGO','UVA');
SELECT * FROM tabla_de_clientes WHERE CIUDAD IN ('CIUDAD DE MÉXICO', 'GUADALAJARA');
SELECT * FROM tabla_de_clientes WHERE CIUDAD IN ('CIUDAD DE MÉXICO', 'GUADALAJARA') AND EDAD > 21;
SELECT * FROM tabla_de_clientes WHERE CIUDAD IN ('CIUDAD DE MÉXICO', 'GUADALAJARA') AND (EDAD BETWEEN 20 AND 25);
