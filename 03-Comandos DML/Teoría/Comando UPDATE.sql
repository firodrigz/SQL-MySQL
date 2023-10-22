/*Comando UPDATE*/

/*Se usa para incluir / excluir datos*/
UPDATE tb_producto SET PRECIO_LISTA = 5 WHERE CODIGO = "1000889";
UPDATE tb_producto SET DESCRIPCION = "Sabor de la Montaña",
TAMANO = "1 Litro", ENVASE = "Botella PET" WHERE CODIGO = "1000889";

SELECT * FROM tb_producto;

SELECT * FROM tb_cliente;

/*El volumen de compra está en decilitros, queremos pasarlo a litros... para eso*/
UPDATE tb_cliente SET VOLUMEN_COMPRA = VOLUMEN_COMPRA/10;