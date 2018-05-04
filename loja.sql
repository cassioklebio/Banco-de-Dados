create database loja;


create table PRODUTOS(
	codigo_produto numeric(4),
    descricao varchar(60),
    valor_unitario float,
    quantidade_estoque int(4),
    primary key(codigo_produto)
);

create table PEDIDOS(
	numero_pedido numeric(10),
    data date,
    valor float,
    primary key(numero_pedido)
);

create table DETALHES_PEDIDOS(
	codigo_produto numeric references PRODUTO(codigo_produto),
    numero_pedido numeric references PEDIDO(numero_pedido),
    quantidade int(50),
    primary key(codigo_produto,numero_pedido)
    

);
