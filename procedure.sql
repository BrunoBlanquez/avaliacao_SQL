################ CADASTRO ################
DELIMITER $$ 
create procedure pCadastraProduto(in marcas_idMarca int, in descricao varchar(45), in preco float, in estoque int)
begin
	insert into produtos(marcas_idMarca, descricao, preco, estoque) 
    values(marcas_idMarca, descricao, preco, estoque);
end $$
DELIMITER ;

DELIMITER $$ 
create procedure pCadastraCliente(in nome varchar(45), in endereco varchar(45))
begin
	insert into clientes(nome, endereco) 
    values(nome, endereco);
end $$
DELIMITER ;

DELIMITER $$ 
create procedure pAdicionaCarrinho(in idProdutoAdicionado int, in quantidade int)
begin
	declare precoProduto float;
    select preco into precoProduto from produtos where idProduto = idProdutoAdicionado;
    
	insert into carrinho_compras(idProduto, dataCompra, precoTotal, quantidade) 
    values(idProdutoAdicionado, now(), precoProduto, quantidade);
end $$
DELIMITER ;

DELIMITER $$ 
create procedure pAdicionaVendas(in idCarrinhoAdd int, in statusVenda VARCHAR(15))
begin    
	insert into vendas(idCarrinho, status) 
    values(idCarrinhoAdd, statusVenda);
end $$
DELIMITER ;

################ UPDATE ################
DELIMITER $$ 
create procedure pAtualizaProduto(in idProdutoAtualizar int, in descricaoNova varchar(45))
begin
	update produtos set descricao = descricaoNova where idProduto = idProdutoAtualizar;
end $$
DELIMITER ;

DELIMITER $$ 
create procedure pAtualizaCliente(in idClienteAtualizar int, in nomeNovo varchar(45))
begin
	update clientes set nome = nomeNovo where idCliente = idClienteAtualizar;
end $$
DELIMITER ;

DELIMITER $$ 
create procedure pAtualizaCarrinho(in idCarrinhoAtualizado int, in precoNovo float)
begin
	update carrinho_compras set precoTotal = precoNovo where idCarrinho = idCarrinhoAtualizado;
end $$
DELIMITER ;

################ DELETE ################
DELIMITER $$ 
create procedure pDeletaProduto(in idProdutoDeletado int)
begin
	delete from produtos where idProduto = idProdutoDeletado;
end $$
DELIMITER ;

DELIMITER $$ 
create procedure pDeletaCliente(in idClienteDeletar int)
begin
	delete from clientes where idCliente = idClienteDeletar;
end $$
DELIMITER ;

call pCadastraCliente ('diego', 'PR');


DELIMITER $$ 
create procedure pDeletaCarrinho(in idCarrinhoDeletar int)
begin
	delete from carrinho_compras where idCarrinho = idCarrinhoDeletar;
end $$
DELIMITER ;

drop procedure pVerificaEstoqueProdutos
################ EXTRA ################
DELIMITER $$ 
create procedure pVerificaEstoqueProdutos(in idProdutoVerificar int, in qtd int, out ok boolean)
begin
	declare estoqueAtual int;
    select estoque into estoqueAtual from produtos where idProduto = idProdutoVerificar;

	if estoqueAtual >= qtd and estoqueAtual > 0 then
		set ok = true;
	else 
		set ok = false;
	end if;
end $$
DELIMITER ;

drop procedure pAtualizaEstoque;
DELIMITER $$ 
create procedure pAtualizaEstoque(in idProdutoAtualizado int, in qtd float)
begin
	update produtos set estoque = (estoque - qtd)
    where idProduto = idProdutoAtualizado;
end $$
DELIMITER ;