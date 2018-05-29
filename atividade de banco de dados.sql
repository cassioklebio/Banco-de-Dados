create database empresaDB;

use empresaDB;

create table empregados(
	matricula int  auto_increment,
    nome_empregado varchar(50) not null,
    endereco text(200),
    salario float,
    supervisor boolean,
    depto varchar(25),
    constraint empregado_matricula primary key (matricula) 
	
);

create table departamentos(
	coddep int auto_increment,
    nome_departamento varchar(50) not null,
    gerente varchar(50) not null,
    dataini datetime,
    constraint departamentos_coddep primary key (coddep)
);

create table projetos(
	codproj int  auto_increment,
    nome_projeto varchar(50) not null,
    local_projeto varchar(50) not null,
    depart varchar(50),
    constraint projetos_codproj primary key (codproj)
);    

create table alocacao(
	matric_alocacao int auto_increment,
    codproj int not null,
    horas time,
    constraint aloc_matric primary key (matric_alocacao)
);

/*drop database empresaDB;*/
    
alter table empregados drop endereco;
  
select * from empregados;

alter table empregados add column id_emp int;

alter table empregados alter constraint 
