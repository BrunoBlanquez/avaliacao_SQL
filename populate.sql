######### CLIENTES #########
insert into clientes(nome, endereco) values('bruno', 'SP'), ('victor', 'SC'), ('felipe', 'SP'), ('Ale', 'SP'), ('Luiz', 'ES'), ('Bruna', 'ES'), ('Arthur', 'RS'), ('Jeff', 'MG'), ('Cris', 'RS'), ('Gabs', 'SP');
update clientes set nome = 'Bruno' where idCliente = 1;
delete from clientes where idCliente = 12;

######### LOJA #########
insert into loja(endereco) values('RS');
update loja set endereco = 'SP' where idLoja = 3;
delete from loja where idLoja = 3;

######### MARCAS #########
insert into marcas(nomeMarca, desconto) values('Nike', 0), ('adidas', 0), ('lacoste', 0), ('polo', 0), ('puma', 0), ('hering', 0), ('gucci', 0);
insert into marcas(nomeMarca, desconto) values('Nike', 0);
update marcas set nomeMarca = 'nike' where idMarca = 1;
delete from marcas where idMarca = 24;

######### PRODUTOS #########
insert into produtos(marcas_idMarca, descricao, preco) values(1, 'tenis', 400), (2, 'camiseta', 300), (3, 'blusa', 350), (4, 'jaqueta', 250), (5, 'tenis corrida', 450), (6, 'calça', 120), (7, 'bolsa', 1050), (1, 'boné', 250), (2, 'bermuda', 200), (1, 'top', 150), (3, 'camisa polo', 120);
insert into produtos(marcas_idMarca, descricao, preco) values(1, 'tenis', 400);
update produtos set descricao = "Tenis" where idProduto = 1;
delete from produtos where idProduto = 24;

######### FUNCIONARIOS #########
insert into funcionarios(nome,cargo,endereco,salario) values('gabriel', 'gerente', 'SP', 5000), ('lucas', 'vendedor', 'SP', 3000), ('amanda', 'vendedor', 'SP', 3000), ('camille', 'desenvolvedor', 'RJ', 4500), ('aline', 'recursos humanos', 'SP', 4500); 
insert into funcionarios(nome,cargo,endereco,salario) values('gabriel', 'gerente', 'SP', 5000);
update funcionarios set nome = 'GABRIEL' where idFuncionarios = 9; 
delete from funcionarios where idFuncionarios = 9;

######### fornecedor #########
insert into fornecedor(marcas_idMarca,nome) values(1, 'fornecedor 1'),(2, 'fornecedor 1'),(3, 'fornecedor 1'),(4, 'fornecedor 2'),(5, 'fornecedor 2'),(6, 'fornecedor 3'),(7, 'fornecedor 3');
insert into fornecedor(marcas_idMarca,nome) values(1, 'fornecedor 1');

update fornecedor set nome = 'TESTE' where idFornecedor = 8;
delete from fornecedor where idFornecedor = 8;

######### VENDAS #########
insert into vendas(idCarrinho,status) values(6, 'concluido');
update vendas set status = 'concluido' where idVenda = 2;
delete from vendas where idVenda = 2;

######### CARRINHO_COMPRAS #########
insert into carrinho_compras(idProduto,dataCompra,precoTotal,quantidade) values(1, now(), 400, 5);
call pAdicionaCarrinho(1, 5);
call pAdicionaCarrinho(2, 5);
call pAdicionaCarrinho(3, 15);
call pAdicionaCarrinho(4, 5);
call pAdicionaCarrinho(5, 5);
call pAdicionaCarrinho(6, 15);
call pAdicionaCarrinho(7, 25);
call pAdicionaCarrinho(8, 5);
call pAdicionaCarrinho(9, 5);
call pAdicionaCarrinho(10, 5);
update carrinho_compras set precoTotal = 50 where idCarrinho = 8;
delete from carrinho_compras where idCarrinho = 8;