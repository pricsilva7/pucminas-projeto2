select * from fornecedor;

select * from produto;

select * from funcionario;

select * from telefone;

select * from estoque;

select * from venda;

select * from item_venda;

/*Visualizar informações de contato dos fornecedores*/

select * from fornecedor
    where nome = nome_fornecedor;

/*Atualizar valor de venda dos produtos*/
update produto
    set valor_venda = valor
    where id_produto = id;

/*Visualizar estoque por produto*/
select p.id_produto, p.nome, p.tamanho, e.quantidade
    from produto as p
    inner join estoque as e ON p.id_produto = e.id_produto
    where  p.id_produto = id; 

/*Visualizar vendas do dia*/
select v.data, p.nome, i.quantidade, i.desconto, v.valor_total
    from venda as v
    inner join item_venda as i ON v.id_venda = i.id_venda
    inner join produto as p ON i.id_produto = p.id_produto
    where data = '2023-03-21';
    
/*Visualizar dias com maiores vendas*/
select data, valor_total
    from venda
    group by data   
    order by valor_total DESC
    limit 5;

/*Visualizar funcionários com maiores vendas*/
select f.primeiro_nome as Funcionario, round(sum(v.valor_total),2) as Valor_Total
    from venda as v
    inner join funcionario as f on v.id_funcionario = f.id_funcionario
    group by primeiro_nome
    order by valor_total DESC;
