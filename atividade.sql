create database ESCOLA
default character set utf8
default collate utf8_general_ci;


use ESCOLA;

create table Aluno(
nome varchar(30) not null,
matricula int(10),
nascimento date,
sexo enum('M','F'),
peso decimal(5,2),
nacionalidade varchar(20) default 'brasileiro'
)default charset utf8;


create table Professor(
nome varchar(30) not null,
matricula int(10),
nascimento date, 
sexo enum ('M','F'), 
peso decimal(5,2),
nacionalidade varchar(30) default 'BRASILEIRO'
)default charset utf8;


create database estudo_java
default character set utf8
default collate utf8_general_ci;

create table usuario(
id_usuario int not null auto_increment,
login varchar(20) not null comment 'login do usuario para acesso ao sistema',
senha varchar(20) not null comment 'senha do usuario para acesso ao sistema'

)default charset utf8;

drop database estudo_java;

create database ESTUDO_JAVA
default character set utf8
default collate utf8_general_ci;

use ESTUDO_JAVA;

create table USUARIO(
id_usuario int not null auto_increment comment 'codigo do usuario',
login varchar(30) not null comment'login do usuario para acesso',
senha varchar(30) not null comment 'senha do usuario para acesso',
constraint primary key (id_usuario)
)default charset utf8;


create table PESSOAS(
id_pessoa int not null auto_increment comment'codigo da pessoa',
nome varchar(70) not null comment 'nome da pessoa',
sexo enum ('M','F'),
dataCadstro datetime comment 'data do cadastro',
email varchar(80) not null comment'Email da Pessoa',
id_endereco int comment 'chave estrangeira da tabela endereço',
id_usuario int comment 'chave estrangeira da tabela usuario',
origemCadastro enum('I','X')comment'ORIGEM DO CADASTRO (I) = INPUT OU (X) = XML',
constraint primary key (id_pessoa),
constraint USUARIO_PESSOA foreign key (id_usuario) references USUARIO (id_usuario),
constraint ENDERECO_PESSOA foreign key (id_endereco) references ENDERECO(id_endereco)
)default charset utf8;


create table ENDERECOS(
id_endereco int not null auto_increment comment 'codigo do endereço',
rua varchar(20) not null comment 'nome da rua',
numero int comment 'numero da rua',
bairro varchar(20) comment 'bairro do endereço',
cidade varchar(20) comment 'cidade do endereço',
estado char(2) comment 'estado',
constraint primary key (id_endereco)
)default charset utf8;
