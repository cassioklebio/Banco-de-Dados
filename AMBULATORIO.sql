create database CONSULTORIO;




use CONSULTORIO;



create table AMBULATORIOS(
	nroa int not null auto_increment,
    andar int, 
    capacidade i,
    constraint ambulatorio primary key (nroa)    
);

create table MEDICOS(
	codm int not null auto_increment,
    nroa int,
    codend int,
    CPF int unique,
    nome varchar(100),
    idade int,    
    especialidade varchar(20),
    constraint medicos primary key(codm),
    constraint medico_ambulatorio foreign key(nroa) references AMBULATORIOS(nroa),
    constraint endereco_ambulatorio foreign key(codend) references ENDERECOS(codend)
    
 );   
 

create table PACIENTES(
	codp int not null auto_increment,
    codend int,
    CPF int unique,
    nome varchar(100),
    idade int,    
    doenca varchar(100) not null,
    constraint pacientes primary key(codp),
    constraint endereco_paciente foreign key(codend) references ENDERECOS(codend)
);

create table CONSULTAS(
	codm int,
    codp int,
    data date,
    hora time,
    constraint medico_consulta foreign key(codm) references MEDICOS(codm),
    constraint paciente_consulta foreign key(codp) references PACIENTES(codp)    
);

create table FUNCIONARIOS(
	codf int not null auto_increment,
    codend int,
    CPF int unique,
    nome varchar(100),
    idade int,
    salario float,
    constraint funcionario primary key(codf),
    constraint endereco_funcionario foreign key(codend) references ENDERECOS(codend)
);



select * from FUNCIONARIOS;

create table ENDERECOS(
	codend int not null auto_increment,
    rua varchar(100),
    bairro varchar(20),
    cidade varchar(30),
    estado char(2),
    constraint endereco primary key(codend)    
);


/* insert NA TABELA ENDEREÇO */

insert into ENDERECOS (codend, rua, bairro, cidade, estado) values('1','Sebastião Araujo','centro','Esperança','PB');
insert into ENDERECOS (codend, rua, bairro, cidade, estado) values('2','Venancio Neiva','centro','Campina Grande','PB');
insert into ENDERECOS (codend, rua, bairro, cidade, estado) values('3','Floriano Peixoto','centro','Campina Grande','PB');
insert into ENDERECOS (codend, rua, bairro, cidade, estado) values('4','São Francisco','centro','Areia','PB');
insert into ENDERECOS (codend, rua, bairro, cidade, estado) values('5','Arruda Camara','São Antonio','Campina Grande','PB');

insert into ENDERECOS (codend, rua, bairro, cidade, estado) values('6','Eptacio pessoa','centro','Esperança','PB');
insert into ENDERECOS (codend, rua, bairro, cidade, estado) values('7','Presidente Castelo Branco','centro','Esperança','PB');
insert into ENDERECOS (codend, rua, bairro, cidade, estado) values('8','São Vicente','centro','Esperança','PB');
insert into ENDERECOS (codend, rua, bairro, cidade, estado) values('9','São Francisco','centro','Areia','PB');
insert into ENDERECOS (codend, rua, bairro, cidade, estado) values('10','Tedu Dias','Centro','Remigio','PB');

select * from ENDERECOS;


/* insert NA TABELA AMBULATORIOS */
    


insert into AMBULATORIOS (nroa, andar, capacidade) values('1','4','20');
insert into AMBULATORIOS (nroa, andar, capacidade) values('2','5','15');
insert into AMBULATORIOS (nroa, andar, capacidade) values('3','3','70');
insert into AMBULATORIOS (nroa, andar, capacidade) values('4','1','100');
insert into AMBULATORIOS (nroa, andar, capacidade) values('5','2','24');

select * from AMBULATORIOS;

/* insert NA TABELA MEDICOS */

insert into MEDICOS (codm, nroa, codend, CPF, nome, idade, especialidade) values('1','5','4','0000000000000', 'Carlos Augusto', '45', 'Pediatra');
insert into MEDICOS (codm, nroa, codend, CPF, nome, idade, especialidade) values('2','4','1','123456789', 'Maria do Carmo', '34', 'Obstetra');
insert into MEDICOS (codm, nroa, codend, CPF, nome, idade, especialidade) values('3','3','2','1001234567', 'Giovana', '28', 'Cardiologista');
insert into MEDICOS (codm, nroa, codend, CPF, nome, idade, especialidade) values('4','2','3','1000123458', 'Tereziana', '29', 'Ortopedista');
insert into MEDICOS (codm, nroa, codend, CPF, nome, idade, especialidade) values('5','1','5','1000012349', 'Patricia', '40', 'psicóloga');

/* insert NA TABELA PACIENTES */
 
insert into PACIENTES (codp, codend, CPF, nome, idade, doenca) values('1','6','100000123','Carlos Augusto', '60', 'Cardiomiopatias');
insert into PACIENTES (codp, codend, CPF, nome, idade, doenca) values('2','7','100000023','Jose Henrique', '79', 'Osteomalacia');
insert into PACIENTES (codp, codend, CPF, nome, idade, doenca) values('3','8','100000003','Dona Cecilia', '89', 'Stress');
insert into PACIENTES (codp, codend, CPF, nome, idade, doenca) values('4','9','100000000','Lourdes', '31', 'Gestante');
insert into PACIENTES (codp, codend, CPF, nome, idade, doenca) values('5','8','110000000','Flavio Galdino', '9', 'Denca de pele');

/* insert NA TABELA fUNCIONARIO */

insert into FUNCIONARIOS (codf, codend, CPF, nome, idade, salario) values('1','4','111000000','Artur','28','1500.00');
insert into FUNCIONARIOS (codf, codend, CPF, nome, idade, salario) values('2','1','111100000','Marcos', '31', '4000.00');
insert into FUNCIONARIOS (codf, codend, CPF, nome, idade, salario) values('3','7','111110000','Mariana', '40', '980.00');
insert into FUNCIONARIOS (codf, codend, CPF, nome, idade, salario) values('4','9','11111100','Thomas', '25', '2500.00');
insert into FUNCIONARIOS (codf, codend, CPF, nome, idade, salario) values('5','2','111111100','Ana Cecilia', '18', '500.00');



/* insert NA TABELA CONSULTAS  */
insert into CONSULTAS (codm, codp, data, hora) values('3','1','2018-05-09','18:00:00');
insert into CONSULTAS (codm, codp, data, hora) values('4','2','2018-06-09','20:00:00');
insert into CONSULTAS (codm, codp, data, hora) values('5','3','2018-06-10','14:30:00');
insert into CONSULTAS (codm, codp, data, hora) values('2','4','2018-06-11','13:15:00');
insert into CONSULTAS (codm, codp, data, hora) values('1','5','2018-05-08','09:20:00');




/* SELECT */

select CPF from MEDICOS;

select * from PACIENTES where idade > 18;

