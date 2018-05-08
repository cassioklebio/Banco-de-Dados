create database EMPRESADB;

use EMPRESADB;

create table EMPREGADOS(
	matricula int primary key,
    nome varchar(100) not null,
    endereco varchar(100),
    salario float,
    supervisor varchar(20),
    depto varchar(20) 
);

create table DEPARTAMENTOS(
	coddep int primary key,
    nome varchar(100) not null,
    gerente varchar(20),
    dataini date
);

create table PROJETOS(
	codproj int primary key,
    nome varchar(100) not null,
    local_projeto varchar(100),
    depart varchar(20)
);

create table ALOCACAO(
	MATRICULA int,
    codproj int,
    horas time
);


/* tornando a table mais legiveis */



/* 1º PASSO CRIAÇÃO DA TABELA ENDEREÇO */

create table ENDERECOS(
	id_endereco int primary key,
    id_aluno int,
    id_projetos int,
    rua varchar(20) not null,
    numero int,
    cidade varchar(20) default 'CAMPINA GRANDE',
    Bairro varchar(20),
    constraint EMPREGADO_ENDERECO foreign key(id_empregado) references EMPREGADOS(matricula),
    constraint PROJETOS_ENDERECO foreign key(id_projetos) references PROJETOS(codproj)
 );
 
 /* 2º PASSO deletar o atributo endereço no da tabela EMPREGADOS */
 
 alter table EMPREGADOS drop column endereco;

/* 3º PASSO deLetar o atributo local_projeto da tabela PROJETOS */

alter table PROJETOS drop column local_projeto;

/*4º PASSO adicionando os atribudos id_empregados e id_projetos na tabela DEPARTAMENTOS */

alter table DEPARTAMENTOS add column id_empregado int;

alter table DEPARTAMENTOS add column id_projeto int;

/*5º PASSO adicionando a restrição a tabela DEPARTAMENTOS */

alter table DEPARTAMENTOS add constraint empregado_departamento foreign key(id_empregado) references EMPREGADOS(matricula) on delete cascade;

alter table DEPARTAMENTOS add constraint projeto_departamento foreign key(id_projeto) references PROJETOS(codproj) on delete cascade;

/*6º PASSO deLetar o atributo depart da tabela PROJETOS */
alter table PROJETOS drop column depart;

/* 7º PASSO adicionando a restriçoes a tabela ALOCAÇÃO*/

alter table ALOCACAO add constraint ALOCACAO_EMPREGADOS foreign key(matricula) references EMPREGADOS(matricula)on delete cascade;

alter table ALOCACAO add constraint ALOCACAO_PROJETOS foreign key(codproj) references PROJETOS(codproj)on delete cascade;

/* 8º PASSO criando a tabela cargo */

create table CARGOS(
	id_cargo int primary key,
    nome varchar(20) default 'SUPERVISOR',
    id_empregado int,
    id_departamento int,
    data date
);

/* 9º PASSO creando as resgras */

alter table CARGOS add constraint CARGOS_EMPREGADOS foreign key(id_empregado) references EMPREGADOS(matricula);

alter table CARGOS add constraint CARGOS_DEPARTAMENTO foreign key(id_departamento) references DEPARTAMENTOS(coddep);

/* 10º PASSO remover o atributo supervisor da tabela EMPREGADOS */

alter table EMPREGADOS drop column supervisor;

/* 11º PASSO remover o atributo depto da tabela EMPREGADOS */

alter table EMPREGADOS drop column depto;
/* 12º PASSO remover o atributo supervisor da tabela EMPREGADOS */

alter table DEPARTAMENTOS drop column gerente;





