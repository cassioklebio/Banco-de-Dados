create database ARMAZEM
default character set utf8
default collate utf8_general_ci;

use ARMAZEM;

create table PESSOAS(
	id_pessoa int not null auto_increment,
    nome varchar(100),
    cpf int(20) unique,
    endereco varchar(100),
    constraint id_pessoa primary key (id_pessoa)
)default charset utf8;



create table CLIENTES(
	id_cliente int not null auto_increment,
    id_pessoa int,
    profissao varchar(20),
    idade int,
    constraint id_cliente primary key(id_cliente),
    constraint PESSOA_CLIENTE foreign key (id_pessoa) references PESSOAS(id_pessoa)on delete cascade	
)default charset utf8;


create table TELEFONE(
	id_telefone int not null auto_increment,
    id_cliente int,
    numero int(20),
    tipo enum('RESIDENCIAL','COMERCIAL', 'CELULAR'),
    constraint id_telefone primary key (id_telefone),
    constraint CLIENTES_TELEFONE foreign key (id_cliente) references CLIENTES(id_cliente)on delete cascade
)default charset utf8;

create table DEPENDENTES(
	id_dependente int not null auto_increment comment 'id do dependente',
    id_cliente int comment 'chave estrangeira da tabela cliente',
    nome_dependente varchar(100) not null comment 'nome do dependente',
    idade int(10) comment 'idade do dependente',
	constraint id_dependente primary key(id_dependente),
    constraint CLIENTE_DEPENDENTES foreign key (id_cliente) references CLIENTES(id_cliente)on delete cascade
)default charset utf8;

create table PRODUTOS(
	id_produto int not null auto_increment comment' id do produto e chave primaria',
    nome varchar(20) not null comment' nome do produto',
    descricao text(300) comment'breve descrição do produto',
    valor decimal(5,2)comment 'valor do produto',
    tamanho int comment'tamanho do produto',
    constraint id_produto primary key (id_produto)
)default charset utf8;

create table VENDAS(
	id_vendas int not null auto_increment comment 'id da venda e chave primaria',
    id_pessoa int comment 'chave estrageira da tabela pessoa',
    id_produto int comment'chave estrageira da tabela produto',
    data date comment'data da venda',
    constraint id_vendas primary key (id_vendas),
    constraint PESSOAS_VENDAS foreign key(id_pessoa) references PESSOAS(id_pessoa),
    constraint PRODUTOS_VENDAS foreign key(id_produto) references PRODUTOS(id_produto)
)default charset utf8;
