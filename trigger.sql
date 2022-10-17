DELIMITER $
create trigger t_altera_estoque AFTER INSERT
ON carrinho_compras
FOR EACH ROW
BEGIN
	declare okay boolean;
	call pVerificaEstoqueProdutos(NEW.idProduto, NEW.quantidade, okay);
    if okay = false then
		SIGNAL sqlstate '45001' set message_text = "Estoque indisponível";
	else
		call pAtualizaEstoque(new.idProduto, new.quantidade);
	end if;
END$
DELIMITER ;

call pAdicionaCarrinho(1, 5);
select * from produtos;
select * from carrinho_compras;

DELIMITER $
create trigger t_altera_estoque_delete AFTER DELETE
ON carrinho_compras
FOR EACH ROW
BEGIN
	update produtos set estoque = estoque + OLD.quantidade
    where idProduto = OLD.idProduto;
END$
DELIMITER ;