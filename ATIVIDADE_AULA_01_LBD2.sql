-- Database: "ATIVIDADE_AULA"

-- DROP DATABASE "ATIVIDADE_AULA";

CREATE DATABASE "ATIVIDADE_AULA"
  WITH OWNER = cassio
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'pt_BR.UTF-8'
       LC_CTYPE = 'pt_BR.UTF-8'
       CONNECTION LIMIT = -1;

COMMENT ON DATABASE "ATIVIDADE_AULA"
  IS '-- -- Atividade referente a aula de laboratorio  de banco de dados ';

CREATE type sexo as enum ('M','F');
 	
 create table PROFESSORES(
    id_professor SERIAL,
    nome_professor varchar(100) not null,
    idade int,
    SEXO sexo,
    constraint id_professor primary key(id_professor)
    );

DROP TABLE ALUNOS;

 create table ALUNOS(
	id_aluno         SERIAL,
	matricula        int            not null,
	nome_aluno       varchar(100)   not null,
	idade 		 int,
	SEXO 		sexo,
	constraint id_aluno primary key(id_aluno)	
	);

create table CASOS_DE_USOS(
	id_caso_de_uso		SERIAL,
	id_aluno		integer,
	id_professor		integer,
	titulo			varchar(100)		not null,
	area			varchar(100),			
	data			date			not null,
	caso_a_ser_estudado	varchar(100)		not null,
	resposta		text		not null,
	constraint id_caso_de_uso primary key (id_caso_de_uso),
	constraint PROF_CASO foreign key (id_professor) references PROFESSORES(id_professor) on delete cascade,
	constraint ALUN_CASO foreign key (id_aluno) references ALUNOS(id_aluno) on delete cascade
	);


create table PARECERES(
	id_parecer 		SERIAL,
	id_aluno		integer,
	id_professor		integer,
	constraint id_parecer primary key (id_parecer),
	constraint PAR_ALUN foreign key (id_aluno) references ALUNOS(id_aluno) on delete cascade,
	constraint PAR_PROF foreign key (id_professor) references PROFESSORES (id_professor) on delete cascade
	);

	

);

