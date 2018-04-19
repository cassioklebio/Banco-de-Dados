CREATE DATABASE VENDAS;

USE VENDAS;


create table PESSOAS(
    id_pessoa int not null auto_increment,
    nome_pessoa varchar(20) not null,
    cpf varchar(20) unique,
    endereco varchar(30),
    primary key (id_pessoa)
    );

create table CLIENTES(
	id_cliente int not null auto_increment,
    id_pessoa int,
    profissao varchar(20),
    idade int(5),
    primary key (id_cliente),
    foreign key(id_pessoa) references PESSOAS(id_pessoa),
    check(idade >18)
    );


create table TELEFONES(
    id_telefone int not null auto_increment,
    id_cliente int,
    numero int(20),
    tipo varchar(10) default 'comercial',
    primary key (id_telefone),
    foreign key (id_cliente) references CLIENTES(id_cliente) on delete cascade
    );

create table DEPENDENTES(
    id_dependentes int not null auto_increment,
    id_pessoa int,
    idade date,
    primary key(id_dependentes),
    foreign key (id_pessoa) references PESSOAS(id_pessoa)on delete cascade,
    check (idade > 18)
    );
    

create table PRODUTOS(
    id_produto int not null auto_increment,
    nome_produto varchar(20),
    valor float(10),
    tamanho varchar(10),
    primary key (id_produto)
    );

create table VENDAS(
	id_venda int not null auto_increment,
    id_pessoa int,
    id_produto int,
    data date,
    primary key (id_venda),
    foreign key (id_pessoa) references PESSOAS (id_pessoa) on delete cascade,
    foreign key (id_produto) references PRODUTOS(id_produto) on delete cascade
    );
 


