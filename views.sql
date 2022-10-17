################### VIEW 1 ####################
create or replace view viewProdutosEMarcas as
select p.descricao, p.preco, m.nomeMarca, cc.dataCompra
from produtos p
inner join marcas m
inner join carrinho_compras cc
where p.marcas_idMarca = m.idMarca AND cc.idProduto = p.idProduto
order by p.descricao;

select * from viewProdutosEMarcas;

################### VIEW 2 ####################
create or replace view viewProdutosMarcasFornecedor as
select p.descricao, p.preco, m.nomeMarca, f.nome
from produtos p
inner join marcas m
inner join fornecedor f
where p.marcas_idMarca = m.idMarca and m.idMarca = f.marcas_idMarca
order by p.descricao;

select * from viewProdutosMarcasFornecedor;

################### VIEW 3 ####################
create or replace view viewValorTotalCarrinho as
select cc.idCarrinho, sum(cc.precoTotal)
from carrinho_compras cc
group by cc.precoTotal;

select * from viewValorTotalCarrinho;

################### VIEW 4 ####################
create or replace view viewQtdFornecedor as
select f.nome, count(f.idFornecedor) as 'QTD Produtos fornecidos'
from fornecedor f
group by f.nome;

select * from viewQtdFornecedor;

################### VIEW 5 ####################
create or replace view viewMarcasxFornecedor as
select m.nomeMarca, f.nome
from marcas m
inner join fornecedor f
where m.idMarca = f.marcas_idMarca
group by m.nomeMarca;

select * from viewMarcasxFornecedor;

################### VIEW 6 ####################
create or replace view viewMarcasxFornecedorLeft as
select m.nomeMarca, f.nome
from marcas m
left join fornecedor f
on m.idMarca = f.marcas_idMarca
group by m.nomeMarca;

select * from viewMarcasxFornecedorLeft;

################### VIEW 7 ####################
create or replace view viewMarcasxFornecedorRight as
select m.nomeMarca, f.nome
from marcas m
right join fornecedor f
on m.idMarca = f.marcas_idMarca
group by m.nomeMarca;

select * from viewMarcasxFornecedorRight;

################### VIEW 8 ####################
create or replace view view5tables as
select *
from fornecedor f
LEFT OUTER JOIN marcas m on f.marcas_idMarca = m.idMarca
INNER JOIN produtos p using(marcas_idMarca)
INNER JOIN carrinho_compras cc using(idProduto)
INNER JOIN vendas v using(idCarrinho);
select * from view5tables;