create database ecommerce;
-- drop database ecommerce;

use ecommerce;

create table cliente(
	idcliente int auto_increment primary key,
    fname varchar(20),
    minit char(3),
    lname varchar(20),
    cpf char (9) not null,
    address varchar(255),
    constraint unique_cpf_client unique (cpf)
);

-- alter table cliente auto_increment=1;
-- desc cliente;

create table produto(
	idproduto int auto_increment primary key,
    pname varchar(10),
    clasification_kids boolean default false,
    category enum('alimentos', 'eletronicos', 'vestimento', 'brinquedo', 'móveis') not null,
    avaliation float default 0,
    size varchar(15)
);
-- drop table produto;
-- alter table produto delete cpf;
-- desc produto;

create table pedido(
	idpedido int auto_increment primary key,
    idpedidocliente int,
    pedido_status enum('cancelado', 'confirmado', 'em processamento') not null default 'em processamento',
    descricao varchar(255),
    valor_frete float,
    constraint fk_pedido_cliente foreign key (idpedidocliente) references cliente(idcliente)
		on update cascade
);
-- drop table pedido;
-- alter table pedido auto_increment=1;
-- desc pedido;

create table pagamento(
	idcliente int,
    idpagamento int,
    tipo_pagamento enum('boleto', 'debito', 'credito', 'pix'),
    primary key (idcliente, idpagamento),
    constraint fk_pagamento foreign key (idpagamento) references pedido(idpedido)
);

-- drop table pagamento;
create table estoque(
	idestoque int auto_increment primary key,
    local_estoque varchar (50),
    quantidade int not null default 0    
);
-- alter table estoque auto_increment=1;

create table fornecedor(
	idfornecedor int auto_increment primary key,
    razaoSocial varchar (255) not null unique,
    cnpj char(15) not null,
    contato varchar(50) default 0,
    constraint unique_fornecedor unique (cnpj)
);
-- alter table fornecedor auto_increment=1;
-- desc fornecedor;

create table tercerizado(
	idtercerizado int auto_increment primary key,
    razaoSocial varchar (255) not null,
    nomeSocial varchar (255),
    cnpj_tercerizado char(15),
    cpf_tercerizado char(15),
    local_tercerizado varchar(255),
    contato varchar(50) default 0,
    constraint unique_cnpj_tercerizado unique (cnpj_tercerizado),
    constraint unique_cpf_tercerizado unique (cpf_tercerizado)
);
-- alter table tercerizado auto_increment=1;

create table produtoVendedor(
	idPvendedor int,
    idPproduto int,
    quantidade int default 1,
    primary key (idPvendedor, idPproduto),
    constraint fk_produto_vendedor foreign key (idPvendedor) references tercerizado (idtercerizado),
    constraint fk_produto_produto foreign key (idPproduto) references produto (idproduto)
);
-- drop table produtoVendedor;

-- desc produtoVendedor;

create table produtoPedido(
	idPpedido int,
    idPproduto int,
    quantidade int default 1,
    status_pedido enum ('em estoque', 'fora de estoque') default 'em estoque',
    primary key (idPpedido, idPproduto),
    constraint fk_produto_pedido foreign key (idPpedido) references pedido (idpedido),
    constraint fk_produtopedido_produto foreign key (idPproduto) references produto (idproduto)
);
create table produtoEstoque(
	idPestoque int,
    idPproduto int,
    location varchar(255) not null,
    primary key (idPestoque, idPproduto),
    constraint fk_produto_estoque foreign key (idPestoque) references estoque (idestoque),
    constraint fk_produtoestoque_produto foreign key (idPproduto) references produto (idproduto)
);
-- drop table produtoEstoque;
create table disponibilizar(
	idPdisponivel int,
    idPprodutodisponivel int,
    quantidade int default 1,
    primary key (idPdisponivel, idPprodutodisponivel),
    constraint fk_produto_disponivel foreign key (idPdisponivel) references fornecedor (idfornecedor),
    constraint fk_produtodisponivel_produto foreign key (idPprodutodisponivel) references produto (idproduto)
);

-- show tables;
-- use information_schema;
-- select * from referential_constraints where constraint_schema = 'ecommerce';



