use ecommerce;

insert into cliente (fname, minit, lname, cpf, address)
	values('Mari', 'M', 'Silva', 123546789, 'rua tal do numero tal - na cidade de pandora'), 
			('Mateus', 'G', 'Soares', 124578789, 'rua tal pequena do numero infimo - na cidade de pandora'),
			('Matias', 'B', 'Margarida', 124144789, 'rua tal 21 do numero infinito - na cidade de pandora'),
            ('Julio', 'R', 'Soares', 748144789, 'rua M 341 do numero joia - na cidade de pandora');

insert into produto (pname, clasification_kids, category, avaliation, size)
	values('fones', false, 'eletronicos', '4', null),
			('boneca', true, 'brinquedo', '4', null),
            ('Sofa', true, 'móveis', '5', '400 x 50 x 70');

insert into pagamento(idcliente, idpagamento, tipo_pagamento)
            values (1, 1, 'boleto'),
				(2, 2, 'pix'),
                (3, 3, 'boleto');
select * from cliente;
            
insert into pedido (idpedidocliente, pedido_status, descricao, valor_frete)
	values(1, 'confirmado', 'compra via aplicativo', 1.14),
		(2, 'confirmado', 'compra via aplicativo', 1.80),
        (3, 'confirmado', null, null);
            
insert into produtoPedido (idPpedido, idPproduto, quantidade, status_pedido)
	values (1,1,2,null),
			(2,1,1,null),
            (3,2,1,null);
            
insert into estoque( local_estoque, quantidade)
	values ('Rio de Janeiro', 1000),
    ('São Paulo', 500),
    ('Praia grande', 12);

insert into produtoEstoque (idPestoque, idPproduto, location)
	values (1, 2, 'RJ'),
			(2, 1, 'MG');
            
insert into fornecedor (razaoSocial, cnpj, contato)
	values ('julio e filhos', 120345168733986, 1598986565),
			('Pernambucanas', 120345161228986, 3599996565),
            ('Aço minas', 120345168728986, 4187542136);
            
insert into tercerizado (razaoSocial, nomeSocial, cnpj_tercerizado, cpf_tercerizado, local_tercerizado, contato)
	VALUES ('Amigos e aliados LTDA', 'ALIADOS', 111111111111111, null, 'Rio de Janeiro', 35992486245),
		('Amigos e jovens LTDA', 'JOVENS', 222222222222222, null, 'sAMPA', 35956886245),
        ('Amigos e CRIANÇAS LTDA', 'ACRIANCAAS', NULL, 123456789123456, 'Osasnco', 11992486245);
        
insert into produtoVendedor (idPvendedor, idPproduto, quantidade)
	VALUES (4,1,350),
			(5,2,250),
            (6,3,1000);
            
select * from cliente c, pedido p where c.idcliente = p.idpedido;
select count(*) from cliente;
select concat(fname,' ', minit,' ', lname) as cliente, pedido_status as status_do_pedido  
	from cliente c, pedido p 
	where c.idcliente = p.idpedido;

select * from cliente c, pedido p
	where c.idcliente = p.idpedido
    group by idpedido;
    
select * from cliente
	left outer join pedido
    on idcliente = idpedido;
            

            
            

            
            
            
            
            
            