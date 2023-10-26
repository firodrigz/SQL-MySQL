/* Creando SP que genera ventas para una fecha específica utilizando las funciones aleatorias generadoras de clientes, productos y vendedores */

DELIMITER $$
CREATE PROCEDURE `sp_venta` (fecha DATE, maxitems INT, maxcantidad INT)
BEGIN
DECLARE vcliente VARCHAR(11);
DECLARE vproducto VARCHAR(10);
DECLARE vvendedor VARCHAR(5);
DECLARE vcantidad INT;
DECLARE vprecio FLOAT;
DECLARE vitems INT;
DECLARE vnfactura INT;
DECLARE vcontador INT DEFAULT 1;

SELECT MAX(NUMERO) + 1 INTO vnfactura FROM facturas;
SET vcliente = f_cliente_aleatorio();
SET vvendedor = f_vendedor_aleatorio();
INSERT INTO facturas (NUMERO, FECHA, DNI, MATRICULA, IMPUESTO) VALUES (vnfactura, fecha, vcliente, vvendedor, 0.16);
SET vitems = f_aleatorio(1,maxitems);

WHILE vcontador <= vitems
DO
SET vproducto = f_producto_aleatorio();
SET vcantidad = f_aleatorio(1,maxcantidad);
SELECT PRECIO INTO vprecio FROM productos WHERE CODIGO = vproducto;
INSERT INTO items(NUMERO, CODIGO, CANTIDAD, PRECIO) VALUES (vnfactura, vproducto, vcantidad, vprecio);
SET vcontador = vcontador + 1;
END WHILE;
END $$

CALL sp_venta("20231025", 15, 100);

SELECT MAX(NUMERO) FROM FACTURAS;

/* CAMBIAMOS TIPO DE DATO DE NUMERO A ENTERO PARA NO TENER PROBLEMAS A LA HORA DE SELECCIONA EL MAX(NUMERO) DE FACTURAS*/

CREATE TABLE facturas(
NUMERO INT NOT NULL,
FECHA DATE,
DNI VARCHAR(11) NOT NULL,
MATRICULA VARCHAR(5) NOT NULL,
IMPUESTO FLOAT,
PRIMARY KEY (NUMERO),
FOREIGN KEY (DNI) REFERENCES clientes(DNI),
FOREIGN KEY (MATRICULA) REFERENCES vendedores(MATRICULA)
);

CREATE TABLE items(
NUMERO INT NOT NULL,
CODIGO VARCHAR(10) NOT NULL,
CANTIDAD INT,
PRECIO FLOAT,
PRIMARY KEY (NUMERO, CODIGO),
FOREIGN KEY (NUMERO) REFERENCES facturas(NUMERO),
FOREIGN KEY (CODIGO) REFERENCES productos(CODIGO)
);

INSERT INTO items
SELECT NUMERO, CODIGO_DEL_PRODUCTO AS CODIGO, CANTIDAD, PRECIO FROM jugos_ventas.items_facturas;

INSERT INTO facturas
SELECT NUMERO, FECHA_VENTA AS FECHA, DNI, MATRICULA, IMPUESTO FROM jugos_ventas.facturas;
