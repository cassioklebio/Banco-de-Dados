create database CLINICA;

use CLINICA;

create table MEDICOS(
	CRM varchar(15) unique null,
    NOME varchar(100) not null,
    IDADE INT check(idade > 23 and idade < 70),
    ESPECIALIDADE varchar(20) check(ESPECIALIDADE not like '%ortopedia%')

);

create table PACIENTE(
	CPF int(15) unique,
    NOME varchar(50) unique,
    DOENCA varchar(10) check(DOENÇA not like '%fratura%"' and '%torção%')
);

