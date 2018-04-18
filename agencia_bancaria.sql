create database agencia_bancaria;

use agencia_bancaria;

create table endereco(
    id_endereco int not null auto_increment,
    id_cliente int not null,
    id_agencia int not null,
    rua varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(5) not null,
    pais varchar(20) not null,
    primary key (id_endereco),
    foreign key (id_cliente) references cliente(id_cliente)
    foreign key (id_agencia) references agencia(id_agencia)
    );

create table cliente(
    id_cliente int not null auto_increment,
    nome_cliente varchar(20) not null,
    cpf_cliente varchar(20) not null,
    rg_cliente varchar(20) not null,
    primary key (id_cliente)
    );


create table agencia(
    id_agencia int not null auto_increment,
    nome_agencia varchar(20) not null, 
    numero_agencia int(20)  not null,
    ativo numeric(16) not null,
    primary key (id_agencia)
    );

create table conta(
   id_conta int not null auto_increment,
   id_agencia int,
   numero_conta int not null,
   saldo numeric(20,2),
   primary key (id_conta)
   foreign key (id_agencia) references agencia (id_agencia)
   ); 


create table depositante(
   id_depositante int not null auto_increment,
   id_cliente int,
   id_conta int,
   primary key (id_depositante),
   foreign key (id_cliente) references cliente(id_cliente),
   foreign key (id_conta) references conta(id_conta)
   );



